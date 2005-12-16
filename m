Received: from bay113-f2.bay113.hotmail.com ([65.54.168.12] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EnCSD-0002l6-60
	for linux-mtd@lists.infradead.org; Fri, 16 Dec 2005 05:04:48 -0500
Message-ID: <BAY113-F234AEF9342BB5E683064AE83A0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru
Date: Fri, 16 Dec 2005 17:47:06 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: A question about frag merge in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Artem

What will happen for the following case in JFFS2?
1 A process write small frags to flash through JFFS2,
for example the frag length is 15 bytes.
2 after some time, when GC is triggered, how merge operation
proceed? Will GC merge as many frags as possible?

Thanks,
Forrest
