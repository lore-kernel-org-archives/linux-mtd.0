Received: from [65.115.102.195] (helo=nancy)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ZbU8-0004uD-00
	for <linux-mtd@lists.infradead.org>; Tue, 30 Jul 2002 19:12:41 +0100
Message-ID: <FA06AA2C99BCD511951200005A99441001E3ECBE@irvexch1.sextantifs.com>
From: "Curtis, Allen" <Allen.Curtis@Thales-IFS.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Date: Tue, 30 Jul 2002 11:11:02 -0700
Subject: jffs2_scan_eraseblock() - errors
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

While testing power-fail operation of JFFS2, I can consistently produce this
error which occurs when the partition is mounted.

jffs2_scan_eraseblock() - Node at 0xXXXXXX {0x1985, 0xe002, 0x1985c002) has
invalid CRC)

I do not remember if the error is always CRC related and the Node location
changes but the hex values displayed within the parens is consistent.

Has anyone seen this before? Some concerns are:
1. Once the error occurs, it never gets fixed.
2. There does not appear to be a utility to fix errors.

We are using MVista 2.1, which is 2.4.17. I was able to produce this error
with only 13 power-cycles.

Any help would be appreciated!
TIA
