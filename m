Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AnmSc-0002CE-GL
	for linux-mtd@lists.infradead.org; Mon, 02 Feb 2004 22:22:30 +0000
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i12MMRi31894
	for <linux-mtd@lists.infradead.org>; Tue, 3 Feb 2004 11:22:27 +1300
Received: from sunstorm.tait.co.nz (sunstorm.tait.co.nz [172.25.40.9])
	by gatekeeper.tait.co.nz (8.11.2/8.9.3) with ESMTP id i12MMRi31888
	for <linux-mtd@lists.infradead.org>; Tue, 3 Feb 2004 11:22:27 +1300
Received: from tait.co.nz ([172.25.107.89])
 by sunstorm.tait.co.nz (iPlanet Messaging Server 5.1 (built May  7 2001))
 with ESMTP id <0HSH0068GA5AIL@sunstorm.tait.co.nz> for
 linux-mtd@lists.infradead.org; Tue, 03 Feb 2004 11:22:22 +1300 (NZDT)
Date: Tue, 03 Feb 2004 11:20:26 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
To: mtd list <linux-mtd@lists.infradead.org>
Message-id: <401ECD2A.4070106@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii; format=flowed
Content-transfer-encoding: 7BIT
Subject: workstation mount of jffs2 and endianess
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Greetings

Is it possible to mount a bigendian jffs2 filesystem image (via blkmtd 
or whatever) on a little endian host system (i.e. a PC workstation)?

If so, where do I tell the system what the endianess is? At present I 
get errors during mount (which if the endianess is not known I'd expect) 
of the form:
losetup /dev/loop3 /home/gilksr/jffs2.fs
insmod blkmtd erasesz=64 device=/dev/loop3
mount -t jffs2 /dev/mtdblock/0 /mnt/root_fs
mount: wrong fs type, bad option, bad superblock on /dev/loop3,
        or too many mounted file systems

I've checked that I can create and loop mount a l-e filesystem but the 
target I'm working with is a powerpc that I want to keep as natively b-e.


-- 
Robin Gilks
Senior Design Engineer          Phone: (+64)(3) 357 1569
Tait Electronics                Fax  :  (+64)(3) 359 4632
PO Box 1645 Christchurch        Email : robin.gilks@tait.co.nz
New Zealand
