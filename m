Received: from mailout1.samsung.com ([203.254.224.24])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1H9x36-0006o1-JK
	for linux-mtd@lists.infradead.org; Thu, 25 Jan 2007 00:21:29 -0500
Received: from ep_ms12_bk (mailout1.samsung.com [203.254.224.24])
	by mailout1.samsung.com
	(iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
	with ESMTP id <0JCE00GLXS6CPP@mailout1.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 25 Jan 2007 14:20:36 +0900 (KST)
Received: from ep_spt01 (ms12.samsung.com [203.254.225.99])
	by ms12.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
	2004)) with ESMTP id <0JCE00GKKS6C38@ms12.samsung.com> for
	linux-mtd@lists.infradead.org; Thu, 25 Jan 2007 14:20:36 +0900 (KST)
Content-return: prohibited
Date: Thu, 25 Jan 2007 05:20:36 +0000 (GMT)
From: Kyungmin Park <kyungmin.park@samsung.com>
Subject: [PATCH] [MTD] OneNAND: Amend write-verify to compare to original
	buffer
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Message-id: <28810309.81531169702436300.JavaMail.weblogic@ep_ml28>
MIME-version: 1.0
MIME-version: 1.0
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: base64
Reply-To: kyungmin.park@samsung.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

SGkgQWRyaWFuLA0KDQo+IFdoZW4gd3JpdGUtdmVyaWZ5IGlzIGVuYWJsZWQgKENPTkZJR19NVERf
T05FTkFORF9WRVJJRllfV1JJVEUpLA0KPiB0aGUgZGF0YSB3cml0dGVuIGlzIHJlYWQgYmFjayBh
bmQgY29tcGFyZWQuICBUaGUgY29tcGFyaXNvbg0KPiB3YXMgYmVpbmcgbWFkZSBiZXR3ZWVuIGRh
dGFSQU0gYnVmZmVycywgYnV0IHRoaXMgZG9lcyBub3QNCj4gdmVyaWZ5IHRoYXQgdGhlIGRhdGEg
bWFkZSBpdCB0byB0aGUgZGF0YVJBTSBjb3JyZWN0bHkgaW4NCj4gdGhlIGZpcnN0IHBsYWNlLiAg
VGhpcyBwYXRjaCBhbWVuZHMgd3JpdGUtdmVyaWZ5IHRvDQo+IGNvbXBhcmUgYmFjayB0byB0aGUg
b3JpZ2luYWwgYnVmZmVyLiAgSXQgYWxzbyBub3cgdmVyaWZpZXMNCj4gc3ViLXBhZ2Ugd3JpdGVz
Lg0KDQpJJ2xsIHB1c2ggaXQNCg0KVGhhbmsgeW91LA0KS3l1bmdtaW4gUGFyaw0K
