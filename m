Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5II2-00005N-2F
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2013 16:01:03 +0000
Message-ID: <1360684853.12703.118.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: lantiq: Add NAND support on Lantiq Falcon SoC.
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: John Crispin <blogic@openwrt.org>
Date: Tue, 12 Feb 2013 18:00:53 +0200
In-Reply-To: <1359577936-7004-1-git-send-email-blogic@openwrt.org>
References: <1359577936-7004-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Langer <thomas.langer@lantiq.com>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-01-30 at 21:32 +0100, John Crispin wrote:
> The driver uses plat_nand. As the platform_device is loaded from DT, we need
> to lookup the node and attach our falcon specific "struct platform_nand_data"
> to it.
> 
> Signed-off-by: Thomas Langer <thomas.langer@lantiq.com>
> Signed-off-by: John Crispin <blogic@openwrt.org>

Would you please send me or point to the defconfig file which I can use
to compile-test this?

-- 
Best Regards,
Artem Bityutskiy
