Received: from bay17-f26.bay17.hotmail.com ([64.4.43.76] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKAf9-0008HD-Ut
	for linux-mtd@lists.infradead.org; Tue, 27 Sep 2005 04:18:17 -0400
Message-ID: <BAY17-F26CCF10BB1004AFDDBDF51E88A0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: joern@wohnheim.fh-wedel.de
Date: Tue, 27 Sep 2005 15:59:41 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]enhanced 1:1 mapping(revision 1)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I revised the patch according to Joern's comments.
Now the basic data structure is:
vmalloc()/kmalloc + pointer array + slab cache.
Also I did some code re-constructure to make it more clean.

The patch is at 
http://www.infradead.org/~forrest/1:1mapping_r1.patch

Thanks,
Forrest
