Received: from astoria.ccjclearline.com ([64.235.106.9])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mljfu-0006Wo-NO
	for linux-mtd@lists.infradead.org; Thu, 10 Sep 2009 13:27:02 +0000
Date: Thu, 10 Sep 2009 09:26:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH] Kconfig: MTD_DATAFLASH_WRITE_VERIFY ->
	MTD_DATAFLASH_VERIFY_WRITE
In-Reply-To: <877hw7vwps.fsf@macbook.be.48ers.dk>
Message-ID: <alpine.LFD.2.00.0909100925520.3439@localhost>
References: <alpine.LFD.2.00.0909100716440.19313@localhost>
	<877hw7vwps.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 10 Sep 2009, Peter Korsgaard wrote:

> >>>>> "Robert" == Robert P J Day <rpjday@crashcourse.ca> writes:
>
>  Robert> Fix the misspelled Kconfig variable "MTD_DATAFLASH_WRITE_VERIFY" so
>  Robert> that it matches the spelling here:
>
>  Robert> drivers/mtd/devices/mtd_dataflash.c:#ifdef CONFIG_MTD_DATAFLASH_VERIFY_WRITE
>  Robert> drivers/mtd/devices/mtd_dataflash.c:#endif	/* CONFIG_MTD_DATAFLASH_VERIFY_WRITE */
>
>  Robert> -config MTD_DATAFLASH_WRITE_VERIFY
>  Robert> +config MTD_DATAFLASH_VERIFY_WRITE
>
> It probably makes more sense to change the .c file instead of Kconfig,
> to not bother/confuse people and simply make it "just work".

  ok, if that's the consensus, i'll have that patch out later today.

rday
--

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

        Linux Consulting, Training and Annoying Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================
