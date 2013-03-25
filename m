Received: from mail-da0-x22f.google.com ([2607:f8b0:400e:c00::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UJxvL-0004WO-Jr
 for linux-mtd@lists.infradead.org; Mon, 25 Mar 2013 03:18:16 +0000
Received: by mail-da0-f47.google.com with SMTP id s35so3009620dak.34
 for <linux-mtd@lists.infradead.org>; Sun, 24 Mar 2013 20:18:13 -0700 (PDT)
Sender: Paul Henson <paul.b.henson@gmail.com>
Message-ID: <514FC1F1.8040500@acm.org>
Date: Sun, 24 Mar 2013 20:18:09 -0700
From: "Paul B. Henson" <henson@acm.org>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: i.MX28 gpmi-nand underlying geometry
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to get the Freescale kobs-ng tool (used to burn boot images 
to NAND) working under a current kernel.

Under the 2.6 kernel that Freescale ships with their BSP, access to the 
NAND is via the gpmi-nfc driver, which creates a sysfs node at 
/sys/bus/platform/devices/gpmi-nfc.0/nfc_geometry exposing the 
underlying geometry of the NAND to user space.

The kobs-ng tool accesses this, and looks up:

"Page Size in Bytes"
"Metadata Size in Bytes"
"ECC Chunk Size in Bytes"
"ECC Chunk Count"
"Block Mark Byte Offset"
"Block Mark Bit Offset"

(I think it might only actually be using the last two, but am not 
completely sure at this point)

With a current kernel, access to the NAND uses the gpmi-nand driver. 
Almost the exactly identical geometry information is printed out by 
gpmi_dump_info in gpmi-lib.c, but evidently only in the case of a kernel 
bug/error.

Is there any way to access this geometry information from user space 
with the gpmi-nand driver under a current kernel? After a few other 
minor changes, I was able to successfully get kobs-ng working by hard 
coding the values based on the output generated while booted under the 
Freescale kernel. Ideally I'd like to be able to read the necessary 
information directly from the NAND while booted with a current kernel.

Thanks much…
