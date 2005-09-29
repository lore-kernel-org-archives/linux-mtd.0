Received: from bay17-f16.bay17.hotmail.com ([64.4.43.66] helo=hotmail.com)
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EKsrl-0008Ew-TI
	for linux-mtd@lists.infradead.org; Thu, 29 Sep 2005 03:30:13 -0400
Message-ID: <BAY17-F16455592CF9453C2183C0BE88C0@phx.gbl>
From: "zhao forrest" <zhao_fusheng@hotmail.com>
To: dedekind@yandex.ru, joern@wohnheim.fh-wedel.de
Date: Thu, 29 Sep 2005 15:30:03 +0800
Mime-Version: 1.0
Content-Type: text/plain; charset=gb2312; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH]enhanced wear-leveling based on erase count
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Here I port my original enhanced WL patch to latest 
MTD CVS.

The main changes are:
1 use the gap between index_of_highest_filled_bucket and
index_of_lowest_filled_bucket as the timing indicator of
WL adjustment.
2 when WL adjustment is necessary, we get block from used
blocks hash table with 1% possiblity.

The patch is at:
http://www.infradead.org/~forrest/wl.patch

Thanks,
Forrest
