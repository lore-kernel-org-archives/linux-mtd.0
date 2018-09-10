Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fzJnk-0001gg-Dm
 for linux-mtd@lists.infradead.org; Mon, 10 Sep 2018 10:52:19 +0000
Received: by mail-wr1-x444.google.com with SMTP id k5-v6so21384504wre.10
 for <linux-mtd@lists.infradead.org>; Mon, 10 Sep 2018 03:52:04 -0700 (PDT)
MIME-Version: 1.0
References: <20180908131345.8145-1-kernel@nospam.obeliks.de>
 <20180908131345.8145-3-kernel@nospam.obeliks.de>
In-Reply-To: <20180908131345.8145-3-kernel@nospam.obeliks.de>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 10 Sep 2018 12:51:51 +0200
Message-ID: <CACna6ryWCwKZJm2rq0_KeaKve8Ym9zi6AU+Kat9cpYAqtzCMdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: add bindings for mtd-concat devices
To: kernel@nospam.obeliks.de
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 8 Sep 2018 at 15:14, Bernhard Frauendienst
<kernel@nospam.obeliks.de> wrote:
>
> Document virtual mtd-concat device bindings.
>
> Signed-off-by: Bernhard Frauendienst <kernel@nospam.obeliks.de>
> ---
>  .../devicetree/bindings/mtd/mtd-concat.txt    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/mtd-concat.txt
>
> diff --git a/Documentation/devicetree/bindings/mtd/mtd-concat.txt b/Documentation/devicetree/bindings/mtd/mtd-concat.txt
> new file mode 100644
> index 000000000000..2daf3157b163
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/mtd-concat.txt
> @@ -0,0 +1,36 @@
> +Virtual MTD concat device

I think you forgot to include the documentation. Please ***describe***
that binding.
