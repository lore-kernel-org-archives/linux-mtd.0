Received: from musenki.com ([192.207.126.3] helo=dinky.musenki.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FMne-0005Tn-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2002 23:29:10 +0100
From: Jim Thompson <jim@musenki.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID: <15613.16180.337384.910293@gargle.gargle.HOWL>
Date: Tue, 4 Jun 2002 17:29:08 -0500
To: justin.wojdacki@analog.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: Strange problem related to writing to flash
In-Reply-To: <3CFD131D.1AA4678F@analog.com>
References: <3CFD131D.1AA4678F@analog.com>
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

I've been seeing similar things (well, worse, the kernel (yes the
kernel) crashes somewhere in the bootloader after a soft reset) on
PowerPC.  If the root filesystem is mounted read-only, things are just
peachy.

In your case, I'd bet that the flash isn't in 'read' mode.  You
probably want to assure that the flash is in 'read' mode before you
soft reset the CPU.

I haven't figured out whats wrong with mine yet.

Justin Wojdacki writes:
> 
> Okay, so here's the problem I'm running into:
> 
> On a hard reset, the board I'm working with always comes up fine.
> Linux boots, mounts the root filesystem (JFFS2) and all that. It looks
> happy. 
> 
> If I don't modify the filesystem, Linux boots fine on a soft reset. 
> 
> If I modify the filesystem in some way, Linux fails to boot properly
> on a soft reset. What happens is the bootstrap loads the kernel from
> the JFFS2 partition and boots the kernel. When the kernel probes the
> flash, it sees 2 8-bit wide devices instead of the actual 1 16-bit
> wide device. JFFS2 then get's really unhappy because it's attempts to
> access the flash device fail. 
> 
> here are relevant bits of dmesg
> 
> First, on success:
> AD6489 Residential Gateway flash probe(0x1fc00000,2097152,2): 200000
> at 1fc00000
> Analog Devices AD6489 Residential Gateway, Rev 2.0: Found 1 x16
> devices at 0x0 in 16-bit mode
> Found: ST M29W160DB
> number of JEDEC chips: 1
> 0: offset=0x0,size=0x4000,blocks=1
> 1: offset=0x4000,size=0x2000,blocks=2
> 2: offset=0x8000,size=0x8000,blocks=1
> 3: offset=0x10000,size=0x10000,blocks=31
> Creating 4 MTD partitions on "Analog Devices AD6489 Residential
> Gateway, Rev 2.0":
> 0x00000000-0x00004000 : "Bootstrap 1"
> 0x00004000-0x00008000 : "Configuration"
> 0x00008000-0x00020000 : "Bootstrap 2"
> 0x00020000-0x00200000 : "Root"
> 
> Next, on failure:
> AD6489 Residential Gateway flash probe(0x1fc00000,2097152,2): 200000
> at 1fc00000
> Analog Devices AD6489 Residential Gateway, Rev 2.0: Found 2 x8 devices
> at 0x0 in 16-bit mode
> Found: ST M29W160DB
> number of JEDEC chips: 1
> 0: offset=0x0,size=0x8000,blocks=1
> 1: offset=0x8000,size=0x4000,blocks=2
> 2: offset=0x10000,size=0x10000,blocks=1
> 3: offset=0x20000,size=0x20000,blocks=31
> Creating 4 MTD partitions on "Analog Devices AD6489 Residential
> Gateway, Rev 2.0":
> 0x00000000-0x00004000 : "Bootstrap 1"
> 0x00004000-0x00008000 : "Configuration"
> 0x00008000-0x00020000 : "Bootstrap 2"
> 0x00020000-0x00200000 : "Root"
> ...
> jffs2_scan_empty(): Empty block at 0x0000ffc0 ends at 0x00010000 (with
> 0x1985e002)! Marking dirty
> (message repeats for successive 128KB blocks)
> CLEANMARKER node found at 0x00150000, not first node in block
> (0x00140000)
> jffs2_scan_empty(): Empty block at 0x0016000c ends at 0x00170000 (with
> 0x19852003)! Marking dirty
> CLEANMARKER node found at 0x00170000, not first node in block
> (0x00160000)
> jffs2_scan_empty(): Empty block at 0x0018000c ends at 0x00190000 (with
> 0x19852003)! Marking dirty
> CLEANMARKER node found at 0x00190000, not first node in block
> (0x00180000)
> jffs2_scan_empty(): Empty block at 0x001a000c ends at 0x001b0000 (with
> 0x19852003)! Marking dirty
> CLEANMARKER node found at 0x001b0000, not first node in block
> (0x001a0000)
> jffs2_scan_empty(): Empty block at 0x001c000c ends at 0x001d0000 (with
> 0x19852003)! Marking dirty
> CLEANMARKER node found at 0x001d0000, not first node in block
> (0x001c0000)
> VFS: Mounted root (jffs2 filesystem).
> Freeing unused kernel memory: 40k freed
> Waiting for chip to read, status = 7
> Waiting for chip to read, status = 7
> 
> Any pointers on what to look for here? 
> 
> -- 
> -------------------------------------------------
> Justin Wojdacki        
> justin.wojdacki@analog.com         (408) 350-5032
> Communications Processors Group -- Analog Devices
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
"Perl is basically TECO-99."  ---Barry Shein
