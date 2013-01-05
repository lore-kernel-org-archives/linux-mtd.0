Received: from outbound-241.asp.reflexion.net ([69.84.129.241]
 helo=asp.reflexion.net)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TrWMz-0001in-0c
 for linux-mtd@lists.infradead.org; Sat, 05 Jan 2013 16:13:14 +0000
From: Dan Donahue <ddonahue@gridcosystems.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: JFFS2 Garbage Collection causing mtd do_write_buffer timeouts?
Date: Sat, 5 Jan 2013 16:13:07 +0000
Message-ID: <99124789FD278148B0B056AC36E5D8DB496CC2FD@THOR.gridco.local>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings,

Some data:
---------------
- proprietary board with ARM processor booting out of CFI NOR flash
- Linux kernel 3.1.0
- BusyBox v1.19.v
- JFFS2 mounted mtdblocks
- using JFFS2 for disk-like storage of images; not using JFFS2 for=A0
root file system (that's in RAM)

summary:
I am seeing intermittent mtd do_write_buffer() timeouts when un'taring a la=
rge file (10MB) directly to flash and believe the cause to be a mutex issue=
 with jffs2 garbage collection thread.

details:
Flash status returned in chip_ready() (cfi_cmdset_0002.c) when the timeouts=
 occur indicate "Erase in progress" (DQ3=3D1, DQ2 toggling, DQ6 toggling), =
which shouldn't be the case when writing the flash. My guess is there is a =
mutex issue occurring with the jffs2_gcd_mtdX when it's erasing a block it =
recently collected.

I've killed the gcd thread and am currently re-running my test. I've yet to=
 see a timeout.

questions:
Could jffs2 garbage collection erase contend with a write operation (especi=
ally when the write is large and takes a while)?

If so, then how should garbage collection be turned off when doing large wr=
ites to flash?=20

I've read the gc thread is optional (gc done regardless). Is that true? If =
so, how do I turn it off? I didn't see an associated configs parameter.

Could it be related to this issue: http://lists.infradead.org/pipermail/lin=
ux-mtd/2012-February/039787.html

Thanks for reading this far...


Dan Donahue
Gridco Systems, Inc.
