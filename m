Received: from bay17-f13.bay17.hotmail.com ([64.4.43.63] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EPbei-0004xQ-Go
	for linux-mtd@lists.infradead.org; Wed, 12 Oct 2005 04:08:17 -0400
Message-ID: <BAY17-F1344AFBDFD00042A2D4837E87B0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de
Date: Wed, 12 Oct 2005 16:08:05 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]add EBH support for jffs2dump
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

This patch add eraseblock header support for
jffs2dump.
With this patch, jffs2dump can dump the fields in
EBH.

The patch is at:
http://www.infradead.org/~forrest/jffs2dump.patch

Thanks,
Forrest
