Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BshZp-0002Kc-86
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2004 08:42:35 -0400
Message-ID: <003f01c47aeb$706113d0$0100a8c0@superfortress>
From: "Dan Brown" <brown@osdsun1.nrl.navy.mil>
To: <BrendanSimon@fastmail.fm>,
	"linux-mtd" <linux-mtd@lists.infradead.org>
References: <4111AEA6.2080605@fastmail.fm>
Date: Thu, 5 Aug 2004 08:55:09 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Cc: 
Subject: Re: 128MB DOC2000 with 2.4.X kernel
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message ----- 
From: "Brendan J Simon" <BrendanSimon@fastmail.fm>
Sent: Wednesday, August 04, 2004 11:51 PM


> I've just been reading the archives about 128MB DOCs looking like a
> Millenium device and the soltion being to do 4 reads, etc.

Just to be absolutely clear:  The reason it looks like a Millennium device
is that it is (in almost every respect) a Millennium device, from a hardware
access perspective.  The "solution" you describe allows you to properly
detect the fact that it is a larger DOC2000, rather than a true Millennium,
but you still have to talk to it as if it were a Millennium.

> If I modify docprobe.c to detect the 128MB DOC2000 correctly, will the
> rest of the MTD code work correctly with it ???

Depends on your definition of "correctly".  You may be able to get the stock
2.4.18 MTD code to read and write your device with the modification you
describe (or you may not -- I haven't tried it).  However, you'll be missing
a lot of critical functionality that has been added to the 2.6.8-rc2 kernel
(and the MTD CVS repository, which is even more up-to-date).

In particular, you won't get proper bad block handling, because your device
uses INFTL (rather than NFTL), and the 2.4 series do not properly parse
INFTL bad block tables.  Bad block detection becomes particularly critical
for larger devices.

> I hope so as this would be a quick fix, however I do recall seeing
> something about 3 and 4 byte addresses.  Is this relevant to getting
> 128MB DOC working with 2.4.X kernels ?

Not sure.  I doubt the 128MB DOC is big enough to require 4-byte addresses.
(It depends on whether it's organized as one very large flash chip or
several -- does anyone know?)

> I'm looking for the quickest solution.  Any ideas, comments or
> suggestions would be greatly appreciated.

I strongly suggest you put in the effort to switch to the latest kernel
(2.6.8-rc2 or later).  I'm not certain that your quick fix to 2.4.18 will
work.  You will certainly not have full functionality -- in addition to
proper bad block handling, the new DOC drivers under the NAND subsystem
allow you to use jffs2 cleanly on DOC devices, which you may be interested
in.

Perhaps most importantly, you'll find people on this list to be much more
supportive and helpful to someone who is using the latest code.  There's not
a whole lot of interest in helping people deal with problems that have
already been fixed in the newer code.

Your best bet may be to grab the latest 2.6 kernel and patch it with the
latest MTD snapshot; others may disagree.

> Is INTFL needed for the 128MB DOC2000 or can I use the NFTL code that I
> am currently using on the 64MB doc?

You can't use NFTL.  If you want to use an arbitrary filesystem (such as
ext2) on your device, you'll have to use INFTL.  Another (better, in my
opinion) option is to switch to a filesystem that runs directly over the
flash device, such as JFFS2.  The latest DOC drivers (the NAND subsytem
reimplementation, not the original stand-alone drivers) finally support this
cleanly.

Good luck!

    -Dan Brown
