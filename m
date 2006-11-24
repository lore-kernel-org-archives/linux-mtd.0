Received: from rgminet01.oracle.com ([148.87.113.118])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GnXht-0006UE-D7
	for linux-mtd@lists.infradead.org; Fri, 24 Nov 2006 04:51:01 -0500
Received: from rgmgw3.us.oracle.com (rgmgw3.us.oracle.com [138.1.186.112])
	by rgminet01.oracle.com (Switch-3.2.4/Switch-3.1.6) with ESMTP id
	kAO9ona3002031
	for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2006 02:50:49 -0700
Received: from [10.179.121.103] (dhcp-skc-10-179-121-103.kr.oracle.com
	[10.179.121.103])
	by rgmgw3.us.oracle.com (Switch-3.2.4/Switch-3.1.7) with ESMTP id
	kAO9olEk029042
	for <linux-mtd@lists.infradead.org>; Fri, 24 Nov 2006 02:50:48 -0700
Message-ID: <4566C070.1000405@oracle.com>
Date: Fri, 24 Nov 2006 18:50:40 +0900
From: Howard Yoo <hyunggook.yoo@oracle.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: JFFS2 - how does the new page allocated?
Content-Type: multipart/mixed; boundary="------------060201080606070002070808"
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
--------------060201080606070002070808
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit

I'm currently analyzing the structure of JFFS2, for research reason.
I have a simple question,

When JFFS2 allocates a new page to store the newly entering data, how
does it select the new page? Does it allocate a new block for each new
page request, or does it intelligently reuse the dirty marked page first
to be more space efficient? I would like to get some hints on how JFFS2
provisions pages and blocks..



--------------060201080606070002070808
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
--------------060201080606070002070808--
