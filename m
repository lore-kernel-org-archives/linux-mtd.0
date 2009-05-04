Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M14PU-0004rk-Qk
	for linux-mtd@lists.infradead.org; Mon, 04 May 2009 20:05:15 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1M14PO-0006Di-VP
	for linux-mtd@lists.infradead.org; Mon, 04 May 2009 20:05:02 +0000
Received: from pool-98-117-108-7.sttlwa.fios.verizon.net ([98.117.108.7])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 May 2009 20:05:02 +0000
Received: from ceckak by pool-98-117-108-7.sttlwa.fios.verizon.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 04 May 2009 20:05:02 +0000
To: linux-mtd@lists.infradead.org
From: Ken Cecka <ceckak@alumni.washington.edu>
Subject: any problem with changing mtdparts to a sysfs parameter?
Date: Mon, 04 May 2009 12:55:53 -0700
Message-ID: <gtnh8b$q54$1@ger.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7Bit
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to modify the firmware update scripts on a board I'm working on 
to allow updates to change the partition layout.  One thing that would be 
extremely useful is a way to change the partition layout at runtime, so that 
I can read the existing partition data into RAM, change the layout, then 
write the data back to the rearranged partitions.

I've been experimenting with this by converting mtdparts to a sysfs 
parameter:
  static char mtdparts[COMMAND_LINE_SIZE];
  module_param_string(mtdparts, mtdparts, sizeof(mtdparts), S_IRUGO | 
S_IWUSR);
  MODULE_PARM_DESC(mtdparts, "MTD partitions");

After some other modifications to allow mtdpart_setup_real to be called more 
than once, things seem to be working well.  I can unbind the physmap_of 
driver, define a new layout in the mtdparts sysfs file, then rebind the 
physmap_of driver and see the new partition layout.

One point of concern I had - mtdpart_setup_real was protected so that it 
only runs once, but I don't really understand why.  It allocates an array of 
mtd_partition structures, but it looks like the caller is responsible for 
freeing this array.  Is there any problem with letting 
parse_cmdline_partitions call mtdpart_setup_real every time?

Thanks,
Ken
