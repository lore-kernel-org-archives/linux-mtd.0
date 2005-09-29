Received: from bay17-f29.bay17.hotmail.com ([64.4.43.79] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKsdg-0007vp-Vr
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 03:15:40 -0400
Message-ID: <BAY17-F294C924184D625D98CF65FE88C0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de
Date: Thu, 29 Sep 2005 15:15:30 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]erase count tracking in JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here I port my original patch to make it adapt
to eraseblock header.
Since EBH has include erase count, part of erase count
tracking work has been done in EBH patch.
The main functionality of this patch is to record
max_erase_count, and assign the average erase_count
to blocks, which has no EBH previously.

The patch is at:
http://www.infradead.org/~forrest/ect.patch

Thanks,
Forrest
