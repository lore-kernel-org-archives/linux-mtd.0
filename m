Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD08C79F80
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Sep 2026 17:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ysKpcvgB8PUF7p9S6QBZ7VFqixhXWWyg0xh+wkNTT9s=; b=K7CzT3dbFJhpZs
	HcAyFO9XcGzVb6yMNQRTl5y5BkHCUOQYt7JaMlOMR3qsPmdSdIYCRmp3i9+IsXrMUMw2LSOLQd5dV
	G8I/Rk51DeT+p4EhNP+RvqduYOxAHruWrRYIDrn0AmK0qQDITjm3BxLGLgUoPLGWoZoqqf1Q9Sav+
	U6oQ0Dh2bkR8boG4/irTri2J7LV/Hwp5MGIjOE4JIB792dsCzhDKdeLHqQjkYsQh4WLMVDrq/9xtm
	3ToT9oxP5IpmdrNkb2/YdsjrRtiw/w1/lUOjD1EzzPiy0Hs9+EbmicODNsTjgd9xacVGFt8zIGZQc
	UXOc0WNcYrhmid/CFirw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XrS-00000002tmZ-1RY9;
	Fri, 04 Sep 2026 17:37:58 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XrP-00000002tlB-1tiK
	for linux-mtd@lists.infradead.org;
	Fri, 04 Sep 2026 17:37:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 13FED4E41518;
	Fri,  4 Sep 2026 17:37:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C2D4C6057F;
	Fri,  4 Sep 2026 17:37:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 16DB811C78705;
	Fri,  4 Sep 2026 19:37:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788543466; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NGCtegBMvxhNV72n4BBpE6YScdV3H5CF5sxKQIzh0Ns=;
	b=f/ZPwRO7/I98nP+2Y3r7GcCxegsAiq2CPVsDw6AWSZ4bOAkfqTNfEq7YMLZWuTGAwzdM0l
	0o3SKr06fPLG7rC6Np8Pa4qyAGdG7QnpxWUP3IiYlmoEF7ywWc+YVbycvBFsi3e4xuEwY+
	Cl/saTLeRbixzd5XnGjIsfvpaEIiq2RESr6kPYe0Cdh62+mVl0BxVb3eEHMmpvZeFdq+6C
	H0ge0sDfjLMHHcF7t0YcuC2osRS0yhzGOw/HoupNYP2+6i9nxdZayfCne8GglwvEzUNTvg
	MRjBP/NLNXyw+XYCGtJsBsYUn8TdVzAynGznF/HyL/4edq16WpZERk8JicYC5g==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: joern@lazybastard.org, richard@nod.at, vigneshr@ti.com, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Pei Xiao <xiaopei01@kylinos.cn>
Cc: syzbot+b320a4d5f65a61dbbf89@syzkaller.appspotmail.com, 
 =?utf-8?q?J=C3=B6rn_Engel?= <joern@barelysecure.org>, 
 stable@vger.kernel.org
In-Reply-To: <25ec7ba58facdf29b42ca43dcf11cd98e2089a5f.1786589041.git.xiaopei01@kylinos.cn>
References: <25ec7ba58facdf29b42ca43dcf11cd98e2089a5f.1786589041.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH v3] mtd: block2mtd: Fix divide error when erase_size is
 zero
Message-Id: <178854346368.1467647.15981574582759186211.b4-ty@bootlin.com>
Date: Fri, 04 Sep 2026 19:37:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103755_628053_3FD19631 
X-CRM114-Status: UNSURE (   5.66  )
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

T24gVGh1LCAxMyBBdWcgMjAyNiAxMDo0ODoxMiArMDgwMCwgUGVpIFhpYW8gd3JvdGU6Cj4gVGhl
IGVyYXNlIHNpemUgaXMgcGFyc2VkIGZyb20gdGhlICJibG9jazJtdGQiIG1vZHVsZSBwYXJhbWV0
ZXIgYW5kIGNhbgo+IGJlIHNldCB0byB6ZXJvLiBhZGRfZGV2aWNlKCkgdGhlbiBldmFsdWF0ZXMK
PiAKPiAgICAgICAgIGlmIChzaXplICUgZXJhc2Vfc2l6ZSkKPiAKPiB3aXRoIGEgemVybyBkaXZp
c29yLCB3aGljaCB0cmlnZ2VycyBhIGRpdmlkZSBlcnJvcjoKPiAKPiBbLi4uXQoKQXBwbGllZCB0
byBtdGQvZml4ZXMsIHRoYW5rcyEKClsxLzFdIG10ZDogYmxvY2sybXRkOiBGaXggZGl2aWRlIGVy
cm9yIHdoZW4gZXJhc2Vfc2l6ZSBpcyB6ZXJvCiAgICAgIGNvbW1pdDogYjU5NjVjNDIyMTE2NTA0
NWUxOTczNjc5NGNhNWY0OGFlM2Q2NzE0MgoKUGF0Y2hlKHMpIHNob3VsZCBiZSBhdmFpbGFibGUg
b24gbXRkL2xpbnV4LmdpdCBhbmQgd2lsbCBiZQpwYXJ0IG9mIHRoZSBuZXh0IFBSIChwcm92aWRl
ZCB0aGF0IG5vIHJvYm90IGNvbXBsYWlucyBieSB0aGVuKS4KCktpbmQgcmVnYXJkcywKTWlxdcOo
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
