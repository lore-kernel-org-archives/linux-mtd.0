Received: from [216.187.71.220] (helo=shelbrook.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 175kPQ-0007Ig-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 May 2002 10:40:24 +0100
From: "Darren Martz" <dmartz@shelbrook.com>
To: <linux-mtd@lists.infradead.org>
Subject: Boot from DoC2000
Date: Thu, 9 May 2002 02:40:18 -0700
Message-ID: <001e01c1f73d$8a53ad90$9702a8c0@maverick>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
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

I'm new to linux, so my questions may seem rather simplistic <g>

Sorry for the multiple questions, I have read most of the papers and
many of the posting on this list but these are missing pieces...

It seems the m-sys driver adds logic to the bios gaining access to the
DoC. The mtd solution everyone is working so hard on seems to do things
differently, but I'm not sure how or what.  I am also unclear as to what
boot loaders support this new way to boot an mtd device. I understand
grub is designed to support that scenario but is still in development.
Does the lilo solution rely on the m-sys patch?

I suppose a boot loader like grub is required because the bios doesn't
support native access to the device(s).

So what filesystem options are there? I know that m-sys has their own
"TrueFFS" fs, and it requires a kernel patch. Being new to linux, I'd
like to stay away from that for the time being. I have read about jffs1
and jffs2, and from what I can tell jffs1 is stable but lacking the nice
features, while jffs2 is very much experimental but coming along nicely.

Knowing all that, the options seem to be as follows:

1) LILO plus an m-sys patch with the TrueFFS or any other filesystem
2) GRUB with any filesystem including JFFS, but not TrueFFS
3) SYSLINUX ??? i suspect is not supported

I believe I read that to date, nobody has had a successful boot on a DoC
with grub - yet! 
So does that leave the only current option as LILO with the m-sys patch?

Darren
