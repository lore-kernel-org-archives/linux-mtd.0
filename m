Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1kJL-0004Xs-4r
 for linux-mtd@lists.infradead.org; Wed, 15 Aug 2012 20:35:27 +0000
Message-ID: <502C07BC.5010302@openwrt.org>
Date: Wed, 15 Aug 2012 22:34:04 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 2/2] MTD: MIPS: lantiq: Add NAND support on Lantiq XWAY
 SoC.
References: <1342940398-2162-1-git-send-email-blogic@openwrt.org>
 <1342940398-2162-2-git-send-email-blogic@openwrt.org>
In-Reply-To: <1342940398-2162-2-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The driver uses plat_nand. As the platform_device is loaded from DT, we need
> to lookup the node and attach our xway specific "struct platform_nand_data"
> to it.
>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: linux-mtd@lists.infradead.org
> ---
Hi David,

is it ok if we have this patch go upstream via lmo for 3.7 ?

John
