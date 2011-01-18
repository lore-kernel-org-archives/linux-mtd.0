Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH] MTD: atmel_nand: Add DMA support to access Nandflash
Date: Tue, 18 Jan 2011 09:43:45 +0800
Message-ID: <4C79549CB6F772498162A641D92D5328D9FE16@penmb01.corp.atmel.com>
In-Reply-To: <4D34C5BF.2070107@bluewatersys.com>
References: <hong.xu@atmel.com>
	<1295248809-30334-2-git-send-email-hong.xu@atmel.com>
	<4D34A37E.1060300@bluewatersys.com>
	<4D34C5BF.2070107@bluewatersys.com>
From: "Xu, Hong" <Hong.Xu@atmel.com>
To: "Ryan Mallon" <ryan@bluewatersys.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, jamie@jamieiles.com,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ryan,
> -----Original Message-----
> From: Ryan Mallon [mailto:ryan@bluewatersys.com]
> Sent: Tuesday, January 18, 2011 6:42 AM
> To: Xu, Hong
> Cc: linux-mtd@lists.infradead.org; =
linux-arm-kernel@lists.infradead.org;
> linux-kernel@vger.kernel.org; jamie@jamieiles.com; jacmet@sunsite.dk;
> Ferre, Nicolas
> Subject: Re: [PATCH] MTD: atmel_nand: Add DMA support to access =
Nandflash
>=20
> root@snapper:~$ dmesg | grep -i dma
> [    0.850000] atmel_nand atmel_nand: Failed to request DMA channel
> [    0.860000] atmel_nand atmel_nand: No DMA support for NAND access.
> [    1.530000] at_hdmac at_hdmac: Atmel AHB DMA Controller ( cpy slave =
),
> 8 channels
>=20
>=20
> It looks like the registration for the DMA controller happens after =
the
> NAND driver probe and so the request is failing. I had a quick look, =
but
> I can't see anything that would change this in more recent kernels. =
Any
> ideas?
>=20
You got the point. A [Git Pull] has been sent, see
http://article.gmane.org/gmane.linux.kernel/1088240/match=3Ddmaengine+upd=
ate

In this patch, subsys_initcall will be used so DMA engine will be =
initialized before NAND driver.
Thanks.

BR,
Hong
