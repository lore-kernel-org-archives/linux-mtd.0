Received: from nameservices.net ([208.234.25.16] helo=opersys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17d0vT-0007oI-00
	for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2002 04:58:59 +0100
Message-ID: <3D533EB0.23ADF2A6@opersys.com>
Date: Fri, 09 Aug 2002 00:01:52 -0400
From: Karim Yaghmour <karim@opersys.com>
Reply-To: karim@opersys.com
MIME-Version: 1.0
To: Mark Meade <mark@lakeshoremicro.com>
CC: linux-mtd@lists.infradead.org
Subject: Re: Avoiding DOC hotplug when Grub fails
References: <200208082158.18411.mark@lakeshoremicro.com>
Content-Type: text/plain; charset=us-ascii
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

Mark Meade wrote:
> > As far as I can see by browsing this mailing list archive, one
> > has to hotplug the DOC device in order to have the HD come up
> > first if Grub fails in some way after having hijacked int 19h.
> > This is rather inconvenient, to say the least.
> 
> I've recently found an easier way - with the M-Sys ISA Eval card, anyway.  I
> assume the PCI card would be similar.
> 
> On the ISA card, there is a jumper used to set the DoC Address (C800, D000,
> etc).  If this jumper is removed, the DoC is no longer recognized by the
> BIOS.
> 
> If the DoC has int 19h, simply boot without the jumper in place, and then put
> it back after the hard drive boot has finished.  If you have the MTD stuff
> compiled as modules, don't do the modprobe until after the jumper is
> replaced.   Works great, plus eliminates the risky procedure of hotplugging
> the DoC or Eval card.

Interesting. I hadn't thought of this. It sure beats the hotplugging
circus, but it still involves risky runtime hardware manipulation _and_
it only works if you have a jumper to set the address of the DOC, such
as with the eval board (which I am using myself).

> > Why not just hijack int 16h (keyboard) while we're at it, write
> > a small keyboard int handler, and check if the space-bar (or
> > some other key) is held down while Grub is booting? If it is,
> > then Grub invokes the BIOS's original int 19h which then proceeds
> > normally. If it isn't, then Grub continues with its own load
> > procedure.
> 
> One potential problem is that the low level Grub code that grabs int 19 is
> limited to 512 bytes.  With all the other things that code has to do, there
> might not be enough room to add another int handler.

That's a possibility. Although I'm sure some of the folks on this list
have DOS asm wizardry in some past life. There are, nevertheless, other
ways to rely on keyboard input to influence Grub's behavior without
implementing a complete int 9 handler (I made a mistake in my previous
mail, int 16h is the BIOS's service routine for keyboard ops while
int 9 is the actual interrupt handler for the keyboard). Here are two 
I can think of:

1) The BIOS keeps all keyboard input in a buffer starting at 0040:001E
and measuring 16 words (2 bytes per word). This is a circular buffer
and appropriate head and tail pointers are located at 0040:001A and
0040:001C. We don't need those pointers, however. By keeping the
space-bar down, this buffer will fill with space-bar characters. When
Grub's int 19 handler starts executing, it would scan the content of
the keyboard buffer and check whether one of the character is the
space-bar. If it is, then continue with the default BIOS int 19h.

2) The BIOS provides keyboard services through int 16h. Function 02h
of this interrupt handler returns a bit field in AL which has a "1"
set in the appropriate position if one of these keys is active:
right shift, left shift, ctrll, alt, scroll lock, num lock, caps lock,
and insert. Grub's int 19 need only call on this function, do the
appropriate test, and jump to an alternate path in case, say, "ctrl"
is held down.

Both of these should be very short and trivial in assembly (the second
one should be 5 instructions more: 1 to store the old handler before
overwritting it with Grub's handler, 1 to fill AH with 02h, 1 to call
int 16h, 1 to test the appropriate bit, and one to jump to the old
handler according to the test result). Unfortunately, my DOS/BIOS/real-
mode asm past life is very far away. My hope is that someone on this
list has this experience a little bit closer to memory than I.
Otherwise I'll have to go looking for my old spell books in the attic ...

Karim

===================================================
                 Karim Yaghmour
               karim@opersys.com
      Embedded and Real-Time Linux Expert
===================================================
