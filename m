Received: from ip68-6-32-25.sb.sd.cox.net ([68.6.32.25] helo=speedy.datawave.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16cpvv-0007Cx-00
	for <linux-mtd@lists.infradead.org>; Mon, 18 Feb 2002 15:42:28 +0000
From: "Brian J. Fox" <bfox@ua.com>
To: dwmw2@infradead.org
CC: rob@sysgo.de, linux-mtd@lists.infradead.org,
	joern@wohnheim.fh-wedel.de
In-reply-to: <16804.1014023155@redhat.com> (message from David Woodhouse on
	Mon, 18 Feb 2002 09:05:55 +0000)
Subject: Re: MTD concat layer
Message-Id: <E16cq6b-0004Hq-00@speedy.datawave.net>
Date: Mon, 18 Feb 2002 07:53:29 -0800
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
   Cc: "Brian J. Fox" <bfox@ua.com>, linux-mtd@lists.infradead.org,
       J?rn Engel <joern@wohnheim.fh-wedel.de>
   Date: Mon, 18 Feb 2002 09:05:55 +0000
   Sender: David Woodhouse <dwmw2@redhat.com>

   There is never any excuse for passing invalid offset/length to the
   erase function - even the ioctl code can do a sanity check before
   passing through the values provided by the user.

That's right.

   For errors which can understandably occur, your concerns are valid
   and we should ensure sanity by failing the request as safely as
   possible, doing nothing else.

   This is not such an error. As long as the ioctl() has an
   appropriate sanity check, the occurrence of such an error indicates
   that the kernel code is completely broken. Better to BUG()

BUG() is completely acceptable.  It allows the driver to be fixed.
It's also orthogonal to the original question.  Erasing blocks is
simply a way to guarantee that data has been irrevocably lost.

Brian
== The Difference Between Cultures: ==
    Einigkeit und Recht und Freiheit
    Liberte', E'galite', Fraternite'
    Sex, drugs and rock'n'roll
