Received: from valiant.concentric.net ([207.155.252.9]
	helo=valiant.cnchost.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACLbr-0006Zl-SM
	for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2003 17:13:20 +0100
Errors-To: <sri@technovare.com>
Message-ID: <010001c398b6$aeadc740$1000a8c0@tsihq.com>
From: "Srikanth Sherman" <sri@technovare.com>
To: <linux-mtd@lists.infradead.org>
Date: Wed, 22 Oct 2003 09:08:07 -0700
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Running FAT+MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

After reading some of the old archives of the MTD list,
it looks like at least a few people have used FAT+NFTL
instead of JFFS.  The one question I have is that how do
they take care of things like wear-leveling and garbage-collection?  Aren't
they a function of JFFS or am I completely confused about MTD?  Thanks.

Sri
