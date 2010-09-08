Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OtHSu-0006P5-BI
	for linux-mtd@lists.infradead.org; Wed, 08 Sep 2010 10:01:17 +0000
Received: by bwz13 with SMTP id 13so6580417bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Sep 2010 03:01:13 -0700 (PDT)
Subject: Re: [PATCH v2] mtd: fix the build warning for fsl_upm.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Roy Zang <tie-fei.zang@freescale.com>
In-Reply-To: <1283935675-14215-1-git-send-email-tie-fei.zang@freescale.com>
References: <1283935675-14215-1-git-send-email-tie-fei.zang@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Sep 2010 12:59:45 +0300
Message-ID: <1283939985.2979.66.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, cbouatmailru@gmail.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-09-08 at 16:47 +0800, Roy Zang wrote:
> Fix the build warning:
> 
> drivers/mtd/nand/fsl_upm.c: In function 'fun_chip_init':
> drivers/mtd/nand/fsl_upm.c:190: warning: format '%x' expects type 'unsigned int', but argument 3 has type 'resource_size_t'
> 
> Signed-off-by: Roy Zang <tie-fei.zang@freescale.com>

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
