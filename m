Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0825CCD1AB
	for <linux-mtd@archiver.kernel.org>; Fri, 24 Oct 2025 11:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8OuMSab1bDQUUKH7FApa3bMb9J7MhfycBg1fKN9K51A=; b=nA/PJfoopAAm7V
	CSWTtpLKBxNAfPEjpsKw37bGbKrSgLVisYwtKJn8tWDUQZ6P+R5RwZ1HJ1mknCW2zNG0Ma2BjghGL
	EDDw1CzkjfghvsDQ6cqxTm/OgQZdaUG/ojP8dfr5Xb2MI/IdaO/e85sdnAyplk3hDJ6G1W/er/x7t
	LMK1ZzYZBOVYy3OXMpmpjQbstlXculv0PzgDWVirZaXbMbYzg7KPsPbZa5xk6vx2pl2sD2zG4k8Ao
	fSImqP05z8A5zLyIRBUxPEjoZL3QZ1MMA3TjOLIwvqo0PPKazWHRZjt4Kf4mVvw82CpLdr+O71k33
	3Rqv2e67wSN+YAFIR3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFmt-000000099wO-1CLA;
	Fri, 24 Oct 2025 11:16:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCFmr-000000099w1-3YCw
	for linux-mtd@bombadil.infradead.org;
	Fri, 24 Oct 2025 11:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=BaDn986q5yhbWKKWBePyq6Pb8smvvlHHR98lZRxcrVQ=; b=d/7QhBKEhICUDqYwVeSgLy7SSj
	vk3qkzMUaF9HbLlfGLd6jitGynK86tdi49KHaP7En5O746g5UWiUg2oWo+RGTkxNNcKmo7AiPz0L2
	rag8zLDBEi7a9kDEunDcQJa/zeCjoVSrt8Dj9JzR9kFglqU7JpP1UZv3RRgQE/NUllSm6SN5VXcwJ
	F7TRjB7eRR+ZucWNTDO0NY8AjIKXeLPMVBkpz6eEw3irvhjNjplTFB613kml2JOXA5wB9kgGueJAO
	xd1+n2s2udJeSwLBWAT3j9MdGZz9l+XYGuM+Hcw83whnNSUgXTTrI2qEWrG7MWFKgjLDQzYzez3Nk
	KDD6XdLg==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCEvA-00000002EPp-3Kia
	for linux-mtd@lists.infradead.org;
	Fri, 24 Oct 2025 10:21:22 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 405F81A1646;
	Fri, 24 Oct 2025 11:16:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 16D3760703;
	Fri, 24 Oct 2025 11:16:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3237102F248F;
	Fri, 24 Oct 2025 13:16:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761304603; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BaDn986q5yhbWKKWBePyq6Pb8smvvlHHR98lZRxcrVQ=;
	b=SAEP9+nackPJTf3w5lUHPqIxzSpqBkOG/SPRu/QjSdJ+uod2yNSqgvSUrBhLo1AVsPZNam
	lDNtnlTZ5MPC9WCZmRBd8iBaYEHPuc+aPxOY+7CG/WxrhCmyN0MVK+1b5471Z/9lytvn46
	eYYUcNBH2h2SFd/RXvZqG7s2prh4bi+FNDrSIdeQj9O1MIXtaET5ulyB/bDUGF8c+v3I7z
	e+gmElP3nLpUqU+P0QgsmEpcgMwx9nHCYLsT2RsnmaoHNZ60suFMIr/ysqNs84jHrmcgM+
	KUSYjNJWv41bUnO6CwaEPDAPJdgnth4UTaJ6KLbzRuS4kl5YBgTliEPDVPU5Zg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: niravkumarlaxmidas.rabara@altera.com
Cc: richard@nod.at,  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: cadence: Add support for NV-DDR
 interface mode
In-Reply-To: <20251024102611.310568-1-niravkumarlaxmidas.rabara@altera.com>
	(niravkumarlaxmidas rabara's message of "Fri, 24 Oct 2025 18:26:11
	+0800")
References: <20251024102611.310568-1-niravkumarlaxmidas.rabara@altera.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 24 Oct 2025 13:16:40 +0200
Message-ID: <87zf9gpn1j.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_112120_980115_C4835403 
X-CRM114-Status: UNSURE (   7.05  )
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

SGksCgo+ICsJaWYgKG5hbmRfaW50ZXJmYWNlX2lzX3Nkcihjb25mKSkgewo+ICsJCWNvbnN0IHN0
cnVjdCBuYW5kX3Nkcl90aW1pbmdzICpzZHIgPSBuYW5kX2dldF9zZHJfdGltaW5ncyhjb25mKTsK
PiArCj4gKwkJaWYgKElTX0VSUihzZHIpKQo+ICsJCQlyZXR1cm4gUFRSX0VSUihzZHIpOwo+ICsK
PiArCQlyZXQgPSBjYWRlbmNlX25hbmRfc2V0dXBfc2RyX2ludGVyZmFjZShjaGlwLCBzZHIpOwo+
ICsJfSBlbHNlIHsKPiArCQlpZiAoY2hpcG5yIDwgMCkKPiArCQkJcmV0dXJuIHJldDsKCkkgc3Rp
bGwgdGhpbmsgdGhpcyBpcyBpbmNvcnJlY3QuIFRoZSBjaGlwbnIgdmFsdWUgc2hhbGwgbm90IGJl
IHRyZWF0ZWQKZGlmZmVyZW50bHkgZnJvbSB0aGUgU0RSIHBhdGguCgpUaGFua3MsCk1pcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
