Received: from ip68-6-32-22.sb.sd.cox.net ([68.6.32.22] helo=speedy.datawave.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18dW2s-00040z-00
	for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2003 13:44:59 +0000
From: "Brian J. Fox" <bfox@ua.com>
To: dwmw2@infradead.org
CC: joern@wohnheim.fh-wedel.de, phil@river-bank.demon.co.uk,
	hno@marasystems.com, linux-mtd@lists.infradead.org
In-reply-to: <9649.1043761486@passion.cambridge.redhat.com> (message from
	David Woodhouse on Tue, 28 Jan 2003 13:44:46 +0000)
Subject: Re: JFFS2 Format Documentation?
Message-Id: <E18dWJm-0000NO-00@speedy.datawave.net>
Date: Tue, 28 Jan 2003 06:02:26 -0800
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

   From: David Woodhouse <dwmw2@infradead.org>
   Date: Tue, 28 Jan 2003 13:44:46 +0000

   phil@river-bank.demon.co.uk said:
   > David's paper is a good start but I was after a lower level of detail.
   > I need  something from which I can implement a JFFS2 reader from
   > scratch (ie. without  any GPL code). 

   The on-medium format is very simple. The actual layout of the
   existing node types is detailed in full in include/linux/jffs2.h.
   In conjunction with the theory of operation described in the paper,
   these should be perfectly sufficient.

Perhaps he can't read that header file without "contaminating" his
clean-room implementation?

Phil?

Brian
--
More people use Apache than Word, and it does them more good.
  Kragen Sitaker, Mon, 04 Nov 2002 21:32:18 -0800
