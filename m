Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5F2C433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:52:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35FB610D2
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 09:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35FB610D2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Ioj0+dn4g1JnVcQhSO+jwp9vrKLB81xKyhGPOlsCH4=; b=b2H/6rLI4yu2fISay57VF6z56O
	ixiP/FsrL7uckec9EffaoKXVQ54t7Olt0OGDxcqKi75bK47xTM77jpNI836sLmJlzZav/XPWYaei9
	3d4vTy3FJ8BnQDfMoQ41tcXMWa9u7oluDF2iey8I3LuPNp2KFSLNjtDiHHSIAdOqs8AhmLgKCt8ch
	RjI7qzd0btPF+oIjF8msDOX9gVVNxwDorO1E89SYkKGFA99RKUOCLqznCrjXKiHyIhJOya35xLnMf
	4GsK3p6wnEgpS4fdyGOa2Ikzz6zl53nb0p09wRbtnMLWkrg8PIGx6VuZXHqxJMViDOSdot3P2O709
	Tz22nnGg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSGTC-00CesS-CT; Fri, 02 Apr 2021 09:52:02 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSGT5-00Ceqp-1Y
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 09:51:57 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 1CD931C0002;
 Fri,  2 Apr 2021 09:51:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [RFC PATCH 00/16] mtd: rawnand: NV-DDR support
Date: Fri,  2 Apr 2021 11:51:29 +0200
Message-Id: <20210402095145.254867-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_105155_166067_3AE6DE58 
X-CRM114-Status: GOOD (  10.89  )
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

SGVsbG8sCgpBZnRlciBhbG1vc3QgMjAgeWVhcnMgb2YgZXhjbHVzaXZlIFNEUiBzdXBwb3J0IGlu
IHRoZSBMaW51eCBrZXJuZWwgYW5kCnRoYW5rcyB0byB0aGUgbWFqb3IgdXBkYXRlcyByZWNlbnRs
eSBkb25lIGluIHRoZSBOQU5EIHN1YnN5c3RlbSwgaGVyZSBpcwp0aGUgZmluYWwgc2VyaWVzIGF0
dGVtcHRpbmcgdG8gYnJpbmcgTlYtRERSIHN1cHBvcnQgdG8gcmF3IE5BTkQKZGV2aWNlcy4KCkFz
IGFsd2F5cywgZmlyc3QgcGF0Y2hlcyBhcmUgaGVyZSB0byBwcmVwYXJlIHRoZSBmaWVsZCBmb3Ig
dGhlIHNlY29uZApoYWxmIHdoaWNoIGFjdHVhbGx5IGJyaW5ncyBOVi1ERFIgc3VwcG9ydCBiaXRz
IHBlciBiaXRzIHRvIG1ha2UgaXQgbW9yZQpyZWFkYWJsZSBhbmQgZWFzaWVyIHRvIHJldmlldy4K
ClRoaXMgc2VyaWVzIGlzIG9ubHkgY29tcGlsZS10ZXN0ZWQgZm9yIG5vdywgYnV0IHNob3dzIHRo
ZSBwcmluY2lwbGVzIG9mCm15IGFwcHJvYWNoLiBDb21tZW50cyBhcmUgd2VsY29tZSEKCkNoZWVy
cywKTWlxdcOobAoKTWlxdWVsIFJheW5hbCAoMTYpOgogIG10ZDogcmF3bmFuZDogQWRkIGEgaGVs
cGVyIHRvIGNsYXJpZnkgdGhlIGludGVyZmFjZSBjb25maWd1cmF0aW9uCiAgbXRkOiByYXduYW5k
OiBhcmFzYW46IENoZWNrIHRoZSBwcm9wb3NlZCBkYXRhIGludGVyZmFjZSBpcyBzdXBwb3J0ZWQK
ICBtdGQ6IHJhd25hbmQ6IGF0bWVsOiBDaGVjayB0aGUgcHJvcG9zZWQgZGF0YSBpbnRlcmZhY2Ug
aXMgc3VwcG9ydGVkCiAgbXRkOiByYXduYW5kOiBvbmZpOiBVc2UgdGhlIEJJVCgpIG1hY3JvIHdo
ZW4gcG9zc2libGUKICBtdGQ6IHJhd25hbmQ6IFVwZGF0ZSBkZWFkIFVSTAogIG10ZDogcmF3bmFu
ZDogVXNlIG1vcmUgcmVjZW50IE9ORkkgc3BlY2lmaWNhdGlvbiB3b3JkaW5nCiAgbXRkOiByYXdu
YW5kOiBDbGFyaWZ5IHRoZSBOVi1ERFIgZW50cmllcyBpbiB0aGUgT05GSSBzdHJ1Y3R1cmUKICBt
dGQ6IHJhd25hbmQ6IEFkZCBOVi1ERFIgdGltaW5ncwogIG10ZDogcmF3bmFuZDogUmV0cmlldmUg
TlYtRERSIHRpbWluZyBtb2RlcyBmcm9tIHRoZSBPTkZJIHBhcmFtZXRlcgogICAgcGFnZQogIG10
ZDogcmF3bmFuZDogQWRkIGFuIGluZGlyZWN0aW9uIG9uIG9uZmlfZmlsbF9pbnRlcmZhY2VfY29u
ZmlnKCkKICBtdGQ6IHJhd25hbmQ6IEFkZCBvbmZpX2ZpbGxfbnZkZHJfaW50ZXJmYWNlX2NvbmZp
ZygpIGhlbHBlcgogIG10ZDogcmF3bmFuZDogQXZvaWQgYWNjZXNzaW5nIE5WLUREUiB0aW1pbmdz
IGZyb20gbGVnYWN5IGNvZGUKICBtdGQ6IHJhd25hbmQ6IEFjY2VzcyBTRFIgYW5kIE5WLUREUiB0
aW1pbmdzIHRocm91Z2ggYSBjb21tb24gbWFjcm8KICBtdGQ6IHJhd25hbmQ6IEFkZCBhIGhlbHBl
ciB0byBmaW5kIHRoZSBjbG9zZXN0IE9ORkkgTlYtRERSIG1vZGUKICBtdGQ6IHJhd25hbmQ6IENo
b29zZSB0aGUgYmVzdCB0aW1pbmdzLCBOVi1ERFIgaW5jbHVkZWQKICBtdGQ6IHJhd25hbmQ6IGFy
YXNhbjogU3VwcG9ydCBOVi1ERFIgaW50ZXJmYWNlCgogZHJpdmVycy9tdGQvbmFuZC9yYXcvYXJh
c2FuLW5hbmQtY29udHJvbGxlci5jIHwgIDI2ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9hdG1l
bC9uYW5kLWNvbnRyb2xsZXIuYyAgfCAgIDcgKy0KIC4uLi9tdGQvbmFuZC9yYXcvY2FkZW5jZS1u
YW5kLWNvbnRyb2xsZXIuYyAgICB8ICAgNiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZ3BtaS1u
YW5kL2dwbWktbmFuZC5oICAgIHwgICAyICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9pbnRlcm5h
bHMuaCAgICAgICAgICAgICAgfCAgIDUgKwogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFuZF9iYXNl
LmMgICAgICAgICAgICAgIHwgMjI4ICsrKysrKystLS0KIGRyaXZlcnMvbXRkL25hbmQvcmF3L25h
bmRfbGVnYWN5LmMgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFuZC9yYXcvbmFu
ZF9vbmZpLmMgICAgICAgICAgICAgIHwgICA1ICstCiBkcml2ZXJzL210ZC9uYW5kL3Jhdy9uYW5k
X3RpbWluZ3MuYyAgICAgICAgICAgfCA0MDIgKysrKysrKysrKysrKysrKy0tCiBpbmNsdWRlL2xp
bnV4L210ZC9vbmZpLmggICAgICAgICAgICAgICAgICAgICAgfCAgMzYgKy0KIGluY2x1ZGUvbGlu
dXgvbXRkL3Jhd25hbmQuaCAgICAgICAgICAgICAgICAgICB8IDE1NSArKysrKystCiAxMSBmaWxl
cyBjaGFuZ2VkLCA3NTcgaW5zZXJ0aW9ucygrKSwgMTE3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjcu
MAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
