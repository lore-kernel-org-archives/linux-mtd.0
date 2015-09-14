Received: from m50-110.126.com ([123.125.50.110])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZbVMb-0006YA-Hq
 for linux-mtd@lists.infradead.org; Mon, 14 Sep 2015 15:08:14 +0000
Message-ID: <55F6E2C3.7000407@126.com>
Date: Mon, 14 Sep 2015 23:07:47 +0800
From: wangxing <pingfanrenweilai@126.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: panic_write
References: <55F6C9A1.2030203@126.com>
 <CAFLxGvw+pD0ZNqG8RZMeTc481Vdv-DgU0Zoc9EcV5U67YJ+kZw@mail.gmail.com>
In-Reply-To: <CAFLxGvw+pD0ZNqG8RZMeTc481Vdv-DgU0Zoc9EcV5U67YJ+kZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 2015年09月14日 22:24, Richard Weinberger wrote:
> On Mon, Sep 14, 2015 at 3:20 PM, wangxing <pingfanrenweilai@126.com> wrote:
>> Hi, I use the mtdoops get:
>> mtdoops:Cannot write from panic without panic_write.
> Can it be that your MTD driver does not support the panic_write interface?
>
Em, as the message said, I think  MTD driver does not support the 
panic_write interface.
1.Is a writable filesytem enough for mtdoops like jsff2?
2.Is the panic_write interface  highly related to the flash device(I use 
the winbond 32M)? Or is it a common layer interface of mtd.
