Received: from bay17-f15.bay17.hotmail.com ([64.4.43.65] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EOV3Z-000718-1y
	for linux-mtd@lists.infradead.org; Sun, 09 Oct 2005 02:53:27 -0400
Message-ID: <BAY17-F15DEB2FFF5F102120DB7A6E8860@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de, dedekind@yandex.ru
Date: Sun, 09 Oct 2005 14:53:11 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]erase block header(revision 5)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Being compared with version 4, the main changes are:
1 remove data_crc field from struct jffs2_raw_ebh
2 change the macro names for EBH in flags
3 rollback to stack allocation of ebh
4 encapsulate the complidated condition judgement into
small functions. has_expected_free_size() and 
need_mark_first_node_obsolete().

The revised patch is at:
http://www.infradead.org/~forrest/eraseblock_header_r5.patch

Thanks,
Forrest
