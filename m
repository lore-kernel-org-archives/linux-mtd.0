Received: from mail-gx0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsPq1-0001Ar-JV
 for linux-mtd@lists.infradead.org; Wed, 01 Feb 2012 02:22:22 +0000
Received: by ggnf2 with SMTP id f2so471437ggn.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 18:22:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CACRpkdaLekGTdkpfr_Zf5PXAZ16dZsXrwnFHjBe+aEvGb5zYjg@mail.gmail.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
 <CACRpkdaLekGTdkpfr_Zf5PXAZ16dZsXrwnFHjBe+aEvGb5zYjg@mail.gmail.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 1 Feb 2012 10:22:00 +0800
Message-ID: <CAGsJ_4z-QB_1z1Dw3H6sE2Vwe2ZQtRce9uy-Xa3V+sfj2drOuA@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Greg Kroah-Hartman <gregkh@suse.de>,
 linux-kernel@vger.kernel.org, workgroup.linux@csr.com,
 Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
 Barry Song <Baohua.Song@csr.com>, David Woodhouse <dwmw2@infradead.org>,
 Erik Gilling <konkers@google.com>, Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Linus,

2012/2/1 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Jan 31, 2012 at 11:00 AM, Barry Song <Barry.Song@csr.com> wrote:
>
>> From: Barry Song <Baohua.Song@csr.com>
>>
>> this patch helps to move the common pattern from
>
> Good idea!
>
>> @@ -44,6 +44,7 @@ extern struct device platform_bus;
>>
>> =C2=A0extern void arch_setup_pdev_archdata(struct platform_device *);
>> =C2=A0extern struct resource *platform_get_resource(struct platform_devi=
ce *, unsigned int, unsigned int);
>> +extern void __iomem *platform_devm_request_and_ioremap(struct platform_=
device *, unsigned int);
>
> But don't you want a reverse call for the module remove() function?
>
> Like:
>
> extern void __iomem *platform_devm_iounmap_and_free(struct
> platform_device *, unsigned int);

that point is we have the garbage collection mechanism by calling
devm_ function families. everything is undone on driver detach.
so we will not have the free and unmap things.
>
> ?
>
> Yours,
> Linus Walleij

-barry
