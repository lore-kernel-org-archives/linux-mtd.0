Received: from mail-fx0-f211.google.com ([209.85.220.211])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NCNS8-0002rk-14
	for linux-mtd@lists.infradead.org; Mon, 23 Nov 2009 01:10:56 +0000
Received: by fxm3 with SMTP id 3so5487354fxm.4
	for <linux-mtd@lists.infradead.org>;
	Sun, 22 Nov 2009 17:10:49 -0800 (PST)
MIME-Version: 1.0
Date: Mon, 23 Nov 2009 02:10:49 +0100
Message-ID: <b8e9195f0911221710x5587429eve175bf6bfb2e360f@mail.gmail.com>
Subject: [MTD] CHIPS: add support for switching old SST chips into QRY mode
	(tested with 39VF3201)
From: Guillaume LECERF <foxcore@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: multipart/mixed; boundary=001485f6d4840350f70478ff7fa8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--001485f6d4840350f70478ff7fa8
Content-Type: text/plain; charset=UTF-8

Hi,

SST 39VF160x/39VF320x and some old SST chips need a special command
sequence to enter CFI QueRY mode [1].
This patch adds the relevant sequence to cfi_qry_mode_on().

Signed-off-by: Guillaume LECERF <glecerf@gmail.com>


[1] http://www.sst.com/dotAsset/40479.pdf / Table 6 : Software Command Sequence

-- 
Guillaume LECERF

--001485f6d4840350f70478ff7fa8
Content-Type: text/x-patch; charset=US-ASCII; name="old_sst_query_on.diff"
Content-Disposition: attachment; filename="old_sst_query_on.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g2cjeuje0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV91dGlsLmMgYi9kcml2ZXJzL210ZC9j
aGlwcy9jZmlfdXRpbC5jCmluZGV4IGM1YTg0ZmQuLmNhNTg0ZDAgMTAwNzU1Ci0tLSBhL2RyaXZl
cnMvbXRkL2NoaXBzL2NmaV91dGlsLmMKKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX3V0aWwu
YwpAQCAtNzEsNiArNzEsMTMgQEAgaW50IF9feGlwcmFtIGNmaV9xcnlfbW9kZV9vbih1aW50MzJf
dCBiYXNlLCBzdHJ1Y3QgbWFwX2luZm8gKm1hcCwKIAljZmlfc2VuZF9nZW5fY21kKDB4OTgsIDB4
NTU1LCBiYXNlLCBtYXAsIGNmaSwgY2ZpLT5kZXZpY2VfdHlwZSwgTlVMTCk7CiAJaWYgKGNmaV9x
cnlfcHJlc2VudChtYXAsIGJhc2UsIGNmaSkpCiAJCXJldHVybiAxOworCS8qIHNvbWUgb2xkIFNT
VCBjaGlwcywgZS5nLiAzOVZGMTYweC8zOVZGMzIweCAqLworCWNmaV9zZW5kX2dlbl9jbWQoMHhG
MCwgMCwgYmFzZSwgbWFwLCBjZmksIGNmaS0+ZGV2aWNlX3R5cGUsIE5VTEwpOworCWNmaV9zZW5k
X2dlbl9jbWQoMHhBQSwgMHg1NTU1LCBiYXNlLCBtYXAsIGNmaSwgY2ZpLT5kZXZpY2VfdHlwZSwg
TlVMTCk7CisJY2ZpX3NlbmRfZ2VuX2NtZCgweDU1LCAweDJBQUEsIGJhc2UsIG1hcCwgY2ZpLCBj
ZmktPmRldmljZV90eXBlLCBOVUxMKTsKKwljZmlfc2VuZF9nZW5fY21kKDB4OTgsIDB4NTU1NSwg
YmFzZSwgbWFwLCBjZmksIGNmaS0+ZGV2aWNlX3R5cGUsIE5VTEwpOworCWlmIChjZmlfcXJ5X3By
ZXNlbnQobWFwLCBiYXNlLCBjZmkpKQorCQlyZXR1cm4gMTsKIAkvKiBRUlkgbm90IGZvdW5kICov
CiAJcmV0dXJuIDA7CiB9Cg==
--001485f6d4840350f70478ff7fa8--
