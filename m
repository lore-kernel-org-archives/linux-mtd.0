Received: from 206.173.66.57.ptr.us.xo.net ([206.173.66.57]
	helo=zebra.brightstareng.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DOFRP-0008By-Od
	for linux-mtd@lists.infradead.org; Wed, 20 Apr 2005 09:40:32 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by zebra.brightstareng.com (Postfix) with ESMTP id 8BC2528C2A0
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Apr 2005 09:40:32 -0400 (EDT)
Received: from zebra.brightstareng.com ([127.0.0.1])
	by localhost (zebra [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 09731-02 for <linux-mtd@lists.infradead.org>;
	Wed, 20 Apr 2005 09:40:30 -0400 (EDT)
Received: from pippin (unknown [192.168.1.25])
	by zebra.brightstareng.com (Postfix) with ESMTP id E576C28C1E2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Apr 2005 09:40:30 -0400 (EDT)
From: Ian McDonnell <ian@brightstareng.com>
To: linux-mtd@lists.infradead.org
Date: Wed, 20 Apr 2005 09:40:30 -0400
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200504200940.30757.ian@brightstareng.com>
Subject: Suggestion: Give JFFS its own mail list.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is it time to give JFFS/JFFS2 a mail list of its own?

I am a user intested in MTD and below but not jffs, and
it seams like there's a lot of jffs adn jffs/mtd discussion on 
the MTD list.

Decoupling the two mail lists may indirectly help improve the 
MTD/mtd-clent (JFFS2,YAFFS,Char-IO/Block-IO) API by focusing
more on the abstract interface and less on application specifics.

-ian
