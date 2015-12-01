Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3iuF-0007rP-6Y
 for linux-mtd@lists.infradead.org; Tue, 01 Dec 2015 11:15:45 +0000
Date: Tue, 1 Dec 2015 12:15:12 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 dwmw2@infradead.org, michals@xilinx.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, kpc528@gmail.com,
 kalluripunnaiahchoudary@gmail.com, Punnaiah Choudary Kalluri
 <punnaia@xilinx.com>
Subject: Re: [PATCH] mtd: Expand the ecc placement locations to 1216
Message-ID: <20151201121512.40ce9cce@bbrezillon>
In-Reply-To: <20151120193342.GX64635@google.com>
References: <1446742735-20824-1-git-send-email-punnaia@xilinx.com>
 <20151120193342.GX64635@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian, Punnaiah,

On Fri, 20 Nov 2015 11:33:42 -0800
Brian Norris <computersforpeace@gmail.com> wrote:

> On Thu, Nov 05, 2015 at 10:28:55PM +0530, Punnaiah Choudary Kalluri wrote:
> > Device like MT29F32G08ABCDBJ4 have a writesize/oobsize of 16K/1216 Bytes.
> > So, increasing the maximum ecc placement locations to 1216
> 
> I'd really prefer not increasing the size of the internal arrays any
> more. The structures should be rewritten to be dynamic.

I already started this migration (you can find the code here [1]). I
was planning to rework this series to make the eccpos definition mimic
what's done for oobfree (as suggested by Brian) before sending it, but
I'm not sure when I'll be able to do that, so if you really need that
quickly I suggest you submit those patches instead of reimplementing
it yourself.

Best Regards,

Boris

[1]https://github.com/bbrezillon/linux-sunxi/commits/nand/ecclayout

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
