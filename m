Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D8Hby-0004in-4l
	for linux-mtd@lists.infradead.org; Mon, 07 Mar 2005 07:45:26 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id j27CjPbc023171
	for <linux-mtd@lists.infradead.org>; Mon, 7 Mar 2005 07:45:25 -0500
Received: from d01av02.pok.ibm.com (d01av02.pok.ibm.com [9.56.224.216])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	j27CjPWY064608
	for <linux-mtd@lists.infradead.org>; Mon, 7 Mar 2005 07:45:25 -0500
Received: from d01av02.pok.ibm.com (loopback [127.0.0.1])
	by d01av02.pok.ibm.com (8.12.11/8.12.11) with ESMTP id j27CjOMv016537
	for <linux-mtd@lists.infradead.org>; Mon, 7 Mar 2005 07:45:24 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050307111307.GA9597@wohnheim.fh-wedel.de>
References: <1110043569.11425.63.camel@squizzey.bult.co.uk>
	<20050307110413.GD2198@wohnheim.fh-wedel.de>
	<20050307111307.GA9597@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Date: Mon, 07 Mar 2005 06:45:17 -0600
Message-Id: <1110199517.7621.2.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Gareth Bult <gareth@linux.co.uk>, linux-mtd@lists.infradead.org
Subject: Re: Re; MTD (2) Block Driver broken
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-03-07 at 12:13 +0100, Jörn Engel wrote:
> 
> Btw, it is interesting to note that noone has sent me bug reports
> before.  Apparently, 2.6.<final> is getting *much* more testing than
> mtd cvs, -mm, -bk* and -rc* together.

Given that -mm, and -bk* are generally broken for at least half a dozen
things when they first come out, I'm not surprised.  Plus, the driver in
question probably isn't used all that often to begin with.

josh
