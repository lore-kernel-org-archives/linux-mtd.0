Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SRiLU-0001hb-4I
 for linux-mtd@lists.infradead.org; Tue, 08 May 2012 11:12:44 +0000
Message-ID: <4FA8FF4C.5050400@openwrt.org>
Date: Tue, 08 May 2012 13:11:08 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: xway_nand does not build
References: <1336474838.23308.28.camel@sauron.fi.intel.com>
 <4FA8FD24.6060908@openwrt.org>
 <1336475618.23308.30.camel@sauron.fi.intel.com>
In-Reply-To: <1336475618.23308.30.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: MIPS Mailing List <linux-mips@linux-mips.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> OK, so I should drop this patch from l2-mtd.git:
>
> commit e4445062be41c27b2a0b4f2e1e770d24b68686f4
> Author: John Crispin <blogic@openwrt.org>
> Date:   Mon Apr 30 19:30:48 2012 +0200
>
>     mtd: mips: lantiq: add xway nand support
>     
>     Add NAND support on Lantiq XWAY SoC.
>     
>     The driver uses plat_nand. As the platform_device is loaded from DT, we need
>     to lookup the node and attach our xway specific "struct platform_nand_data"
>     to it.
>     
>     Signed-off-by: John Crispin <blogic@openwrt.org>
>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>
> Right?
Hi,

That would be appreciated. i will get aligned with Ralf to make sure
this patch flow via his tree

Thanks,
John
