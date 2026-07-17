Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F1D9C44515
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D1deCNdIn1pFbR63vWR8NeslGaxD+dFFV8MpOgotxAg=; b=nLOcY7J7znd8ym
	Y5YNrZ+5nT+DR+mzOPIfl1RMkkdvUhQdlcVJaOPYIG9EDS8hburmzFE9kfNyeFs5NjjYnrkkIJUKI
	thWiKrYYaz7+OHmwvdv8kN/J17DahOlJqZGJvPSGUglU/fXIEm0BIBrtUi4n4Eu9j3l4W+o/PaB7V
	Gnxkp4ediPwSl1pXvO62m6avpqrl899jDn5PH8OQgn86NZQWp3xOiopn7sUXNg4Y7Yq+Fh8t8buxq
	dnB4736xOWia5BxdrrWccDQT2twSKwXdyNLxzZ9OpN28QPsTs+c15zK9tw61R2fjVNy3cB0ghISs0
	764ZkyjEU0Lmxie+5SoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkoA-00000002ejk-0AQZ;
	Fri, 17 Jul 2026 15:49:02 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkko6-00000002ehk-4AeK
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:49:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5EB044E40E1F;
	Fri, 17 Jul 2026 15:48:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3320C60361;
	Fri, 17 Jul 2026 15:48:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BBCA11BD091E;
	Fri, 17 Jul 2026 17:48:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784303336; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QbUDrpweXBkXnpB+1RVzuMysgABZvGWpm0FeF9Xeg9k=;
	b=gNuVuP6+VXY006U6LPgTO77zhT/M2ClBPpY4c2gNyVydZzTrONZL55waOlWjuXi630PmQL
	00QcQ5OJmTGV7cLYkWkux46lDD7burZYmT179kVrgs3Yj40U316ofgxqUBo8T2fg7G5FWq
	ssWj1llL2r6AQwimdg2l9k7VkD2CrR7UsXEzCCAMWifCgRH0VKwsY7PBWxXve9ePU/Ipps
	AdO48TjQe7ufoCHw5drz3KevVS5u3n2pYrY7KBHgPkaiosaujPlitfSI0pNntmyKgFyQZm
	kJ7V6t6dW5nmJbxUMVpBfvKYONZ4Z1BcBgL88Ndtkh4JBsnoAaFjTcNZXyPgjQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>, 
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
In-Reply-To: <20260708014712.99760-1-pengpeng@iscas.ac.cn>
References: <20260708014712.99760-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH v2 RESEND] mtd: nand: realtek-ecc: add missing
 MODULE_DEVICE_TABLE()
Message-Id: <178430333433.4128272.14238871340808286831.b4-ty@bootlin.com>
Date: Fri, 17 Jul 2026 17:48:54 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084859_182566_072014A5 
X-CRM114-Status: UNSURE (   6.50  )
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

T24gV2VkLCAwOCBKdWwgMjAyNiAwOTo0NzoxMiArMDgwMCwgUGVuZ3BlbmcgSG91IHdyb3RlOgo+
IFRoZSBSZWFsdGVrIGV4dGVybmFsIEVDQyBlbmdpbmUgZHJpdmVyIGhhcyBhbiBPRiBtYXRjaCB0
YWJsZSB3aXJlZCBpbnRvCj4gaXRzIHBsYXRmb3JtIGRyaXZlciwgYnV0IHRoZSB0YWJsZSBpcyBu
b3QgZXhwb3J0ZWQgd2l0aAo+IE1PRFVMRV9ERVZJQ0VfVEFCTEUoKS4KPiAKPiBXaGVuIHRoZSBk
cml2ZXIgaXMgYnVpbHQgYXMgYSBtb2R1bGUsIHRoZSBtaXNzaW5nIE9GIG1vZHVsZSBhbGlhcwo+
IHByZXZlbnRzIGF1dG9tYXRpYyBtb2R1bGUgbG9hZGluZyBmcm9tIHRoZSBjb21wYXRpYmxlIHN0
cmluZy4KPiAKPiBbLi4uXQoKQXBwbGllZCB0byBuYW5kL25leHQsIHRoYW5rcyEKClsxLzFdIG10
ZDogbmFuZDogcmVhbHRlay1lY2M6IGFkZCBtaXNzaW5nIE1PRFVMRV9ERVZJQ0VfVEFCTEUoKQog
ICAgICBjb21taXQ6IDViMjQ0NGI0ZDU3NWQ4MTE3ODA5YzU3ODAxNTYyZWYzN2NhMmQ0YWYKClBh
dGNoZShzKSBzaG91bGQgYmUgYXZhaWxhYmxlIG9uIG10ZC9saW51eC5naXQgYW5kIHdpbGwgYmUK
cGFydCBvZiB0aGUgbmV4dCBQUiAocHJvdmlkZWQgdGhhdCBubyByb2JvdCBjb21wbGFpbnMgYnkg
dGhlbikuCgpLaW5kIHJlZ2FyZHMsCk1pcXXDqGwKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
