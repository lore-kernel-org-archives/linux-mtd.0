Received: from bay17-f5.bay17.hotmail.com ([64.4.43.55] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EF8CN-0004Dq-7l
	for linux-mtd@lists.infradead.org; Tue, 13 Sep 2005 06:39:44 -0400
Message-ID: <BAY17-F5764D8A5D6C706B910F94E89C0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: linux-mtd@lists.infradead.org
Date: Tue, 13 Sep 2005 18:39:33 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Subject: Should we put jffs2_sum_marker into eraseblock_header?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

When writing the eraseblock_header patch, I found the current
summary patch in MTD CVS place jffs2_sum_marker at the end of
each erase block. Since jffs2_sum_marker is a per-eraseblock
structure, should we put it into eraseblock_header when the
eraseblock_header patch is ready in the future?

Thanks,
Forrest
