Received: from bay17-f3.bay17.hotmail.com ([64.4.43.53] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKWRz-0004NX-Ao
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 08:34:01 +0100
Message-ID: <BAY17-F344C9EEA6AC6CEF83CBE2E88D0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de
Date: Wed, 28 Sep 2005 15:33:46 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]erase block header(revision 4)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
This is the forth version. Compared with version 3, the
main changes are:
1 move "priv->jeb->has_ebh = 1;" from jffs2_erase_callback()
to jffs2_erase_succeeded() to prevent eCos from being broken.
2 define ebh at the top of erase.c and this ebh is shared
by jffs2_write_nand_ebh() in wbuf.c
3 remove unnecessary PAD() stuff
4 change has_ebh from uint32_t to one bit of flags
5 remove unnecessary dsize field from struct jffs2_raw_ebh{}
6 use ref_totlen() instead of directly getting __totlen.

The patch is at:
http://www.infradead.org/~forrest/eraseblock_header_r4.patch

Thanks,
Forrest
