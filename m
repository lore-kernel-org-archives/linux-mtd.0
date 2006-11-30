Received: from rgminet01.oracle.com ([148.87.113.118])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Gphcu-0007am-HP
	for linux-mtd@lists.infradead.org; Thu, 30 Nov 2006 03:50:46 -0500
Received: from rgmgw3.us.oracle.com (rgmgw3.us.oracle.com [138.1.186.112])
	by rgminet01.oracle.com (Switch-3.2.4/Switch-3.1.6) with ESMTP id
	kAU8oX8K012836
	for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2006 01:50:33 -0700
Received: from [10.179.121.103] (dhcp-skc-10-179-121-103.kr.oracle.com
	[10.179.121.103])
	by rgmgw3.us.oracle.com (Switch-3.2.4/Switch-3.1.7) with ESMTP id
	kAU8oVgS022154
	for <linux-mtd@lists.infradead.org>; Thu, 30 Nov 2006 01:50:31 -0700
Message-ID: <456E9B4F.5080806@oracle.com>
Date: Thu, 30 Nov 2006 17:50:23 +0900
From: Howard Yoo <hyunggook.yoo@oracle.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: performance of JFFS and YAFFS in terms of in-place updates
Content-Type: multipart/mixed; boundary="------------090000050700000906030405"
Reply-To: hyunggook.yoo@oracle.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------090000050700000906030405
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit

Dear members,

we're testing the performance btw. JFFS and YAFFS, and we're currently
using nand simulator to simulate the nand flash behavior (since we don't
have the physical flash for our testing) on linux kernel 2.6.17.

While running both FFS's, we've found out that somehow, JFFS shows much
better performance than YAFFS, in terms of in-place updates and erase
counts. However, we're not really sure whether this is the right figure,
and since we're new in dealing with nand flash memory, we want to be
sure if there is a specific(proper) ways to run JFFS on nand simulator.,
or is there any nand simulator specifically tuned for YAFFS, or is it
that simply JFFS is better in terms of in-place updates compared to YAFFS?

--------------090000050700000906030405
Content-Type: text/x-vcard; charset=utf-8;
 name="hyunggook.yoo.vcf"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="hyunggook.yoo.vcf"

YmVnaW46dmNhcmQNCmZuOkh5dW5nIEdvb2sgWW9vDQpuOllvbztIeXVuZyBHb29rDQpvcmc6
T0FSREM7S29yZWENCmFkcjo7OztTZW91bDs7O1NvdXRoIEtvcmVhDQplbWFpbDtpbnRlcm5l
dDpoeXVuZ2dvb2sueW9vQG9yYWNsZS5jb20NCnRpdGxlOk1lbWJlciBvZiB0aGUgdGVjaG5p
Y2FsIHN0YWZmDQp0ZWw7d29yazorODIuMi4yMTk0Ljc1NjINCm5vdGU6PGltZyBzcmM9Imh0
dHA6Ly9waG90b3MxLmJsb2dnZXIuY29tL2Jsb2dnZXIvNjQzOS80MDQvMzIwL0h5dW5nR29v
a1lvb19lbl80MDAuanBnIiBib3JkZXI9IjAiIC8+DQp4LW1vemlsbGEtaHRtbDpUUlVFDQp2
ZXJzaW9uOjIuMQ0KZW5kOnZjYXJkDQoNCg==
--------------090000050700000906030405--
