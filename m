Received: from samwise.efn.org ([12.33.21.33])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1Dqvgd-0001Je-UR
	for linux-mtd@lists.infradead.org; Fri, 08 Jul 2005 12:26:51 -0400
Received: from amazonia.client.comcast.net (c-24-20-117-59.hsd1.or.comcast.net
	[24.20.117.59])
	by samwise.efn.org (Postfix) with ESMTP id B8B211701E3
	for <linux-mtd@lists.infradead.org>;
	Fri,  8 Jul 2005 09:26:40 -0700 (PDT)
Received: from rick by amazonia.client.comcast.net with local (Exim 3.36 #1
	(Debian)) id 1DqvgV-000275-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Jul 2005 09:26:39 -0700
To: linux-mtd@lists.infradead.org
Message-Id: <E1DqvgV-000275-00@amazonia.client.comcast.net>
From: Rick Bronson <rick@efn.org>
Date: Fri, 08 Jul 2005 09:26:39 -0700
Subject: infinite loop in jffs2_flush_wbuf_gc()?
Reply-To: rick@efn.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

  I seem to encounter an infinite loop in in jffs2_flush_wbuf_gc() in
wbuf.c starting at: 

	} else while (old_wbuf_len &&
		      old_wbuf_ofs == c->wbuf_ofs) {

  Once it gets in this loop, I don't see how it ever gets out if
c->wbuf_ofs doesn't change.

  Thanks so much for any help.

  Rick Bronson
