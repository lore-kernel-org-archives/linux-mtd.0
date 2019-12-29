Return-Path: <SRS0=kin+=2T=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8BAC2D0CE
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Dec 2019 18:37:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EBC520748
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Dec 2019 18:37:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SvvuBFVs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjFGQSfO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EBC520748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nenAD8OC51ZV5OLgVTUs5VDgUae+Ex5ph8T0QTsbfBY=; b=SvvuBFVsyqNVHn
	xPVE9jgShBzLvH/yFQMW8jXRf5dNQe6CUCIXZPu95Pc1ebVRTUf+02hTftXVqav0cfDA3nLKN+OLW
	4hmUXhCHIGrOgGbnbTQox41gSDqmR+gzB9WNknq+uoH30XakPXDGJDUDDovRWh5TzV5Z1DyDGcGm9
	udSpRLyn9gkw3CI3j54smu9GOkReqhHT4QXdJ/AT3NfhumdCuu0Dffv3FVjyWvG4A1rV+yjg6rj7K
	neYrP9Yjt5gQgBcHun0g9lCo3eVruUEnCRqDUgpeQIifK4mwXximBjImeXr8xlYcLDwoODAcvT4HG
	RKQU1+ZNBkWQ92+mvBdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ildQr-0001kc-79; Sun, 29 Dec 2019 18:36:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ildQP-0001Lc-Q7; Sun, 29 Dec 2019 18:36:27 +0000
Received: from localhost.localdomain (unknown [194.230.155.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B14820748;
 Sun, 29 Dec 2019 18:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1577644582;
 bh=czUisFJmY3fA8ZbN0nGTyeSLt61Fc6iQHasHh+W7A9s=;
 h=From:To:Cc:Subject:Date:From;
 b=OjFGQSfOacDRk3KxbOgA5t0fVE9LjnAFKB5NkdlF/9nppBfYnCELFHBJaz+4IHJLO
 RQtOn4nEMbEsM0lH3UgCE50zZDEZLtlyNHAe6t7KBYvC/ZpmJGTVvrrGKrY6HmxqTm
 c1leBBunL0FxfS4RhONrX0bAwo2xFf1DGxWIKnrw=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kyungmin Park <kyungmin.park@samsung.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] mtd: onenand: samsung: Fix pointer cast
 -Wpointer-to-int-cast warnings on 64 bit
Date: Sun, 29 Dec 2019 19:36:10 +0100
Message-Id: <20191229183612.22133-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_103625_870004_492D98B0 
X-CRM114-Status: GOOD (  10.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

aW9tZW0gcG9pbnRlcnMgc2hvdWxkIGJlIGNhc3RlZCB0byB1bnNpZ25lZCBsb25nIHRvIGF2b2lk
Ci1XcG9pbnRlci10by1pbnQtY2FzdCB3YXJuaW5ncyB3aGVuIGNvbXBpbGluZyBvbiA2NC1iaXQg
cGxhdGZvcm0gKGUuZy4Kd2l0aCBDT01QSUxFX1RFU1QpOgoKICAgIGRyaXZlcnMvbXRkL25hbmQv
b25lbmFuZC9zYW1zdW5nX210ZC5jOiBJbiBmdW5jdGlvbiDigJhzM2Nfb25lbmFuZF9yZWFkd+KA
mToKICAgIGRyaXZlcnMvbXRkL25hbmQvb25lbmFuZC9zYW1zdW5nX210ZC5jOjI1MTo2OiB3YXJu
aW5nOgogICAgICAgIGNhc3QgZnJvbSBwb2ludGVyIHRvIGludGVnZXIgb2YgZGlmZmVyZW50IHNp
emUgWy1XcG9pbnRlci10by1pbnQtY2FzdF0KICAgICAgaWYgKCh1bnNpZ25lZCBpbnQpIGFkZHIg
PCBPTkVOQU5EX0RBVEFSQU0gJiYgb25lbmFuZC0+Ym9vdHJhbV9jb21tYW5kKSB7CiAgICAgICAg
ICBeCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+
Ci0tLQogZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmdfbXRkLmMgfCA0ICsrLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmdfbXRkLmMgYi9kcml2ZXJzL210ZC9u
YW5kL29uZW5hbmQvc2Ftc3VuZ19tdGQuYwppbmRleCA1NWU1NTM2YTU4NTAuLjcwNTAxZDAzMWRi
NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmdfbXRkLmMKKysr
IGIvZHJpdmVycy9tdGQvbmFuZC9vbmVuYW5kL3NhbXN1bmdfbXRkLmMKQEAgLTI0OCw3ICsyNDgs
NyBAQCBzdGF0aWMgdW5zaWduZWQgc2hvcnQgczNjX29uZW5hbmRfcmVhZHcodm9pZCBfX2lvbWVt
ICphZGRyKQogCX0KIAogCS8qIEJvb3RSQU0gYWNjZXNzIGNvbnRyb2wgKi8KLQlpZiAoKHVuc2ln
bmVkIGludCkgYWRkciA8IE9ORU5BTkRfREFUQVJBTSAmJiBvbmVuYW5kLT5ib290cmFtX2NvbW1h
bmQpIHsKKwlpZiAoKHVuc2lnbmVkIGxvbmcpYWRkciA8IE9ORU5BTkRfREFUQVJBTSAmJiBvbmVu
YW5kLT5ib290cmFtX2NvbW1hbmQpIHsKIAkJaWYgKHdvcmRfYWRkciA9PSAwKQogCQkJcmV0dXJu
IHMzY19yZWFkX3JlZyhNQU5VRkFDVF9JRF9PRkZTRVQpOwogCQlpZiAod29yZF9hZGRyID09IDEp
CkBAIC0yODksNyArMjg5LDcgQEAgc3RhdGljIHZvaWQgczNjX29uZW5hbmRfd3JpdGV3KHVuc2ln
bmVkIHNob3J0IHZhbHVlLCB2b2lkIF9faW9tZW0gKmFkZHIpCiAJfQogCiAJLyogQm9vdFJBTSBh
Y2Nlc3MgY29udHJvbCAqLwotCWlmICgodW5zaWduZWQgaW50KWFkZHIgPCBPTkVOQU5EX0RBVEFS
QU0pIHsKKwlpZiAoKHVuc2lnbmVkIGxvbmcpYWRkciA8IE9ORU5BTkRfREFUQVJBTSkgewogCQlp
ZiAodmFsdWUgPT0gT05FTkFORF9DTURfUkVBRElEKSB7CiAJCQlvbmVuYW5kLT5ib290cmFtX2Nv
bW1hbmQgPSAxOwogCQkJcmV0dXJuOwotLSAKMi4xNy4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
