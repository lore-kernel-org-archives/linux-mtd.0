Return-Path: <SRS0=HCZ/=BK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7EBC433E0
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2020 11:59:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6000122B40
	for <linux-mtd@archiver.kernel.org>; Fri, 31 Jul 2020 11:59:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CF2osDbV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6000122B40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emlix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XOIsqdlHtcafF0CHavhZjgXbIgHmh5z4AIfL0dNr5Ss=; b=CF2osDbVmHTUZ6SmEamDxzDGgr
	fnFlkPydWKijmFsoCtwNB4yf8s4tVzW3T9CzGhvPW+tbW86ClDLjtv9P+/2dsxdWbv6CNshN7xVY1
	rsYVEcMrEuNYqxhgC/00fr8M8O7SjWdkhaYruFc+V1bXyS/1ZYUCTUe98MPOAIsQcxDlo6D7pF+Ui
	SbEdru0BPCCqjIrNJZvLizpbugG99PJyy79Zsk72qJgyoQis5eroPUQgnkK36b6EFVKf8yZZ3xwtV
	54sHbMurXB7XXtZ8zr6sQU2Z6d/wa2+Ay4Gr1ZQ6PxoaP4i9kCXYRhnZqsLOlFFsjqCXkymYmsNOW
	G2+ALB5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Tfm-0000yU-ER; Fri, 31 Jul 2020 11:58:02 +0000
Received: from mx1.emlix.com ([188.40.240.192])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Tff-0000xq-Hp
 for linux-mtd@lists.infradead.org; Fri, 31 Jul 2020 11:57:56 +0000
Received: from mailer.emlix.com (p5098be52.dip0.t-ipconnect.de [80.152.190.82])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.emlix.com (Postfix) with ESMTPS id 4E260600EF
 for <linux-mtd@lists.infradead.org>; Fri, 31 Jul 2020 13:57:53 +0200 (CEST)
From: Rolf Eike Beer <eb@emlix.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] fix build of jffs2reader and jffs2dump if zlib or lzo headers
 are not in default paths
Date: Fri, 31 Jul 2020 13:57:53 +0200
Message-ID: <4173430.oBoMjFJ7W7@devpool35>
Organization: emlix GmbH
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_075755_758964_392361B4 
X-CRM114-Status: UNSURE (   7.83  )
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
