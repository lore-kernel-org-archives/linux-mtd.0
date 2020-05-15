Return-Path: <SRS0=xunr=65=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AACDC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 13:16:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 269AE20759
	for <linux-mtd@archiver.kernel.org>; Fri, 15 May 2020 13:16:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L21pZBy5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 269AE20759
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XOIsqdlHtcafF0CHavhZjgXbIgHmh5z4AIfL0dNr5Ss=; b=L21pZBy5yodcxG
	Xc9QftKiD+uB66YmZEiFhkbTR016z/7OSbd+8+39XX6ilBj2xI6FdFh0r4tuy/XKjEqnrouibuw2M
	5WIbozmoKDuQ7T2hTvdsOp+YUSoLSN5qsvBckPmdD3CE6hkO9SAp9hOJ7GFiePwKSvwKwdnohB7Ap
	o9IQV7uhGWgXF8Kn7d7vpbK9HRGV94Fp3U0vgToH6SgP1i01de7/dXBQQ6lPLGYY/cNYXbsWLbTFl
	ZvZcqiZfmLg23GNS+farQ5NKpUzP+NH+Xx5HkCEdvABZX+1zcwE823lO5BdXaOQs54qEqQiCiysBN
	qbH1U544UG8F6rfZJcGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZaCJ-0002wE-4I; Fri, 15 May 2020 13:16:19 +0000
Received: from mx1.emlix.com ([188.40.240.192])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZaCC-0002uF-Fa
 for linux-mtd@lists.infradead.org; Fri, 15 May 2020 13:16:17 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id CFEA35F8D7
 for <linux-mtd@lists.infradead.org>; Fri, 15 May 2020 15:16:08 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix build of jffs2reader and jffs2dump if zlib or lzo headers
 are not in default paths
Date: Fri, 15 May 2020 15:16:08 +0200
Message-ID: <2421145.rPmLg7YRcb@devpool35>
Organization: emlix GmbH
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200515_061612_680180_B7BFB682 
X-CRM114-Status: UNSURE (   5.53  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbSAxN2Y2NDA3ZjIyYjhmODc5ZTZiNzg4Y2I0ZTNhNjdkODU2YWJlMDJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBSb2xmIEVpa2UgQmVlciA8ZWJAZW1saXguY29tPgpEYXRlOiBG
cmksIDE1IE1heSAyMDIwIDE0OjU2OjQ4ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZml4IGJ1aWxk
IG9mIGpmZnMycmVhZGVyIGFuZCBqZmZzMmR1bXAgaWYgemxpYiBvciBsem8KIGhlYWRlcnMgYXJl
IG5vdCBpbiBkZWZhdWx0IHBhdGhzCgpTaWduZWQtb2ZmLWJ5OiBSb2xmIEVpa2UgQmVlciA8ZWJA
ZW1saXguY29tPgotLS0KIGpmZnNYLXV0aWxzL01ha2Vtb2R1bGUuYW0gfCAyICsrCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvamZmc1gtdXRpbHMvTWFrZW1v
ZHVsZS5hbSBiL2pmZnNYLXV0aWxzL01ha2Vtb2R1bGUuYW0KaW5kZXggZmIxODFkZS4uOWZkNzM0
YiAxMDA2NDQKLS0tIGEvamZmc1gtdXRpbHMvTWFrZW1vZHVsZS5hbQorKysgYi9qZmZzWC11dGls
cy9NYWtlbW9kdWxlLmFtCkBAIC0xMiw5ICsxMiwxMSBAQCBta2ZzX2pmZnMyX0NQUEZMQUdTID0g
JChBTV9DUFBGTEFHUykgJChaTElCX0NGTEFHUykgJChMWk9fQ0ZMQUdTKQogCiBqZmZzMnJlYWRl
cl9TT1VSQ0VTID0gamZmc1gtdXRpbHMvamZmczJyZWFkZXIuYwogamZmczJyZWFkZXJfTERBREQg
PSBsaWJtdGQuYSAkKFpMSUJfTElCUykgJChMWk9fTElCUykKK2pmZnMycmVhZGVyX0NQUEZMQUdT
ID0gJChBTV9DUFBGTEFHUykgJChaTElCX0NGTEFHUykgJChMWk9fQ0ZMQUdTKQogCiBqZmZzMmR1
bXBfU09VUkNFUyA9IGpmZnNYLXV0aWxzL2pmZnMyZHVtcC5jCiBqZmZzMmR1bXBfTERBREQgPSBs
aWJtdGQuYSAkKFpMSUJfTElCUykgJChMWk9fTElCUykKK2pmZnMyZHVtcF9DUFBGTEFHUyA9ICQo
QU1fQ1BQRkxBR1MpICQoWkxJQl9DRkxBR1MpICQoTFpPX0NGTEFHUykKIAogc3VtdG9vbF9TT1VS
Q0VTID0gamZmc1gtdXRpbHMvc3VtdG9vbC5jCiBzdW10b29sX0xEQUREID0gbGlibXRkLmEKLS0g
CjIuMjYuMgoKLS0gClJvbGYgRWlrZSBCZWVyLCBlbWxpeCBHbWJILCBodHRwOi8vd3d3LmVtbGl4
LmNvbQpGb24gKzQ5IDU1MSAzMDY2NC0wLCBGYXggKzQ5IDU1MSAzMDY2NC0xMQpHb3RoYWVyIFBs
YXR6IDMsIDM3MDgzIEfDtnR0aW5nZW4sIEdlcm1hbnkKU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBH
w7Z0dGluZ2VuLCBBbXRzZ2VyaWNodCBHw7Z0dGluZ2VuIEhSIEIgMzE2MApHZXNjaMOkZnRzZsO8
aHJ1bmc6IEhlaWtlIEpvcmRhbiwgRHIuIFV3ZSBLcmFja2Ug4oCTIFVzdC1JZE5yLjogREUgMjA1
IDE5OCAwNTUKCmVtbGl4IC0gc21hcnQgZW1iZWRkZWQgb3BlbiBzb3VyY2UKCgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
