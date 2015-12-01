Received: from mail-oi0-x231.google.com ([2607:f8b0:4003:c06::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3nX0-0001jO-FC
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 16:11:55 +0000
Received: by oiww189 with SMTP id w189so6536664oiw.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Dec 2015 08:11:33 -0800 (PST)
MIME-Version: 1.0
Sender: kalluripunnaiahchoudary@gmail.com
In-Reply-To: <20151201121512.40ce9cce@bbrezillon>
References: <1446742735-20824-1-git-send-email-punnaia@xilinx.com>
 <20151120193342.GX64635@google.com>
 <20151201121512.40ce9cce@bbrezillon>
Date: Tue, 1 Dec 2015 21:41:33 +0530
Message-ID: <CAGnW=BYU3zFXXKX68d9y0xoe16MRkKJ928X2wXNDPWTd5-tWHw@mail.gmail.com>
Subject: Re: [PATCH] mtd: Expand the ecc placement locations to 1216
From: punnaiah choudary kalluri <punnaia@xilinx.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "michals@xilinx.com" <michals@xilinx.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, Punnaiah Choudary <kpc528@gmail.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On Tue, Dec 1, 2015 at 4:45 PM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> Brian, Punnaiah,
>
> On Fri, 20 Nov 2015 11:33:42 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
>
>> On Thu, Nov 05, 2015 at 10:28:55PM +0530, Punnaiah Choudary Kalluri wrote:
>> > Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1216 Bytes.
>> > So, increasing the maximum ecc placement locations to 1216
>>
>> I'd really prefer not increasing the size of the internal arrays any
>> more. The structures should be rewritten to be dynamic.
>
> I already started this migration (you can find the code here [1]). I
> was planning to rework this series to make the eccpos definition mimic
> what's done for oobfree (as suggested by Brian) before sending it, but
> I'm not sure when I'll be able to do that, so if you really need that
> quickly I suggest you submit those patches instead of reimplementing
> it yourself.
>

Sure. let me check your implementation and then send these patches for review
with your sign off.

Thanks,
Punnaiah

> Best Regards,
>
> Boris
>
> [1]https://github.com/bbrezillon/linux-sunxi/commits/nand/ecclayout
>
> --
> Boris Brezillon, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
