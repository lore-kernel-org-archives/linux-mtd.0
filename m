Received: from [203.63.104.245] (helo=cobalttech.com)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A9Ix9-0006G1-ET
	for <linux-mtd@lists.infradead.org>; Tue, 14 Oct 2003 07:46:44 +0100
Date: Tue, 14 Oct 2003 16:45:36 +1000 (EST)
From: Michael McLellan <michael-mclellan@swsa.com.au>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1066111607.3172.40.camel@imladris.demon.co.uk>
Message-ID: <Pine.LNX.4.53.0310141638470.12391@slop.cobalttech.com>
References: <Pine.LNX.4.53.0310141537460.12298@slop.cobalttech.com>
 <1066111607.3172.40.camel@imladris.demon.co.uk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: mtd list <linux-mtd@lists.infradead.org>
Subject: Re: DoC Grub booting problems
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 14 Oct 2003, David Woodhouse wrote:

> I believe that's intentional; it doesn't go looking for the drive until
> it's asked to access it.

Seems a little silly to me, grub doesn't do that when booting off a hard
disk. It would be silly if everytime you booted off a harddisk you had to
go to the grub shell and tell it where your menu.lst file is.

Besides I thought that it found the drive first using an older version of
the firmware.

> Don't you have to tell it that the menu.lst file is on (dc0,0) to make
> it look there?

Yes I do, thats the problem.

> What do you use your _other_ partitions for, btw?

The partitions are laid out like that by PeeWee linux. There is no (dc0,1)
I potentially wont partition the drive once I settle on the installation.

Cheers,
Mikey.
