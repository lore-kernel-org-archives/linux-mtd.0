Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10613D5B854
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Oct 2024 00:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7nTM7lnTKbTr7QEPCpMxUSK3FFhTXuvrzsMAh9RNqEc=; b=vYS2FA8KoCXArxL7wPKoOnkFa0
	ydBy+Xcas/LVl9R2r19DmeKE4A/Wp0Z4yt1gEIqAaXOAI4ZTsMhUKm1YCMcSH/cp0Ogt5YtRjFcJZ
	n7B20KeNWWV1ccXQlsxylr4LxD2EQPjtMsJKboNmFOQkB0hiuU86qK8bXs7Prm/ebDXTR9eUkqRIf
	akPyeEgLKlBmwPBGFIcnHFwH9nzzknhdNQi0BAQdCkMTljEV4P4AE92GJmk0okFP3jeB4FgGCV4O/
	1LySfZJsuoxrkOiWuVZc7ho1QlviP0WEJCSd1HrUzAb7v2BNhMD2uWBFzrywg3lZmQLlKYvFJO1Gg
	RWau4WwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5aG5-0000000Cly6-3SLU;
	Tue, 29 Oct 2024 00:38:53 +0000
Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5aG2-0000000ClxS-266w
	for linux-mtd@lists.infradead.org;
	Tue, 29 Oct 2024 00:38:52 +0000
Received: from svr-chch-seg1.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id 4F17E2C0707;
	Tue, 29 Oct 2024 13:38:47 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
	s=mail181024; t=1730162327;
	bh=1TRrFEU/XYzXbAArtmSSYVFHq0PJWrAZw/PZ69nzIRg=;
	h=Date:From:Subject:To:Cc:From;
	b=w96pig3mG/5eekKbdvyYIJjYAO9Dkz4BeKrLBo2JyCQYgXS6u2qKn81MYGol6VPGs
	 d0NHhw6l6gUMjNuh9BJuSYuLi3IaDDogxKOmuWXYrVS/FMNqgg2TSrzr/xhRi0bj7P
	 G7OeBSh/C5CMazx14Y2S0Jt7c55RhBDQiOOXCZja7Gd59ysAsTDF1Uxw6h7oMmC2Vr
	 JQhIIRYOIonn38fcv6YhCEf9Y1w/gzTI0YOhMy6Wd0eNykV2VlaegdJk/oYh4uXcAs
	 TP2/K4fkmV1eOE8STBcHja2TuTK7zIogbrEeoF5do2HNeDfQdQplkTly9ufhl3GiWt
	 0HUQ+6XN3RmIw==
Received: from pat.atlnz.lc (Not Verified[10.32.16.33]) by svr-chch-seg1.atlnz.lc with Trustwave SEG (v8,2,6,11305)
	id <B67202e970000>; Tue, 29 Oct 2024 13:38:47 +1300
Received: from [10.33.22.30] (chrisp-dl.ws.atlnz.lc [10.33.22.30])
	by pat.atlnz.lc (Postfix) with ESMTP id 3FA9F13ED7B;
	Tue, 29 Oct 2024 13:38:47 +1300 (NZDT)
Message-ID: <826c4456-461c-424b-88de-a36e77fd7475@alliedtelesis.co.nz>
Date: Tue, 29 Oct 2024 13:38:47 +1300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: ubifs_recover_master_node: failed to recover master node
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Language: en-US
X-SEG-SpamProfiler-Analysis: v=2.4 cv=ca1xrWDM c=1 sm=1 tr=0 ts=67202e97 a=KLBiSEs5mFS1a/PbTCJxuA==:117 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=D-m8bwV1JRgZdnQgOdUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-SEG-SpamProfiler-Score: 0
x-atlnz-ls: pat
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_173851_043440_2B7408F9 
X-CRM114-Status: UNSURE (   7.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

KHJlc2VuZCBhcyBwbGFpbnRleHQpCgpIaSwKCkkgcmVjZW50bHkgYWRkZWQgc3VwcG9ydCBmb3Ig
dGhlIFNQSS1OQU5EIGNvbnRyb2xsZXIgb24gdGhlIFJUTDkzMDJDIApTb0NbMV0uIEkgZGlkIG1v
c3Qgb2YgdGhlIHdvcmsgYWdhaW5zdCBMaW51eCA2LjExIGFuZCBpdCdzIHdvcmtpbmcgZmluZSAK
dGhlcmUuIEkgcmVjZW50bHkgcmViYXNlZCBhZ2FpbnN0IHRoZSB0aXAgb2YgTGludXMncyB0cmVl
ICg2LjEyLXJjNSkgYW5kIApmb3VuZCBJIHdhcyBnZXR0aW5nIHViaWZzIGVycm9ycyB3aGVuIG1v
dW50aW5nOgoKW8KgwqDCoCAxLjI1NTE5MV0gc3BpLW5hbmQgc3BpMS4wOiBNYWNyb25peCBTUEkg
TkFORCB3YXMgZm91bmQuClvCoMKgwqAgMS4yNjEyODNdIHNwaS1uYW5kIHNwaTEuMDogMjU2IE1p
QiwgYmxvY2sgc2l6ZTogMTI4IEtpQiwgcGFnZSBzaXplOiAKMjA0OCwgT09CIHNpemU6IDY0ClvC
oMKgwqAgMS4yNzExMzRdIDIgZml4ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1U
RCBkZXZpY2Ugc3BpMS4wClvCoMKgwqAgMS4yNzgyNDddIENyZWF0aW5nIDIgTVREIHBhcnRpdGlv
bnMgb24gInNwaTEuMCI6ClvCoMKgwqAgMS4yODM2MzFdIDB4MDAwMDAwMDAwMDAwLTB4MDAwMDBm
MDAwMDAwIDogInVzZXIiClvCoMKgIDIwLjQ4MTEwOF0gMHgwMDAwMGYwMDAwMDAtMHgwMDAwMTAw
MDAwMDAgOiAiUmVzZXJ2ZWQiClvCoMKgIDcyLjI0MDM0N10gdWJpMDogc2Nhbm5pbmcgaXMgZmlu
aXNoZWQKW8KgwqAgNzIuMjcwNTc3XSB1YmkwOiBhdHRhY2hlZCBtdGQzIChuYW1lICJ1c2VyIiwg
c2l6ZSAyNDAgTWlCKQpbwqDCoCA3Mi4yNzY4MTVdIHViaTA6IFBFQiBzaXplOiAxMzEwNzIgYnl0
ZXMgKDEyOCBLaUIpLCBMRUIgc2l6ZTogMTI2OTc2IApieXRlcwpbwqDCoCA3Mi4yODQ1MzddIHVi
aTA6IG1pbi4vbWF4LiBJL08gdW5pdCBzaXplczogMjA0OC8yMDQ4LCBzdWItcGFnZSBzaXplIDIw
NDgKW8KgwqAgNzIuMjkyMTMyXSB1YmkwOiBWSUQgaGVhZGVyIG9mZnNldDogMjA0OCAoYWxpZ25l
ZCAyMDQ4KSwgZGF0YSAKb2Zmc2V0OiA0MDk2ClvCoMKgIDcyLjI5OTg4NV0gdWJpMDogZ29vZCBQ
RUJzOiAxOTIwLCBiYWQgUEVCczogMCwgY29ycnVwdGVkIFBFQnM6IDAKW8KgwqAgNzIuMzA2Njg5
XSB1YmkwOiB1c2VyIHZvbHVtZTogMSwgaW50ZXJuYWwgdm9sdW1lczogMSwgbWF4LiB2b2x1bWVz
IApjb3VudDogMTI4ClvCoMKgIDcyLjMxNDc0N10gdWJpMDogbWF4L21lYW4gZXJhc2UgY291bnRl
cjogMS8wLCBXTCB0aHJlc2hvbGQ6IDQwOTYsIAppbWFnZSBzZXF1ZW5jZSBudW1iZXI6IDI1MjY0
MjIzMApbwqDCoCA3Mi4zMjQ4NTBdIHViaTA6IGF2YWlsYWJsZSBQRUJzOiAwLCB0b3RhbCByZXNl
cnZlZCBQRUJzOiAxOTIwLCBQRUJzIApyZXNlcnZlZCBmb3IgYmFkIFBFQiBoYW5kbGluZzogNDAK
W8KgwqAgNzIuMzcwMTIzXSB1YmkwOiBiYWNrZ3JvdW5kIHRocmVhZCAidWJpX2JndDBkIiBzdGFy
dGVkLCBQSUQgMTQxClvCoMKgIDcyLjQ3MDc0MF0gVUJJRlMgKHViaTA6MCk6IE1vdW50aW5nIGlu
IHVuYXV0aGVudGljYXRlZCBtb2RlClvCoMKgIDcyLjQ5MDI0Nl0gVUJJRlMgKHViaTA6MCk6IGJh
Y2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiIHN0YXJ0ZWQsIApQSUQgMTQ0ClvCoMKgIDcy
LjUyODI3Ml0gVUJJRlMgZXJyb3IgKHViaTA6MCBwaWQgMTQzKTogdWJpZnNfcmVjb3Zlcl9tYXN0
ZXJfbm9kZTogCmZhaWxlZCB0byByZWNvdmVyIG1hc3RlciBub2RlClvCoMKgIDcyLjU1MDEyMl0g
VUJJRlMgKHViaTA6MCk6IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiIHN0b3BzClvC
oMKgIDcyLjcxMDcyMF0gVUJJRlMgKHViaTA6MCk6IE1vdW50aW5nIGluIHVuYXV0aGVudGljYXRl
ZCBtb2RlClvCoMKgIDcyLjcxNzQ0N10gVUJJRlMgKHViaTA6MCk6IGJhY2tncm91bmQgdGhyZWFk
ICJ1Ymlmc19iZ3QwXzAiIHN0YXJ0ZWQsIApQSUQgMTQ5ClvCoMKgIDcyLjc3NzYwMl0gVUJJRlMg
ZXJyb3IgKHViaTA6MCBwaWQgMTQ4KTogdWJpZnNfcmVjb3Zlcl9tYXN0ZXJfbm9kZTogCmZhaWxl
ZCB0byByZWNvdmVyIG1hc3RlciBub2RlClvCoMKgIDcyLjc4Nzc5Ml0gVUJJRlMgKHViaTA6MCk6
IGJhY2tncm91bmQgdGhyZWFkICJ1Ymlmc19iZ3QwXzAiIHN0b3BzCgpGdWxsIGRtZXNnIG91dHB1
dCBpcyBhdFsyXQoKZ2l0IGJpc2VjdCBsZWFkIG1lIHRvIGNvbW1pdCAxMTgxMzg1Nzg2NGYgKCJt
dGQ6IHNwaS1uYW5kOiBtYWNyb25peDogCkNvbnRpbnVvdXMgcmVhZCBzdXBwb3J0IikuIFJldmVy
dGluZyB0aGUgYmxhbWVkIGNvbW1pdCBmcm9tIDYuMTItcmM1IApzZWVtcyB0byBhdm9pZCB0aGUg
cHJvYmxlbS4gVGhlIGZsYXNoIGNoaXAgb24gbXkgYm9hcmQgaXMgYSAKTVgzMExGMkcyOEFELVRJ
LiBJJ20gbm90IHN1cmUgaWYgdGhlcmUgaXMgYSBwcm9ibGVtIHdpdGggMTE4MTM4NTc4NjRmIG9y
IAp3aXRoIG15IHNwaS1tZW0gZHJpdmVyIHRoYXQgaXMgZXhwb3NlZCBhZnRlciBzdXBwb3J0IGZv
ciBjb250aW51b3VzIHJlYWQgCmlzIGVuYWJsZWQuCgpUaGFua3MsCkNocmlzCgotLQoKWzFdIC0g
Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MTAxNTIyNTQzNC4zOTcwMzYwLTEtY2hy
aXMucGFja2hhbUBhbGxpZWR0ZWxlc2lzLmNvLm56LwpbMl0gLSAKaHR0cHM6Ly9naXN0LmdpdGh1
Yi5jb20vY3BhY2toYW0tYXRsbnovNjZhMDg0MzM2MmU4ZjhlYjJjNGY1YzdlZDAxYzVlZmUKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
