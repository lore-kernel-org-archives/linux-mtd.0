Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Gz5v-0006T4-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2001 09:30:11 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3B391571.9114E309@daniel.com> 
References: <3B391571.9114E309@daniel.com>  <3B390B4C.65A5DB68@daniel.com> <25950.993594415@redhat.com> 
To: Vipin Malik <vipin.malik@daniel.com>
Cc: jffs-dev <jffs-dev@axis.com>, nico@cam.org,
    MTD for Linux <linux-mtd@lists.infradead.org>
Subject: Re: Problems with JFFS2/MTD upgrade to latest in CVS. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 02 Jul 2001 09:35:29 +0100
Message-ID: <29076.994062929@redhat.com>
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

vipin.malik@daniel.com said:
> > > jffs2_scan_empty(): Empty block at 0x00000000 ends at 0x00000000 (with 0x00031985)! Marking dirty 

> > Does reverting to an older version of scan.c fix this?
> >         cvs up -r 1.46 scan.c

> Yes!

Nicolas - should I just revert to 1.46? Is there anything in 1.48 you'd 
like to (fix and) keep?


----------------------------
revision 1.48
date: 2001/06/13 23:01:47;  author: nico;  state: Exp;  lines: +9 -3
OK... We can't be sure that empty blocks are actually fully erased.  Queue them
for erase again. (sigh)
----------------------------
revision 1.47
date: 2001/06/13 20:44:16;  author: nico;  state: Exp;  lines: +21 -7
If flash does not contain any JFFS2 node, don't touch it as before.
If flash is entirely empty, then go ahead now.
This also speeds up mount on partially erased flash since completely empty
flash blocks aren't erased unnecessarily.

--
dwmw2
