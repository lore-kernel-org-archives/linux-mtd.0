Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3025DC3ABDD
	for <linux-mtd@archiver.kernel.org>; Fri, 16 May 2025 08:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4mYcPCYS76kPZ3QsCEnDOR6X6ukPPybdTr6yAIl/pgI=; b=L10b6r7qkfxv9D
	1xMgHnzstG7rDSHY4aVNLZsSHmVbpKZaqfPD6dXeSwK+kOUH5GvZ0on2BgdmQ7kh3vmgv+2W7lar7
	mPq1lBApLpU3c02XCxqnQNYQcQs1IgYZZBFwAMo3LAHtGS3y+1/phini67F03jf3KTj1C4IZRqWew
	NhscgHY9JA7b8TwxER6BQ042eDK7TC/McNbDvbQVJhlOXHW0oBN6gHWkw6kp8h3Vw9CMwLsVpF4n/
	cIpVqRpXjfRHABzz6Bi23iUkl8SkoO/OKh0BMI+H2hFuPsbgRVeeKA1L145JoJGRmG5QC5do93OHE
	PRf7fo4AvWSqHNeqEvDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqCJ-00000002lSv-2YxF;
	Fri, 16 May 2025 08:13:39 +0000
Received: from mail.genbiz.pl ([94.177.225.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFq9H-00000002koU-2KfE
	for linux-mtd@lists.infradead.org;
	Fri, 16 May 2025 08:10:32 +0000
Received: by mail.genbiz.pl (Postfix, from userid 1002)
	id 4F63283432; Fri, 16 May 2025 10:10:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=genbiz.pl; s=mail;
	t=1747383030; bh=LcirBK93cQ+85aSOiW37iCYU65joqNAj97HHfwOn6nA=;
	h=Date:From:To:Subject:From;
	b=O2yUjxL79+X7OBm/uGe3fQw/nn+YjxWDy73JbtMHtFabaVTAcq1rT9z1WjyPQv+wQ
	 wRwRu6wc/S3l8YZ+Xq+CCmoMV2VQ/4nqQvW4crHbSOM3lIy5+57EHpjJ5Og8svps5l
	 t88rqROsg7iF3s8uEEpmvaTfPiPHQ1VRUGDaPE6kXUTVH5wXSjG5jF/8/7M0cNWb7C
	 OxXBEb612f1esFAOd2lEtRSDHlNTmH0bm+4esoI+oVLEYrPU5KGdxx2XJsEwPM44Ya
	 v3l8UaZtjeZ1xXWPmrspQkphDYYpMQQYPxm1L0Wdne0zs3fzCC7ZedzZhlC1FKco+9
	 msxBu5Ytj2AJA==
Received: by mail.genbiz.pl for <linux-mtd@lists.infradead.org>; Fri, 16 May 2025 08:10:26 GMT
Message-ID: <20250516084500-0.1.1e.1x8f.0.9zxruoh884@genbiz.pl>
Date: Fri, 16 May 2025 08:10:26 GMT
From: =?UTF-8?Q?"Rados=C5=82aw_Grabowski"?= <radoslaw.grabowski@genbiz.pl>
To: <linux-mtd@lists.infradead.org>
Subject: W sprawie samochodu 
X-Mailer: mail.genbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_011031_727446_E0885859 
X-CRM114-Status: UNSURE (  -0.38  )
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

RHppZcWEIGRvYnJ5LAoKY2hjaWVsaWJ5xZtteSB6YXBld25pxIcgUGHFhHN0d3Uga29tcGxla3Nv
d2Ugcm96d2nEhXphbmlhLCBqZcWbbGkgY2hvZHppIG8gc3lzdGVtIG1vbml0b3Jpbmd1IEdQUy4K
ClByZWN5enlqbmUgbW9uaXRvcm93YW5pZSBwb2phemTDs3cgbmEgbWFwYWNoIGN5ZnJvd3ljaCwg
xZtsZWR6ZW5pZSBpY2ggcGFyYW1ldHLDs3cgZWtzcGxvYXRhY3lqbnljaCB3IGN6YXNpZSByemVj
enl3aXN0eW0gb3JheiBrb250cm9sYSBwYWxpd2EgdG8ga2x1Y3pvd2UgZnVua2Nqb25hbG5vxZtj
aSBuYXN6ZWdvIHN5c3RlbXUuIAoKT3JnYW5pem93YW5pZSBwcmFjeSBwcmFjb3duaWvDs3cgamVz
dCBkemnEmWtpIHRlbXUgcHJvc3RzemUgaSBiYXJkemllaiBlZmVrdHl3bmUsIGEgb3N6Y3rEmWRu
b8WbY2kgaSBvcHR5bWFsaXphY2phIHcgemFrcmVzaWUgcG9ub3N6b255Y2gga29zenTDs3csIG1h
asSFIGRsYSBrYcW8ZGVnbyBwcnplZHNpxJliaW9yY3kgb2dyb21uZSB6bmFjemVuaWUuCgpEb3Bh
c3VqZW15IG5hc3rEhSBvZmVydMSZIGRvIFBhxYRzdHdhIG9jemVraXdhxYQgaSBwb3RyemViIG9y
Z2FuaXphY2ppLiBDenkgbW9nbGliecWbbXkgcG9yb3ptYXdpYcSHIG8gbmFzemVqIHByb3Bvenlj
amk/IAoKClBvemRyYXdpYW0KUmFkb3PFgmF3IEdyYWJvd3NraQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
