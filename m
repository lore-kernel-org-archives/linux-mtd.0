Received: from [64.170.22.142] (helo=mail.spewey.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 15M8LT-0007qd-00
	for <linux-mtd@lists.infradead.org>; Mon, 16 Jul 2001 14:23:31 +0100
Message-Id: <5.1.0.14.0.20010716083829.00a68028@mail.spewey.com>
Date: Mon, 16 Jul 2001 08:41:17 -0500
To: Andrew Dixon <andrew.dixon@seranoa.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Vipin Malik <vipin@embeddedlinuxworks.com>
Subject: Re: [Question] cp result.txt  /dev/mtd0 problem
In-Reply-To: <3B52E192.50EF674@seranoa.com>
References: <20010714082817.HM.F0000000002ETLk@www16.hanmail.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

At 08:44 AM 7/16/2001 -0400, Andrew Dixon wrote:

> >  when I followed the step in FAQ manual.
> >  I tried
> >
> >  cp /tmp/jffs.image  /dev/mtd0
> >
> >  I got
> >
> >  cp: /dev/mtd0  Read only file system.
> >
>
>Have you mounted /dev/mtd0 onto a file system?  You probably need to do
>something like:
>
>         #mount -t mtd /dev/mtd0 /flash
>                ^^^^^^

/dev/mtd is not a filesystem- it is a char device. You cannot mount it. 
(though you can mount a *filesystem* on top of it (via its cousin- mtdblockn)).

try the following:
# strace cp /tmp/jffs.image  /dev/mtd0

See where it fails. It may give you a clue.

Vipin
