Received: from lo.gmane.org ([80.91.229.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QQdPk-00088N-JR
	for linux-mtd@lists.infradead.org; Sun, 29 May 2011 10:40:09 +0000
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1QQdPh-0003xr-6h
	for linux-mtd@lists.infradead.org; Sun, 29 May 2011 12:40:05 +0200
Received: from mar92-9-82-237-75-54.fbx.proxad.net ([82.237.75.54])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 29 May 2011 12:40:05 +0200
Received: from gilles.ganault by mar92-9-82-237-75-54.fbx.proxad.net with
	local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Sun, 29 May 2011 12:40:05 +0200
To: linux-mtd@lists.infradead.org
From: Gilles <gilles.ganault@free.fr>
Subject: [Ubi] Wrong major:minor
Date: Sun, 29 May 2011 12:39:33 +0200
Message-ID: <5d84u6d24de3ikt776vdrqpnhhecs3aoio@4ax.com>
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

Hello

I used the following data to compile Ubi(fs) into a uClinux kernel:

========= device_table.txt
#UBIFS nodes
/dev/ubi_ctrl	c	644	0	0	10	63	0	0	-
/dev/ubi0	c	644	0	0	253	0	0	0	-
========= 

However, ubimkvol isn't happy with it:
========= 
root:~> ubimkvol /dev/ubi0 -s 20MiB -N ubifs0

libubi: error!: "/dev/ubi0" has major:minor 253:0, but this does not
correspond to any UBI device or volume

ubimkvol: error!: "/dev/ubi0" is not an UBI device node
========= 

Here's what the two device nodes look like in the running kernel:
========= 
root:~> ls -al /dev/ubi*
crw-r--r--    1 root     root      253,   0 May 27  2011 /dev/ubi0
crw-r--r--    1 root     root       10,  63 May 27  2011 /dev/ubi_ctrl
========= 

I'm no Linux expert, and was wondering how to find out what the
correct major:minor is for the Ubi device nodes? Are they defined
somewhere in the Linux source code?

Thank you.
