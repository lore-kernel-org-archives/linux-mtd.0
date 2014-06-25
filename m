Received: from protonic.xs4all.nl ([83.163.252.89])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WzlQc-0006nq-CR
 for linux-mtd@lists.infradead.org; Wed, 25 Jun 2014 11:31:51 +0000
Date: Wed, 25 Jun 2014 13:31:29 +0200
From: David Jander <david.jander@protonic.nl>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [FRC] [PATCH] MTD: nand_base.c: Enable support for Samsung
 E-die SLC NAND
Message-ID: <20140625133129.060cd535@archvile>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EAF7560@DBDE04.ent.ti.com>
References: <1403259137-22171-1-git-send-email-david@protonic.nl>
 <CAE94FHELXgoZ9Jm1E3_YT6D1SB=VAGWthZSjbsR+qqkUWn97PA@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF6A08@DBDE04.ent.ti.com>
 <CAE94FHGNHDVygoviGgEtE2ZDyumjwa73tZiDnEBdSnnWCE03YQ@mail.gmail.com>
 <CAE94FHFvCoZyawRC=LL+PdBR3ig10crKJN6c_M_q=yGdOXnR9A@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAF7560@DBDE04.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ted Juan <ted.juan@gmail.com>,
 "sjhill@realitydiluted.com" <sjhill@realitydiluted.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Dear Pekon,

On Wed, 25 Jun 2014 10:04:11 +0000
"Gupta, Pekon" <pekon@ti.com> wrote:

> Hi Ted,
> 
> >From: Ted Juan [mailto:ted.juan@gmail.com]
> >Dear Pekon,
> >
> >I backup the raw data to data2[] before doing elm_decode_bch_error_page();
> >Dump  code is as below. The raw data is the same with the correction
> >data that all more than 8 bit-flips.
> >
> (a) In that case you should contact the Flash vendor here.
> Fresh NAND device from factory should not violate the spec.
> I don't suspect a driver issue here, because the raw data read itself
> has random bit-flips.

Sorry to interrupt, but this does sound serious. Are you absolutely sure your
hardware is OK? Is the power-supply clean and well enough decoupled? Timings
within specs?
If electrical specifications are not met, this could explain the bit-flips. It
is possible that Samsung is at fault here (they screwed up the specs for this
version anyway), but double checking the hardware looks like a good idea
here...

> (b) Also, it may be the case that there few particular blocks which has gone
> bad and those are is showing again and again at each boot. However, If it
> was such a case that only some handful blocks on NAND device have gone
> bad, then UBI torture test [1] should have detected them and marked them
> bad. And those should not re-appear in next time.
> - You can check (b) by scrubbing all bad-blocks from u-boot
>   #u-boot> nand scrub.chip all
>   #u-boot> nand bad  (should report 0 bad blocks)
> - Then, re-boot and let UBI detect bad-blocks on its own using torture-test
> - And then again reset the system 2nd time and check newly detected
> bad-blocks #u-boot> nand bad  (should report [n] bad blocks)
> 
> (c) You can also check, if you are seeing bit-flips only during
> erased-pages ? You can identify this by adding prints in u-boot.
> There is slight difference in u-boot and kernel omap-gpmc NAND drivers,
> - u-boot: simply ignores erased-pages and does not check for bit-flips in
> them.
> - kernel: counts number of bit-flips in erased-pages also.
>  
> 
> >The full data log is put as below but include some useless dump data.
> >https://drive.google.com/file/d/0BwVGpNFs7l22RmZXTHhJWXFYYWs/edit?usp=sharing
> >
> There will be no correction done if 'un-correctable error' flag is raised by
> ELM. Therefore pre-correction and post-correction data matches in below dump.
> Bit-flip correction will _only_ happen if the number of bit-flips are within
> correctable range (that is <=8 for BCH8 ECC scheme).
> 
> 
> [1] $kernel/drivers/mtd/ubi/io.c @@ torture_peb()

Best regards,

-- 
David Jander
Protonic Holland.
