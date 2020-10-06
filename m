Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9ECC4727E
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 09:20:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B21020866
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 09:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XcZlKkav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B21020866
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0BVrKtEt7cWqDkCLKgW3tKnV2gZWYoAOgFl7a/JJywo=; b=XcZlKkav73LVAD+fnmItzB6DLs
	ulk/zTYfvoDUvWOf+mtq/B/d5qLiwV46jgaSuFKZ/u4SWnn3s4L1RAe7PAk3JpXr3ZJDmN25cWn20
	zsppvM0MRqcjy1l5Xru6zVdl+m7mve1kc1D28frJQ5Z/oMmCMUzTJazvFSh6XaBBUGebnbhRhxpyg
	3f3yvCvaYMPCkbGT5sD8HeMpihBW+FTnNNhyG6cgoGJOcvipIwvdVv90w0Dm5qP0M5bJSd9IfTUNi
	Nf5ZMm2KdIv2NRj90eYb+/OQz+nYH4DMpo4oAOp6ACckZbnftC7kRWPlYSg/7DtuQ0BBCZtr34rBG
	0ai7I3Ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPj8X-0005LI-4X; Tue, 06 Oct 2020 09:19:57 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPj8U-0005KS-RM
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 09:19:55 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kPj8L-00037V-L4; Tue, 06 Oct 2020 11:19:45 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kPj8J-0007Rv-Sg; Tue, 06 Oct 2020 11:19:43 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH mtd-utils RFC] Add an ubifs mount helper
Date: Tue,  6 Oct 2020 11:19:13 +0200
Message-Id: <20201006091912.1139071-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_051954_887477_872A1D9E 
X-CRM114-Status: GOOD (  22.19  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 entwicklung@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhpcyBhYnN0cmFjdHMgYXdheSBhdHRhY2hpbmcgb2YgdGhlIHJpZ2h0IHViaSBhbmQgdGhlbiBz
ZWxlY3RpbmcgdGhlIHJpZ2h0CnViaSBkZXZpY2UgYW5kIHZvbHVtZSB0byBtb3VudC4KCkFzIGRl
c2NyaWJlZCBpbiB0aGUgY29tbWVudCBhdCB0aGUgdG9wIHRoaXMgYWxsb3dzIHRvIG1vdW50IHVi
aWZzIHZvbHVtZXMKZGlyZWN0bHkgZnJvbSAvZXRjL2ZzdGFiIHdpdGhvdXQgaGF2aW5nIHRvIHVz
ZSBoYXJkY29kZWQgbnVtYmVycyAod2hpY2gKZGVwZW5kIG9uIG1vdW50IG9yZGVyIGFuZCBzbyBh
cmUgdW5yZWxpYWJsZSkgYW5kIGV4dHJhIG1hZ2ljIHRvIGNhcmUgZm9yCmF0dGFjaGluZy4KClNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+Ci0tLQpIZWxsbywKCnRoaXMgaXMgYSBuaWNlIHNjcmlwdCB0aGF0IGhlbHBzIGF0dGFj
aGluZyB1YmlzIGFuZCBtb3VudGluZyB1YmlmcycuIEkKYWxyZWFkeSBkaXNjdXNzZWQgdGhpcyBh
IGJpdCB3aXRoIFJpY2hhcmQgb24gaXJjIGFuZCB0aGUgaWRlYSB3YXMKd2VsY29tZSBpbiBwcmlu
Y2lwbGUuCgpBIGNvbmNlcm4gd2FzIHRoYXQgdGhlIGVudHJ5IGluIC9ldGMvZnN0YWIgaXMgdG9v
IG1hZ2ljIGFuZCB0aGVyZSBzaG91bGQKYmUgYW4gaW5kaWNhdGlvbiB0aGF0IHRoaXMgcmVsaWVz
IG9uIHRoZSBtb3VudCBoZWxwZXIuIFNvbWV0aGluZyBsaWtlCnVzaW5nIHViaWZzLmF1dG9hdHRh
Y2ggYXMgZmlsZSBzeXN0ZW0gdHlwZSAoZnNfdmZzdHlwZSkgb3IgcmVxdWlyaW5nCiJhdXRvYXR0
YWNoIiBpbiB0aGUgZm91cnRoIGZpZWxkIChmc19tbnRvcHMpLgoKSGF2aW5nIHRob3VnaHQgYSBi
aXQgSSdtIG5vdCBjb252aW5jZWQgd2UgbmVlZCB0aGlzIGluZGljYXRpb24uIFllcwp0aGVyZSBp
cyBtYWdpYyBidXQgbm90aGluZyBvdXQgb2YgdGhlIG9yZGluYXJ5IGFzIG1vdW50IGhlbHBlcnMg
YXJlIGEKa25vd24gY29uY2VwdCBhbmQgdGhlIGZzX3NwZWMgYWxyZWFkeSBsb29rcyBpbnRlcmVz
dGluZyBlbm91Z2ggdG8gbWFrZQppdCBvYnZpb3VzIHRoZXJlIGlzIHNvbWV0aGluZyBnb2luZyBv
bi4gQW5kIG9uY2UgcGVvcGxlIGFyZSB1c2VkIHRvIHRoZQptYWdpYyBpdCBpcyBhbm5veWluZyB0
byBoYXZlIHRvIGFsd2F5cyB3cml0ZSB0aGlzIGluZGljYXRpb24gaW4geW91cgpmc3RhYi4gQWRk
aXRpb25hbGx5IGl0IGNvbXBsaWNhdGVzIHRoZSBpbXBsZW1lbnRhdGlvbi4gCgpBbHNvICJhdXRv
YXR0YWNoIiBkb2Vzbid0IGNvbXBsZXRlbHkgY292ZXIgdGhlIHNjcmlwdCBhcyBpdCBkb2VzIGEK
dHJhbnNsYXRpb24gZnJvbSBtdGQgbmFtZSB0byBtdGQgbnVtYmVyLCB0b28uICJhdXRvYXR0YWNo
LG10ZHRyYW5zbGF0ZSIKc2VlbXMgYSBiaXQgZXhjZXNzaXZlLgoKQmVzdCByZWdhcmRzClV3ZQoK
IHViaWZzLXV0aWxzL01ha2Vtb2R1bGUuYW0gfCAgIDIgKwogdWJpZnMtdXRpbHMvbW91bnQudWJp
ZnMgICB8IDEwMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAxMDMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNzU1IHViaWZzLXV0
aWxzL21vdW50LnViaWZzCgpkaWZmIC0tZ2l0IGEvdWJpZnMtdXRpbHMvTWFrZW1vZHVsZS5hbSBi
L3ViaWZzLXV0aWxzL01ha2Vtb2R1bGUuYW0KaW5kZXggNTkxMDljY2Q2MTNjLi41YzVkOTlmNzU3
MmIgMTAwNjQ0Ci0tLSBhL3ViaWZzLXV0aWxzL01ha2Vtb2R1bGUuYW0KKysrIGIvdWJpZnMtdXRp
bHMvTWFrZW1vZHVsZS5hbQpAQCAtNDcsNCArNDcsNiBAQCBVQklGU19FWFRSQSA9IFwKIAogRVhU
UkFfRElTVCArPSAkKFVCSUZTX0hFQURFUikgJChVQklGU19FWFRSQSkKIAorZGlzdF9zYmluX1ND
UklQVFMgPSB1Ymlmcy11dGlscy9tb3VudC51YmlmcworCiBzYmluX1BST0dSQU1TICs9ICQoVUJJ
RlNfQklOUykKZGlmZiAtLWdpdCBhL3ViaWZzLXV0aWxzL21vdW50LnViaWZzIGIvdWJpZnMtdXRp
bHMvbW91bnQudWJpZnMKbmV3IGZpbGUgbW9kZSAxMDA3NTUKaW5kZXggMDAwMDAwMDAwMDAwLi5i
OTRkZGM1NjQ5ZjQKLS0tIC9kZXYvbnVsbAorKysgYi91Ymlmcy11dGlscy9tb3VudC51YmlmcwpA
QCAtMCwwICsxLDEwMSBAQAorIyEvYmluL3NoCisKKyMgVGhpcyBzY3JpcHQgc2hvdWxkIGJlIGlu
c3RhbGxlZCBhcyAvc2Jpbi9tb3VudC51Ymlmcy4gVGhlIGJlbmVmaXQgaXMgdGhhdCBhbgorIyBm
c3RhYiBlbnRyeSBsaWtlOgorIworIyAJbXRkPW10ZGRldjpob21lICAgICAvaG9tZSAgICAgICAg
dWJpZnMgICBkZWZhdWx0cyAwIDAKKyMKKyMgcmVzdWx0cyBpbiB0aGUgdWJpIGNvbnRhaW5lZCBp
biB0aGUgbXRkIG5hbWVkICJtdGRkZXYiIHRvIGJlIGF0dGFjaGVkIChpZiBub3QKKyMgYWxyZWFk
eSBkb25lKSBhbmQgdGhlbiB0aGUgdm9sdW1lIG5hbWVkICJob21lIiBiZWluZyBtb3VudGVkIHRv
IC9ob21lLgorCisjIFRoaXMgaXMgY2FsbGVkIGJ5IG1vdW50IHdpdGggdGhlIGZvbGxvd2luZyBv
cHRpb25zOgorIyAvc2Jpbi9tb3VudC51YmlmcyBzcGVjIGRpciBbLXNmbnZdIFstTiBuYW1lc3Bh
Y2VdIFstbyBvcHRpb25zXSBbLXQgdHlwZS5zdWJ0eXBlXQorCitzcGVjPSIkMSIKK3NoaWZ0CisK
K210ZG5hbWUybnVtKCkgeworCWxvY2FsIG5hbWUKKworCW5hbWU9IiQxIgorCisJZm9yIGQgaW4g
JChmaW5kIC9zeXMvY2xhc3MvbXRkLyAtcmVnZXggJy4qL210ZFswLTldKicpOyBkbworCQljYXNl
ICIkZCIgaW4KKwkJCSpybykKKwkJCQljb250aW51ZQorCQkJCTs7CisJCWVzYWMKKworCQlpZiB0
ZXN0ICIkbmFtZSIgPSAiJChjYXQgIiRkL25hbWUiKSI7IHRoZW4KKwkJCWxvY2FsIGRldiBtdGRu
dW0KKworCQkJZGV2PSIkKGJhc2VuYW1lICIkZCIpIgorCQkJbXRkbnVtPSIke2RldiNtdGR9Igor
CQkJZWNobyAiJG10ZG51bSIKKwkJCXJldHVybgorCQlmaQorCWRvbmUKKworCXJldHVybiAxCit9
CisKK210ZG51bTJ1YmkoKSB7CisJbG9jYWwgbXRkbnVtCisKKwltdGRudW09IiQxIgorCisJZm9y
IGQgaW4gJChmaW5kIC9zeXMvY2xhc3MvdWJpLyAtcmVnZXggJy4qL3ViaVswLTldKicpOyBkbwor
CQljYXNlICIkZCIgaW4KKwkJCSpfWzAtOV0qKQorCQkJCWNvbnRpbnVlCisJCQkJOzsKKwkJZXNh
YworCisJCWlmIHRlc3QgIiRtdGRudW0iID0gIiQoY2F0ICIkZC9tdGRfbnVtIikiOyB0aGVuCisJ
CQlsb2NhbCB1YmkKKworCQkJdWJpPSIkKGJhc2VuYW1lICIkZCIpIgorCQkJZWNobyAiJHViaSIK
KwkJCXJldHVybjsKKwkJZmkKKwlkb25lCisKKwlyZXR1cm4gMQorfQorCittdGRudW0ydWJpX2F1
dG9hdHRhY2goKSB7CisJbG9jYWwgbXRkbnVtIHViaQorCisJbXRkbnVtPSIkMSIKKworCXViaT0i
JChtdGRudW0ydWJpICIkbXRkbnVtIikiICYmIHsgZWNobyAiJHViaSI7IHJldHVybjsgfQorCisJ
IyB1YmlhdHRhY2ggbWlnaHQgZmFpbCB3aXRoICJtdGRYIGlzIGFscmVhZHkgYXR0YWNoZWQgdG8g
dWJpWSIgaWYgdGhlcmUKKwkjIGlzIG1vcmUgdGhhbiBvbmUgbW91bnQgdG8gZG8gaW4gdGhlIHNh
bWUgbXRkIHBhcnRpdGlvbi4gU28gaWdub3JlIGVycm9ycy4KKwl1YmlhdHRhY2ggLW0gIiRtdGRu
dW0iID4mMiB8fCB0cnVlCisKKwltdGRudW0ydWJpICIkbXRkbnVtIgorfQorCitjYXNlICIkc3Bl
YyIgaW4KKwltdGQ9KjoqKQorCQlzcGVjPSIke3NwZWMjbXRkPX0iCisJCW10ZD0iJHtzcGVjJToq
fSIKKwkJcnNwZWM9IiR7c3BlYyMqOn0iCisKKwkJbXRkbnVtPSIkKG10ZG5hbWUybnVtICIkbXRk
IikiIHx8IHsKKwkJCWVjaG8gIkZhaWxlZCB0byBmaW5kIG10ZG51bSBmb3IgbXRkIFwiJG10ZFwi
IgorCQkJZXhpdCAxCisJCX0KKworCQl1Ymk9IiQobXRkbnVtMnViaV9hdXRvYXR0YWNoICIkbXRk
bnVtIikiIHx8IHsKKwkJCWVjaG8gIkZhaWxlZCB0byBmaW5kIHViaSBmb3IgbXRkIFwiJG10ZFwi
IgorCQkJZXhpdCAxCisJCX0KKworCQlzcGVjPSIkdWJpOiRyc3BlYyIKKworCQk7OworZXNhYwor
CisvYmluL21vdW50IC1pIC10IHViaWZzICIkc3BlYyIgIiRAIgotLSAKMi4yOC4wCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
