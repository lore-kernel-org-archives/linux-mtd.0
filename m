Received: from 228-216.205.122.dellhost.com ([216.205.122.228] helo=lakeshoremicro.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16i0AM-0000rF-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2002 21:38:42 +0000
Message-ID: <005301c1c3c6$87ceea30$0101a8c0@dellc800>
From: "Mark Meade" <mark@lakeshoremicro.com>
To: "Ilguiz Latypov" <ilatypov@superbt.com>,
	"David Woodhouse" <dwmw2@infradead.org>
Cc: "Linux MTD mailing list" <linux-mtd@lists.infradead.org>
References: <Pine.LNX.4.44.0203041529100.20113-100000@server.superbt.com>
Subject: Re: DiskOnChip 2000 and Millenium support in GRUB bootloader 
Date: Mon, 4 Mar 2002 16:48:56 -0500
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

On Mon, 4 Mar 2002, Ilguiz Latypov wrote:

> What was your fix?  Do you copy %cs to %ds in
> case doc_stage1 is IPL itself?  Are there any extra things to be done to
> make the code eXecute-In-Place?

Ilguiz,

The segment issue is minor -- the original code assumed that _start was loaded at 0x20000
by the IPL, but in this case, we are executing in place, at 0xD0000 (for example).

So instead of this:

#ifndef DOC_REPLACE_IPL
    /* Store the DiskOnChip segment */
    movw %ds, %cs:doc_seg
#endif

I added the following, after the int 18/19 handler has been copied to the end of memory:

#ifdef DOC_REPLACE_IPL
    /* Store the DiskOnChip segment (XIP from the IPL area) */
    movw %cs, %es:doc_seg
#endif

When the interrupt handler is called, doc_seg is now in the correct spot.

I suppose it's possible to let the int handler XIP also, but it just seemed to fit better
with existing code to copy it to the 1K segment at the top of memory.  This way, no more
Millennium-specific changes are required in doc_stage1b.S.

> I will modify the checksum program to generate a different value when
> "--enable-diskonchip-ipl" option is supplied to the configure script.

I had to add the checksum byte and a jump to the _start routine:

#ifdef DOC_REPLACE_IPL
    /*
      * _start is in the beginning of DoC Millennium flash memory
      */
     .byte 0x55, 0xAA        /* BIOS extension signature */
     .byte 0x10                  /* DoC window is 8K (16*512) in size */
     /* BIOS will call far _start + 3 */

    jmp over
    .byte 0                       /* BIOS extension checksum goes here */
#endif
over:

> I will also add an option to hook to the diskless boot int 18h handler.

Thanks!  This makes it easier for me to test.  I had one occasion when a botched int 19
handler made it impossible to boot with the DOC installed.  I had to remove the DOC, boot
into DOS, install the DOC (with the PC turned on), and then erase it.  Needless to say,
I'm trying to avoid having to do this again.  ;-)

> Mark, my DoC Millennium modifications to the MTD GRUB patch were based on
> the doc2000.c kernel driver code from MTD repository.  Perhaps, I wasn't
> careful enough in copying the necessary operations.

I looked at that source late Friday, but I haven't had time to get real serious about it
yet.  I've found some assembly sources related to the Linux BIOS project that may help,
also.

Mark
