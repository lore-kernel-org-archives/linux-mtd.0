Received: from cuees8.ee.cuhk.edu.hk ([137.189.32.50])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F6Pis-0006f5-5F
	for linux-mtd@lists.infradead.org; Tue, 07 Feb 2006 05:05:31 -0500
Received: from cuees7.ee.cuhk.edu.hk (cuees7.ee.cuhk.edu.hk [137.189.32.222])
	by cuees8.ee.cuhk.edu.hk (8.12.9-20030924/8.12.9) with ESMTP id
	k179uDJ7000371 for <linux-mtd@lists.infradead.org>;
	Tue, 7 Feb 2006 17:56:13 +0800 (HKT)
Received: (from nobody@localhost)
	by cuees7.ee.cuhk.edu.hk (8.12.9-20030924/8.12.9) id k179uDrD015861
	for linux-mtd@lists.infradead.org; Tue, 7 Feb 2006 17:56:13 +0800 (HKT)
Message-ID: <1139306173.43e86ebd94f5c@webmail.ee.cuhk.edu.hk>
Date: Tue,  7 Feb 2006 17:56:13 +0800
From: pttsui@ee.cuhk.edu.hk
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
Subject: OOB byte assignment Question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, I am writting to check whether there is a standard scheme for the byte
assignment in the NAND Flash Spare OOB region?
For example, what physical meaning byte [15..0] is corresponding.
Is it a standard (Apart from the bad block indicator)? Is it independent to the
MTD users?  

Also, I read through the nand_base.c and find the following:

static struct nand_oobinfo nand_oob_8 
static struct nand_oobinfo nand_oob_16
static struct nand_oobinfo nand_oob_64

I would like to know which one correspond to small page (528B) and which one
correspond to large page (2KB). Any difference for x8 and x16 organised flash?

Sorry if I ask naive question but I am really eager to know it. Thx

Rgds, Nelson.
