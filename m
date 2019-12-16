Return-Path: <SRS0=uFxw=2G=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB3D0C43603
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 15:45:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 817BE206E0
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2019 15:45:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DcvYXreQ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b="xRtW8Ewo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 817BE206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aliyun.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0G9V+sFzPTTi71dSSy2N/QMQhetM9ZZwOaD56nq/pPQ=; b=DcvYXreQuAeY15
	taBb4WBsCgrrbZSTlpZDN5UUiYoNTfo5samIyFklpISjlc0kkaYi5WHj2tKYLr5b+Kwx6yemyp8DC
	MfX9sv1wJI5L+kT36DQVPPZoUNmvGvi5dLmC1eXdp2M/RIYFOh1StQBCaDzYuF7iQs/t+PVYj4sUU
	Oa4GOd32AzEjT1DHwN3NLmLewqo42xnK+PZfq+X4QmHt724oxr+pO8eI/F3PXp5RkWnPKYTbr/01l
	0iyNCX6IRaVjTFhW+pc4jwdT2U4zhkf2anyCxWIFgcFmxEHXZfGLbN0OdWC5euPhyMzc4zWWvbilm
	iYoj2/e7flSLCE1Iyr1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igsYe-0007cd-2Z; Mon, 16 Dec 2019 15:45:16 +0000
Received: from out30-17.freemail.mail.aliyun.com ([115.124.30.17])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igsYQ-0007Yq-5G
 for linux-mtd@lists.infradead.org; Mon, 16 Dec 2019 15:45:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
 t=1576511090; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 bh=6zAiWPSYL75zFYBJT4AkAkgM2IQQmMXGGWWfOe3zt7Y=;
 b=xRtW8Ewoda1gsmQ4SvHkLFN3QWf/abQpCeN59KiemTRXJ1TABdj8XmM0jXfN1RDondX0rn/3hyExzVoeU6rTr/sLqx7F2rGVHC3QOmsa4pq/8stUlx0Tr4AmeMveCMZ6pgt739ig4EOAdx05yjhjxreORsAcKWbWao96WMu6sA4=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1462385|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.149743-0.00979444-0.840462;
 DS=CONTINUE|ham_system_inform|0.0185772-0.00813876-0.973284;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01e07417; MF=fishland@aliyun.com; NM=1; PH=DS; RN=4;
 RT=4; SR=0; TI=SMTPD_---0Tl7Xe7K_1576511084; 
Received: from localhost.localdomain(mailfrom:fishland@aliyun.com
 fp:SMTPD_---0Tl7Xe7K_1576511084) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 16 Dec 2019 23:44:49 +0800
From: Liu Song <fishland@aliyun.com>
To: richard@nod.at
Subject: [PATCH] ubifs: Fix potentially out-of-bounds memory access in
 ubifs_dump_node
Date: Mon, 16 Dec 2019 23:44:41 +0800
Message-Id: <20191216154441.6648-1-fishland@aliyun.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_074506_443786_DDF84E66 
X-CRM114-Status: UNSURE (   9.35  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 liu.song11@zte.com.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

RnJvbTogTGl1IFNvbmcgPGxpdS5zb25nMTFAenRlLmNvbS5jbj4KCkluIOKAnHViaWZzX2NoZWNr
X25vZGXigJ0sIHdoZW4g4oCcbm9kZV9sZW4gKyBvZmZzPiBjLT4gbGViX3NpemXigJ0sIHRoZW4K
Z290byBsYWJlbCBvZiAib3V0X2xlbiIuIFRoZW4sIGluIHRoZSBmb2xsb3dpbmcgInViaWZzX2R1
bXBfbm9kZSIsCmlmIGlub2RlIHR5cGUgaXMgIlVCSUZTX0RBVEFfTk9ERSIsIGluICJwcmludF9o
ZXhfZHVtcCIsIGFuCm91dC1vZi1ib3VuZHMgYWNjZXNzIG1heSBvY2N1ciBkdWUgdG8gdGhlIHdy
b25nICJjaC0+bGVuIi4KV2UgZW5jb3VudGVyZWQgdGhpcyBwcm9ibGVtIGluIG91ciBlbnZpcm9u
bWVudC4gSWYgImNoLT4gbGVuIiBpcwp2ZXJ5IGxhcmdlLCBpdCBtYXkgZXZlbiBjYXVzZSB0aGUg
a2VybmVsIHRvIGNyYXNoLgoKVGhlcmUgYXJlIHRocmVlIHJlYXNvbnMgdG8gY2hvb3NlIHRvIHJl
bW92ZSAicHJpbnRfaGV4X2R1bXAiLgoxKSBBcyBtZW50aW9uZWQgZWFybGllciwgdGhlIGV4Y2Vw
dGlvbiAiY2gtPiBsZW4iIG1heSBjYXVzZSBhbgpleGNlcHRpb24gaW4gInByaW50X2hleF9kdW1w
IjsKMikgRGF0YSBub2RlcyBhcmUgb2Z0ZW4gbGFyZ2UuIFdoZW4gcHJpbnRpbmcgZGF0YSBjb250
ZW50IGluCiJwcmludF9oZXhfZHVtcCIsIGEgbGFyZ2UgYW1vdW50IG9mIG91dHB1dCB3aWxsIGJy
aW5nIGEgaGlnaCBsb2FkCm9uIHRoZSBzeXN0ZW0sIGFuZCBtYXkgZXZlbiBjYXVzZSBhIHdhdGNo
ZG9nIHJlc2V0OwozKSBFdmVuIGlmIHRoZXJlIGlzIGEgQ1JDIGNoZWNrIGVycm9yLCB0aGUgc3R1
ZmYgb2YgZmlsZSBpcyBkaWZmaWN1bHQKdG8gaWRlbnRpZnksIGFuZCBkaWZmaWN1bHQgdG8gZmlu
ZCB0aGUgcHJvYmxlbSBmcm9tIGEgbGFyZ2UgYW1vdW50IG9mCm91dHB1dC4gV2UgaGF2ZSBhbHJl
YWR5IG91dHB1dCB0aGUgTEVCIGFuZCBvZmZzZXQgb2YgdGhlIG5vZGUuIFNvIHdlCmNhbiB0YWtl
IHRoZSBpbml0aWF0aXZlIHRvIHZpZXcgdGhlIGRhdGEgb2YgaW50ZXJlc3QsIGluc3RlYWQgb2YK
cHJpbnRpbmcgaXQgZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBMaXUgU29uZyA8bGl1LnNvbmcx
MUB6dGUuY29tLmNuPgotLS0KIGZzL3ViaWZzL2RlYnVnLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5n
ZWQsIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvdWJpZnMvZGVidWcuYyBiL2ZzL3Vi
aWZzL2RlYnVnLmMKaW5kZXggMGY1YTQ4MGZlMjY0Li5lOWZjNmYwZGFlYzggMTAwNjQ0Ci0tLSBh
L2ZzL3ViaWZzL2RlYnVnLmMKKysrIGIvZnMvdWJpZnMvZGVidWcuYwpAQCAtNDc2LDkgKzQ3Niw2
IEBAIHZvaWQgdWJpZnNfZHVtcF9ub2RlKGNvbnN0IHN0cnVjdCB1Ymlmc19pbmZvICpjLCBjb25z
dCB2b2lkICpub2RlKQogCQlwcl9lcnIoIlx0Y29tcHJfdHlwICAgICAgJWRcbiIsCiAJCSAgICAg
ICAoaW50KWxlMTZfdG9fY3B1KGRuLT5jb21wcl90eXBlKSk7CiAJCXByX2VycigiXHRkYXRhIHNp
emUgICAgICAlZFxuIiwgZGxlbik7Ci0JCXByX2VycigiXHRkYXRhOlxuIik7Ci0JCXByaW50X2hl
eF9kdW1wKEtFUk5fRVJSLCAiXHQiLCBEVU1QX1BSRUZJWF9PRkZTRVQsIDMyLCAxLAotCQkJICAg
ICAgICh2b2lkICopJmRuLT5kYXRhLCBkbGVuLCAwKTsKIAkJYnJlYWs7CiAJfQogCWNhc2UgVUJJ
RlNfVFJVTl9OT0RFOgotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlz
dApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
