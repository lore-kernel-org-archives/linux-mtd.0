Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95869D1CA3A
	for <linux-mtd@archiver.kernel.org>; Tue,  5 Nov 2024 07:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P79XxJNPcIUwZbdKmD0MMSVuh5FAkugLpvifwKm6bWA=; b=YXtb3SiHFYvdbh
	ld5RgcmSPNK00uv+0cHCJCon3p4BNrCmPuU/C2ALBD9xWhxL9n852CdgvSzF0s/LwwwyriIVLzsXE
	oQ/PmNDWSY+o4GlZbsoOpDT31qnkXnB0L3lQh1+vJT2NyURxLJYQiffGIbjfr2L9BJbrD5CoHlg/u
	2oR0Tzo7ZdZ9hSmFDeFqJkL9NCgvqKdxEo+6Gc05QVz0zQq93/2/VyUITQp88ieK87EuV3eetr48k
	psUausW4GT6P81UgqHt9tm5IrpsUCjGaKTXJ5Blbhf8t8IIP7x6D/XiPEFkiIlee7NEFaZInar0sV
	aGZqnZQC76KdqqiuHzAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DZ1-0000000G84l-31SX;
	Tue, 05 Nov 2024 07:01:19 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8DYx-0000000G83L-3LSO
	for linux-mtd@lists.infradead.org;
	Tue, 05 Nov 2024 07:01:17 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5c937b5169cso8219495a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 04 Nov 2024 23:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730790074; x=1731394874; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMC2nCHCegVHnG8968VXLv6rjHwiT0mzs5/u6u9/wQ8=;
        b=L9hakLISaM+uLRZh9FzManuMbS6RJt7dgdkfpvjTdXXUaQJ0q/G2vemplgeqLsSyEh
         eDMBkkZ5aEK9gfUSK7HrJETBvzqmy5ZrmIMgNjMhJTNB6EAKYUNUcQE85/OQtCl8WPCD
         ZW3vgb8L3i1yMZZvUMiM3VZW319q8x8py5+RfI4/Sna3VThYtgffGf7fwGArIOJB1gz+
         hGvll3feV/HBAHvnJlXbAB/zHlcQxJBbXZnutf6PvkmbR0Z9bgRn/+Jd9VMTJwmQ/tFK
         yLvCYdBVjjRmX7Rl6yUzNM+cSIvwBq2f94nWvkukvogADISC4GA+xARemuURgkq/jmF9
         QGuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730790074; x=1731394874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMC2nCHCegVHnG8968VXLv6rjHwiT0mzs5/u6u9/wQ8=;
        b=SOvt/JiSFKHwFMDxpAHOL5az9XqdD1fDmX2KHPMSSEQGX1XjfEjjRD8tmlBHcalJMU
         HXmTNiaL3Ra83e1lz551vleTVpRTQiXMX1VWBpK45hyTU1hORrhgbL5znHT9Ckilb4iA
         F/VWNCjNJ+PfEKURUY3i45iW1U+Ipx9XEav0Bg7C5N0yWWqYeL7eh+S716u9dBLbM+F7
         1I2Ens2ga9LIQV+RQEI3/CqlQhGJi868E9PN8cEA8lO+uvqys6BJsXdZbMPrjsfBdtjS
         PxmI+MNRJjD18UiCc03YIyC7xbjsdG1vm/Fsd7p3vgTJhYl8abmC5iWLFeyuLxC8dXNR
         s/9w==
X-Forwarded-Encrypted: i=1; AJvYcCXw20R1ah1r9PBRvciYVrWaYWAKIKXzDTwYaP39jZd/WoTB/1r7sXmHofZCdklRqXEAu/dBrjAtvjQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeP2nKo3AxbXuArrC9Z4msaU7KupXleUDaiU10mCIzy8z7O8Dm
	0nzvTPktltsyoxjg7EdYe0RChOeykbPOs6fKq1gw860DGniIiZkoPBr527dYWDpW1cuzront2gB
	2vO2h5BR45SEal3lJFPVh2jBld6Q=
X-Google-Smtp-Source: AGHT+IFpFl6d6FD3d3bHUu/f6xsx6k+d+E9VxTMNIjcz5Z/CqziON6Sge5X9IdrtoQxk42rWpFoCK55JubqqX0imrR4=
X-Received: by 2002:a05:6402:35c9:b0:5ce:b113:4a91 with SMTP id
 4fb4d7f45d1cf-5ceb8cb065amr15096805a12.2.1730790073799; Mon, 04 Nov 2024
 23:01:13 -0800 (PST)
MIME-Version: 1.0
References: <CAOuPNLhxBBihr38p_XMQEgkiLFc+DPxkQf4oewF8U1+ihaFn-Q@mail.gmail.com>
 <5cdff557-c90f-6acc-7245-a2fb2406ecb9@huawei.com>
In-Reply-To: <5cdff557-c90f-6acc-7245-a2fb2406ecb9@huawei.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Tue, 5 Nov 2024 12:31:01 +0530
Message-ID: <CAOuPNLgiPxoNjqdN2C_BbzEjkcv9tdOpiu7bz6stXwqAK0VMCw@mail.gmail.com>
Subject: Re: Block based OTA update needs mtdblock
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_230115_859091_39E2AA71 
X-CRM114-Status: GOOD (  21.33  )
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

SGksCgpPbiBUdWUsIDUgTm92IDIwMjQgYXQgMDc6NDUsIFpoaWhhbyBDaGVuZyA8Y2hlbmd6aGlo
YW8xQGh1YXdlaS5jb20+IHdyb3RlOgo+Cj4g5ZyoIDIwMjQvMTEvNSAwOjAxLCBQaW50dSBBZ2Fy
d2FsIOWGmemBkzoKPiA+IEhpIEFsbCwKPiA+Cj4gPiBGb3Igb25lIG9mIG91ciBhdXRvbW90aXZl
IHByb2R1Y3RzIHdlIGhhdmUgdGhlIGZvbGxvd2luZyBjb25maWd1cmF0aW9uOgo+ID4gUUMgY2hp
cHNldCwgYXJtNjQsIEtlcm5lbC01LjE1LCBOQU5EIEZsYXNoIDFHQiwgQS9CIHN5c3RlbSwgVUJJ
Cj4gPiB2b2x1bWVzIChzcXVhc2hmcywgdWJpZnMpLCBETS12ZXJpdHkgZm9yIHJvb3RmcyAoc3F1
YXNoZnMpLCBzaW1wbGUKPiA+IGJ1c3lib3ggcGxhdGZvcm0uCj4gPgo+ID4gRm9yIE9UQSB1cGRh
dGVzIHdlIGhhdmUgYSBzdHJvbmcgZGVwZW5kZW5jeSB3aXRoIE1URF9CTE9DSy4KPiA+Cj4gPiBU
aWxsIG5vdywgd2Ugd2VyZSB1c2luZyB1YmlibG9jayBmb3IgbW91bnRpbmcgc3F1YXNoZnMgdm9s
dW1lcyBhbmQKPiA+IGNvbXBsZXRlbHkgZ290IHJpZCBvZiBtdGRfYmxvY2sgYnkgY29uZmlndXJp
bmcgaXQgYXMgYSBsb2FkYWJsZQo+ID4gbW9kdWxlLgo+ID4gQnV0LCB3ZSBhbHNvIG5lZWQgdG8g
c3VwcG9ydCBPVEEgdXBkYXRlcyAoRnVsbCwgSW5jcmVtZW50YWwpIG9uIEEvQgo+ID4gdm9sdW1l
cyB1c2luZyB0aGUgc2FtZSBBbmRyb2lkIE9UQSBmcmFtZXdvcmsuCj4gPiBodHRwczovL3NvdXJj
ZS5hbmRyb2lkLmNvbS9kb2NzL2NvcmUvb3RhL25vbmFiL2Jsb2NrCj4gPgo+ID4gT1RBIHVwZGF0
ZSB3aWxsIGJlIGFwcGxpZWQgdG8gdGhlIEIgKGluYWN0aXZlKSBwYXJ0aXRpb24uCj4gPiBPVEEg
dXBkYXRlcyBwcmVmZXIgYmxvY2sgYmFzZWQgdXBkYXRlIG92ZXIgZmlsZSBiYXNlZCBlc3BlY2lh
bGx5IGZvcgo+ID4gZG0tdmVyaXR5IGVuYWJsZWQgZGV2aWNlcy4KPiA+Cj4gPiBOb3csIHRoZSBw
cm9ibGVtIGlzLCBvbiBNVEQgd2Ugb25seSBoYXZlIDIgb3B0aW9ucyBmb3IgYmxvY2sgYmFzZWQK
PiA+IHVwZGF0ZXM7IHViaV9ibG9jayBvciBtdGRfYmxvY2suCj4gPiBXZSBjYW5ub3QgdXNlIHVi
aWJsb2NrIGZvciBPVEEgdXBkYXRlcyBhcyBpdCBpcyByZWFkIG9ubHkuCj4gPiBGb3IgZnVsbCB1
cGRhdGUgdm9sdW1lLCB3ZSBjYW4gdXNlICJ1Yml1cGRhdGV2b2wiIGludGVyZmFjZSB0bwo+ID4g
Y29tcGxldGVseSByZXBsYWNlIHRoZSB2b2x1bWUgY29udGVudCwgYnV0IGZvciBwYXJ0aWFsIG9y
IGluY3JlbWVudGFsCj4gPiB1cGRhdGUgd2UgbmVlZCB0byB1cGRhdGUgb25seSBzcGVjaWZpYyBi
bG9ja3MgYW5kIG5vdCBlbnRpcmUKPiA+IHBhcnRpdGlvbnMuCj4gPiBUaHVzLCB3ZSBoYXZlIHRv
IHVzZSB0aGUgTVREX0JMT0NLICgvZGV2L210ZGJsb2NrKSBpbnRlcmZhY2UgdG8KPiA+IHN1cHBv
cnQgYmxvY2sgYmFzZWQgT1RBIHVwZGF0ZXMgb24gVUJJIHZvbHVtZXMuCj4gPiBUaHVzLCBkdXJp
bmcgb3RhIHVwZGF0ZXMgKG9ubHkpIHdlIG5lZWQgdG8gaW5zdGFsbCB0aGUgbXRkYmxvY2sKPiA+
IG1vZHVsZSwgcGVyZm9ybSB0aGUgdXBkYXRlIGFuZCB0aGVuIHVuaW5zdGFsbCB0aGUgbW9kdWxl
Lgo+Cj4gSGkgUGludHUsIGhvdyBkbyB5b3UgZXhwb3J0IHRoZSBtdGRibG9jayBkZXZpY2Ugb3Zl
ciBvbiBhbiBVQkkgdm9sdW1lPwo+IEJ5IHRoZSBnbHVlYmk/Cj4gPgpZZXMsIHdlIGhhdmUgdGhl
IGJlbG93IGNvbmZpZ3MgZW5hYmxlZC4KQ09ORklHX01URF9CTE9DSz1tCkNPTkZJR19NVERfVUJJ
X0dMVUVCST1tCkNPTkZJR19NVERfVUJJX0JMT0NLPXkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
