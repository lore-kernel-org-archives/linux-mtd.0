Received: from krynn.axis.se ([193.13.178.10])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15tooA-0003qW-00
	for <linux-mtd@lists.infradead.org>; Wed, 17 Oct 2001 12:24:22 +0100
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6C52@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: =?iso-8859-1?Q?=27J=F6rn_Engel=27?= <joern@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: MTD partitioning rewrite
Date: Wed, 17 Oct 2001 13:33:01 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> Here are some quick pointers at my design goals:
> - An MTD device will be the equivalent of a hard drive. There will be
> several, named mtda, mtdb, mtdc,...
> - Each MTD device can be partitioned into mtda0 (whole device), mtda1,
> mtda2,...

Would it still be possible to make a logical partition that extends over
several flash chips (e.g. one big partition of two chips)?

/Jonas
