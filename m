Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E697EC433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:40:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61EE4613D6
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 21:40:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61EE4613D6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e2P4CiDKrryxYWbcO5H+tdXdczG5t3UHyrp4vnI06Zw=; b=K/IJk/ZYaJH68sHV/cHxaQ/roi
	To+ZFz7dQjoA6a8RlQkMD7JDFR9XbjvQKDhNSD3HUXK1qemOv0Mo+roZ/qneYi6DnkrNQS/rbGwVt
	xQChGFp3zj2yLtGyEI5VnW9UucNfy8pHWJR3FcN2sg3PHWonkYaAaYu78Ji23N3uUT5QSbfh6bQCn
	b+TGfLVzj6Th0ROb827zb55EquvS30Uya5y8g/3DiVMDaBdZPYw7/vfPJYn7P9mBugarLANRTz+Zc
	26+Gzi+1d1k1565yX1vB/pm78/Fs9jMe96no8O7MVI2Qsh6c7re9E07vk1SCbs0SPjl+OC0FuZKPi
	Lj5rCNHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lePEI-002OuS-5Q; Wed, 05 May 2021 21:38:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDY-002Om9-86
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 21:38:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=gEwsnb+jlL+TIFMYv0VJV2EvaCYQI0wfrzxTcBddf1c=; b=g1Qnd41qfiaCOoQlaYg9oBe/0r
 AuoCkKhRpcH5/yoAZpl8/0G3I1LGyUirxHAgp/oJsi9OiMRteJdKA/d78yq0zjxNCLkf1mtZarzP7
 iOegmJO7krgvHzwuc/cWweXUiYfD+fDrjMau9Lp1HbNUpsw/jf2pvgBZYOLobd5HZTV93aWr5sfaw
 5jzAJ4VPxaAr2B8VH3sPj8PGdeIkZWCE8Unga01+GgfaXBGpU2ksp7EUN4LUcr9fImblcfqbv8frj
 G5Hal3oYv+P+Ugh1VohrBRxWMhuMsw9YpDOsGX8Q4ptk1k1+bqKXwRGJidstv5xpqdWJFVtg8hY9l
 Dk+L3Hig==;
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lePDU-005Ico-DB
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 21:38:03 +0000
X-Originating-IP: 90.89.138.59
Received: from xps13.stephanxp.local (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id EC0AD1BF206;
 Wed,  5 May 2021 21:37:50 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 00/22] mtd: rawnand: NV-DDR support
Date: Wed,  5 May 2021 23:37:28 +0200
Message-Id: <20210505213750.257417-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_143800_745969_E087347C 
X-CRM114-Status: GOOD (  15.15  )
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
CkZpbmFsbHksIHRoZSBBcmFzYW4gTkFORCBjb250cm9sbGVyIGRyaXZlciBpcyBiZWluZyB1cGRh
dGVkIHRvIHN1cHBvcnQgdGhlCk5WLUREUiBpbnRlcmZhY2UuIE9uIGEgMTZraUItcGFnZSBOQU5E
IGRldmljZSBoZXJlIGFyZSB0aGUgbWVhc3VyZWQgcmVzdWx0czoKKiBTRFIgbW9kZSA1OgogID4g
ODA5NCBraUIvcyByZWFkcwogID4gNzAxMyBraUIvcyB3cml0ZXMKKiBOVi1ERFIgbW9kZSA1Ogog
ID4gMTYwNjIga2lCL3MgcmVhZHMKICA+IDI0ODI0IGtpQi9zIHdyaXRlcwpIb3dldmVyLCB0aGVz
ZSB2YWx1ZXMgYXJlIG11Y2ggbG93ZXIgdGhhbiB3aGF0IHRoZSBjb250cm9sbGVyIGlzIGFibGUg
dG8gZG8KYmVjYXVzZSBvZiB0aGUgZmxha3kgZGVzaWduIG9mIHRoZSBBcmFzYW4gRUNDIGVuZ2lu
ZSB3aGljaCBuZWVkcyBhIGNvc3RseQpzb2Z0d2FyZSB3b3JrYXJvdW5kLiBXaGVuIHRoaXMgd29y
a2Fyb3VuZCBpcyBkaXNhYmxlZCwgdGhlIGJhcmUgdGhyb3VnaHB1dCwKc3RpbGwgd2l0aCBFQ0Mg
Y29ycmVjdGlvbiwgZXZlbiB0aG91Z2ggaXQgY2Fubm90IGJlIDEwMCUgdHJ1c3RlZCwgaXM6CiAg
PiAxMTM3Nzcga2lCL3MgcmVhZHMKICA+IDMxNzUxIGtpQi9zIHdyaXRlcwoKQ2hlZXJzLApNaXF1
w6hsCgpNaXF1ZWwgUmF5bmFsICgyMik6CiAgbXRkOiByYXduYW5kOiBBZGQgYSBoZWxwZXIgdG8g
Y2xhcmlmeSB0aGUgaW50ZXJmYWNlIGNvbmZpZ3VyYXRpb24KICBtdGQ6IHJhd25hbmQ6IGFyYXNh
bjogQ2hlY2sgdGhlIHByb3Bvc2VkIGRhdGEgaW50ZXJmYWNlIGlzIHN1cHBvcnRlZAogIG10ZDog
cmF3bmFuZDogYXRtZWw6IENoZWNrIHRoZSBwcm9wb3NlZCBkYXRhIGludGVyZmFjZSBpcyBzdXBw
b3J0ZWQKICBtdGQ6IHJhd25hbmQ6IG9uZmk6IFVzZSB0aGUgQklUKCkgbWFjcm8gd2hlbiBwb3Nz
aWJsZQogIG10ZDogcmF3bmFuZDogVXBkYXRlIGRlYWQgVVJMCiAgbXRkOiByYXduYW5kOiBVc2Ug
bW9yZSByZWNlbnQgT05GSSBzcGVjaWZpY2F0aW9uIHdvcmRpbmcKICBtdGQ6IHJhd25hbmQ6IENs
YXJpZnkgdGhlIE5WLUREUiBlbnRyaWVzIGluIHRoZSBPTkZJIHN0cnVjdHVyZQogIG10ZDogcmF3
bmFuZDogQWRkIE5WLUREUiB0aW1pbmdzCiAgbXRkOiByYXduYW5kOiBSZXRyaWV2ZSBOVi1ERFIg
dGltaW5nIG1vZGVzIGZyb20gdGhlIE9ORkkgcGFyYW1ldGVyCiAgICBwYWdlCiAgbXRkOiByYXdu
YW5kOiBBZGQgYW4gaW5kaXJlY3Rpb24gb24gb25maV9maWxsX2ludGVyZmFjZV9jb25maWcoKQog
IG10ZDogcmF3bmFuZDogQWRkIG9uZmlfZmlsbF9udmRkcl9pbnRlcmZhY2VfY29uZmlnKCkgaGVs
cGVyCiAgbXRkOiByYXduYW5kOiBBdm9pZCBhY2Nlc3NpbmcgTlYtRERSIHRpbWluZ3MgZnJvbSBs
ZWdhY3kgY29kZQogIG10ZDogcmF3bmFuZDogQWNjZXNzIFNEUiBhbmQgTlYtRERSIHRpbWluZ3Mg
dGhyb3VnaCBhIGNvbW1vbiBtYWNybwogIG10ZDogcmF3bmFuZDogSGFuZGxlIHRoZSBkb3VibGUg
Ynl0ZXMgaW4gTlYtRERSIG1vZGUKICBtdGQ6IHJhd25hbmQ6IEFkZCBhIGhlbHBlciB0byBmaW5k
IHRoZSBjbG9zZXN0IE9ORkkgTlYtRERSIG1vZGUKICBtdGQ6IHJhd25hbmQ6IFN1cHBvcnQgZW5h
YmxpbmcgTlYtRERSIHRocm91Z2ggU0VUX0ZFQVRVUkVTCiAgbXRkOiByYXduYW5kOiBBbGxvdyBT
RFIgdGltaW5ncyB0byBiZSBuYWNrZWQKICBtdGQ6IHJhd25hbmQ6IENob29zZSB0aGUgYmVzdCB0
aW1pbmdzLCBOVi1ERFIgaW5jbHVkZWQKICBNQUlOVEFJTkVSUzogQWRkIG15c2VsZiBhcyBjby1t
YWludGFpbmVyIG9mIHRoZSBBcmFzYW4gTkFORCBjb250cm9sbGVyCiAgICBkcml2ZXIKICBtdGQ6
IHJhd25hbmQ6IGFyYXNhbjogRml4IGEgbWFjcm8gcGFyYW1ldGVyCiAgbXRkOiByYXduYW5kOiBh
cmFzYW46IFdvcmthcm91bmQgYSBtaXNiZWhhdmluZyBwcm9nIHR5cGUgd2l0aCBOVi1ERFIKICBt
dGQ6IHJhd25hbmQ6IGFyYXNhbjogU3VwcG9ydCBOVi1ERFIgaW50ZXJmYWNlCgogTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsKIGRyaXZlcnMvbXRk
L25hbmQvcmF3L2FyYXNhbi1uYW5kLWNvbnRyb2xsZXIuYyB8ICA0NSArLQogZHJpdmVycy9tdGQv
bmFuZC9yYXcvYXRtZWwvbmFuZC1jb250cm9sbGVyLmMgIHwgICA3ICstCiAuLi4vbXRkL25hbmQv
cmF3L2NhZGVuY2UtbmFuZC1jb250cm9sbGVyLmMgICAgfCAgIDYgKy0KIGRyaXZlcnMvbXRkL25h
bmQvcmF3L2dwbWktbmFuZC9ncG1pLW5hbmQuaCAgICB8ICAgMiArLQogZHJpdmVycy9tdGQvbmFu
ZC9yYXcvaW50ZXJuYWxzLmggICAgICAgICAgICAgIHwgICA1ICsKIGRyaXZlcnMvbXRkL25hbmQv
cmF3L25hbmRfYmFzZS5jICAgICAgICAgICAgICB8IDMyNSArKysrKysrKysrLS0tLQogZHJpdmVy
cy9tdGQvbmFuZC9yYXcvbmFuZF9sZWdhY3kuYyAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJz
L210ZC9uYW5kL3Jhdy9uYW5kX29uZmkuYyAgICAgICAgICAgICAgfCAgIDUgKy0KIGRyaXZlcnMv
bXRkL25hbmQvcmF3L25hbmRfdGltaW5ncy5jICAgICAgICAgICB8IDQwMiArKysrKysrKysrKysr
KysrLS0KIGluY2x1ZGUvbGludXgvbXRkL29uZmkuaCAgICAgICAgICAgICAgICAgICAgICB8ICA0
MCArLQogaW5jbHVkZS9saW51eC9tdGQvcmF3bmFuZC5oICAgICAgICAgICAgICAgICAgIHwgMTU1
ICsrKysrKy0KIDEyIGZpbGVzIGNoYW5nZWQsIDg2MiBpbnNlcnRpb25zKCspLCAxMzMgZGVsZXRp
b25zKC0pCgotLSAKMi4yNy4wCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
