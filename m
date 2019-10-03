Return-Path: <SRS0=mpCX=X4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01A7DC32792
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 06:36:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A06A421D81
	for <linux-mtd@archiver.kernel.org>; Thu,  3 Oct 2019 06:36:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SMdgitUu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A06A421D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubgJdqe1zRgsRyzI//AIHGMJcI4VuWMUFKkOr+n2e9E=; b=SMdgitUuyFPWYk
	SRvJ0izm9V9a1JQusNkpw8n7SJM0ZW7N6+F9d99CEAWSAybo3jCCrk7zjZI6mP149Sd3/dgbIvk4y
	0dp+iLlbMP4omW/wXkE4SU35k5vaLB0UNh1vaU6qizUvC/hYekCXnSl44hVjYQnvX2F/0WqfWq4WO
	CePAAFsRNDOEez/CNvkBKErvlXTe/Ue9m+E/vurI49KFMJF7ueHqewMSj4/SgqrcPxlMD6G5kqSJ/
	rvbZj87/YPn5gfLQ4Jmrc9EF7wRr24F2Q6auS+7Psd1I8XMUOgACMbmjS8JbnFo7xuegWYF4zZoB4
	q45FHAMusdTu+I9UiWOw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFuiX-0000Jf-MB; Thu, 03 Oct 2019 06:36:01 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFuiE-0008Ma-V8
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2019 06:35:44 +0000
Received: from methusalix.home.lespocky.de ([92.117.58.69]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1M7s1M-1iC2pQ1gxe-0051Ln; Thu, 03 Oct 2019 08:35:26 +0200
Received: from lemmy.home.lespocky.de ([192.168.243.176])
 by methusalix.home.lespocky.de with esmtpsa
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256) (Exim 4.92.3)
 (envelope-from <alex@home.lespocky.de>)
 id 1iFuhv-0002o9-4q; Thu, 03 Oct 2019 08:35:24 +0200
Received: (nullmailer pid 18482 invoked by uid 2001);
 Thu, 03 Oct 2019 06:35:20 -0000
From: Alexander Dahl <post@lespocky.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] ubihealthd: Add option -h/--help
Date: Thu,  3 Oct 2019 08:35:01 +0200
Message-Id: <20191003063501.18421-3-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191003063501.18421-1-post@lespocky.de>
References: <20191003063501.18421-1-post@lespocky.de>
MIME-Version: 1.0
X-Scan-Signature: 47e1ccf8997e9864e874f9390d09bff5
X-Provags-ID: V03:K1:vtnGE6H0BPAVnQ34U3JZLtvvNu/pTWBPAo1Qnrf/pdHAiAgFBg5
 rWQiT90QsjdkX63nPKm6326Tx98p41CmcPjy6o5cKJcVT5SD9n5BIkBIQKyT8/8V3oR/bfP
 pT2QL7ZQwxmCohnwdEdtCXj5JXGkpTXo8V4jyl/uu9Ps6F7r/RJn+AEEqdXhLBOfpAWgkIG
 qyzVo+bEivdW2XxYaEzcA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:HM/AHdpAXCM=:msfP8/0ZdpeobiQmQx8zj1
 Z8QrTIfermFsezURJ2Cs0eMTImSZOglnETUgPWO0pOWCv4uUKezYDdQzmH0cs3LE1Q/HQRgbB
 bn6bMoBNsmyxPOSkmVELLhYmXVxIgj/Vxiv4a6Wr/iXPTRyImCydk4rS5y3TR9BjwKS2Sh0CW
 I1bTfq1pgYiz0xRDh716BNvFy5vLrR1WYNc20cXrs63j591vWr0iZ6mxQGMfPRRskkFLcJY3q
 qSrq1ddX5E+Ba+7Fd1qMr700GnA/RI4SjinTfy4qqZb08e6GvkyT5LuqShdLuu0CwbnkfFZMo
 edlwRPHVrIsepZga5YpAKzUO8Z82astm2vm4hI1cXj0JZZZ0MJ2RmbfK1tAK+GOZ3xYrDrN58
 Ba4TpoXjB8jfqDvn1SSYRmBNWtY54oTzHVjWME2PGyg7pUZrTJ9/eh1R25ovqG5sxkKq/+V+D
 m1O5oyFo3BHpcIGkaTVh4ge9mbF1mbOEBhRWRld6XvtEFiYzliF3l9HCWspJLU0M0pyZYcohV
 sqsAL8tMZmlnaxswDXyqTBSU89L1ScWGpYe2qozews7gZ1dpfxBdUtyWIgqu97w6DjWhyNpBR
 oIDT7Hc8bwLKDOyrSv03GnvyV2W0tzUtN7WIzG0KbpmEokF4KqBCXE9lSJ7Jik69uuLxPlPMo
 AqFZZRDn42dQ9D2bX8ii1UZL2klKP7zLlN1mOXwBF+Nktz4sh2cHQEXLTgAl4p6iLes1FTO1z
 B2mdIIVxn+FVvawbLuoK5cFuZ6cVORecxMLMByUd8T6aNZ3MGQ55S9ju0n9KRi+IlQGSGmoXk
 /2ll1S8T504mEPLc0u3D6WK6iaPnyOHfWmpDQKUxEXRUHgXLTXG+j/YwrCqL0edf5sksqj5gf
 S8xfGrkGRl+3+gAbU13N8UE+GEXo76mvMKl8H68kY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191002_233543_291996_6D1FCBC3 
X-CRM114-Status: GOOD (  14.04  )
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VXNpbmcgJz8nIGFzIG9wdGlvbiBkaWQgbm90IHdvcmssIGFuZCB3b3VsZCBiZSBzdHJhbmdlIHRv
IHBhc3MgYW55d2F5LApiZWNhdXNlIGl0J3MgYSBnbG9iIGNoYXIgZm9yIHRoZSBzaGVsbCBhbmQg
eW91IHdvdWxkIGhhdmUgdG8gZXNjYXBlIGl0Cmxpa2UgLi91YmloZWFsdGhkIC1cPyDigKYgdXNl
IHRoZSBtb3JlIGNvbW1vbiAtaC8tLWhlbHAgaW5zdGVhZC4KCk5vdGU6IHRoaXMgZG9lcyBub3Qg
dG91Y2ggdGhlIG91dHB1dCwganVzdCBjaGFuZ2VzIHRoZSBvcHRpb25zIGl0c2VsZi4KClNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRlciBEYWhsIDxwb3N0QGxlc3BvY2t5LmRlPgotLS0KIHViaS11dGls
cy91YmloZWFsdGhkLmMgfCAxMCArKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3ViaS11dGlscy91YmloZWFsdGhk
LmMgYi91YmktdXRpbHMvdWJpaGVhbHRoZC5jCmluZGV4IGYzODIzNWIuLjI3Nzk5ZjcgMTAwNjQ0
Ci0tLSBhL3ViaS11dGlscy91YmloZWFsdGhkLmMKKysrIGIvdWJpLXV0aWxzL3ViaWhlYWx0aGQu
YwpAQCAtNDIsNyArNDIsNyBAQCBzdGF0aWMgaW50IHViaV9mZDsKIHN0YXRpYyBpbnQgaW50ZXJ2
YWxfc2VjcyA9IDEyMDsKIHN0YXRpYyBpbnQgbm9kYWVtb247CiAKLXN0YXRpYyBjb25zdCBjaGFy
IG9wdF9zdHJpbmdbXSA9ICJkOmk6ZiI7CitzdGF0aWMgY29uc3QgY2hhciBvcHRfc3RyaW5nW10g
PSAiZDppOmZoIjsKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb3B0aW9uIG9wdGlvbnNbXSA9IHsKICAg
ICAgICAgewogICAgICAgICAgICAgICAgIC5uYW1lID0gImRldmljZSIsCkBAIC01Niw2ICs1Niwx
MiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9wdGlvbiBvcHRpb25zW10gPSB7CiAgICAgICAgICAg
ICAgICAgLmZsYWcgPSBOVUxMLAogICAgICAgICAgICAgICAgIC52YWwgPSAnaScKICAgICAgICAg
fSwKKwl7CisJCS5uYW1lID0gImhlbHAiLAorCQkuaGFzX2FyZyA9IG5vX2FyZ3VtZW50LAorCQku
ZmxhZyA9IE5VTEwsCisJCS52YWwgPSAnaCcKKwl9LAogCXsgLyogc2VudGluZWwgKi8gfQogfTsK
IApAQCAtMjM4LDcgKzI0NCw3IEBAIGludCBtYWluIChpbnQgYXJnYywgY2hhciAqYXJndltdKQog
CQkJbm9kYWVtb24gPSAxOwogCQkJYnJlYWs7CiAJCX0KLQkJY2FzZSAnPyc6CisJCWNhc2UgJ2gn
OgogCQlkZWZhdWx0OgogCQkJZnByaW50ZihzdGRlcnIsICJVc2FnZTogJXMgWyAtZCBVQklfREVW
SUNFIF0gWy1pIElOVEVSVkFMX1NFQyBdIFsgLWYgXVxuIiwgYXJndlswXSk7CiAJCQlleGl0KDEp
OwotLSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
