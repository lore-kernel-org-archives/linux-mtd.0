Received: from asmtpout028.mac.com ([17.148.16.103])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MnyE4-0001TW-GL
	for linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 17:23:33 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; charset=ISO-8859-1
Received: from spool002.mac.com ([10.150.69.52])
	by asmtp028.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTP id <0KQ200LM6QYUT250@asmtp028.mac.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 10:23:19 -0700 (PDT)
Received: from webmail051 ([10.13.128.51])
	by spool002.mac.com (Sun Java(tm) System Messaging Server 6.3-8.01
	(built Dec
	16 2008; 32bit)) with ESMTP id <0KQ200H9OQYU6MB0@spool002.mac.com> for
	linux-mtd@lists.infradead.org; Wed, 16 Sep 2009 10:23:18 -0700 (PDT)
Date: Wed, 16 Sep 2009 10:23:18 -0700
From: Thomas Jackson <penguinroot@mac.com>
To: linux-mtd@lists.infradead.org
Message-id: <135822900926629194925601609215544403182-Webmail@me.com>
Subject: use U-boot to Boot From a NAND Flash Memory Device
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi List,

I understand NOR-based Flash memory devices have traditionally been used for non-volatile storage for a bootloader for various advantages
including support for execute-in-place code, random access to memory, and zero error rate.  However, we have a project that we would like to use U-boot to Boot From a NAND Flash Memory Device on a ARM926 based board.  Does the community know of any existing mechanisms for this type of configuration?

Thanks in advance!

TJ
