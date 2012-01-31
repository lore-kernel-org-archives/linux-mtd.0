Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsL7R-0007qB-O1
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 21:20:02 +0000
Received: by iafj26 with SMTP id j26so604772iaf.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 13:20:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
Date: Tue, 31 Jan 2012 22:20:00 +0100
Message-ID: <CACRpkdaLekGTdkpfr_Zf5PXAZ16dZsXrwnFHjBe+aEvGb5zYjg@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
From: Linus Walleij <linus.walleij@linaro.org>
To: Barry Song <Barry.Song@csr.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Greg Kroah-Hartman <gregkh@suse.de>,
 linux-kernel@vger.kernel.org, workgroup.linux@csr.com,
 Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
 Barry Song <Baohua.Song@csr.com>, David Woodhouse <dwmw2@infradead.org>,
 Erik Gilling <konkers@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 11:00 AM, Barry Song <Barry.Song@csr.com> wrote:

> From: Barry Song <Baohua.Song@csr.com>
>
> this patch helps to move the common pattern from

Good idea!

> @@ -44,6 +44,7 @@ extern struct device platform_bus;
>
> =A0extern void arch_setup_pdev_archdata(struct platform_device *);
> =A0extern struct resource *platform_get_resource(struct platform_device *=
, unsigned int, unsigned int);
> +extern void __iomem *platform_devm_request_and_ioremap(struct platform_d=
evice *, unsigned int);

But don't you want a reverse call for the module remove() function?

Like:

extern void __iomem *platform_devm_iounmap_and_free(struct
platform_device *, unsigned int);

?

Yours,
Linus Walleij
