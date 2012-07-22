Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SsqHB-00049P-KJ
 for linux-mtd@lists.infradead.org; Sun, 22 Jul 2012 07:08:26 +0000
Message-ID: <500BA6B8.1040700@openwrt.org>
Date: Sun, 22 Jul 2012 09:07:36 +0200
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] MTD: MIPS: lantiq: Add NAND support on Lantiq XWAY
 SoC.
References: <1342940398-2162-1-git-send-email-blogic@openwrt.org>
 <1342940398-2162-2-git-send-email-blogic@openwrt.org>
In-Reply-To: <1342940398-2162-2-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22/07/12 08:59, John Crispin wrote:
> The driver uses plat_nand. As the platform_device is loaded from DT, we need
> to lookup the node and attach our xway specific "struct platform_nand_data"
> to it.
>
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> Cc: linux-mtd@lists.infradead.org

Hi Artem,

This patch was ack'ed for 3.5, but i then decided to drop it to avoid
merger order problems.
can you queue it for 3.6 please ?

Thanks,
John
