Received: from mail9.messagelabs.com ([194.205.110.133])
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AGdVX-0004P6-1r
	for <linux-mtd@lists.infradead.org>; Mon, 03 Nov 2003 12:08:31 +0000
From: Ian Campbell <icampbell@arcom.com>
To: Linux MTD Mailing List <linux-mtd@lists.infradead.org>
In-Reply-To: <1067859524.11241.58.camel@linuxdev.icampbell.arcom.cc>
References: <1067856319.11251.47.camel@linuxdev.icampbell.arcom.cc>
	 <1067858096.3423.431.camel@hades.cambridge.redhat.com>
	 <1067859524.11241.58.camel@linuxdev.icampbell.arcom.cc>
Message-Id: <1067861205.11248.78.camel@linuxdev.icampbell.arcom.cc>
Mime-Version: 1.0
Date: Mon, 03 Nov 2003 12:06:46 +0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: ilookup used in fs/jffs2/gc.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> but I don't expect any problems with it.

that'll teach me :-)

with the latest CVS I see corruption of some of the nodes in /dev/. I
don't think this is anything to do with the ilookup stuff, but rather
the update to the latest CVS code. 

/dev/ttyS0 (the console device) and some of /dev/tty[0-9] seem to be
corrupted (the major.minor #s and other metadata is incorrect). 

Adding some debugging to my initscripts suggest that the corruption is
happening before /sbin/init even starts. It's interesting to note that
the corrupted devices are exactly those which are referenced by getty
processes in /etc/inittab.

The board seems to boot the first time after being loaded with a clean
JFFS2 filesystem (produced with mkfs.jffs2 and loaded with redboot),
thereafter the device node is corrupted, so getty can't start, I can
access the system via ssh though.

# ls -l /dev/ttyS*
crw-------    1 root     root       0,  68 Jan  1 02:19 ttyS0
crw-------    1 root     tty        4,  65 Aug 11  2003 /dev/ttyS1
crw-------    1 root     tty        4,  66 Aug 11  2003 /dev/ttyS2
crw-------    1 root     tty        4,  67 Aug 11  2003 /dev/ttyS3
crw-------    1 root     tty        4,  68 Aug 11  2003 /dev/ttyS4

# ls -l /dev/tty?
crw-------    1 root     tty        4,   0 Aug 11  2003 /dev/tty0
crw--w--w-    1 root     root       0,   5 Aug 11  2003 /dev/tty1
crw--w--w-    1 root     root       0,   6 Aug 11  2003 /dev/tty2
crw--w--w-    1 root     root       0,   7 Aug 11  2003 /dev/tty3
crw--w--w-    1 root     root       0,   4 Aug 11  2003 /dev/tty4
crw--w--w-    1 root     root       0,   5 Aug 11  2003 /dev/tty5
crw--w--w-    1 root     root       0,   6 Aug 11  2003 /dev/tty6
crw-------    1 root     tty        4,   7 Aug 11  2003 /dev/tty7
crw-------    1 root     tty        4,   8 Aug 11  2003 /dev/tty8
crw-------    1 root     tty        4,   9 Aug 11  2003 /dev/tty9

Any ideas? I tried turning on jffs2 debugging but the amount of
information was overwhelming, I can turn on debugging only for sections
of the code if you have an idea where to look, or I can try and capture
the lot (what debugging level would be useful?).

Could this be a symptom of the race condition that the CVS commit logs
suggest you have been fixing recently?

I'm running 2.4.19-rmk7-pxa2 with patches for my hardware. The previous
version of MTD I was using was CVS HEAD from 2003-10-03 and this works
just fine (and the problem reliably goes away if I revert to it). I had
the same problem yesterday, but when I got in this morning you had made
some further fixes so I thought I'd try them before reporting anything.

The incorrect information seems to be getting written back to the flash,
since if I revert to my older kernel the problem persists until I
recreate the device nodes, so I don't think the problem is a purely
in-core one.

Cheers,
Ian.
-- 
Ian Campbell, Senior Design Engineer

Arcom, Clifton Road, 			Direct: +44 (0)1223 403 465
Cambridge CB1 7EA, United Kingdom	Phone:  +44 (0)1223 411 200


_____________________________________________________________________
The message in this transmission is sent in confidence for the attention of the addressee only and should not be disclosed to any other party. Unauthorised recipients are requested to preserve this confidentiality. Please advise the sender if the addressee is not resident at the receiving end.

This message has been checked for all viruses by MessageLabs Virus Control Centre.
