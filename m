Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZqpWe-0002IP-4S
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 21:41:57 +0000
Subject: Re: UBIFS corruption after power cut - possibly unstable bits issue?
To: Tim Harvey <tharvey@gateworks.com>
References: <CAJ+vNU3eu4qBxaZpDRY=Fidv=9iGmA5pq8b4yUfyBayLTos5oQ@mail.gmail.com>
 <562E8697.50207@nod.at>
 <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <562E9E0B.5030204@nod.at>
Date: Mon, 26 Oct 2015 22:41:31 +0100
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU1J+MvyWgY1FPv4G7TxQLDtPJWdWw=DP5+1h2HcTi-SxQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Tim,

Am 26.10.2015 um 21:31 schrieb Tim Harvey:
> What would be causing the bit-flips on the erased pages? Could it have
> something to do with the larger flash part having a much longer erase
> time?

According to NAND manufactures can happen also on empty space.
At the time when UBIFS was designed this was not known nor was it observed.
These days it seems to happen on some large/cheap NANDs.

> There shouldn't be anything writing to ubifs so I'm not clear what
> caused this to occur. Note that even if I remove the /etc/fstab that
> causes root to be re-mounted read/write I always see 'UBIFS (ubi0:0):
> recovery needed' and I'm not understanding what causes that but it
> makes me think that NAND is getting touched each and every boot by the
> recovery process.
> 
>> In March there was an attempt to fix that in software.
>> But no mainline ready solution was presented so far:
>> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052521.html
>>
>> It is not clear whether to implement this directly in gpmi-nand or MTD core.
>> Currently UBIFS assumes that empty spaces must contain only 0xff octets.
>> A naive approach would be removing that check from UBIFS, bit this can have
>> disastrous consequences as UBIFS's recovery algorithm relies on that.
> 
> I think I ran across that approach right before the thread you pointed
> me to: http://thread.gmane.org/gmane.linux.drivers.mtd/52208

:-)

> the second case is not permanent corruption - when the system is
> power-cycled it comes up fine the next time.

Yeah, but have you checked how the temporary corruption looks like?

Thanks,
//richard
