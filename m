Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYhAD-00019M-90
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 20:35:34 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1YYh9k-0004R5-VV
 for linux-mtd@lists.infradead.org; Thu, 19 Mar 2015 21:35:05 +0100
Received: from 216.239.45.97 ([216.239.45.97])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 19 Mar 2015 21:35:04 +0100
Received: from pwvanvugt by 216.239.45.97 with local (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Thu, 19 Mar 2015 21:35:04 +0100
To: linux-mtd@lists.infradead.org
From: Peter van Vugt <pwvanvugt@gmail.com>
Subject: Re: [RFC PATCH v2] mtd: nand: add erased-page bitflip correction
Date: Thu, 19 Mar 2015 19:37:45 +0000 (UTC)
Message-ID: <loom.20150319T201643-899@post.gmane.org>
References: <1394803700-29467-1-git-send-email-pekon@ti.com>
 <20140317184130.GA3834@ld-irv-0074>
 <20980858CB6D3A4BAE95CA194937D5E73EAB3DE3@DBDE04.ent.ti.com>
 <20140318090554.GY31517@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EAB3F69@DBDE04.ent.ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Gupta, Pekon <pekon <at> ti.com> writes:
 
> I'll wait for your next revision of patch,  but please re-think on my 
proposal
> to leave out ecc.layout->oobfree[], and just reset ecc.laout->ecc.pos[].
> as it keeps compatibility with other file-systems which use OOB to store
> some metadata.
> 
> (may be you can put resetting complete OOB, as separate patch later).
> 
> >> - Therefore in my earlier patch [2] I was just counting bit-flips in 
read_ecc[]
> >>   *not* read_oob[].
> >
> >You can't have your cake and eat it too. You're trying to support
> >intentionally programming bitflips (i.e., the 'cleanmarker') to spare
> >area, but you're also trying to correct bits in such a page. Pick one.
> >Or improve the JFFS2 / MTD API so that JFFS2 can communicate when it
> >does and doesn't want error correction, rather than making assumptions.
> >

For the record, has this patch been abandoned?

I have encountered issues with one (and occasionally more) non-1 bits in 
erased pages on several vendors' MLC NAND devices when using the GPMI 
controller, which causes significant issues when using UBI. There was an 
earlier GPMI-specific, not platform-agnostic patch 
(http://lists.infradead.org/pipermail/linux-mtd/2014-
January/thread.html#51356) that appears it may have been abandoned due to 
silicon bugs that may have been fixed in my silicon revision, and a OMAP-
specific patch that made it into the mainline in commit 62116e51 .

The GPMI patch appears to have a few small issues in our use case that 
might be fixable, but if I've missed something and some version of this 
patch is still alive in some other form, I'd prefer to use/support it.

Regards,

Peter
