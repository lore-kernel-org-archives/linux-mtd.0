Received: from [66.239.226.123] (helo=hermes.wildseed.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18HE1E-0006wJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Nov 2002 02:03:09 +0000
Message-ID: <43CB1396676FD4119F03001083FD299401A1C6BC@neptune.kirkland.local>
From: Paul Nash <paulnash@wildseed.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: RE: Restart problems after writing to mtdblock?
Date: Wed, 27 Nov 2002 18:33:31 -0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

Partially answering my question, it looks like I was partly correct.  It
appears that MTD is setup to lazily delay a reset to read array mode until
an actual read request comes along.  In my case, this is fatal.

I'm wondering if a reasonable solution is to do something like install a
reboot_notifier so I can guarantee the chip is back in Read Array mode.
Where would be a good place to do such a thing, or if this is a bad idea,
what is a better one?  Thanks...

-Paul


-----Original Message-----
From: Paul Nash [mailto:paulnash@wildseed.com]
Sent: Wednesday, November 27, 2002 4:58 PM
To: 'linux-mtd@lists.infradead.org'
Subject: Restart problems after writing to mtdblock?


On 2.4.18, we're experiencing a problem where if we write some partition
through /dev/mtdblock (by opening, writing and closing in code, not from the
shell) when we close the device (and it's corresponding mtdchar device) and
then call reboot() with the restart option, the syste fails to successfully
restart.

I'm quite certain that what's happening is the flash chip (intel 640J part,
1x16 arrangement) is not being taken out of Read Array mode, so the
bootloader can't fetch instructions.  On our StrongARM board at the moment,
we don't have nRESET_OUT fed into the flash chip.  We're investingating
that, but I would like to knoew the root cause.

What's really weird is that if I go to the shell and cat file >
/dev/mtdblock/<id> and then reboot via the same system call, everything
works fine.  On the one hand, a bunch of syncs happen when busybox does the
reboot, but on the other hand, this particular partition is not a mounted
filesystem, and we tried inserting some sync() calls as well.

I notice that cfi_cmdset_0001.c, for instance, doesn't explicitly put the
chip into Read Array mode after completeing a buffer write or erase block
operation.  The intel datasheet generally recommends this.  Is there any
harm in it?  It looks like maybe the driver waits until a read operation is
requested before doing this?

Help greatly appreciated...


-Paul


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
