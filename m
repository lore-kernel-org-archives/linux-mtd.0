Received: from mga03.intel.com ([143.182.124.21])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5xxl-0002MY-Tu
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 11:26:22 +0000
Message-ID: <1331292517.29445.6.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2 1/3] MTD: MIPS: lantiq: use module_platform_driver
 inside lantiq map driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
Date: Fri, 09 Mar 2012 13:28:37 +0200
In-Reply-To: <1330013024-13622-1-git-send-email-blogic@openwrt.org>
References: <1330013024-13622-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 Ralf Baechle <ralf@linux-mips.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-02-23 at 17:03 +0100, John Crispin wrote:
> Reduce boilerplate code by converting driver to module_platform_driver.
> 
> Signed-off-by: John Crispin <blogic@openwrt.org>
> Cc: linux-mtd@lists.infradead.org

This is not an independent patch - do you want to merge it via the mips
tree?

-- 
Best Regards,
Artem Bityutskiy
