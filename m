Received: from fmr18.intel.com ([134.134.136.17] helo=orsfmr003.jf.intel.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOtEg-0002n0-6s
	for linux-mtd@lists.infradead.org; Mon, 10 Oct 2005 09:42:19 +0100
From: "zhao, forrest" <forrest.zhao@intel.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Mon, 10 Oct 2005 16:37:55 +0800
Message-Id: <1128933476.20274.11.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: 
Subject: [PATCH] add eraseblock header support for mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch added the eraseblock header support
for mkfs.jffs2.
In particular, the option
"--eraseblock-header" is used to specify the
eraseblock header size, the default is 28 bytes;
"--no-eraseblock-headers" is used to specify 
that no EBH is written to each erase block.

The patch is at:
http://www.infradead.org/~forrest/mkfs.jffs2.patch

Thanks,
Forrest
