Received: from f04s01.cac.psu.edu ([128.118.141.31] helo=f04n01.cac.psu.edu)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15wjdH-0005ah-00
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2001 13:29:11 +0100
Received: from nrlgrad.psu.edu (nrlgrad.cedcc.psu.edu [130.203.252.43])
	by f04n01.cac.psu.edu (8.9.3/8.9.3) with ESMTP id IAA57144
	for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2001 08:38:26 -0400
Message-Id: <5.1.0.14.2.20011025083606.00a8d7b0@mail.psu.edu>
Date: Thu, 25 Oct 2001 08:38:32 -0400
To: linux-mtd@lists.infradead.org
From: Bill Seisler <wrs122@psu.edu>
Subject: Boot DOC2000 readonly...
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
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

Here's my setup:
PIII 850, 256MB RAM, 144 MB DOC2000, Redhat Linux 7.1, Kernel version 
2.4.9, DOC formatted ext2.

I can boot from DOC without a problem. I have a nice little linux root 
filesystem on it and everything (approx 70 MB). I know I can trim it down 
some more if I have to.

The next step I have to do is to make the system capable of handling power 
outages (instead of powering down linux properly). The idea was to mount 
DOC read-only, reducing it to a ROM essentially and mounting writeable 
areas to a ramdisk. I have one problem, I do not know how to populate the 
ramdisk area or where during bootup this should be done properly. I can 
boot from an initrd and I've even played with a linuxrc file. However, nash 
is not the friendliest of shells (if you consider it a shell). I can mount 
stuff but I can't copy or dd anything to a ramdisk. The commands just don't 
work, even if I copy the binaries cp and dd to my initrd image.

I looked at the instructions provided with the MTD CVS, however, I think 
putting only what is written to in a ramdisk is a faster booting solution.

I like the idea of mounting one large ramdisk as var and populating it 
appropriately (including /var/tmp and /var/dev). If I use an initrd, and 
setup linuxrc to
mount /dev/nftla1 as root. Where would I put the commands to mount and 
populate the ramdisk?

And suggestions/ideas/detailed instructions are greatly appreciated.
-Bill
