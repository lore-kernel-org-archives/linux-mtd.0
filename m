Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHA5N-0000Vp-OA
 for linux-mtd@lists.infradead.org; Fri, 30 Jan 2015 11:50:07 +0000
Message-ID: <54CB6F51.2070403@imgtec.com>
Date: Fri, 30 Jan 2015 08:47:29 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: =?UTF-8?B?IlBldGVyIFBhbiDmvZjmoIsgKHBldGVycGFuZG9uZyki?=
 <peterpandong@micron.com>, =?UTF-8?B?IlFpIFdhbmcg546L6LW3IChxaXdhbmcpIg==?=
 <qiwang@micron.com>, Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 0/3] An alternative to SPI NAND
References: <87F60714EC601C4C83DFF1D2E3D390A04AB3F3@NTXXIAMBX02.xacn.micron.com>
 <20150108010257.GP9759@ld-irv-0074>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7714DD2A@NTXXIAMBX02.xacn.micron.com>
 <54ADF90B.1070800@imgtec.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A7714F043@NTXXIAMBX02.xacn.micron.com>
 <54BE2F7B.60003@imgtec.com>
 <71CF8D7F32C5C24C9CD1D0E02D52498A77151E62@NTXXIAMBX02.xacn.micron.com>
 <54CA75F6.5020803@imgtec.com>
 <87F60714EC601C4C83DFF1D2E3D390A04AE751@NTXXIAMBX02.xacn.micron.com>
In-Reply-To: <87F60714EC601C4C83DFF1D2E3D390A04AE751@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Andrew Bresticker <abrestic@chromium.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?IkZyYW5rIExpdSDliJjnvqQgKGZyYW5rbGl1KSI=?= <frankliu@micron.com>,
 =?UTF-8?B?Ik1lbGFuaWUgWmhhbmcg5byg54eVIChtZWxhbmll?= =?UTF-8?B?emhhbmcpIg==?=
 <melaniezhang@micron.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>,
 James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 01/29/2015 09:57 PM, Peter Pan 潘栋 (peterpandong) wrote:
[..]
> 
> Currently, we are working on sharing the bbt code. I think your and Brain's suggestion
> will be very helpful.
> 
> There are two options. We can put struct nand_bbt pointer in either nand_chip
> or mtd_info structure.

I'm sorry, you lost me here. Do you mean struct nand_bbt_descr ?

> If put nand_bbt in nand_chip, we need to change the

I thought the plan was NOT to base spi-nand on nand, so you can't put
this in nand_chip, can you?

Also: After looking at the nand_bbt.c file, I'm wondering how promising
is to separate it from NAND. It seems the BBT code is quite attached to
NAND!

Are you planning to do this in just one patch? Maybe it's better to
start simple and prepare small patches that gradually make the
nand_base.c and nand_bbt.c files less dependent.

For instance, you can get rid of the memory release in a first patch:

        /* Free bad block table memory */
        kfree(chip->bbt);
        if (!(chip->options & NAND_OWN_BUFFERS))
                kfree(chip->buffers);

        /* Free bad block descriptor memory */
        if (chip->badblock_pattern && chip->badblock_pattern->options
                        & NAND_BBT_DYNAMICSTRUCT)
                kfree(chip->badblock_pattern);

by moving it to some nand_bbt_release() function.

I might be pushing some patches to do this, as I think it can be useful
in general to clean this code.
-- 
Ezequiel
