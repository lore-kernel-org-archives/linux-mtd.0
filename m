Received: from ip68-6-32-25.sb.sd.cox.net ([68.6.32.25] helo=speedy.datawave.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16c66T-00076Y-00
	for <linux-mtd@lists.infradead.org>; Sat, 16 Feb 2002 14:46:17 +0000
From: "Brian J. Fox" <bfox@ua.com>
To: rob@sysgo.de
CC: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
	joern@wohnheim.fh-wedel.de
In-reply-to: <Pine.LNX.4.21.0202161157380.17237-100000@dagobert.svc.sysgo.de>
	(message from Robert Kaiser on Sat, 16 Feb 2002 12:03:27 +0100 (MET))
Subject: Re: MTD concat layer
Message-Id: <E16c6Gf-0000m9-00@speedy.datawave.net>
Date: Sat, 16 Feb 2002 06:56:49 -0800
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

   From: Robert Kaiser <rob@sysgo.de>
   Date: Sat, 16 Feb 2002 12:03:27 +0100 (MET)

   On Sat, 16 Feb 2002, David Woodhouse wrote:

   > 
   > rob@sysgo.de said:
   > > OK, just to be clear about this: If my erase function is asked to
   > > erase -say-  1.5 blocks, what should it do: 
   > 
   > -EINVAL.

   OK, but is the function allowed to erase blocks up to the point
   where it hits the partial block request ? That would make it simpler,
   especially in the presence of variable block sizes.

I was lurking, but I guess I have to post an opinion on this.

*No*, you should *not* erase some blocks and return an error.

Brian
== The Difference Between Cultures: ==
    Einigkeit und Recht und Freiheit
    Liberte', E'galite', Fraternite'
    Sex, drugs and rock'n'roll
