Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB1CD49209
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Nov 2024 10:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pmgiYm/q2bNYvk7jgAsMYzY+YHhRxp/wIpjaXfMjheQ=; b=par4cP6h/EMCo1
	UH+o+nk3+0l8fCrYG634y8cZ6tFE6SqiWfplWo4nxIJEn1j2aQI5FSv15Anj723hbJkX2rRUHeDcT
	WGFMaF4/zGTUFDGriSAda+RkIAl0lQC5m70uMTokuhuP6uiEJpFvOVb8Hjx5B08boXv3dBumgalaa
	Oxxw80QNwdM6jIG22fD7suOM0cYDhOixC/r0xAC5UjrUgRWJDRccUbPe/q/oyC2jv4iIwoPAgAnNY
	OFKAUAcaE01AKXkI+AZeoD2DUe6ZvCf3qPi9yVH+iDSGmJ/26xrF6bizSwcNexViX7ML2A6q5stzR
	iMG8/PDw4FCvhvWCtEXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz4x-0000000968v-44IZ;
	Mon, 18 Nov 2024 10:33:59 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCz4s-00000009682-1pjc
	for linux-mtd@lists.infradead.org;
	Mon, 18 Nov 2024 10:33:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5CB0FF805;
	Mon, 18 Nov 2024 10:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731926031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3QbtL+cZcW8vapLs122ZmhiOZ6P53VsNtBrGOyv4wqk=;
	b=Ylq7hZRmtSxlTZfyiqyPKtDsZFIVPmE/UzKLf8ofZF2eqoJOw/sXNIBRAtly94+njkd3gJ
	zi9SyqpsQ74xYpPYmYIVuA6twHgfCI0irFblosDK+ZiYXuDKKcSmg64/BAbSdP3CFg/TOG
	ySgEh3Hv/cRh+MeLFkhOGL7zlN4i+wM8gfPVkujPiRM5+1xfWvCzvh1uJo8A9BhJ+axmNH
	eDZdjcUZeAG/5BKtUQzDDdp98IUWTBlnb8UsOUII4J5HWoCMeaCJV5Rq4L+C6CjdxB54xG
	3wquu2LgoWrWTW5Fkx9h7edZyBKakJ241JXM2vyyCdyuhWtj05iGLHMSo+GZ5Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  richard@nod.at,  alvinzhou@mxic.com.tw,
  leoyu@mxic.com.tw,  Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH v2 2/2] mtd: spi-nand: macronix: Add support for read retry
In-Reply-To: <20241114023528.181583-3-linchengming884@gmail.com> (Cheng Ming
	Lin's message of "Thu, 14 Nov 2024 10:35:28 +0800")
References: <20241114023528.181583-1-linchengming884@gmail.com>
	<20241114023528.181583-3-linchengming884@gmail.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Mon, 18 Nov 2024 11:33:49 +0100
Message-ID: <87serozv8y.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_023354_617872_23181F6E 
X-CRM114-Status: UNSURE (   6.88  )
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

T24gMTQvMTEvMjAyNCBhdCAxMDozNToyOCArMDgsIENoZW5nIE1pbmcgTGluIDxsaW5jaGVuZ21p
bmc4ODRAZ21haWwuY29tPiB3cm90ZToKCj4gRnJvbTogQ2hlbmcgTWluZyBMaW4gPGNoZW5nbWlu
Z2xpbkBteGljLmNvbS50dz4KPgo+IEFkZCBmdW5jdGlvbiBmb3Igc3VwcG9ydGluZyByZWFkIHJl
dHJ5OgoKQWRkIHJlYWQgcmV0cnkgc3VwcG9ydC4KCj4gLSBTZXQgZmVhdHVyZSBvbiBTcGVjaWFs
IFJlYWQgZm9yIERhdGEgUmVjb3ZlcnkgcmVnaXN0ZXIuCgpJIGFtIHNvcnJ5IHRoaXMgc2VudGVu
Y2UgaXMgdW5jbGVhci4gUGx1cyB0aGVyZSBpcyBvbmx5IGEgc2luZ2xlICctJwp3aGljaCBpcyBz
dHJhbmdlIGZvciBhIGxpc3QuCgo+Cj4gVGhlIFNwZWNpYWwgUmVhZCBmb3IgRGF0YSBSZWNvdmVy
eSBvcGVyYXRpb24gaXMgZW5hYmxlZCBieQo+IFNldCBGZWF0dXJlIGZ1bmN0aW9uLgo+Cj4gVGhl
cmUgYXJlIDYgbW9kZXMgZm9yIHRoZSB1c2VyIHRvIHJlY292ZXIgdGhlIGxvc3QgZGF0YS4KPgo+
IFNpZ25lZC1vZmYtYnk6IENoZW5nIE1pbmcgTGluIDxjaGVuZ21pbmdsaW5AbXhpYy5jb20udHc+
CgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
