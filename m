Received: from mail-out.m-online.net ([212.18.0.9])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EhCNS-0007Zl-4i
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 15:47:07 -0500
To: Michael Richardson <mcr@sandelman.ottawa.on.ca>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Tue, 29 Nov 2005 10:18:18 EST."
	<v0sltfeb45.fsf@marajade.sandelman.ca>
Date: Tue, 29 Nov 2005 21:46:58 +0100
Sender: wd@denx.de
Message-Id: <20051129204658.EE6FC353B0C@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] --cvs-exclude for mkfs.jffs2 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <v0sltfeb45.fsf@marajade.sandelman.ca> you wrote:
>
>     Wolfgang> You use CVS, others use GIT, or Subversion, or ClearCase, or
>     Wolfgang> Monotone, or darcs, or ... - it would not be really practical
>     Wolfgang> to add special rules for everybody's favorite tool.
> 
>   It would very much be practical to do this.
>   I'd rather have a more general --exclude.

Now *this*  is  something  completely  different.  If  you  implement
generic  exclude feature, like the "--exclude=PATTERN" optioon in GNU
tar, than this would be really useful.

Just hard-coding a specific directory name  is  nothing  else  but  a
quick and dirty hack and should IMHO not be accepted for public code.

>   Of course, you argue for removing equivalent options from rsync and other
> things.  Accept the patch or not. 

Note that "rsync and other things"  do  not  hard-code  any  specific
names.

My vote is clear: this patch should not be accepted as is.

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
But it's real. And if it's real it can be affected ... we may not  be
able  to break it, but, I'll bet you credits to Navy Beans we can put
a dent in it.
	-- deSalle, "Catspaw", stardate 3018.2
