Received: from mail-oi0-x236.google.com ([2607:f8b0:4003:c06::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XEhP3-00048I-GG
 for linux-mtd@lists.infradead.org; Tue, 05 Aug 2014 16:15:58 +0000
Received: by mail-oi0-f54.google.com with SMTP id i138so753016oig.41
 for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2014 09:15:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1407233482-11642-2-git-send-email-rogerq@ti.com>
References: <1407233482-11642-1-git-send-email-rogerq@ti.com>
 <1407233482-11642-2-git-send-email-rogerq@ti.com>
Date: Tue, 5 Aug 2014 19:15:31 +0300
Message-ID: <CANOLnOM-Q4b8N5T522Vc_gXTSj2C-mxV6GV0hRTDPscpPgXO6A@mail.gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: omap: Revert to using software ECC by
 default
From: Grazvydas Ignotas <notasas@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>, artem.bityutskiy@linux.intel.com,
 jg1.han@samsung.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Felipe Balbi <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, pekon.gupta@gmail.com,
 Brian Norris <computersforpeace@gmail.com>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 5, 2014 at 1:11 PM, Roger Quadros <rogerq@ti.com> wrote:
> For v3.12 and prior, 1-bit Hamming code ECC via software was the
> default choice. Commit c66d039197e4 in v3.13 changed the behaviour
> to use 1-bit Hamming code via Hardware using a different ECC layout
> i.e. (ROM code layout) than what is used by software ECC.
>
> This ECC layout change causes NAND filesystems created in v3.12
> and prior to be unusable in v3.13 and later. So revert back to
> using software ECC by default if an ECC scheme is not explicitely
> specified.
>
> This defect can be observed on the following boards during legacy boot
>
> -omap3beagle
> -omap3touchbook
> -overo
> -am3517crane
> -devkit8000
> -ldp
> -3430sdp

omap3pandora is also using sw ecc, with ubifs. Some time ago I tried
booting mainline (I think it was 3.14) with rootfs on NAND, and while
it did boot and reached a shell, there were lots of ubifs errors, fs
got corrupted and I lost all my data. I used to be able to boot
mainline this way fine sometime ~3.8 release. It's interesting that
3.14 was able to read the data, even with wrong ecc setup.

Do you think it's safe again to boot ubifs created on 3.2 after
applying this series?

--=20
Gra=C5=BEvydas
