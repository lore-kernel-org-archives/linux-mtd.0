Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1PM0SY-0002SD-W8
	for linux-mtd@lists.infradead.org; Fri, 26 Nov 2010 15:43:42 +0000
Received: by bwz5 with SMTP id 5so2026338bwz.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 26 Nov 2010 07:43:37 -0800 (PST)
Subject: Re: [PATCH 1/1] [MTD]:CORE Fix wrong check register_blkdev return
	value
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Frank Li <Frank.Li@freescale.com>
In-Reply-To: <1289386349-29033-1-git-send-email-Frank.Li@freescale.com>
References: <1289386349-29033-1-git-send-email-Frank.Li@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 26 Nov 2010 17:43:04 +0200
Message-ID: <1290786184.2552.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel.vger.kernel.org@shlinux.ap.freescale.net
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-11-10 at 18:52 +0800, Frank Li wrote:
> register_blkdev return 1..255 when major = 0.
> 
> if (ret ) {
> 	printk(KERN_WARNING "Unable to register %s block device on major %d: %d\n",
> 		tr->name, tr->major, ret);
> 	      mutex_unlock(&mtd_table_mutex);
> 	return ret;
> }
> 
> Above code will return fail when register_blkdev return allocated major number.
> 
> Signed-off-by: Frank Li <Frank.Li@freescale.com>

This patch is already in upstream.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
