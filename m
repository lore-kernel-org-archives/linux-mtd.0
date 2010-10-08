Received: from arroyo.ext.ti.com ([192.94.94.40])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P44yy-0006ZN-FB
	for linux-mtd@lists.infradead.org; Fri, 08 Oct 2010 04:55:01 +0000
From: "Nori, Sekhar" <nsekhar@ti.com>
To: Sergei Shtylyov <sshtylyov@mvista.com>, "Dharmappa, Savinay"
	<savinay.dharmappa@ti.com>
Date: Fri, 8 Oct 2010 10:24:48 +0530
Subject: RE: [PATCH 2/2] davinci: Platform support for OMAP-L137/AM17x NOR
	flash driver
Message-ID: <B85A65D85D7EB246BE421B3FB0FBB59302342ADE9D@dbde02.ent.ti.com>
References: <1286451272-12988-1-git-send-email-savinay.dharmappa@ti.com>
	<4CADE1B8.50800@mvista.com>
In-Reply-To: <4CADE1B8.50800@mvista.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Aleksey Makarov <amakarov@ru.mvista.com>,
	"davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Griego <dgriego@mvista.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sergei,

On Thu, Oct 07, 2010 at 20:35:28, Sergei Shtylyov wrote:

> > +static void da830_evm_nor_done(void *data)
> > +{
> > +   clk_disable(da830_evm_nor.clk);
> > +   clk_put(da830_evm_nor.clk);
> > +   iounmap(da830_evm_nor.latch.addr);
> > +   release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
> > +   iounmap(da830_evm_nor.aemif.addr);
> > +   release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
> > +}
>
>     Why you've changed this function which was useful also for the error =
cleanup
> before?

The issues down below aside, I think goto based error handling
is clearer to follow. Any objections to using goto based
error handing per-se?

Thanks,
Sekhar

>
> > +static int da830_evm_nor_init(void *data, int cs)
> > +{
> > +   /* Turn on AEMIF clocks */
> > +   da830_evm_nor.clk =3D clk_get(NULL, "aemif");
> > +   if (IS_ERR(da830_evm_nor.clk)) {
> > +           pr_err("%s: could not get AEMIF clock\n", __func__);
> > +           da830_evm_nor.clk =3D NULL;
> > +           return -ENODEV;
> > +   }
> > +   clk_enable(da830_evm_nor.clk);
> > +
> > +   da830_evm_nor.aemif.res =3D request_mem_region(DA8XX_AEMIF_CTL_BASE=
,
> > +                                                SZ_32K, "AEMIF control=
");
> > +   if (da830_evm_nor.aemif.res =3D=3D NULL) {
> > +           pr_err("%s: could not request AEMIF control region\n",
> > +                   __func__);
> > +           goto err_aemif_region;
>
>     I wonder why you used goto's at all. Anyway, the error cleanup code i=
s
> completely broken now.
>
> > +   }
> > +
> > +   da830_evm_nor.aemif.addr =3D ioremap_nocache(DA8XX_AEMIF_CTL_BASE,
> > +                                              SZ_32K);
> > +   if (da830_evm_nor.aemif.addr =3D=3D NULL) {
> > +           pr_err("%s: could not remap AEMIF control region\n", __func=
__);
> > +           goto err_aemif_ioremap;
> > +   }
> > +
> > +   /* Setup AEMIF -- timings, etc. */
> > +
> > +   /* Set maximum wait cycles */
> > +   davinci_aemif_setup_timing(&da830_evm_norflash_timing,
> > +                                           da830_evm_nor.aemif.addr, c=
s);
> > +
> > +   davinci_aemif_setup_timing(&da830_evm_norflash_timing,
> > +                                   da830_evm_nor.aemif.addr, cs + 1);
> > +
> > +   /* Setup the window to access the latch */
> > +   da830_evm_nor.latch.res =3D
> > +           request_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE,
> > +                              "DA830 UI NOR address latch");
> > +   if (da830_evm_nor.latch.res =3D=3D NULL) {
> > +           pr_err("%s: could not request address latch region\n",
> > +                   __func__);
> > +           goto err_latch_region;
> > +   }
> > +
> > +   da830_evm_nor.latch.addr =3D
> > +           ioremap_nocache(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
> > +   if (da830_evm_nor.latch.addr =3D=3D NULL) {
> > +           pr_err("%s: could not remap address latch region\n", __func=
__);
> > +           goto err_latch_ioremap;
> > +   }
> > +   return 0;
> > +
> > +err_aemif_region:
> > +   release_mem_region(DA8XX_AEMIF_CTL_BASE, SZ_32K);
>
>     Why release what you've just failed to request?!
>
> > +   da830_evm_nor.aemif.res =3D NULL;
>
>     Useless assignment.
>
> > +   return -EBUSY;
>
>     And you're not calling clk_disable().
>
> > +err_aemif_ioremap:
> > +   iounmap(da830_evm_nor.aemif.addr);
>
>     Why unmap what you've just failed to map?! da830_evm_nor.aemif.addr i=
s NULL.
>
> > +   da830_evm_nor.aemif.addr =3D NULL;
>
>     Useless assignment.
>
> > +   return -ENOMEM;
>
>     You're not calling release_mem_region() and clk_disable().
>
> > +err_latch_region:
> > +   release_mem_region(DA8XX_AEMIF_CS3_BASE, PAGE_SIZE);
>
>     Why release what you've just failed to request?!
>
> > +   da830_evm_nor.latch.res =3D NULL;
>
>     Useless assginment.
>
> > +   return -EBUSY;
>
>     You're not calling iounmap() and release_mem_region() for the NOR fla=
sh
> region and also not calling clk_disable().
>
> > +
> > +err_latch_ioremap:
> > +   iounmap(da830_evm_nor.latch.addr);
>
>     Why unmap what you've just failed to map?! da830_evm_nor.latch.addr i=
s NULL.
>
> > +   da830_evm_nor.latch.addr =3D NULL;
>
>     Useless assginment.
>
> > +   return -ENOMEM;
>
>     You're not release_mem_region() for the latch region, not calling iou=
nmap()
> and release_mem_region() for the NOR flash region and also not calling
> clk_disable().
>
> > +}
> [...]
>
>     Your changes made me doubt that you actually understood the code well=
 enough
> before doing them...
>
> WBR, Sergei
>
> _______________________________________________
> Davinci-linux-open-source mailing list
> Davinci-linux-open-source@linux.davincidsp.com
> http://linux.davincidsp.com/mailman/listinfo/davinci-linux-open-source
>
