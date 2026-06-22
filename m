Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4685CDB46B
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jun 2026 09:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3KaFYBEaL6d8mIRPlaDbn15vnVzZWwZhw7/5gJfEgUM=; b=riPIyMDzhVrkik
	rLwLe+PQDGB9ThCZq7wr0lXM5HWLY7/v4oPYtIwOwFOq8k39qA68HQuuRGrWMQxgwYfZaQnlVCs7L
	WVM20c7wCLHxLE80yCbO1vgvj8WM6eSgKMqaOk0BWy2E2s4ZfxE3tu5lb14gCHK69Ym0gOMXfbFph
	hUnnkkwrH+1ayIhO5h2k6YEI9rKXFC/swsP/P7IMLOAEY3riOLnLtPIi16EFXx0tHbx5WV6sL0Ms3
	0IMMqzJreWULhqDumB5M/P0HBW/1OhjElw/gRrsXwER4kR+FYhdrnKyqAu/DhUoncRoHYVuUTz6HS
	NpUadt+dg2TZ0lJsU5Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaoR-00000004kCu-2wcJ;
	Mon, 22 Jun 2026 09:19:27 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbaoN-00000004kBI-3Ja3
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jun 2026 09:19:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 821234E405BD;
	Mon, 22 Jun 2026 09:19:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FA3E601BB;
	Mon, 22 Jun 2026 09:19:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 15F38106C8977;
	Mon, 22 Jun 2026 11:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782119957; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2beCXGViMxXHYunWxwL3jEFdLiqEppx5yNhwT5blhMU=;
	b=So4XebZLUF8VcpCvrbzADEiTaH4X+w5ambDD5vuB/T+0LvyO6nQuzjxX1umWek570HECiX
	GioMDkFx1gGPLp8zfKN4eQIniqfzg7cOiH20n2UkhGnJCLOzb2PX3kiSwie8G3xnfNYgMJ
	b4AjAaJV/0EyVMSHvI63nVPVQ+/DuoV/et+3pz7hdMiNH/yeAUp84TXvMK86Z6a8g2VpXU
	uPfgUYNclROiOrBF0rwT/NiqRcX9YhswxhaFDvKyY6hsVOCFYPrFSCcXLLsKdSe80YRaaN
	2h0tIVQegpCfAf9JdWGRfWZ9eiN18F5tFcjnpaiUwNx04Tvb0U5hICDolAPKGg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdswap: remove debugfs stats file on teardown
In-Reply-To: <20260615090850.80659-1-pengpeng@iscas.ac.cn> (Pengpeng Hou's
	message of "Mon, 15 Jun 2026 17:08:50 +0800")
References: <20260615090850.80659-1-pengpeng@iscas.ac.cn>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 22 Jun 2026 11:19:14 +0200
Message-ID: <87y0g72ar1.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_021923_963025_CD6ACE2F 
X-CRM114-Status: UNSURE (   6.17  )
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

SGVsbG8sCgo+IEBAIC0xNDYzLDYgKzE0NjUsOCBAQCBzdGF0aWMgdm9pZCBtdGRzd2FwX3JlbW92
ZV9kZXYoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKmRldikKPiAgewo+ICAJc3RydWN0IG10ZHN3
YXBfZGV2ICpkID0gTVREU1dBUF9NQkRfVE9fTVREU1dBUChkZXYpOwo+ICAKPiArCWlmICghSVNf
RVJSX09SX05VTEwoZC0+ZGVidWdmc19zdGF0cykpCj4gKwkJZGVidWdmc19yZW1vdmUoZC0+ZGVi
dWdmc19zdGF0cyk7CgpQbGVhc2UgY2hlY2sgZGVidWdmc19yZW1vdmUoKSBpbXBsZW1lbnRhdGlv
biwgdGhlICdpZicgY29uZGl0aW9uCmlzIGFscmVhZHkgaGFuZGxlZCBhbmQgdGhlcmVmb3JlIGRv
ZXMgbm90IG5lZWQgdG8gYmUgZG9uZSBoZXJlLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
