Received: from [66.239.226.123] (helo=hermes.wildseed.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18ImV7-0002R4-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 09:04:26 +0000
Message-ID: <43CB1396676FD4119F03001083FD299401A1C6CD@neptune.kirkland.local>
From: Paul Nash <paulnash@wildseed.com>
To: 'David Woodhouse' <dwmw2@infradead.org>
Cc: =?iso-8859-1?Q?=27J=F6rn_Engel=27?= <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Subject: RE: Restart problems after writing to mtdblock? 
Date: Mon, 2 Dec 2002 01:34:52 -0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

A very good point, well taken.  In the particular case of our board, a =
power
supply drop out supervisor will cause a hold-off period and the entire =
reset
system will likely chain off that, but that's pretty specific to our =
design.

Anyway, we're pursuing the obvious "right solution" and looking at =
other
mechanisms for interim fixes.  Thanks all...

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@infradead.org]=20
Sent: Saturday, November 30, 2002 8:23 AM
To: Paul Nash
Cc: 'J=F6rn Engel'; linux-mtd@lists.infradead.org
Subject: Re: Restart problems after writing to mtdblock?=20



paulnash@wildseed.com said:
>  Power fail is not a concern -- this only occurs in the case of a=20
> software reboot of the chip without power loss.  An external reset is =

> not an issue. Flash chips don't store state as to their last read =
mode=20
> across power failure anyway.

I wouldn't swear to that. You could feasibly have a power outage long=20
enough to reset most of the board, but the flash chips don't draw much=20
power and could perhaps retain their state.

Unlikely perhaps, but I wouldn't declare it impossible.


--
dwmw2
