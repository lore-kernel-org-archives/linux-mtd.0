Received: from ns2.arlut.utexas.edu ([129.116.174.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17hbfE-0000eq-00
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 21:01:13 +0100
Received: from ns5.arlut.utexas.edu (ns5.arlut.utexas.edu [10.4.1.6])
	by ns2.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id g7LK1Blg047426
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 15:01:11 -0500 (CDT)
Received: from koffer.arlut.utexas.edu (koffer.arlut.utexas.edu [10.8.17.114])
	by ns5.arlut.utexas.edu (8.12.5/8.12.5) with ESMTP id g7LK1A1j028417
	for <linux-mtd@lists.infradead.org>; Wed, 21 Aug 2002 15:01:10 -0500 (CDT)
Date: Wed, 21 Aug 2002 15:01:09 -0500
Mime-Version: 1.0 (Apple Message framework v482)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Subject: cp of jffs image wants to clobber /dev/mtd1 node.
From: Ken Offer <koffer@arlut.utexas.edu>
To: LinuxMTD <linux-mtd@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Message-Id: <BC765B75-B540-11D6-92ED-000393467F1A@arlut.utexas.edu>
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

Anybody else run into this?

I try to copy my jffs2 image created with:

     ./mkfs.jffs2 -r simple_directory -e 16K -l -o /tmp/test.img

like so

     cp /tmp/test.img /dev/mtd1

And Linux wants to overwrite my "/dev/mtd1" node...

     cp: overwrite `/dev/mtd1'?

If I let it, Linux replaces the file "/dev/mtd1" with the 
contents of test.img, instead of copying test.img TO the DEVICE 
"/dev/mtd1".  Its acting as if "/dev/mtd1" is a simple file 
instead of a device node.

The node looks correctly created:

crw-rw----    1 root     disk      90,   2 Aug 19 08:43 /dev/mtd1

+-----------------------------------------------------------+
|  Ken Offer        koffer@arlut.utexas.edu         ARL:UT  |
|  Office: 512-835-3859                  Fax: 512-835-3259  |
+-----------------------------------------------------------+
