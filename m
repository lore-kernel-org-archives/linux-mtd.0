Received: from e32.co.us.ibm.com ([32.97.110.130])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CgQPx-0000cX-JU
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 11:29:55 -0500
Received: from d03relay05.boulder.ibm.com (d03relay05.boulder.ibm.com
	[9.17.195.107])
	by e32.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id iBKGTpFJ640454
	for <linux-mtd@lists.infradead.org>; Mon, 20 Dec 2004 11:29:51 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay05.boulder.ibm.com (8.12.10/NCO/VER6.6) with ESMTP id
	iBKGToaE200866
	for <linux-mtd@lists.infradead.org>; Mon, 20 Dec 2004 09:29:50 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.12.11) with ESMTP id
	iBKGToeq007233
	for <linux-mtd@lists.infradead.org>; Mon, 20 Dec 2004 09:29:50 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: Amaury Jacquot <sxpert@esitcom.org>
In-Reply-To: <41C6FC08.2010602@esitcom.org>
References: <41C6FC08.2010602@esitcom.org>
Content-Type: text/plain
Message-Id: <1103560190.25853.25.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Mon, 20 Dec 2004 10:29:50 -0600
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 and compact flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-12-20 at 10:21, Amaury Jacquot wrote:
> a couple weeks ago, I sent mail to this list about using JFFS2 on a 
> compact flash card, but haven't received any answer...

Probably because compact flash isn't really flash.  See the bottom of
linux-mtd.infradead.org

> 
> can anyone answer me, or point me to a document describing the procedure 
> it it is at all doable ?

It's probably doable, but only via the blkmtd driver.  There have been
some recent discussions on this.  Take a look at the archives from last
week.

josh
