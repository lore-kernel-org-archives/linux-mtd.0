Received: from nwd2mime2.analog.com ([137.71.25.114])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17FMSX-0005SU-00
	for <linux-mtd@lists.infradead.org>; Tue, 04 Jun 2002 23:07:21 +0100
Received: from nwd2gtw1 (unverified) by nwd2mime2.analog.com
 (Content Technologies SMTPRS 4.2.5) with SMTP id <T5b482089ad894719720c0@nwd2mime2.analog.com> for <linux-mtd@lists.infradead.org>;
 Tue, 4 Jun 2002 15:21:55 -0400
Received: from golf.cpgdesign.analog.com ([137.71.139.100]) by nwd2mhb2.analog.com with ESMTP (8.9.3 (PHNE_18979)/8.7.1) id PAA01965 for <linux-mtd@lists.infradead.org>; Tue, 4 Jun 2002 15:21:03 -0400 (EDT)
Received: from ws4.cpgdesign.analog.com (ws4 [137.71.139.26])
	by golf.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id MAA16503
	for <linux-mtd@lists.infradead.org>; Tue, 4 Jun 2002 12:21:01 -0700 (PDT)
Received: from analog.com (localhost [127.0.0.1])
	by ws4.cpgdesign.analog.com (8.9.1/8.9.1) with ESMTP id MAA19328
	for <linux-mtd@lists.infradead.org>; Tue, 4 Jun 2002 12:21:01 -0700 (PDT)
Message-ID: <3CFD131D.1AA4678F@analog.com>
Date: Tue, 04 Jun 2002 12:21:01 -0700
From: Justin Wojdacki <justin.wojdacki@analog.com>
Reply-To: justin.wojdacki@analog.com
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Strange problem related to writing to flash
Content-Type: text/plain; charset="us-ascii"
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

Okay, so here's the problem I'm running into:

On a hard reset, the board I'm working with always comes up fine.
Linux boots, mounts the root filesystem (JFFS2) and all that. It looks
happy. 

If I don't modify the filesystem, Linux boots fine on a soft reset. 

If I modify the filesystem in some way, Linux fails to boot properly
on a soft reset. What happens is the bootstrap loads the kernel from
the JFFS2 partition and boots the kernel. When the kernel probes the
flash, it sees 2 8-bit wide devices instead of the actual 1 16-bit
wide device. JFFS2 then get's really unhappy because it's attempts to
access the flash device fail. 

here are relevant bits of dmesg

First, on success:
AD6489 Residential Gateway flash probe(0x1fc00000,2097152,2): 200000
at 1fc00000
Analog Devices AD6489 Residential Gateway, Rev 2.0: Found 1 x16
devices at 0x0 in 16-bit mode
Found: ST M29W160DB
number of JEDEC chips: 1
0: offset=0x0,size=0x4000,blocks=1
1: offset=0x4000,size=0x2000,blocks=2
2: offset=0x8000,size=0x8000,blocks=1
3: offset=0x10000,size=0x10000,blocks=31
Creating 4 MTD partitions on "Analog Devices AD6489 Residential
Gateway, Rev 2.0":
0x00000000-0x00004000 : "Bootstrap 1"
0x00004000-0x00008000 : "Configuration"
0x00008000-0x00020000 : "Bootstrap 2"
0x00020000-0x00200000 : "Root"

Next, on failure:
AD6489 Residential Gateway flash probe(0x1fc00000,2097152,2): 200000
at 1fc00000
Analog Devices AD6489 Residential Gateway, Rev 2.0: Found 2 x8 devices
at 0x0 in 16-bit mode
Found: ST M29W160DB
number of JEDEC chips: 1
0: offset=0x0,size=0x8000,blocks=1
1: offset=0x8000,size=0x4000,blocks=2
2: offset=0x10000,size=0x10000,blocks=1
3: offset=0x20000,size=0x20000,blocks=31
Creating 4 MTD partitions on "Analog Devices AD6489 Residential
Gateway, Rev 2.0":
0x00000000-0x00004000 : "Bootstrap 1"
0x00004000-0x00008000 : "Configuration"
0x00008000-0x00020000 : "Bootstrap 2"
0x00020000-0x00200000 : "Root"
...
jffs2_scan_empty(): Empty block at 0x0000ffc0 ends at 0x00010000 (with
0x1985e002)! Marking dirty
(message repeats for successive 128KB blocks)
CLEANMARKER node found at 0x00150000, not first node in block
(0x00140000)
jffs2_scan_empty(): Empty block at 0x0016000c ends at 0x00170000 (with
0x19852003)! Marking dirty
CLEANMARKER node found at 0x00170000, not first node in block
(0x00160000)
jffs2_scan_empty(): Empty block at 0x0018000c ends at 0x00190000 (with
0x19852003)! Marking dirty
CLEANMARKER node found at 0x00190000, not first node in block
(0x00180000)
jffs2_scan_empty(): Empty block at 0x001a000c ends at 0x001b0000 (with
0x19852003)! Marking dirty
CLEANMARKER node found at 0x001b0000, not first node in block
(0x001a0000)
jffs2_scan_empty(): Empty block at 0x001c000c ends at 0x001d0000 (with
0x19852003)! Marking dirty
CLEANMARKER node found at 0x001d0000, not first node in block
(0x001c0000)
VFS: Mounted root (jffs2 filesystem).
Freeing unused kernel memory: 40k freed
Waiting for chip to read, status = 7
Waiting for chip to read, status = 7

Any pointers on what to look for here? 

-- 
-------------------------------------------------
Justin Wojdacki        
justin.wojdacki@analog.com         (408) 350-5032
Communications Processors Group -- Analog Devices
