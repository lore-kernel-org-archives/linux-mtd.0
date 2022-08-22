Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCCFC32792
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Aug 2022 06:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C4RWlm3bBHAXwiI8OpeHdOMHjgd+0DskigGLjbhpHug=; b=tucn7YJWuwsok4Bd+atM72y8w2
	W8O8ur5Wj5vDPN+a2HEhvaZHqthAzyT49fMguASW/9nvtUtmPgjnlFmEKBafiWstTz45bku66x0n/
	TZkqmYXf//hPv7yCXuUsXDDi0A5vT3wb3UwEpb29LE2/WvLIjap3b9SorPbjnG0I/J7BEV+F2t7RT
	rEZGaHBniWw1zyfcJ6ujcKElKga7/0XmgNMyn4dHtxYRrBBLbyuPgiWyXWi5T4s9A/7G4TmskHjwy
	nRirjL93hQ+WzbtCtQMbcBF1tBbjK+ToQMestnyi24StknhiHvOoqQXyVb5ai+AORHNhwiy3+NVyt
	lVKrR87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ0t2-005OoN-Nf; Mon, 22 Aug 2022 06:26:13 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQ0sy-005OkE-Bg
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2022 06:26:10 +0000
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4C878615CC8A;
	Mon, 22 Aug 2022 08:26:01 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 7T8jxlXV35al; Mon, 22 Aug 2022 08:25:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id A4DF4615CCB6;
	Mon, 22 Aug 2022 08:25:59 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BcGappGnTvLl; Mon, 22 Aug 2022 08:25:59 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 79C83615CC8A;
	Mon, 22 Aug 2022 08:25:59 +0200 (CEST)
Date: Mon, 22 Aug 2022 08:25:59 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
Cc: Yifei Liu <yifeliu@cs.stonybrook.edu>, ezk@cs.stonybrook.edu, 
	madkar@cs.stonybrook.edu, David Woodhouse <dwmw2@infradead.org>, 
	Matthew Wilcox <willy@infradead.org>, 
	Kyeong Yoo <kyeong.yoo@alliedtelesis.co.nz>, 
	linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <513220739.132330.1661149559308.JavaMail.zimbra@nod.at>
In-Reply-To: <PH0PR10MB46153A784F27AE96DA69120DF46E9@PH0PR10MB4615.namprd10.prod.outlook.com>
References: <20220803155315.2073584-1-yifeliu@cs.stonybrook.edu> <PH0PR10MB46153A784F27AE96DA69120DF46E9@PH0PR10MB4615.namprd10.prod.outlook.com>
Subject: Re: [PATCH] jffs2: correct logic when creating a hole in
 jffs2_write_begin
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97 (Linux)/8.8.12_GA_3809)
Thread-Topic: jffs2: correct logic when creating a hole in jffs2_write_begin
Thread-Index: AQHYp1GL3Ep6t2pZ9Uewp2J/7maioa25xpiVmVIRMXc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_232608_684293_53F4ECAC 
X-CRM114-Status: UNSURE (   5.05  )
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

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkpvYWtpbSBUamVybmx1bmQi
IDxKb2FraW0uVGplcm5sdW5kQGluZmluZXJhLmNvbT4KPiBBbjogIllpZmVpIExpdSIgPHlpZmVs
aXVAY3Muc3Rvbnlicm9vay5lZHU+Cj4gQ0M6IGV6a0Bjcy5zdG9ueWJyb29rLmVkdSwgbWFka2Fy
QGNzLnN0b255YnJvb2suZWR1LCAiRGF2aWQgV29vZGhvdXNlIiA8ZHdtdzJAaW5mcmFkZWFkLm9y
Zz4sICJyaWNoYXJkIgo+IDxyaWNoYXJkQG5vZC5hdD4sICJNYXR0aGV3IFdpbGNveCIgPHdpbGx5
QGluZnJhZGVhZC5vcmc+LCAiS3llb25nIFlvbyIgPGt5ZW9uZy55b29AYWxsaWVkdGVsZXNpcy5j
by5uej4sICJsaW51eC1tdGQiCj4gPGxpbnV4LW10ZEBsaXN0cy5pbmZyYWRlYWQub3JnPiwgImxp
bnV4LWtlcm5lbCIgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Cj4gR2VzZW5kZXQ6IFNv
bm50YWcsIDIxLiBBdWd1c3QgMjAyMiAyMDoyMTowNAo+IEJldHJlZmY6IFJlOiBbUEFUQ0hdIGpm
ZnMyOiBjb3JyZWN0IGxvZ2ljIHdoZW4gY3JlYXRpbmcgYSBob2xlIGluIGpmZnMyX3dyaXRlX2Jl
Z2luCgo+IFdoYXQgaGFwcGVuZWQgd2l0aCB0aGlzIHBhdGNoPyBMb29rcyBsaWtlIGEgaW1wb3J0
YW50IGZpeCBidXQgSSBkb24ndCBzZWUgaXQKPiBhcHBsaWVkID8KCkl0IHdpbGwgYmUgcGFydCBv
ZiB0aGUgbmV4dCBmaXhlcyBQUiBhZnRlciBJIGhhZCBhIGNoYW5jZSB0byByZXZpZXcgaXQuCgpU
aGFua3MsCi8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
