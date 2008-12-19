Received: from web58902.mail.re1.yahoo.com ([66.196.100.231])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LDXPI-0005Hq-Av
	for linux-mtd@lists.infradead.org; Fri, 19 Dec 2008 04:56:12 +0000
Date: Thu, 18 Dec 2008 20:56:11 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: UBIFS option to make volume not do compression
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <56453.82824.qm@web58902.mail.re1.yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I would like the option to create an empty UBIFS file system that has compression disabled.   I know I can do this via mkfs.ubifs, ubinit, etc ... but this is not helpful when just creating a empty file system for testing.

this option would be equivalent to the -x none option.

Philip



      
