Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9EAC38142
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Jan 2023 13:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WiDiMrZ4s9XCkzpAayJbJDdqow2YrwS5G3Tez5JmtNs=; b=S5f7defwwitJ1d
	fhzFpgQa/B+8ynqP5VB8dmHC7ejFsQeM1++fke4JuwqUiSbAMxrqe7p4oKLk8jevfGu+DPOU3txwc
	zpfCYuziPGNbFPibY+l5Y4ZPAaXMIGf+aGt/CJ0kXGzy8wiTNDmBvbetcgz79AvHaYZw5XPh70Rdd
	wthsfYLe8UCR9oONnH1fjyoIubZObfHAwG3ZOGPRL1Mu9YDUXnKPYhWYEs6eurIthaAB60f4b5Di7
	YBbrLzitHmbamAQd7D/FagvYgEgJdV3JbhBDHv4qTkBRaaYGkxa/iDE9qJJP279TIN8wgonE3qu8x
	LQSPch45k9xzAhv/LfPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLlTE-000EKz-16; Sat, 28 Jan 2023 13:42:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLlTA-000EKF-4Q
	for linux-mtd@lists.infradead.org; Sat, 28 Jan 2023 13:42:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA97460A50;
	Sat, 28 Jan 2023 13:42:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23AF3C433D2;
	Sat, 28 Jan 2023 13:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674913330;
	bh=6I5I/7bjs944s6bDe4yVwlDPDmtzxVuKXQzW/apfcac=;
	h=From:To:Cc:Subject:Date:From;
	b=lWkXZttz+aPqo7U49kY9njmRg/utaE1YXmsx+A4or7ZtXsMU+af1fRUEtQ1hrxRvq
	 sPg3ad2XszUuKzbokiAtImsXhe9e/cqLnFOY+5DgoeI7xrw23m8aa8Avmju4gjclK9
	 QOnMRP3Dq/EZrtIDVArWfMrk8u82NyLdGu3hP7dQ53Ss4HLIuF7E74hw94nCMkyKqi
	 rH/z5CETi4bvFnNWlHDhuDesjHuWAXEH2KhJsSavC+TMWENK+G5jaA0AAcGAhrVoVN
	 /utM8sF4WYWc/S10Xs3Zd3Zg/Pboorqr89JqgxWvica7SkcoXDX4REUFHNrGmcUhiQ
	 Eiwf1F/2lwb0A==
Received: by pali.im (Postfix)
	id 03420639; Sat, 28 Jan 2023 14:42:06 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org
Subject: [PATCH] mtd: rawnand: fsl_elbc: Propagate HW ECC settings to HW
Date: Sat, 28 Jan 2023 14:41:11 +0100
Message-Id: <20230128134111.32559-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230128_054212_255123_6EED895A 
X-CRM114-Status: GOOD (  16.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SXQgaXMgcG9zc2libGUgdGhhdCBjdXJyZW50IGNoaXAtPmVjYy5lbmdpbmVfdHlwZSB2YWx1ZSBk
b2VzIG5vdCBtYXRjaCB0bwpjb25maWd1cmVkIEhXIHZhbHVlIChpZiBIVyBFQ0MgY2hlY2tpbmcg
YW5kIGdlbmVyYXRpbmcgaXMgZW5hYmxlZCBvciBub3QpLgoKVGhpcyBjYW4gaGFwcGVuIHdpdGgg
b2xkIFUtQm9vdCBib290bG9hZGVyIHZlcnNpb24gd2hpY2ggZWl0aGVyIGRvZXMgbm90CmluaXRp
YWxpemUgTkFORCAoYW5kIGxldCBpdCBpbiBzb21lIGRlZmF1bHQgdW51c2FibGUgc3RhdGUpIG9y
IGluaXRpYWxpemUKTkFORCB3aXRoIGRpZmZlcmVudCBwYXJhbWV0ZXJzIHRoYW4gd2hhdCBpcyBz
cGVjaWZpZWQgaW4ga2VybmVsIERUUyBmaWxlLgoKU28gaWYga2VybmVsIGNob3NlIHRvIHVzZSBz
b21lIGNoaXAtPmVjYy5lbmdpbmVfdHlwZSBzZXR0aW5ncyAoZS5nLiBmcm9tCkRUUyBmaWxlKSB0
aGVuIGRvIG5vdCBkZXBlbmQgb24gYm9vdGxvYWRlciBIVyBjb25maWd1cmF0aW9uIGFuZCBjb25m
aWd1cmVzCkhXIEVDQyBzZXR0aW5ncyBhY2NvcmRpbmcgdG8gY2hpcC0+ZWNjLmVuZ2luZV90eXBl
IHZhbHVlLgoKQlJfREVDQyBtdXN0IGJlIHNldCB0byBCUl9ERUNDX0NIS19HRU4gd2hlbiBIVyBp
cyBkb2luZyBFQ0MgKGJvdGgKZ2VuZXJhdGluZyBhbmQgY2hlY2tpbmcpLCBvciB0byBCUl9ERUND
X09GRiB3aGVuIEhXIGlzIG5vdCBkb2luZyBFQ0MuCgpUaGlzIGNoYW5nZSBmaXhlcyB1c2FnZSBv
ZiBTVyBFQ0Mgc3VwcG9ydCBpbiBjYXNlIGJvb3Rsb2FkZXIgZXhwbGljaXRseQplbmFibGVkIEhX
IEVDQyBzdXBwb3J0IGFuZCBrZXJuZWwgRFRTIGZpbGUgaGFzIHNwZWNpZmllZCB0byB1c2UgU1cg
RUNDLgooT2YgY291cnNlIHRoaXMgd29ya3Mgb25seSBpbiBjYXNlIHdoZW4gTkFORCBpcyBub3Qg
YSBib290IGRldmljZSBhbmQgYm90aApib290bG9hZGVyIGFuZCBrZXJuZWwgYXJlIGxvYWRlZCBm
cm9tIGRpZmZlcmVudCBsb2NhdGlvbiwgZS5nLiBGTEFTSCBOT1IuKQoKRml4ZXM6IGY2NDI0YzIy
YWEzNiAoIm10ZDogcmF3bmFuZDogZnNsX2VsYmM6IE1ha2UgU1cgRUNDIHdvcmsiKQpTaWduZWQt
b2ZmLWJ5OiBQYWxpIFJvaMOhciA8cGFsaUBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvbXRkL25h
bmQvcmF3L2ZzbF9lbGJjX25hbmQuYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19u
YW5kLmMgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMKaW5kZXggYTE4ZDEy
MTM5NmFhLi5lMjUxMTllNThiNjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2Zz
bF9lbGJjX25hbmQuYworKysgYi9kcml2ZXJzL210ZC9uYW5kL3Jhdy9mc2xfZWxiY19uYW5kLmMK
QEAgLTcyNSw2ICs3MjUsNyBAQCBzdGF0aWMgaW50IGZzbF9lbGJjX2F0dGFjaF9jaGlwKHN0cnVj
dCBuYW5kX2NoaXAgKmNoaXApCiAJc3RydWN0IGZzbF9sYmNfY3RybCAqY3RybCA9IHByaXYtPmN0
cmw7CiAJc3RydWN0IGZzbF9sYmNfcmVncyBfX2lvbWVtICpsYmMgPSBjdHJsLT5yZWdzOwogCXVu
c2lnbmVkIGludCBhbDsKKwl1MzIgYnI7CiAKIAkvKgogCSAqIGlmIEVDQyB3YXMgbm90IGNob3Nl
biBpbiBEVCwgZGVjaWRlIHdoZXRoZXIgdG8gdXNlIEhXIG9yIFNXIEVDQyBmcm9tCkBAIC03NjQs
NiArNzY1LDEzIEBAIHN0YXRpYyBpbnQgZnNsX2VsYmNfYXR0YWNoX2NoaXAoc3RydWN0IG5hbmRf
Y2hpcCAqY2hpcCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAJfQogCisJLyogZW5hYmxlL2Rpc2FibGUg
SFcgRUNDIGNoZWNraW5nIGFuZCBnZW5lcmF0aW5nIGJhc2VkIG9uIGlmIEhXIEVDQyB3YXMgY2hv
c2VuICovCisJYnIgPSBpbl9iZTMyKCZsYmMtPmJhbmtbcHJpdi0+YmFua10uYnIpICYgfkJSX0RF
Q0M7CisJaWYgKGNoaXAtPmVjYy5lbmdpbmVfdHlwZSA9PSBOQU5EX0VDQ19FTkdJTkVfVFlQRV9P
Tl9IT1NUKQorCQlvdXRfYmUzMigmbGJjLT5iYW5rW3ByaXYtPmJhbmtdLmJyLCBiciB8IEJSX0RF
Q0NfQ0hLX0dFTik7CisJZWxzZQorCQlvdXRfYmUzMigmbGJjLT5iYW5rW3ByaXYtPmJhbmtdLmJy
LCBiciB8IEJSX0RFQ0NfT0ZGKTsKKwogCS8qIGNhbGN1bGF0ZSBGTVIgQWRkcmVzcyBMZW5ndGgg
ZmllbGQgKi8KIAlhbCA9IDA7CiAJaWYgKGNoaXAtPnBhZ2VtYXNrICYgMHhmZmZmMDAwMCkKLS0g
CjIuMjAuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
