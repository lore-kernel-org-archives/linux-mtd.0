From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Mon, 3 Mar 2003 11:58:25 +0100
Subject: [PATCH] makefile bug and some cleanup
In-Reply-To: <20030302181439.GA31492@wohnheim.fh-wedel.de>
References: <20030302092359.GN15015@pengutronix.de> <20030302105730.GA18324@wohnheim.fh-wedel.de> <20030302181439.GA31492@wohnheim.fh-wedel.de>
Message-ID: <20030303105825.GA31829@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2 March 2003 19:14:39 +0100, J?rn Engel wrote:
> 
> I'd have to check this on a 64bit machine on Monday but I expect
> pretty ugly results. Correct fix would be to remove the 'l' from the
> format string each and every time.

Ok, 64bit machines obviously don't mind the current code, %lx does not
imply %08lx. Silly me.

J?rn

-- 
Data dominates. If you've chosen the right data structures and organized
things well, the algorithms will almost always be self-evident. Data
structures, not algorithms, are central to programming.
-- Rob Pike



>From Alex  Mon Mar  3 07:54:23 2003
From: Alex (Alex)
Date: Mon, 03 Mar 2003 15:54:23 +0300
Subject: AMD AM30LV0064D and linux
Message-ID: <E18ppSZ-0009V6-00@f7.mail.ru>

Hello all!

Could somebody help me with information about compability of Linux and AMD Flash AM30LV0064D (it is UltraNAND). AMD itself keeps silence. 
Generally is it possible to boot Linux from this device, and then run root file system from it?

Please help me, you are my last hope.

Thank you.
