Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8DED78779
	for <linux-mtd@archiver.kernel.org>; Thu, 21 Nov 2024 14:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypDbSoYu48su8fv26G1AQpnzn5ik0CDqVzyURsS88vo=; b=1iDGV1bZ5RJnhP
	mRoPIgZM/AIwhwqtujHugsWleGCuYVY0LmW29OG30tLaJXaAW8/fYbHayHogxiUB0zUOOGx+fd3bd
	2teIt/JvrUcelo+z4F5hZqM0P9RfRNo8/6yUk1tcK3rXK6Bt8HLa0LrbL3kviPKgBkEYJrlvgZUIx
	nuQyNi55i1P9YFU7ayy7TbNUfUtjH2viGx3RrSui0FwqLu1mX3sxjC+E+kZISLFvc1mAmWtiGlAQP
	WqofHpYn/pq9Vbe9PiGM7zeYa+hLPddqhs2s5RwG9FEcQ/mnrqg7SwYDSIn9kK8+eJZPJ/ystkykJ
	SrNqBKStAwqhCXXaTREg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8Y7-00000000Gcu-2KfE;
	Thu, 21 Nov 2024 14:52:51 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE8XH-00000000GR3-2rXq
	for linux-mtd@lists.infradead.org;
	Thu, 21 Nov 2024 14:52:01 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21D37FF809;
	Thu, 21 Nov 2024 14:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732200714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L70ih0b5CGIYxQxsmUvq4AV/q7xqEhUmZA/jzOP0hCM=;
	b=Ifi4ZNohp5429Hhl6OSzm3pxgOJVPc4rEMMeytYsEMwjgUIR5PUzdEcPXTCnGcAmASqpxv
	Z3hdqsRr6daakAMQGVDu4bCuK1c2+U68Nolg07pU4x1x7qP4SKUwUoXqx6G+JGT6OeOMug
	T4bWxbFJIw93ti+/UQjcxjcTZyg+WEBkUQbE+hTMZb2V08bTsCuMQ5kIq57IaZR+/rm3vD
	L7G9ek1h84LmjvWdc0dez6LxDNivrXf0ucNtyBPIBNPZGd3nKZ+vUNPWGmns8G5KuJkgCr
	MckBL+M0S4OWh/A2s7DPRSXRj3wCdtD4cPhkCZ/bx/XjgLStgEXoPqnHLO6qBA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bastien Curutchet <bastien.curutchet@bootlin.com>,  Santosh Shilimkar
 <ssantosh@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v4 00/10] Implement setup_interface() in the DaVinci
 NAND controller
In-Reply-To: <72a0e0a5-c44c-4e92-9f91-e200900e3eed@kernel.org> (Krzysztof
	Kozlowski's message of "Thu, 21 Nov 2024 11:23:51 +0100")
References: <20241115132631.264609-1-bastien.curutchet@bootlin.com>
	<72a0e0a5-c44c-4e92-9f91-e200900e3eed@kernel.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 21 Nov 2024 15:51:51 +0100
Message-ID: <87ed34vdvc.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241121_065159_847529_3491573B 
X-CRM114-Status: UNSURE (   7.81  )
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

SGVsbG8gS3J6eXN6dG9mLAoKT24gMjEvMTEvMjAyNCBhdCAxMToyMzo1MSArMDEsIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cgo+IE9uIDE1LzExLzIwMjQgMTQ6
MjYsIEJhc3RpZW4gQ3VydXRjaGV0IHdyb3RlOgo+PiBIaSBhbGwsCj4+IAo+PiBUaGlzIHBhdGNo
IHNlcmllcyBhaW1zIHRvIGltcGxlbWVudCB0aGUgc2V0dXBfaW50ZXJmYWNlKCkgb3BlcmF0aW9u
IGluCj4+IHRoZSBEYVZpbmNpIE5BTkQgY29udHJvbGxlciB0byBlbmFibGUgdGhlIHVzZSBvZiBh
bGwgT05GSSBtb2RlcyBhbmQKPj4gaW1wcm92ZSB0aGUgTkFORCBhY2Nlc3Mgc3BlZWQuCj4+IAo+
PiBQQVRDSCA2IGRlcGVuZHMgb24gUEFUQ0ggMS0yLTMtNC01Cj4+IFBBVENIIDEwIGRlcGVuZHMg
b24gUEFUQ0ggNi04LTkKPgo+IFRoYXQncyBhIGJpdCB0b28gbWFueSB0byBnbyB2aWEgc2VwYXJh
dGUgdHJlZSwgc28gSSdsbCBwcm92aWRlIHRoZW0gdmlhCj4gc3RhYmxlIHRhZyB0byBNaXF1ZWwv
TVRELgoKWWVwLCB3b3JrcyBwZXJmZWN0bHkgZm9yIG1lLgoKQ2hlZXJzLApNaXF1w6hsCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
