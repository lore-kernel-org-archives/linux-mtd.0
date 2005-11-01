Received: from bay113-f27.bay113.hotmail.com ([65.54.168.37] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EWrjP-0007HN-VS
	for linux-mtd@lists.infradead.org; Tue, 01 Nov 2005 03:43:02 -0500
Message-ID: <BAY113-F27F5FC3289B97BC33017FBE86F0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de
Date: Tue, 01 Nov 2005 16:25:36 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]erase block header support in JFFS2(revision 6)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is the 6th version of the patch.
The only change compared with 5th version is:
I replace jffs2_cleanmarker_oob() with jffs2_ebh_oob() to
avoid confusion since cleanmarker is gone.

The patch is at:
http://www.infradead.org/~forrest/eraseblock_header_r6.patch

Your comments are welcome.

Thanks,
Forrest
