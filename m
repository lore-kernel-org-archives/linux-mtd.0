Received: from mail1.daniel.com ([12.19.96.6] helo=mail1.danielind.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 155qFs-0001vd-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Jun 2001 15:50:24 +0100
Message-ID: <3B17ACEF.4FA5EA8B@daniel.com>
Date: Fri, 01 Jun 2001 09:55:43 -0500
From: Vipin Malik <vipin.malik@daniel.com>
MIME-Version: 1.0
To: =?iso-8859-1?Q?K=E1ri=20Dav=ED=F0sson?= <kd@flaga.is>
CC: linux-mtd@lists.infradead.org
Subject: Re: jffs2
References: <EADB10BAC266A14A85ECBF8686A73E310A9186@kolkrabbi.flaga.is>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
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

Kári Davíðsson wrote:

> Are there any known issues of running programs from a jffs2 partition?

Not that I know of.


> I am attempting to run a program from a jffs2 partition (not root
> partition which is mounted on /dev/ram)

Interesting choice of mount dir names (why "ram"?) :)


> and the program seem to be running extremely slow and what is worse it
> seem to block the kernel at the
> same time, i.e. I can not ping the board nor telnet to it.

Not being able to ping it is bad. Not being able to telnet to it may
depend on how much CPU resources are available
to run the telnet daemon.

>
>
> If I wait long enough I get output from the program on the console but
> everything is very very slow.....
>

What processor are you using? How big is your JFFS2 partition and what is
this program that you are running doing?

Remember that JFFS2 needs to go GC when the fs gets full (or near full if
the background GC task is running). If your program
is reading/writing from/to the JFFS2 fs it will get blocked. Are you
generating a lot of data to the JFFS2 fs?

Vipin
