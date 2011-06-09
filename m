Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUhxq-0001xa-3y
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 16:20:11 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QUhxm-00081S-VO
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 18:20:07 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 18:20:06 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Thu, 09 Jun 2011 18:20:06 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: Re: [Ubiattach] "vtbl_check: too large reserved_pebs"
Date: Thu, 09 Jun 2011 18:17:24 +0200
Message-ID: <ics1v6h6c3h777js8uh4j8bve2i1q7m5d0@4ax.com>
References: <mv61v65qqumjmnr9dkejjacgg4id8srbe7@4ax.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 09 Jun 2011 12:24:22 +0200, Gilles <gilles.ganault@free.fr>
wrote:
(snip)

Now that I can successfully format + attach + mount the Ubifs NAND
partition, I tried rebooting with the following kernel command line:

==========
bootargs=ethaddr=00:09:45:56:72:9b console=ttyBF0,115200
rootfstype=ubifs ubi.mtd2 root=ubi0:rootfs
==========

However, uClinux isn't happy:
==========
...
UBIFS error (pid 1): ubifs_get_sb: cannot open "ubi0:rootfs", error
-19
VFS: Cannot open root device "ubi0:rootfs" or unknown-block(0,0)
Please append a correct "root=" boot option; here are the available
partitions:
1f00            8192 mtdblock0 (driver?)
1f01            8192 mtdblock1 (driver?)
1f02          253952 mtdblock2 (driver?)
Kernel panic - not syncing: VFS: Unable to mount root fs on
unknown-block(0,0)
Hardware Trace:
==========

I compiled Ubi(fs) statically in the kernel and included the MTD
utilities. Do I need something else for uClinux to be able to
attach/mount a Ubifs partition?

Thank you.
