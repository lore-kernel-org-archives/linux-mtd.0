Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D91EDC982DA
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Sep 2026 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/IXDQ/T8nSB/Z4B7Kz9/hP3GuXmUtn89kV9Z+e22qvk=; b=2Mwq+SGqBZJQ9g
	pVbGiKqJLkeVVFSPQDrvVA8W5mqhilKzsZ/oEeinvv/ZTZ8yU2IiOw4SkVVw5DoDYUyGN+SfRykoq
	6m8B9NPQdjyMBF3mkTR4YNaxyZgwwb4n4Zhoi5fWZBUeXdNR/WuugYdQKphKE5oyhsvt4TK72+SHg
	aXtLAlZbVhOxglaev3WWKWTU70c+xUqvMqaCNqhMyg7yea+80ef3so6MK0C1iwyXtVeIED7evaHQO
	zlZ4OGOZwqkUeCLwmexLzkWhyKG8oQaBTWQCA3n/khRRsTI0LcRWzkDkzAEAziQCvR0wEhPVNfQ0Q
	kn6qfwARiW2SjscJbTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HSW-0000000HUzD-3bbr;
	Sun, 20 Sep 2026 13:19:56 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HSR-0000000HUyt-2Keh
	for linux-mtd@lists.infradead.org;
	Sun, 20 Sep 2026 13:19:53 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5E0F71A09A4
	for <linux-mtd@lists.infradead.org>; Sun, 20 Sep 2026 13:19:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2B71A604C9;
	Sun, 20 Sep 2026 13:19:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6296103286A4;
	Sun, 20 Sep 2026 15:19:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789910387; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zgc7Gx/an6P7kWKN7q9gfPxCuX+F7Updd1Xsxv0Qhwk=;
	b=x9xyMgCPD30z6oscZoJZWwO0SMkUECpJeMbpwdT+4TGtFjFmS0FgCWS0kKxg3rJjfOp3fD
	3iki0PYqUPkQUK7DurJ3fv92VTU9Y3jZqCHP1n1SSAzD1LIej6ZzII8ODO+GEgOTzkT09l
	EjSlQgEh9eQAjI8PxlVFL7hVgw81J4FYGx+CV0fOIIeegM3feQK7ppm45QpaPLWzuoT06u
	mjyk/1VLWTeEgUqDOMrb5rxYuZk6fyuSmtAggbTFAKiG1EGfK5NCbRUJ7YiOAhJqS9gMf5
	DbV1boUo7aVk5/Jm0uOGC0baQkLgTGLEiBHNAtwKWAUk2FY4a8Zq2Ng3C/oUxg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Stephen Bancroft <stevereaver@gmail.com>
Cc: linux-mtd@lists.infradead.org,  richard@nod.at,  vigneshr@ti.com
Subject: Re: [PATCH v2] mtd: maps: add INT0800 firmware-flash map driver
In-Reply-To: <20260917012123.33685-1-stevereaver@gmail.com> (Stephen
	Bancroft's message of "Thu, 17 Sep 2026 11:21:23 +1000")
References: <20260917012123.33685-1-stevereaver@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Sun, 20 Sep 2026 15:19:08 +0200
Message-ID: <87eceo9i2b.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_061951_752806_7131187A 
X-CRM114-Status: UNSURE (   3.73  )
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

SGkgU3RlcGhlbiwKCj4gK01PRFVMRV9BVVRIT1IoIkRldmluIik7CgpFeGNlcHQgdGhpcyBsaW5l
IHdoaWNoIGlzIG1pc3NpbmcgeW91ciBmdWxsIGlkZW50aXR5LCBJIGd1ZXNzIEknbSBmaW5lCndp
dGggdGhlIGNvbnRyaWJ1dGlvbi4KCj4gK01PRFVMRV9ERVNDUklQVElPTigiUmVhZC1vbmx5IE1U
RCBtYXAgb3ZlciB0aGUgSU5UMDgwMCBmaXJtd2FyZSBmbGFzaCB3aW5kb3ciKTsKPiArTU9EVUxF
X0xJQ0VOU0UoIkdQTCIpOwoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
