Return-Path: <SRS0=jTzi=VC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DF1FC46499
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 14:27:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 670112133F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 14:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O+MhSupo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="u8TCdOLH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 670112133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pFu122dT+u2K1e7QFCfchHpmHSN7hXWojNxs09A5rCc=; b=O+MhSupokcbc1D
	0fahOmjjmSQ6HOXOtKgWdCKs+cHMXrWjOvsupBoqYM0dGKSKVWd8oXcSnojBmzRI6H5YFFSPLaVej
	1npU0JdHDP8xdrybhDJBdxbfUD71PQ6CH9qda1ZJnw7buKR6CeCAfax1K5J7q+GXaKX280eRgSL2b
	7vSC/xXATL91lThljY3OwjAHLNj0jPrsxcXZWtzA/U7fEPamJ53mMKxsCWYjASnR7oJWJDraEuKZd
	QDVXGWcjSRFoyrX3+Fj3J0gGss+H7FYiWQsB1/vvGrEaVqFHvg2AftgbBuQb5OZDyVonHMO3+LCpX
	qcEMOOMeuU/S6wQe3/Jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjPB4-0000fl-Qs; Fri, 05 Jul 2019 14:27:06 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjPB3-0000f6-Os
 for linux-mtd@bombadil.infradead.org; Fri, 05 Jul 2019 14:27:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vJyevZqwgwI8lOBYvN/4EvnyV4A6CWbEjGOv7gp7Ovs=; b=u8TCdOLHb1fLJYUEMR5IGjUoRz
 rbRpsE87zWY5n+9LJumS2vV8cvrvn1mv/BsUuCOjGZUn2LhNP2tpll+F1cxrXskDPiQSBQ0aqQ3Ev
 bHXyCCyQB3gM/bKGjecyZFyn6XqWsAIW6d/DBwff2Ql7me/e5xZ9QOT07fPalNNPIt/AqlBnzin9o
 EP0AJJI3TnY7/R3IbhipHjDNPK40JtQmND26Ke1pXG1KzS0OluaJpQgf8BRXY/Zs93FopN6upuukR
 xiN+nq3q0W4V9DgLHeeOPokBp6+XtcSfLcpmXgXFvy0kpf1nogtgun6wQ2WZUzyupDZS7mQD6lYwW
 dkvRqoBA==;
Received: from lithops.sigma-star.at ([195.201.40.130])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjM76-0005d7-Cq
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2019 11:10:50 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id CAA1B6089351;
 Fri,  5 Jul 2019 13:02:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id yZBS0NU-Tcjd; Fri,  5 Jul 2019 13:02:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id C57C46089339;
 Fri,  5 Jul 2019 13:02:36 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 5-_R_tkPqtN4; Fri,  5 Jul 2019 13:02:36 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 93528608898B;
 Fri,  5 Jul 2019 13:02:36 +0200 (CEST)
Date: Fri, 5 Jul 2019 13:02:36 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1328785502.28643.1562324556415.JavaMail.zimbra@nod.at>
In-Reply-To: <e97cc68c-c59a-1f5f-6580-40868bf16e90@cogentembedded.com>
References: <20190704222803.4328-1-colin.king@canonical.com>
 <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
 <4741f358-7c21-f721-e9fd-59d73876c62c@canonical.com>
 <e97cc68c-c59a-1f5f-6580-40868bf16e90@cogentembedded.com>
Subject: Re: [PATCH][next] ubifs: remove redundant assignment to pointer fname
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF60 (Linux)/8.8.12_GA_3809)
Thread-Topic: ubifs: remove redundant assignment to pointer fname
Thread-Index: k8dwB2k8+EY4AbsA12EzIID8bvM6yg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190705_121048_487948_05EF54BD 
X-CRM114-Status: UNSURE (   4.31  )
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
Cc: Artem Bityutskiy <dedekind1@gmail.com>, kernel-janitors@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Colin Ian King <colin.king@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIlNlcmdlaSBTaHR5bHlvdiIg
PHNlcmdlaS5zaHR5bHlvdkBjb2dlbnRlbWJlZGRlZC5jb20+Cj4gQW46ICJDb2xpbiBJYW4gS2lu
ZyIgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4sICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+
LCAiQXJ0ZW0gQml0eXV0c2tpeSIgPGRlZGVraW5kMUBnbWFpbC5jb20+LAo+ICJBZHJpYW4gSHVu
dGVyIiA8YWRyaWFuLmh1bnRlckBpbnRlbC5jb20+LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxp
c3RzLmluZnJhZGVhZC5vcmc+Cj4gQ0M6IGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmcs
ICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+IEdlc2VuZGV0
OiBGcmVpdGFnLCA1LiBKdWxpIDIwMTkgMTI6NTE6NTMKPiBCZXRyZWZmOiBSZTogW1BBVENIXVtu
ZXh0XSB1YmlmczogcmVtb3ZlIHJlZHVuZGFudCBhc3NpZ25tZW50IHRvIHBvaW50ZXIgZm5hbWUK
Cj4gT24gMDcvMDUvMjAxOSAxMTozMSBBTSwgQ29saW4gSWFuIEtpbmcgd3JvdGU6Cj4gCj4+Pj4g
RnJvbTogQ29saW4gSWFuIEtpbmcgPGNvbGluLmtpbmdAY2Fub25pY2FsLmNvbT4KPj4+Pgo+Pj4+
IFRoZSBwb2ludGVyIGZuYW1lIHJjIGlzIGJlaW5nIGFzc2lnbmVkIHdpdGggYSB2YWx1ZSB0aGF0
IGlzIG5ldmVyCj4+Pgo+Pj4gICAgcmM/Cj4+IAo+PiBPb3BzLCBjdXQnbidwYXN0ZSBlcnJvci4g
RG8geW91IHdhbnQgbWUgdG8gcmVzZW5kIHRvIGNhbiB0aGlzIGJlIGZpeGVkCj4+IHdoZW4gaXQn
cyBhcHBsaWVkPwo+IAo+ICAgVGhhdCdzIHRoZSBxdWVzdGlvbiB0byB0aGUgbWFpbnRhaW5lcnMu
Li4KClBsZWFzZSByZXNlbmQuCgpUaGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
