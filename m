Received: from [61.78.64.122] (helo=tolkien.mizi.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178wXB-0007RJ-00
	for <linux-mtd@lists.infradead.org>; Sat, 18 May 2002 06:13:37 +0100
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: FAT for NAND Flash
References: <20020516141410.72690.qmail@web21509.mail.yahoo.com>
From: Yong-iL Joh <tolkien@mizi.com>
Date: 18 May 2002 14:13:31 +0900
In-Reply-To: <20020516141410.72690.qmail@web21509.mail.yahoo.com>
Message-ID: <hbznyy9gxw.fsf@tolkien.mizi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Studying MTD <studying_mtd@yahoo.com> writes:

> 3. What is the difference between SmartMedia DOS-FAT
> and ordinary Fat filesystem.

SmartMedia DOS-FAT(abbr. SMFS) filesystem is FAT compatible as they say.
we have implemented SMFS on MTD layer,
as following...

1. FAT (of Linux)
2. SCMTL (similar to FTL, NFTL,...)
3. NAND_smc (it's almost same NAND in MTD except handling ECC)
4. SMC (similart to spia.c)

if you will plan to implement SMFS for bootloader or like that,
just ports SMFS221 from SSDC forum.

-- 
Joh, Yong-iL
E-mail: tolkien@nownuri.net tolkien@mizi.com
