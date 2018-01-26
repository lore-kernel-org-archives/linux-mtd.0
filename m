Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ef970-0002jy-IE
 for linux-mtd@lists.infradead.org; Fri, 26 Jan 2018 18:52:32 +0000
Received: by mail-qt0-x241.google.com with SMTP id a27so3783004qtd.1
 for <linux-mtd@lists.infradead.org>; Fri, 26 Jan 2018 10:52:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180124171501.GA1043@lenoch>
References: <20180124100604.GA19593@lenoch> <20180124100754.GC19593@lenoch>
 <CAHp75VeGpj28G60L86d4FDOL1YMAoM5kcdvSC5O6iH4Xi8zfHg@mail.gmail.com>
 <20180124171501.GA1043@lenoch>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 26 Jan 2018 20:52:18 +0200
Message-ID: <CAHp75Vdi=EJoBPe8sS8U3h+QaKR2tqyv2KaF=ixsPoE1qpXOHQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] devres: Add devm_ioremap_shared_resource()
To: Ladislav Michl <ladis@linux-mips.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Tom Lendacky <thomas.lendacky@amd.com>, Borislav Petkov <bp@suse.de>,
 Ingo Molnar <mingo@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Wei Yongjun <weiyongjun1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 24, 2018 at 7:15 PM, Ladislav Michl <ladis@linux-mips.org> wrote:
> On Wed, Jan 24, 2018 at 06:21:38PM +0200, Andy Shevchenko wrote:

>> > +#define devm_ioremap_resource(dev, res) \
>> > +       __devm_ioremap_resource(dev, res, false)
>> > +#define devm_ioremap_shared_resource(dev, res) \
>> > +       __devm_ioremap_resource(dev, res, true)
>> > +void __iomem *__devm_ioremap_resource(struct device *dev, struct resource *res,
>> > +                                     bool shared);
>>
>> I would rather do the following:
>>
>> _resource() ->  _resource_exclusive()
>>
>> #define _resource()  _resource_exclusive()
>>
>> Add _resource_shared()
>>
>> And use long names below in this file whenever refer to exclusive or
>> shared variant.
>
> Two separate functions were also considered, but I was unable to find small
> common implementation.

Common part is still like you have done.

I'm talking about _naming_ scheme here.

> If code size does not matter or you can provide a hint
> to make this solution small and nice, I'll go for it.

It would be the same as in your initial proposal, since I'm not
talking about duplicating anything.

-- 
With Best Regards,
Andy Shevchenko
