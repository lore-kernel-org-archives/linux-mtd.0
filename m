Received: from bay17-f18.bay17.hotmail.com ([64.4.43.68] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKAWY-00084j-CI
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 04:09:26 -0400
Message-ID: <BAY17-F186337C136F8081E8E2828E88A0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de
Date: Tue, 27 Sep 2005 15:51:42 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]erase block header(revision 3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is the revision 3 of erase block header patch.
Compare with revision 2, the main changes are:
1 to keep consistency, rename struct jffs2_eraseblock_header
to struct jffs2_raw_ebh
2 change the type of has_ebh to uint32_t
3 store the real length into totlen
4 rename fs_version into reserved in order to give it a
useful name.

The patch is at:
http://www.infradead.org/~forrest/eraseblock_header_r3.patch

Thanks,
Forrest
