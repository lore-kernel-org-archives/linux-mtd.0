Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9hxI-0001P2-Ju
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 19:09:21 +0000
Message-ID: <4F67844E.5020404@newsguy.com>
Date: Mon, 19 Mar 2012 12:09:02 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com> <4F64F17C.2070409@newsguy.com>
 <20120318100000.336c347d@pixies.home.jungo.com> <4F66F36E.9010102@parrot.com>
In-Reply-To: <4F66F36E.9010102@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
 Ivan Djelic <ivan.djelic@parrot.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/19/2012 01:50 AM, Matthieu CASTET wrote:
> Hi,
> 
> Shmulik Ladkani a écrit :
>> Hi Mike,
>>
> 
>> The only immediate blocker for such a scheme would be those nand
>> controller drivers, where the controller is responsible of the ECC
>> correction, and it does not report per-step stats to the software.
>> Are there any?


I didn't get Shmulik's original email for some reason, only what was quoted in
Matthieu's.  I think the answer to this question is no.  There is one driver,
fsl_elbc_nand.c, that fits this description; i.e., detection, correction, and
stats reporting are all done in hardware, and it looks like the hardware can
only report that some corrections occurred, not the exact number.  Ecc can be
done in multiple steps (depending on page size). but because ecc.strength==1, we
only need to know if any corrections were made at all in order to report
bitflips on a per ecc step basis.  I don't believe there are any other drivers
where bitflips per step can not be determined.


>> (In that case, we have nothing else to do besides falling back to a
>> per-page decision. For example, such driver's 'read_page' may return
>> total_corrected_per_page/ecc.steps as an estimate of the number of
>> per-step corrected bits, or alike)


A compromise between max_bitflips per page vs per ecc step?  As Matthieu and
Ivan pointed out, you can still have a hard error and be under the threshold.


> No, they should return the worst case : max(total_corrected_per_page, ecc.strength).


I don't quite understand that.


> Otherwise you have the same problem : case 2 in [1] will fail.
> It is better to trigger false positive (do scrubbing) than having uncorrectable
> error.


I agree.

Thanks,
Mike
