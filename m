Received: from el-out-1112.google.com ([209.85.162.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JV4jM-00013d-Og
	for linux-mtd@lists.infradead.org; Fri, 29 Feb 2008 12:52:52 +0000
Received: by el-out-1112.google.com with SMTP id o28so484485ele.22
	for <linux-mtd@lists.infradead.org>;
	Fri, 29 Feb 2008 04:52:50 -0800 (PST)
Message-ID: <4558af040802290452q653549f5m199f71050fb359e1@mail.gmail.com>
Date: Fri, 29 Feb 2008 20:52:49 +0800
From: "liu yang" <liudows2@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: question about struct map_info
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, all.

In the MTD driver for nor flash,  we should define a 'map_info'
struct. But what is the use of
map_info->read/write ? What is the difference between
map_info->read/write and mtd_info->read/write ?
I think the fs layer should call mtd_info->read/write, but not
map_info->read/write. Who is the caller of map_info->read/write?

Thanks!

liu yang
