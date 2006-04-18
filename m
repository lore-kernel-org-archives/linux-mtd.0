Received: from nz-out-0102.google.com ([64.233.162.201])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FVrpf-0001T1-1y
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 11:09:46 -0400
Received: by nz-out-0102.google.com with SMTP id v1so797435nzb
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Apr 2006 08:09:33 -0700 (PDT)
Message-ID: <4770282f0604180809v52de6531sd10198663204813b@mail.gmail.com>
Date: Tue, 18 Apr 2006 17:09:33 +0200
From: "Jean-Laurent Gazelle" <jlgazelle@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Subject: jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm running linux 2.6.9 on an ARM based platform booting from Uboot.
My root filesystem is a flash partition.

And I'm experiencing flash JFFS2/MTD corruption on some units while
power cycling its on/off after 1 day of usage.

I saw several posting on the subject, but none about a fix or
workaround. Most of its were talking about powering off units while
accessing the FS (write or erase block)

I'm trying to investigate more deaper the problem, by setting up
something like a watchdog and adding FS stress test.

So if you've experienced similar issue and you've finally fixed it or
workarounded it, please let me know.

thanks,
Jean-Laurent

Here are the details of my configuration :

Here is my flash topology :
Probing Flash2 at physical address 0x04000000 (16-bit bankwidth)
Flash2: Found 1 x16 devices at 0x0 in 16-bit bank
 Intel/Sharp Extended Query Table at 0x0031
cfi_cmdset_0001: Erase suspend on write enabled
Using buffer write method
RedBoot partition parsing not available
cmdlinepart partition parsing not available
Using static partitions on Flash1
Creating 5 MTD partitions on "Flash1":
0x00000000-0x00020000 : "BootLoader"
0x00020000-0x00040000 : "BIOS Data"
0x00040000-0x001c0000 : "Fixed Kernel"
0x001c0000-0x00340000 : "D/L Kernel"
0x00340000-0x02000000 : "Root File-system"

My flash device is intel stratflash 128J3C type.



Everything works properly on the major part of my units.
About ~ 5% of our devices are experiencing data corruption in Flash
when Power Cycling the unit.

What I mean by data corruption is :
- bad CRC of the kernel image in flash.
- corruption of the JFFS2 filesystem with the following errors .

I have set the JFFS2 debug level to 2 to have more infos :
jffs2_scan_inode_node(): CRC failed on node at 0x00082968: Read
0x53550700, calculated 0x5355a705
jffs2_scan_dirent_node(): Node CRC failed on node at 0x00085cb4: Read
0x40be781e, calculated 0xd96b6459
jffs2_scan_dirent_node(): Node CRC failed on node at 0x000876f4: Read
0xdb341107, calculated 0x70a4cf41
jffs2_scan_inode_node(): CRC failed on node at 0x00091794: Read
0x0b79aada, calculated 0x18f814d5
jffs2_scan_eraseblock(): Node at 0x00092964 {0x1985, 0xe002,
0x00000000) has invalid CRC 0x32fe3396 (calculated
0x8c813477)^Mjffs2_scan_eraseblock(): Magic bitmask 0x1985 not found
at 0x0009296c: 0x3396 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092970:
0x02cf instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092974:
0x0001 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092978:
0x21a4 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092984:
0xeac9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092988:
0xeac9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0009298c:
0xeac9 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092994:
0x0002 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00092998:
0x0002 instead
Further such events for this erase block will not be printed
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144448:
0x0554 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0014444c:
0x6e69 instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144450:
0x03bc instead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144454:
0x027e instead
