Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F803C43327
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Jun 2026 14:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xR3FU2LZ36F8BopUFrEeYva23FFV4W8eo3GqnhpPei8=; b=hNIWyZjTGEY0fp
	onz00JfbwGLB2GVSncsaOs9AxvAJve6e9RrMQ6Bcb4P+aP3hkNxrFsv2LdRn9gMCX7MwvQfWJUFek
	KYkc1CmvjOqHU0sInuU+Gi6w+7v8DzwO5BFXNt2j+m+8zoNMcuUPYS/qJYKnczdC+7x3siWudMAmq
	ZYXaC17jsi5VrcmEhkGyrrNzD27t9GR+X6mkqEGK+SBi18Ja4igN85ppoYLk5BtSYUCjjZMsblSDx
	heV5qVKD6rc4fb1SqGrRiScREcKG/7bS1dOallXOSgy09sMvTX1lI6PqzjaGDCMzg78B9mqZCZRsx
	vm0CwjuM3cSyUcNw0oLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9R-0000000Eu7V-2Gdf;
	Mon, 29 Jun 2026 14:39:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weD9Q-0000000Eu73-3YRA
	for linux-mtd@bombadil.infradead.org;
	Mon, 29 Jun 2026 14:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=CxLFtvCxdYSFAPcpJcazY/yhqcVAil9tTOJddYaijQc=; b=agnbXaw7W6iIk3t/4Y3eqOO8pg
	CoMcWQZx4W2Poac0qZqv4pBg7yLlWpjQRtyG360WMW9EDCt4Ur3KC/wr8ckqkY6ESYdwltsXXQoEK
	p4wYdS/rMbREGRNdG2MUnP9ignscw0eQGAfIEJF3vlX9kAMeWqKmGH2W/UsBda8O6+QYR/o78b8/4
	J8N//jEIp11tEWgWBfFGEqKqZzwSbZZb4wuHISOwqq6BmrSO5rNUANfKdT464ZiLHAl08/l1u0oQB
	Bzwx1zMC7US6ce/QSVJr0ndl4dHNzmKzBrr03DPB+gCQ37BHMU/cfNPqu+RGbW29hdziyfypDXfz0
	glHrQz3g==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weD9N-000000017j6-1dMH
	for linux-mtd@lists.infradead.org;
	Mon, 29 Jun 2026 14:39:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 16D754E407AE;
	Mon, 29 Jun 2026 14:39:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE14B5FF96;
	Mon, 29 Jun 2026 14:39:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F59C106F1891;
	Mon, 29 Jun 2026 16:39:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743985; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CxLFtvCxdYSFAPcpJcazY/yhqcVAil9tTOJddYaijQc=;
	b=dhEFk/h4ct5Td/9XznMsILliAmNzGCJ5e8ziQJ1+kPtNdY+10p/ebVZt4TEOUx1UaWlDfm
	daijYsWoCHi1YxN+tXbsX905cs8syjNUocoaCzo4r+tjiDwM1T2fOpRuVSOwIfTljG5ZhI
	rWA7lWHEtDSyUETGuHqywHd8Hl+/drq5NKec+W7afCDCtxAMn8wG8/3e7e2N1p7Za/2QXX
	B9VtbBUiaBesqCroRSQQt7LiL4bEklZlFmQlpuHXaov00fFV4oliIh2YrEh8nXvXKb9aQ3
	9pPTUNFltz9a5LBL503q81BRqCmZv4GGFXh0SGbLA0qQgFdUOgbRlxmM66akgg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Paul Cercueil <paul@crapouillou.net>, 
 Harvey Hunt <harveyhuntnexus@gmail.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Pengpeng Hou <pengpeng@iscas.ac.cn>
In-Reply-To: <20260615063332.48127-1-pengpeng@iscas.ac.cn>
References: <20260615063332.48127-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] mtd: rawnand: ingenic: handle ECC clock enable
 failures
Message-Id: <178274398430.256048.6316758564651286522.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:39:44 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_153953_775441_B17ADC7F 
X-CRM114-Status: UNSURE (   6.68  )
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

T24gTW9uLCAxNSBKdW4gMjAyNiAxNDozMzozMiArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IGluZ2VuaWNfZWNjX2dldCgpIG9idGFpbnMgYSBwcm92aWRlciBkZXZpY2UgcmVmZXJlbmNlIGFu
ZCB0aGVuIGVuYWJsZXMKPiB0aGUgRUNDIGNsb2NrIGJlZm9yZSByZXR1cm5pbmcgdGhlIEVDQyBo
YW5kbGUuCj4gCj4gVGhlIGNsa19wcmVwYXJlX2VuYWJsZSgpIHJldHVybiB2YWx1ZSBpcyBjdXJy
ZW50bHkgaWdub3JlZC4gIElmIGVuYWJsaW5nCj4gdGhlIGNsb2NrIGZhaWxzLCB0aGUgZnVuY3Rp
b24gc3RpbGwgcmV0dXJucyB0aGUgRUNDIGhhbmRsZSBhbmQga2VlcHMgdGhlCj4gcHJvdmlkZXIg
ZGV2aWNlIHJlZmVyZW5jZSBldmVuIHRob3VnaCB0aGUgYWNxdWlyZSBvcGVyYXRpb24gZGlkIG5v
dAo+IGNvbXBsZXRlLgo+IAo+IFsuLi5dCgpBcHBsaWVkIHRvIG10ZC9maXhlcywgdGhhbmtzIQoK
WzEvMV0gbXRkOiByYXduYW5kOiBpbmdlbmljOiBoYW5kbGUgRUNDIGNsb2NrIGVuYWJsZSBmYWls
dXJlcwogICAgICBjb21taXQ6IDFhOGIyOTUxYmEzYzM1ODI0ZmY0ZGYwZWE3ZDlmN2E1NTRjOTY0
YTIKClBhdGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdp
bGwgYmUKcGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFp
bnMgYnkgdGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
