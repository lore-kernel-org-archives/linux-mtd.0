Received: from [208.190.191.184] (helo=sekhmet.ad.newisys.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Vi9l-00034D-00
	for <linux-mtd@lists.infradead.org>; Tue, 29 Jan 2002 23:59:17 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: Problems with mounting a JFFS2 file system image
Date: Tue, 29 Jan 2002 18:09:49 -0600
Message-ID: <D3A72C5007329A4F991C0DD87202259F096A41@sekhmet.ad.newisys.com>
From: "Navin Boppuri" <navin.boppuri@newisys.com>
To: <linux-mtd@lists.infradead.org>
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

Hello all,

I have been able to succesfully partition my flash and mount a jffs2 =
file system on the same. I am able to copy, create, read and write files =
onto my new file system.=20

Now, I wanted to create a file system on my host machine using the =
mkfs.jffs2 utility and mount the file system onto my flash partition on =
my embedded device. But I havent been successful in doing so. I followed =
the JFFS2 README and this is what I did:

	mkfs.jffs -d tmp_fs -o jffs2.image   ( tmp_fs is a directory with all =
my files in it)

	erase /dev/mtd0 0 8 ( I have 8 sectors to erase )
		Worked like a charm. Verified that the flash was completely erased.

	cp jffs2.image /dev/mtd0	( No problem here. I have it running in DEBUG =
mode. )

	insmod jffs2.o 			( No problem here. I get all the messages that I =
expect)

	mount -t jffs2 /dev/mtdblock0 /mnt/jffs2

jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: =
0x8519 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000004: =
0x3100 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000008: =
0x1dd9 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000000c: =
0x0100 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000014: =
0x0200 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000018: =
0x0202 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0000001c: =
0x0908 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000020: =
0x77c0 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000024: =
0x0b76 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000028: =
0x7465 in
stead
Further such events for this erase block will not be printed
JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
Cowardly refusing to erase blocks on filesystem with no valid JFFS2 =
nodes
mount: wrong fs type, bad option, bad superblock on /dev/mtdblock0,
       or too many mounted file systems


I dont see any other special instructions on doing this. What am I =
missing here? What am I doing wrong?=20

Thank you,
Navin Boppuri.
