Received: from firewall1.cammail.net ([193.115.249.1] helo=smtp.camcom.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17BCAf-0002vg-00
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 11:19:41 +0100
Received: from server.camcom.co.uk (localhost [127.0.0.1])
	by smtp.camcom.co.uk (8.12.1/8.12.1) with ESMTP id g4OAJ7s2032499
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 11:19:07 +0100
Received: from localhost (chris@localhost)
	by server.camcom.co.uk (8.12.1/8.12.1/Submit) with ESMTP id g4OAJ7E5032496
	for <linux-mtd@lists.infradead.org>; Fri, 24 May 2002 11:19:07 +0100
Date: Fri, 24 May 2002 11:19:07 +0100 (BST)
From: Chris Wilson <chris@netservers.co.uk>
To: linux-mtd@lists.infradead.org
Subject: Re: Getting big flash onto motherboards. Will CF work? what  will
Message-ID: <Pine.LNX.4.44.0205241118020.31555-100000@localhost>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

Hi All,

This is my first post, please excuse me if I do something bad...

> >there are DOC devices that plug into IDE
> 
> These are called DiskonModule  (as opposed to diskonchip).  
> 
> They come in both 40 and 44 pin connections.  They arent very big, they
> look like a terminator.  Most are flat, like a hard drive (but much shorter
> & smaller), some have an L-shape.

I would guess that these are IDE-compatible then? So I guess I would have 
to use the mtdblock driver to drive it? Does it have internal wear 
levelling like CF?

I know CompactFlash isn't on topic really but I hope someone has used it 
and can give me some advice. We have been using CF in our firewalls for 
"high reliability" - but unfortunately the results have not been 
impressive.

After some period of operation as a root filesystem (with reads and
writes), between a week and three months, the CF cards seem to "lock up".  
Nothing can be read from them (or written, I think) and /sbin/badblocks,
if it runs at all, reports every sector as bad. Rebooting the machine
"cures" the problem.

Has anyone seen this behaviour, or had any clues about how or why it might 
happen? We have had the same effect with several different brands of CF, 
including SanDisk. Does this kind of thing happen to DoC and/or DoM?

I know writing lots to CF is a bad idea, we're working on fixing it, but 
we have no evidence that just reading from a CF isn't going to make it 
lock up eventually... RAID would be more reliable!

Cheers, Chris.
-- 
   ___ __     _
 / __// / ,__(_)_  | Chris Wilson -- UNIX Firewall Lead Developer |
/ (_ / ,\/ _/ /_ \ | NetServers.co.uk http://www.netservers.co.uk |
\ _//_/_/_//_/___/ | 21 Signet Court, Cambridge, UK. 01223 576516 |
