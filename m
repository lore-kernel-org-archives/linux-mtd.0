Received: from ug-out-1314.google.com ([66.249.92.169])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HGgwD-0004sB-F3
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 14:34:11 -0500
Received: by ug-out-1314.google.com with SMTP id m2so37315uge
	for <linux-mtd@lists.infradead.org>;
	Mon, 12 Feb 2007 11:34:05 -0800 (PST)
Message-ID: <f383264b0702121134w4d3fcaf9ted6a5ffba38cff5a@mail.gmail.com>
Date: Mon, 12 Feb 2007 11:34:05 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: PATCH: only round s3c2410 NAND timing values when necessary
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_88301_2201890.1171308845148"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_88301_2201890.1171308845148
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

When calculating NAND timing values, only round up when necessary.

Signed-off-by: Matt Reimer <mreimer@vpop.net>

------=_Part_88301_2201890.1171308845148
Content-Type: application/octet-stream; name="calc-rate.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="calc-rate.patch"
X-Attachment-Id: f_ey3b18hv

LS0tIGEvZHJpdmVycy9tdGQvbmFuZC9zM2MyNDEwLmMJVHVlIEphbiAzMCAxMjoxNTowOCAyMDA3
CisrKyBiL2RyaXZlcnMvbXRkL25hbmQvczNjMjQxMC5jLnBhdGNoZWQJVHVlIEphbiAzMCAxMjox
NTowOCAyMDA3CkBAIC0xNTksNyArMTU5LDggQEAgc3RhdGljIGludCBzM2NfbmFuZF9jYWxjX3Jh
dGUoaW50IHdhbnRlZAogCWludCByZXN1bHQ7CiAKIAlyZXN1bHQgPSAod2FudGVkICogY2xrKSAv
IE5TX0lOX0tIWjsKLQlyZXN1bHQrKzsKKwlpZiAoKCh3YW50ZWQgKiBjbGspICUgTlNfSU5fS0ha
KSAhPSAwKQorCQlyZXN1bHQrKzsKIAogCXByX2RlYnVnKCJyZXN1bHQgJWQgZnJvbSAlbGQsICVk
XG4iLCByZXN1bHQsIGNsaywgd2FudGVkKTsKIAo=
------=_Part_88301_2201890.1171308845148--
