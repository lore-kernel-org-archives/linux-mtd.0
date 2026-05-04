Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90305FF885A
	for <linux-mtd@archiver.kernel.org>; Mon,  4 May 2026 14:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sKfaDsbFI3z1bUlqGTsDf33LMKbS1nKGP81I6kq+d6s=; b=Px5NTfRGXQ1mU0
	pMm32d+WJvVG3T02JwtyuE7VDm15O0ydqq27V2R/zhZ7bkvp7R7bsRYaiiCY60ZVUY9tYCyI+gcrQ
	/uogU2uIAwAPc2rIShh9HmteXt57JfEMxMYrRu1r7ibAEpRfLDR7qcg5n+KLnaFRBkM9eaguCAAJC
	AvshWm6VrYRC/iq9C8dR2zU4NRkRmciPJmz3p4yz9hpmdcpwlSFZb1hxCGFkvQdNlaNTv8hSv6uNp
	s7zghd2U48lWFy++rpkhqt4ZEj2PcM6FIMjxIvQ9sQYUShkhs5Zr/411Hv6i696ZzODmQglCogpWV
	oYmteAQxUZPrvkhPFIPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtqn-0000000DNQM-2VHb;
	Mon, 04 May 2026 14:00:45 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJtql-0000000DNPV-0O7b
	for linux-mtd@lists.infradead.org;
	Mon, 04 May 2026 14:00:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B2D6AC5D72D;
	Mon,  4 May 2026 14:01:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4D7E65FD5F;
	Mon,  4 May 2026 14:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EA15611AD25DA;
	Mon,  4 May 2026 16:00:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777903238; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=J/YMiG8amHVI+NWmZeWwV8yS8UKF2VHUJ9Vx8A+2fB4=;
	b=lUTi8xOjyOfTouy+oxfqjK7oyZ8HrbcBIZuKm4OTWHrI3k1HmCxj0LGR4y0GRQKIyaI/Q1
	OH1XTLejiavn1YCbpidfnf7m/zRUTKbilG0swCa3VIwOX/p4zCF8Ex4F4jxvaE1KMZhzfC
	GaIDxQrSCTxTQ+YILb4AOc45q3VqnBECM1jEz2x7xwsb+59Lchllm3wIDq+zRhbt/R/7EB
	KwTCBA/bo+fgPrK1I52V4kDySuHV2h5Sc8hFhg6pld6uThubN0HzRxoMOBOWKu7irtRTe8
	/2u/Rjy3kl+3jaMtRMB4ySZSeJS6EzT0h+WlMFe3pjrQZuxfrmIXtNfPENppYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mtd@lists.infradead.org,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org
 (open list)
Subject: Re: [PATCH] mtd: sm_ftl: allocate cis_buffer with main struct
In-Reply-To: <20260430220719.77223-1-rosenp@gmail.com> (Rosen Penev's message
	of "Thu, 30 Apr 2026 15:07:19 -0700")
References: <20260430220719.77223-1-rosenp@gmail.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 04 May 2026 16:00:37 +0200
Message-ID: <874ikns29m.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_070043_311246_7D8A16BF 
X-CRM114-Status: UNSURE (   3.96  )
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

SGkgUm9zZW4sCgpPbiAzMC8wNC8yMDI2IGF0IDE1OjA3OjE5IC0wNywgUm9zZW4gUGVuZXYgPHJv
c2VucEBnbWFpbC5jb20+IHdyb3RlOgoKPiBVc2UgYSBmbGV4aWJsZSBhcnJheSBtZW1iZXIgYW5k
IGt6YWxsb2NfZmxleCgpIHRvIGRvIHNvLiBTaW1wbGlmaWVzCj4gbWVtb3J5IGFsbG9jYXRpb24g
c2xpZ2h0bHkuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSb3NlbiBQZW5ldiA8cm9zZW5wQGdtYWlsLmNv
bT4KCkFwcGxpZWQgdG8gbXRkL25leHQuCgpUaGFua3MsCk1pcXXDqGwKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
