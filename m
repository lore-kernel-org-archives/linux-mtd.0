Received: from bay17-f12.bay17.hotmail.com ([64.4.43.62] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKWZo-00008v-7l
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 03:44:12 -0400
Message-ID: <BAY17-F12414C0763DD8F8C87F486E88D0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Wed, 28 Sep 2005 15:42:01 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]1:1 mapping(revision 2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Compared with revision 1, the main changes are:
1 changing from sizeof(uint8_t *) to sizeof(void *)
2 move the definitin of jffs2_blocks_use_vmalloc()
from nodelist.h to malloc.c
3 other minor cleanups

The patch is at:
http://www.infradead.org/~forrest/1:1mapping_r2.patch

Thanks,
Forrest
