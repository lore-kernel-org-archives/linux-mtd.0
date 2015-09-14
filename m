Received: from mail-ob0-x229.google.com ([2607:f8b0:4003:c01::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbUgk-0006Eq-65
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2015 14:24:58 +0000
Received: by obbzf10 with SMTP id zf10so54018462obb.2
 for <linux-mtd@lists.infradead.org>; Mon, 14 Sep 2015 07:24:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55F6C9A1.2030203@126.com>
References: <55F6C9A1.2030203@126.com>
Date: Mon, 14 Sep 2015 16:24:36 +0200
Message-ID: <CAFLxGvw+pD0ZNqG8RZMeTc481Vdv-DgU0Zoc9EcV5U67YJ+kZw@mail.gmail.com>
Subject: Re: panic_write
From: Richard Weinberger <richard.weinberger@gmail.com>
To: wangxing <pingfanrenweilai@126.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 14, 2015 at 3:20 PM, wangxing <pingfanrenweilai@126.com> wrote:
> Hi, I use the mtdoops get:
> mtdoops:Cannot write from panic without panic_write.

Can it be that your MTD driver does not support the panic_write interface?

-- 
Thanks,
//richard
