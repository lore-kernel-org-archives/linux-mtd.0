Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7EFCAC582
	for <linux-mtd@archiver.kernel.org>; Tue,  9 Sep 2025 19:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ux0gsYOs3rLL1BSGNe1/7n2A1EL0ZR4kwaphLSVwOwo=; b=nPDpzq2iQ8REqdK8k4GpgaMCfU
	A5z71VRptIx7VoB9w2lx9ufzo8H/Qwl1aMLjOz57x7zp2m3t92XWF15dDHWejHVw431tqzGCQLRey
	3RJzc1TqcqAQWNL8mN0K3s1nbnMSEu0shka51SmLKZpCTDr7ULAXTg/nFnsvY42gkXsAZcjDJz/kQ
	S7o50a92KYAf4jhoKAP4pnGjA4jk6QftOCc9tBGrOXzW3r9Sxda4KA0FiEp+EjDBMu19st7wDWWxg
	Mrm5cKxq9n77IWYvdag9FmcHkYBz+mUtVNnSi3t6q8PA9oHkFrhJf5gqRbbhQ9jEAwb0gZo5e2cPB
	383ZH7bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4MY-00000009o9i-2kNU;
	Tue, 09 Sep 2025 19:50:46 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw4MU-00000009o20-3M77
	for linux-mtd@lists.infradead.org;
	Tue, 09 Sep 2025 19:50:45 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 3C79D2E52E9;
	Tue,  9 Sep 2025 21:50:31 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IJOKrqkLy_x5; Tue,  9 Sep 2025 21:50:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id DF7D62E5308;
	Tue,  9 Sep 2025 21:50:30 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id rXMUa9oNKVkg; Tue,  9 Sep 2025 21:50:30 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B79F52E52E9;
	Tue,  9 Sep 2025 21:50:30 +0200 (CEST)
Date: Tue, 9 Sep 2025 21:50:30 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Rahul Kumar <rk0006818@gmail.com>
Cc: pratyush <pratyush@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-kernel-mentees <linux-kernel-mentees@lists.linux.dev>, 
	Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <589829523.18235.1757447430401.JavaMail.zimbra@nod.at>
In-Reply-To: <CAKY2RybqkE74EADTPnCUHAXpJLJmM9skPXQ6S3UOq8TK_y9EQA@mail.gmail.com>
References: <20250908070124.2647038-1-rk0006818@gmail.com> <87tt1djtot.fsf@bootlin.com> <93578759.11447.1757322260340.JavaMail.zimbra@nod.at> <mafs08qinn92v.fsf@kernel.org> <CAKY2RybqkE74EADTPnCUHAXpJLJmM9skPXQ6S3UOq8TK_y9EQA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: sm_ftl: replace strncpy with memcpy
Thread-Index: VA8ZEQcKf8WO20Yg9PP2GrFtA20LJQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_125042_982657_91EB10A0 
X-CRM114-Status: UNSURE (   6.17  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

UmFodWwsCgotLS0tLSBVcnNwcsO8bmdsaWNoZSBNYWlsIC0tLS0tCj4gVm9uOiAiUmFodWwgS3Vt
YXIiIDxyazAwMDY4MThAZ21haWwuY29tPgo+IFRoYW5rcyBhIGxvdCBmb3IgdGhlIGRldGFpbGVk
IGZlZWRiYWNrIG9uIG15IHBhdGNoLiBJIHVuZGVyc3RhbmQgbm93Cj4gdGhhdCB0aGlzIGNoYW5n
ZSBkb2VzIG5vdCBhZGQgbXVjaCB2YWx1ZSwgYW5kIEnigJlsbCBrZWVwIHlvdXIgcG9pbnRzIGlu
Cj4gbWluZCBmb3IgZnV0dXJlIGNvbnRyaWJ1dGlvbnMuIEkgcmVhbGx5IGFwcHJlY2lhdGUgdGhl
IGd1aWRhbmNlLgoKSSBob3BlIG15IGNvbW1lbnQgd2Fzbid0IHRvbyBkZW1vdGl2YXRpbmcuCllv
dSBhcmUgKnZlcnkqIHdlbGNvbWUgdG8gaW1wcm92ZSB0aGUgY29kZS4KT25lIG9mIHRoZSBtYWpv
ciBwcm9ibGVtcyBpbiBvcGVuLXNvdXJjZSBwcm9qZWN0cyBpcyB0aGF0CndlJ3JlIHNob3J0IG9u
IHJldmlldyBwb3dlci4gVGhhdCdzIHdoeSBzb21ldGltZXMgbWFpbnRhaW5lcnMgKGluY2x1ZGlu
ZyBtZSkKcmVhY3QgZ3J1bXBpbHkgd2hlbiBjb2RlIGlzIGNoYW5nZWQganVzdCBmb3IgdGhlIHNh
a2Ugb2YgY2hhbmdlLgoKVGhhbmtzLAovL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
