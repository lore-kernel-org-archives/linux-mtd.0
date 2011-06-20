Received: from mail-vx0-f177.google.com ([209.85.220.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QYgHP-00045q-Q4
	for linux-mtd@lists.infradead.org; Mon, 20 Jun 2011 15:20:48 +0000
Received: by vxd3 with SMTP id 3so2823383vxd.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 20 Jun 2011 08:20:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20110617163442.204348a0@schlenkerla.am.freescale.net>
References: <BANLkTikyKObukzVw+c10HyDz+Q=PH4jozA@mail.gmail.com>
	<20110617163442.204348a0@schlenkerla.am.freescale.net>
Date: Mon, 20 Jun 2011 11:20:45 -0400
Message-ID: <BANLkTik7W-9mLOAUCU20O9+KXCimL6Y1+g@mail.gmail.com>
Subject: Re: NAND BBT corruption on MPC83xx
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	mhench@elutions.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 17, 2011 at 5:34 PM, Scott Wood <scottwood@freescale.com> wrote:
>
> As for the corruption, could it be degradation from repeated reads of that
> one page?
>

Could be.  I think Mike's theory was that the -1 page_addr sort of
"wrapped around", and caused us to read in the last block on flash
each time NAND_CMD_PAGEPROG was performed.  So with a lot of writes
happening, we could end up with a BBT that looks like this.

That makes sense I guess, since set_addr() in fsl_elbc_nand.c uses
page_addr to set FBAR.  I don't see anything about it in the manual,
but if FBAR wraps beyond the end of the chip, maybe the bits that
don't make sense are simply ignored.  (In which case we should
probably add a check in set_addr() to prevent anything like this in
the future)

In theory I should be able to prove it out by running 2 devices in
parallel - one with that block of code still there, and one with it
removed.  If the former device sees bit-flips in the BBT and the
latter one doesn't, we'll be sure of the culprit.  I'll try this and
come back with the results.

Thanks!

-- 
Matthew L. Creech
