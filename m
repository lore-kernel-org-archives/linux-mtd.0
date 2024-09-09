Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D77CECE584
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Sep 2024 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnRF9KjTtB7sh5VGgFpKQDrHN4o8rYA0HrH7bkHQEAo=; b=V5h0IEFuKLwm6W
	lXIwd8x5fvigwfxTg9yivAA9mXrPXkluOqf2eFu+dyoV72SyG2sBcVaEnN3eCa2/7XZYThcB4KkbZ
	+bbblCJiQqoAt14HvW+ue3jrEOZyyBNzX4LlwF989iMsHiMSgyJhePgiZP3oj/lKbLLd4YnQaW0JK
	JKwnaPgXcWlXR6Bo+eOXJho1BMAWxQH7aDnKtlCbsnviqmgBMZlG2NY/p+/pcG/C225hjphzqv2uD
	ikp+LmoGNy7mRjQxvHILSv+6648tji6bu8Rb8beTqnzJP6b6rUhqVusXAP3/DSeENKA9/BRCxYAlW
	OaKvsFP9B3gNR58E0ocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncir-00000001hJe-2juy;
	Mon, 09 Sep 2024 11:38:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snb2C-00000001OPA-18wc
	for linux-mtd@bombadil.infradead.org;
	Mon, 09 Sep 2024 09:50:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+n6jIuUoupEYC9it7jynGsfYtTffkj9K1qGvau67Xdk=; b=fcmezFHtpoV25aHlkrtKHNDrib
	AACt0bVnAsxprS9tQLakQaOOY8ih41uvFoY4F0gfFVLhm/mSBi5HBahAxy8wPsnyy7RDCr1JuXn8O
	5YqgkyIzNO01IpW2K1oLfYAghb6k0lhZco1b/oo3Ldu/pNzqa/zVf54UI03yneiGC07oBhG49kppv
	DlJMmommWJb+lelpglzduUpIPkRMbJ5S/rJNaIbxlwpahEs9FXjYgei7bFfdFiNjcuKBaWtc83Wfy
	9pK/I4wgD+J96mXK9QeRlD2N0WH8AAQewomcoddhDPyz+JIIFu/gbCasS2eEfMNClNrEak7j6H5gn
	x2OY9+cA==;
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1snb28-00000000NjF-2Mcs
	for linux-mtd@lists.infradead.org;
	Mon, 09 Sep 2024 09:50:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BC657E0009;
	Mon,  9 Sep 2024 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725875403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+n6jIuUoupEYC9it7jynGsfYtTffkj9K1qGvau67Xdk=;
	b=CDmhO7aBGHlWdZiCpFPQW01csa4AVN722IUzlJyMVnxEH6+cWYz86FQ8OxAiz2420sGBW8
	n4mM+Xeiq3XWkr26A66LjKTVKEUcOwxxzuN8fGsnQz+MqezxXXmz8FbHupp2jM5wyNTII+
	3/91pxDCRwhqKtCdAH7UM0lrmRZqVlt6K8TzvIooik6D1oYcZ1zX5et1JOwT+nQJm6Sr0O
	ftBYMd31fOBewjDuxkkM8qGAf9Y06pe0J0ErzX7ejhx+ytUd7NOMW8PgcUl1M1pLMJnA/s
	PTf2WOuAATZlWj1jXZgZy4p/5p8WR6R3Z9x84E9Svbgp4FU5N3qoihxdVLR7wQ==
Date: Mon, 9 Sep 2024 11:50:01 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH RESEND v2 06/19] mtd: tests: Include <linux/prandom.h>
 instead of <linux/random.h>
Message-ID: <20240909115001.2b05a5ce@xps-13>
In-Reply-To: <20240909075641.258968-7-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
	<20240909075641.258968-7-ubizjak@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_105008_754395_346BB3AF 
X-CRM114-Status: UNSURE (   7.28  )
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

SGkgVXJvcywKCnViaXpqYWtAZ21haWwuY29tIHdyb3RlIG9uIE1vbiwgIDkgU2VwIDIwMjQgMDk6
NTM6NDkgKzAyMDA6Cgo+IFN1YnN0aXR1dGUgdGhlIGluY2x1c2lvbiBvZiA8bGludXgvcmFuZG9t
Lmg+IGhlYWRlciB3aXRoCj4gPGxpbnV4L3ByYW5kb20uaD4gdG8gYWxsb3cgdGhlIHJlbW92YWwg
b2YgbGVnYWN5IGluY2x1c2lvbgo+IG9mIDxsaW51eC9wcmFuZG9tLmg+IGZyb20gPGxpbnV4L3Jh
bmRvbS5oPi4KCkFja2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4u
Y29tPgoKPiAKPiBTaWduZWQtb2ZmLWJ5OiBVcm9zIEJpemphayA8dWJpempha0BnbWFpbC5jb20+
Cj4gQ2M6IE1pcXVlbCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gQ2M6IFJp
Y2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Cj4gQ2M6IFZpZ25lc2ggUmFnaGF2ZW5k
cmEgPHZpZ25lc2hyQHRpLmNvbT4KCk1pcXXDqGwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
