Received: from dsl-64-129-133-253.telocity.com ([64.129.133.253] helo=skylab.outpostsentinel.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dsjH-0003da-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 12:53:43 +0000
Received: from GATEKEEPER ([192.168.2.103])
	by skylab.outpostsentinel.com (8.11.2/8.11.2) with SMTP id g1LDtdL04701
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 08:55:39 -0500
Message-Id: <200202211355.g1LDtdL04701@skylab.outpostsentinel.com>
Date: Thu, 21 Feb 2002 08:03:38 -0500
To: linux-mtd@lists.infradead.org
From: Chris Fowler <cfowler@outpostsentinel.com>
Subject: Update on my problem
Reply-To: cfowler@outpostsentinel.com
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

Many of you guys lately has been halping overcome some issues I've been having during an initrd execution.  I appreciate the efforts.  I'm eamiling you to inform you what I did to fix it in case you ever run into the same problem. 

I have to compile my linuxrc.c program statically.  lib-c is just too big to place on a initrd image.  To keep the size down from 400k I used a program called diet.  It bacsically executes gcc and use some of its own libraries.  My loader 
went from 400k to 22k using it.  This allowed me to stuff more program on the initrd image.  I ran into some major problems using zlib and this program so I wnet back to a normal static binary.  My loader is now 400k but seems to
be working great.  I can download software packages form the network and use those as my roofs just as easy as the package on flash.  I can also restore a backup package that the user has the option to create at flash time.
It appears to be working great.  

Thanks for all your help.
Chris
