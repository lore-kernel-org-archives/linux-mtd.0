Received: from [61.155.114.21] (helo=mail.mobilesoft.com.cn)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BuKnu-0005wG-Ua
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2004 20:47:53 -0400
Date: Tue, 10 Aug 2004 08:52:04 +0800
From: Wu Jian Feng <jianfengw@mobilesoft.com.cn>
To: David Woodhouse <dwmw2@infradead.org>
Message-ID: <20040810005204.GA15714@mobilesoft.com.cn>
References: <20040807150458.E2805@flint.arm.linux.org.uk>
	<20040808061206.GA5417@mobilesoft.com.cn>
	<1091962414.1438.977.camel@imladris.demon.co.uk>
	<20040809015950.GA20408@mobilesoft.com.cn>
	<1092057472.4383.5155.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1092057472.4383.5155.camel@hades.cambridge.redhat.com>
Sender: Wu Jian Feng <jianfengw@mobilesoft.com.cn>
Cc: Russell King <rmk+lkml@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
	Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [BUG] 2.6.8-rc3 slab corruption (jffs2?)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 09, 2004 at 02:17:53PM +0100, David Woodhouse wrote:
> 
> Please could you test this....
> 

It doesn't compile :-(

--- mtdpart.c.old	2004-08-10 08:47:22.000000000 +0800
+++ mtdpart.c	2004-08-10 00:39:11.000000000 +0800
@@ -252,7 +252,7 @@
 void mtd_erase_callback(struct erase_info *instr)
 {
 	if (instr->mtd->erase == part_erase) {
-		struct mtd_part *part = PART(mtd);
+		struct mtd_part *part = PART(instr->mtd);
 
 		if (instr->fail_addr != 0xffffffff)
 			instr->fail_addr -= part->offset;


Then worked fine here, Thanks!
