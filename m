Received: from post2.inre.asu.edu ([129.219.110.73])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16dygg-0004Em-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Feb 2002 19:15:26 +0000
Received: from conversion.post2.inre.asu.edu by asu.edu (PMDF V6.1 #40111)
 id <0GRW00701E0HZY@asu.edu> for linux-mtd@lists.infradead.org; Thu,
 21 Feb 2002 12:26:41 -0700 (MST)
Date: Thu, 21 Feb 2002 12:27:35 -0700
From: Russ Dill <Russ.Dill@asu.edu>
Subject: Re: Update on my problem
In-reply-to: <200202211355.g1LDtdL04701@skylab.outpostsentinel.com>
To: cfowler@outpostsentinel.com
Cc: linux-mtd@lists.infradead.org
Message-id: <1014319655.598.1.camel@russ>
MIME-version: 1.0
Content-type: text/plain
Content-transfer-encoding: 7bit
References: <200202211355.g1LDtdL04701@skylab.outpostsentinel.com>
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

On Thu, 2002-02-21 at 06:03, Chris Fowler wrote:
> Many of you guys lately has been halping overcome some issues I've been having during an initrd execution.  I appreciate the efforts.  I'm eamiling you to inform you what I did to fix it in case you ever run into the same problem. 
> 
> I have to compile my linuxrc.c program statically.  lib-c is just too big to place on a initrd image.  To keep the size down from 400k I used a program called diet.  It bacsically executes gcc and use some of its own libraries.  My loader 
> went from 400k to 22k using it.  This allowed me to stuff more program on the initrd image.  I ran into some major problems using zlib and this program so I wnet back to a normal static binary.  My loader is now 400k but seems to
> be working great.  I can download software packages form the network and use those as my roofs just as easy as the package on flash.  I can also restore a backup package that the user has the option to create at flash time.
> It appears to be working great.  

you probably want to check out uClibc at http://uclibc.org
