Received: from bay17-f31.bay17.hotmail.com ([64.4.43.81] helo=hotmail.com)
	by pentafluge.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EJoDL-0000jw-4p
	for linux-mtd@lists.infradead.org; Mon, 26 Sep 2005 09:19:56 +0100
Message-ID: <BAY17-F3179BEFDF1ABD013971FD1E88B0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de, havasi@inf.u-szeged.hu
Date: Mon, 26 Sep 2005 16:18:15 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]erase block header(revision 2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This is second revision of erase block header patch.
Compared with revision 1, the following changes are made:
1 totally remove JFFS2_NODETYPE_DIRENT_EBH and
JFFS2_NODETYPE_INODE_EBH stuff
2 change the node type from JFFS2_FEATURE_INCOMPAT to
JFFS2_FEATURE_RWCOMPAT_DELETE
3 replace 4 with sizeof(uint32_t) in summary.c

The patch is at 
http://www.infradead.org/~forrest/eraseblock_header_r2.patch

Thanks,
Forrest
