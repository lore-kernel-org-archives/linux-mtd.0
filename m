Received: from [64.244.22.242] (helo=mail.seranoa.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16WhdZ-0007Q5-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Feb 2002 17:38:09 +0000
Received: from seranoa.com (IDENT:andrew.dixon@[172.16.1.202])
	by mail.seranoa.com (8.11.0/8.11.0) with ESMTP id g11Hxss28527
	for <linux-mtd@lists.infradead.org>; Fri, 1 Feb 2002 12:59:54 -0500
Message-ID: <3C5AD45D.9B6EBA1F@seranoa.com>
Date: Fri, 01 Feb 2002 12:46:05 -0500
From: Andrew Dixon <andrew.dixon@seranoa.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Space Loss in JFFS on an EST-SBC8260
References: <FFEBJPOLADLDEDEKEOGFKEJCCIAA.sikenaga@mvista.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Scott Ikenaga wrote:
> 
> We are using JFFS on EST-SBC8260. The problem we are facing now is that
> the space can't be reclaimed after files being deleted.

I don't believe that space should be reclaimed right away.  You only get
space back after the garbage collector has been through and cleaned up
the flash.  (The preceding is mostly a guess.  You should get
independent conformation.)

 So we are
> running out of space as shown by "du".

What's your kernel configuration?

> 
> Questions:
> (1)Is this a known problem? If so, is there a fix?

I haven't seen it before.

> (2)Could this contribute to another problem where the system becomes
>    very sluggish?

It doesn't seem very likely to me but it's hard to tell without knowing
what the configuration of your system is.  You could try running off of
an NFS root filesystem (if that's an option) and see if you performance
is better.

-- 
Andrew Dixon
Software Engineer
Seranoa Networks
978.897.3434 x231
