Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKSS1-0001J8-Nb
 for linux-mtd@lists.infradead.org; Wed, 29 Jul 2015 14:35:22 +0000
Received: by vkci6 with SMTP id i6so1953858vkc.3
 for <linux-mtd@lists.infradead.org>; Wed, 29 Jul 2015 07:34:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55B88952.1060709@dave-tech.it>
References: <mailman.4028.1438106338.1758.linux-mtd@lists.infradead.org>
 <mailman.4028.1438106338.1758.linux-mtd.{c3fbf4b6-bd46-4f1f-ba46-40c78864ddc3}.0@lists.infradead.org>
 <1438105841-22314-1-git-send-email-b45815@freescale.com>
 <55B88952.1060709@dave-tech.it>
Date: Wed, 29 Jul 2015 09:34:59 -0500
Message-ID: <CA+EcR21ert+xksT92-=jQ6HSPEVdOo3gYGttqvsUW2LE9Jk9qA@mail.gmail.com>
Subject: Re: [PATCH 5/6] mtd: nand: gpmi: correct bitflip for erased NAND page
From: Han Xu <xhnjupt@gmail.com>
To: Andrea Scian <rnd4@dave-tech.it>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Han Xu <b45815@freescale.com>,
 Fabio Estevam <fabio.estevam@freescale.com>, boris.brezillon@free-electrons.com,
 Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 Nicholas Mc Guire <hofrat@osadl.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrea,

The threshold gf/2 is referred to Huang Shijie's previous patch for bitflip,

http://lists.infradead.org/pipermail/linux-mtd/2014-January/051513.html

To verify the function, I raw write the whole NAND page with 0xFF and several
scattered bits with 0x0 to fake the bitflip, since the real bitflip is
unpredictable and tested the feature with Micron MT29F64G08AFAAA.


On Wed, Jul 29, 2015 at 3:05 AM, Andrea Scian <rnd4@dave-tech.it> wrote:
> Dear Han Xu,
>
>
> Il 28/07/2015 19:50, Han Xu ha scritto:
>>
>> i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
>> bitflip number for erased NAND page. So for these two platform, set the
>> erase threshold to gf/2 and if bitflip detected, GPMI driver will
>> correct the data to all 0xFF.
>
>
>
> That's an iteresting feature of iMX6QP
> We were discussing about erased NAND page bitflip in MTD ML a few days ago.
>
> Is gf/2 a right value to choose? Why?
> IIUC, in a previuos MTD-level patch [1] Brian used ECC strength as
> threshold.
>
> Could you please also share with which NAND device you tested this patch?
>
> Kind regards and TIA,
>
> --
>
> Andrea SCIAN
>
> DAVE Embedded Systems
>
> [1] http://article.gmane.org/gmane.linux.drivers.mtd/52216
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
