Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cz7v-0007SP-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2002 03:03:43 +0100
Content-Type: text/plain;
  charset="us-ascii"
From: Mark Meade <mark@lakeshoremicro.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Avoiding DOC hotplug when Grub fails
Date: Thu, 8 Aug 2002 22:02:07 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200208082158.18411.mark@lakeshoremicro.com>
Cc: karim@opersys.com
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

Karim Yaghmour wrote:

> As far as I can see by browsing this mailing list archive, one
> has to hotplug the DOC device in order to have the HD come up
> first if Grub fails in some way after having hijacked int 19h.
> This is rather inconvenient, to say the least.

I've recently found an easier way - with the M-Sys ISA Eval card, anyway.  I 
assume the PCI card would be similar.

On the ISA card, there is a jumper used to set the DoC Address (C800, D000, 
etc).  If this jumper is removed, the DoC is no longer recognized by the 
BIOS.

If the DoC has int 19h, simply boot without the jumper in place, and then put 
it back after the hard drive boot has finished.  If you have the MTD stuff 
compiled as modules, don't do the modprobe until after the jumper is 
replaced.   Works great, plus eliminates the risky procedure of hotplugging 
the DoC or Eval card.

> Why not just hijack int 16h (keyboard) while we're at it, write
> a small keyboard int handler, and check if the space-bar (or
> some other key) is held down while Grub is booting? If it is,
> then Grub invokes the BIOS's original int 19h which then proceeds
> normally. If it isn't, then Grub continues with its own load
> procedure.

One potential problem is that the low level Grub code that grabs int 19 is 
limited to 512 bytes.  With all the other things that code has to do, there 
might not be enough room to add another int handler.

Mark
