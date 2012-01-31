Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RsLdc-0000kc-3a
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2012 21:53:16 +0000
Received: by pbdx9 with SMTP id x9so616850pbd.36
 for <linux-mtd@lists.infradead.org>; Tue, 31 Jan 2012 13:53:15 -0800 (PST)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <CACRpkdaLekGTdkpfr_Zf5PXAZ16dZsXrwnFHjBe+aEvGb5zYjg@mail.gmail.com>
References: <1328004002-24646-1-git-send-email-Barry.Song@csr.com>
 <1328004002-24646-2-git-send-email-Barry.Song@csr.com>
 <CACRpkdaLekGTdkpfr_Zf5PXAZ16dZsXrwnFHjBe+aEvGb5zYjg@mail.gmail.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Tue, 31 Jan 2012 14:52:55 -0700
Message-ID: <CACxGe6srOi97g1OHDAULLcGP95ZGb8AJVURRFJt062HiN43wSg@mail.gmail.com>
Subject: Re: [PATCH 1/3] platform: add common resource requesting and mapping
 helper
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Atsushi Nemoto <anemo@mba.ocn.ne.jp>, Greg Kroah-Hartman <gregkh@suse.de>,
 linux-kernel@vger.kernel.org, workgroup.linux@csr.com,
 linux-mtd@lists.infradead.org, Barry Song <Baohua.Song@csr.com>,
 David Woodhouse <dwmw2@infradead.org>, Erik Gilling <konkers@google.com>,
 Barry Song <Barry.Song@csr.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 31, 2012 at 2:20 PM, Linus Walleij <linus.walleij@linaro.org> w=
rote:
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
>> =A0extern void arch_setup_pdev_archdata(struct platform_device *);
>> =A0extern struct resource *platform_get_resource(struct platform_device =
*, unsigned int, unsigned int);
>> +extern void __iomem *platform_devm_request_and_ioremap(struct platform_=
device *, unsigned int);
>
> But don't you want a reverse call for the module remove() function?
>
> Like:
>
> extern void __iomem *platform_devm_iounmap_and_free(struct
> platform_device *, unsigned int);

I wouldn't because it is exactly the same as the normal unwind call.
I don't think the name redirection buys us anything here.

g.
