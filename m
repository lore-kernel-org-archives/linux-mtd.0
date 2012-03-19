Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S9Ytw-0007lO-Qx
 for linux-mtd@lists.infradead.org; Mon, 19 Mar 2012 09:29:17 +0000
Received: by werp11 with SMTP id p11so7062531wer.36
 for <linux-mtd@lists.infradead.org>; Mon, 19 Mar 2012 02:29:15 -0700 (PDT)
Date: Mon, 19 Mar 2012 11:29:06 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH 0/3] MTD: Change meaning of -EUCLEAN return code on reads
Message-ID: <20120319112906.287b4cbc@pixies.home.jungo.com>
In-Reply-To: <4F66F36E.9010102@parrot.com>
References: <1331832353-15569-1-git-send-email-mikedunn@newsguy.com>
 <20120316111939.GA10362@parrot.com> <4F636964.3030904@newsguy.com>
 <20120316184345.GF10228@parrot.com> <4F64F17C.2070409@newsguy.com>
 <20120318100000.336c347d@pixies.home.jungo.com>
 <4F66F36E.9010102@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Ivan Djelic <ivan.djelic@parrot.com>,
 Mike Dunn <mikedunn@newsguy.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Matthieu,

On Mon, 19 Mar 2012 09:50:54 +0100 Matthieu CASTET <matthieu.castet@parrot.com> wrote:
> > The only immediate blocker for such a scheme would be those nand
> > controller drivers, where the controller is responsible of the ECC
> > correction, and it does not report per-step stats to the software.
> > Are there any?
> > (In that case, we have nothing else to do besides falling back to a
> > per-page decision. For example, such driver's 'read_page' may return
> > total_corrected_per_page/ecc.steps as an estimate of the number of
> > per-step corrected bits, or alike)
> No, they should return the worst case : max(total_corrected_per_page, ecc.strength).
> Otherwise you have the same problem : case 2 in [1] will fail.
> It is better to trigger false positive (do scrubbing) than having uncorrectable
> error.

Thanks, your suggested heuristic is better than averaging.

However I guess you meant: min(total_corrected_per_page, ecc.strength)

My suggested 'ecc.read_page' retval denotes maximum bit errors per step.
As such, max possible return value is 'ecc.strength' (returning
'total_corrected_per_page' would be beyond max possible value).

'min(total_corrected_per_page, ecc.strength)' fits your suggestion to
prefer a false positive than having uncorrectable error.
It will indeed lead to scrubbing in "case 2".

Regards,
Shmulik
