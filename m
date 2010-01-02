Received: from mail-iw0-f202.google.com ([209.85.223.202])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NQwBI-0000Yc-A0
	for linux-mtd@lists.infradead.org; Sat, 02 Jan 2010 05:05:44 +0000
Received: by iwn40 with SMTP id 40so7195062iwn.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Jan 2010 21:05:38 -0800 (PST)
Message-ID: <4B3ED430.5040607@billgatliff.com>
Date: Fri, 01 Jan 2010 23:05:52 -0600
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Can ID the NAND chip, but every erase block is bad?
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guys:


I have a platform with an ancient Linux kernel that I'm updating, and
I'm having some problems.  The platform has a Freescale MPC5200, a
Samsung K9 NAND flash chip, and it all works fine under 2.6.20, I'm
trying to bring it up to 2.6.32.

Simply put, when I register the gen_nand device for this chip under
2.6.32, it successfully identifies the chip but then says that every
single eraseblock in the chip is bad.  When I reboot to the 2.6.20
kernel, I don't get any complaints there.  I see the same problem both
with and without CONFIG_MTD_NAND_ECC_SMC.

Anyone have any ideas on where I should look for the problem?  Thanks!


b.g.

-- 
Bill Gatliff
Embedded systems training and consulting
http://billgatliff.com
bgat@billgatliff.com
