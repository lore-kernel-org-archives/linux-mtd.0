Received: from tweedy.ksc.nasa.gov ([128.217.76.165])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17DRoB-0005Et-00
	for <linux-mtd@lists.infradead.org>; Thu, 30 May 2002 16:25:47 +0100
Subject: Re: Grub Booting Disk On Chip
From: Bob Chiodini <Robert.Chiodini-1@ksc.nasa.gov>
To: Ilguiz Latypov <ilatypov@superbt.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <Pine.LNX.4.44.0205301054300.16783-100000@server.superbt.com>
References: <Pine.LNX.4.44.0205301054300.16783-100000@server.superbt.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 30 May 2002 11:25:38 -0400
Message-Id: <1022772338.26053.42.camel@tweedy.ksc.nasa.gov>
Mime-Version: 1.0
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

Ilguiz,

Yes, the "default" entry boots from 0x80 (hda1).  I had to do the
following to get test that:

At the grub prompt:

root (dc0,0)
configfile /boot/grub/menu.lst

At this point a get a menu with the second entry highlighted.  Hitting
enter boots from /dev/hda1.  /dev/hda1 is the only disk on the system.

I assume that the BIOS is supposed to pass the CS with the absolute
segment of the BIOS extension.  Is this handled at the beginning of
doc_stage1.S?  It looks like DS is saved as the address of the DOC, if
it is not a Millenium DOC.

Bob...


On Thu, 2002-05-30 at 10:59, Ilguiz Latypov wrote:
    On 30 May 2002, Bob Chiodini wrote:
    
    > 1.  I get "DoC 2000 at D600".  The DOC is really at D000.
    
    Weird.  Looks like BIOS calls DoC 2000 firmware with a different value of
    Command Segment register.  I don't know if addressing D000:0 by offsetting
    the D600 segment with a different value of IP register is possible.
    
    > default=1
    > [...]
    > 2.  I get several messages about GRUB trying to find
    > /boot/grub/menu.lst.  None of the messages indicate drive 0xE0.
    
    Does the "default" parameter in menu.lst makes GRUB attempt to load the
    second entry which refers to the disk 0x80?
    
    Ilguiz
