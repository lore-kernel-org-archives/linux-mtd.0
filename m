Received: from gateway.digitalview.com.hk
	([152.101.51.1] helo=janus.hk.panelx.com ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17giro-0003jn-00
	for <linux-mtd@lists.infradead.org>; Mon, 19 Aug 2002 10:30:32 +0100
Message-ID: <00bb01c24762$dbcbaa40$9000010a@paulwong>
From: "Paul Wong" <paul.wong@digitalview.com>
To: <linux-mtd@lists.infradead.org>
Subject: help! more message -->jffs2_scan_eraseblock() 
Date: Mon, 19 Aug 2002 17:28:36 +0800
MIME-Version: 1.0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: 7bit
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

Hi!
    i am using a NAND flash to build up the jffs2 file system in Linux
kernel 2.4.17. and get the updated version of the MTD via CVS server. I
followed the NAND doc. and success to control the nand flash component. But,
when using "mount" command to make a device driver. there are more message
to display (like below that). After that, I check the file in jffs2
partition. all files are avaliable in nand flash and good condition.  What
is the meaning about the below message?????

Thank you.

Paul


jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00143760:
0x27de in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00143764:
0x27de in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00143768:
0x3000 in
stead
Further such events for this erase block will not be printed
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144000:
0x9f2c in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144004:
0x6ba1 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144008:
0x04d4 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0014400c:
0x25a6 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144010:
0xb265 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144014:
0xefc5 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144018:
0x12d8 in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x0014401c:
0x1a8f in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144020:
0x7bfa in
stead
jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00144024:
0x42b7 in
stead
Further such events for this erase block will not be printed

******************************************************************
all files are avalible in nand flash
******************************************************************

bash-2.04# ls /mnt/flash -al
total 2419
drwxr-xr-x    3 root     0               0 Jan  1  1970 .
drwxrwxrwx    4 root     0            1024 Aug 13  2002 ..
-rw-r--r--    1 root     0           10818 Jul 25  2002 SiS630
-rwxr--r--    1 root     0           35321 Jul 22  2002 fb_nsc.txt
-rwxr--r--    1 root     0           37467 Jul 19  2002 geode_rm.txt
-rwxr--r--    1 root     0          575598 Jul 17  2002 linuxapi_prgref.pdf
-rwxr--r--    1 root     0           31168 Jun 23  2000
loadregforlinux_v1.2.pdf

-rw-rw-r--    1 500      500        788829 Jul  5  2002 ns2000manual.pdf
-rwxr--r--    1 root     0           91578 Jun 23  2000 sc1200_sc1201_tv.pdf
-rwxr--r--    1 root     0          136106 Jun 23  2000
scx200_capturevip.pdf
-rwxr--r--    1 root     0           42297 Jun 23  2000
scx200_int_routing.pdf
-rwxr--r--    1 root     0           93302 Jun 23  2000
scx200_irq_expansion.pdf

-rwxr--r--    1 root     0           55786 Jun 23  2000 scx200_nand.pdf
-rwxr--r--    1 root     0          425177 Jul 17  2002
sp1sc10_stb_platform.pdf

-rwxr--r--    1 root     0          149956 Jul 17  2002 v4l2_prog_guide.pdf
bash-2.04#
