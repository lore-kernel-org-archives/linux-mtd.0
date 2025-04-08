Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA297C369A4
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Apr 2025 08:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QrTGyPQsR+drM4juMRVVXRXFBhnL9OwO6GA2y+4cfsU=; b=ki7QGGzCSvzSdkg6BEKMnQ3yUG
	nYVF7kZ/LRnH3QrARC72MRaLJnWIERinuvkvEvfzG39BkGc3gWWE7m9GtfWJx+xUwdzWrsi7IEATX
	02y1alhtQrFCUo6FdHKy+bb+pYWDU0XXeoJPPXtz9P2oC3oHTvC1OCxK8IRMMJ3l6raTm/2sOlASR
	V3Uo0titRgOPrBtASdh8mh35vQmeuFBA+Jhkg88HdGiPPjlGt6lT088/GP07XdvQSz8S/+cX3ze4M
	YhsuzIS1eLJAEy+ag/BLCQyIeoV2HW7qaTgpDCy0HvHsYVi1f/HhQPhFCyY98Xj1zm6LPWBklIpY2
	ce1QnBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24O1-00000003GVW-3I3S;
	Tue, 08 Apr 2025 08:32:49 +0000
Received: from mailout.nod.at ([116.203.167.152] helo=lithops.sigma-star.at)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24NJ-00000003GMM-32ag
	for linux-mtd@lists.infradead.org;
	Tue, 08 Apr 2025 08:32:07 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4858429857F;
	Tue,  8 Apr 2025 10:32:00 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 1lnWBbfX9w58; Tue,  8 Apr 2025 10:31:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 6CD5D29858C;
	Tue,  8 Apr 2025 10:31:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id J3zOUV0J1bVT; Tue,  8 Apr 2025 10:31:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4EF8B29857F;
	Tue,  8 Apr 2025 10:31:59 +0200 (CEST)
Date: Tue, 8 Apr 2025 10:31:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: linux-mtd <linux-mtd@lists.infradead.org>, 
	Matthew Wilcox <willy@infradead.org>, 
	chengzhihao1 <chengzhihao1@huawei.com>, 
	regressions <regressions@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <1082087744.255264119.1744101119060.JavaMail.zimbra@nod.at>
In-Reply-To: <20250408082018.GA23886@francesco-nb>
References: <20250408082018.GA23886@francesco-nb>
Subject: Re: Linux 6.15-rc1 regression, folio/ubifs Oops
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF136 (Linux)/8.8.12_GA_3809)
Thread-Topic: Linux 6.15-rc1 regression, folio/ubifs Oops
Thread-Index: JAPy6KTdykUlw4jPDAxg3vJ2RwMacQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_013205_900895_04646408 
X-CRM114-Status: UNSURE (   4.72  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkZyYW5jZXNjbyBEb2xjaW5p
IiA8ZnJhbmNlc2NvQGRvbGNpbmkuaXQ+Cj4gQW46ICJyaWNoYXJkIiA8cmljaGFyZEBub2QuYXQ+
LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmluZnJhZGVhZC5vcmc+LCAiTWF0dGhldyBX
aWxjb3giIDx3aWxseUBpbmZyYWRlYWQub3JnPiwKPiAiY2hlbmd6aGloYW8xIiA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+Cj4gQ0M6ICJyZWdyZXNzaW9ucyIgPHJlZ3Jlc3Npb25zQGxpc3RzLmxp
bnV4LmRldj4sICJsaW51eC1rZXJuZWwiIDxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgo+
IEdlc2VuZGV0OiBEaWVuc3RhZywgOC4gQXByaWwgMjAyNSAxMDoyMDoxOAo+IEJldHJlZmY6IExp
bnV4IDYuMTUtcmMxIHJlZ3Jlc3Npb24sIGZvbGlvL3ViaWZzIE9vcHMKCj4gSGVsbG8gYWxsLAo+
IEkgZG8gaGF2ZSB0aGUgZm9sbG93aW5nIHJlZ3Jlc3Npb24gb24gc2luZ2xlIGNvcmUgc3lzdGVt
IHVzaW5nIFVCSUZTLAo+IGR1YWwgY29yZSBzZWVtcyBub3QgYWZmZWN0ZWQsIGFueSBpZGVhPwoK
SSdtIHN0aWxsIG1hc3NpdmVseSBiZWhpbmQgbXkgc2NoZWR1bGUsIGJ1dCBJJ2Qgc3VzcGVjdCBp
dCBoYXMgc29tZXRoaW5nIHRvIGRvIHdpdGgKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9w
cm9qZWN0L2xpbnV4LW10ZC9saXN0Lz9zZXJpZXM9NDQ4NDY2CgpUaGFua3MsCi8vcmljaGFyZAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
