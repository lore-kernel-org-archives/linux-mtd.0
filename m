Received: from wproxy.gmail.com ([64.233.184.199])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CbS2P-00044A-8h
	for linux-mtd@lists.infradead.org; Mon, 06 Dec 2004 18:13:02 -0500
Received: by wproxy.gmail.com with SMTP id 58so182857wri
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Dec 2004 15:13:00 -0800 (PST)
Message-ID: <4de512b7041206150853f90f61@mail.gmail.com>
Date: Mon, 6 Dec 2004 16:08:46 -0700
From: Vernon Fuller <vernonfuller@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: what version of mkfs.jffs2 is recommended for 2.4.21
Reply-To: Vernon Fuller <vernonfuller@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am running 2.4.21-rmk2-pxa1 and am looking for matching mtd utilities.
I have tried mkfs.jffs2  1.41, 1.39 and even 1.26
what would you recommend?


The way I tell I have a mismatched version is jffs2_scan_eraseblock()
gets off and can't find more than a few Magic bitmasks on blocks that
should be formatted correctly.   My root jffs2 filesystem mounts,
after much of it has been erased.
