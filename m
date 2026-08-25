Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C209C61DBD
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Aug 2026 12:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8IwP4qB8BVYyu/nBvC7E+PjHGvrUYmSN/eey1BgFhc=; b=jzp1sGIngsN5Jd
	i41NdiHP8NbnFLKMF0K3nHlmW0Vby2BF6lzsrNmI7j9EafhyvpEmJ2Q9uzyr76NZoJTknbqMlkrWd
	D/uDogpUrqutMiDK6meGrs1ZYQTRqLFa0GI3J3wP78ChUkbs6xBVqg092S/Z7Yuf4N6iboB4qG29m
	4SmMakl9oTI4pJi3EehhL5QwWya4tt4urahIlpSjNqbDQpEJ9l5owYXhmDpVdCWtPEP89A8d3IOO+
	1BuhYNkg8myXPKcsCuMEBfUmqEjRAPxouNc/9XAmEx/4/iGbx/af55n0UfvN8M2f3Qu0p0fJSm0oE
	oLQMC03sriikS4qbZGxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq6r-00000000kWP-0saV;
	Tue, 25 Aug 2026 12:18:33 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyq6o-00000000kVs-37Jb
	for linux-mtd@lists.infradead.org;
	Tue, 25 Aug 2026 12:18:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 26B8C4E412E9;
	Tue, 25 Aug 2026 12:18:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EE895604C4;
	Tue, 25 Aug 2026 12:18:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E826711C792C9;
	Tue, 25 Aug 2026 14:18:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787660308; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8o1oXJrqZncv1dN01fPRKLnSnmcXHT6RXTZDKgnyQhI=;
	b=xSl2fH+UrxAw5b3PgX/eBormBKdhWxMtBm3ZZWaBiNDZlPvZo2gf+ySuMG9sRueramrQox
	zq/CHoceB4v8tIKG2BBNtCFGtFKL1HesmsDXA3Xffmrr3nmxXNVN64hBYYddacEd0VE2Yd
	9Lfl2eAym8MYp4atUhP6NrzWx7tte6HYuarTUmTKUgN7vMC6cfjTJTblOaVHtO7lhn2wRk
	2xlR8up9z1GLj/l3LwR72kPh7hHDAiUoIFfKhXjiAgVHzesXyVEPfTb9l2rG5OzP19gBdb
	pDq/WEa7Gj4GuOlhu9C72kegle8jYoUcHykx39ZrE7SPf+ql2t02fr+9Y88CYA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Takahiro
 Kuwano <takahiro.kuwano@infineon.com>,  Richard Weinberger
 <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  stable@vger.kernel.org,  Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: core: Unprepare after interrupted
 RWW wait
In-Reply-To: <20260819140337.36775-3-runyu.xiao@seu.edu.cn> (Runyu Xiao's
	message of "Wed, 19 Aug 2026 22:03:37 +0800")
References: <0a15f6e8-f1ca-4945-9bd5-2b64a2802a58@linaro.org>
	<20260819140337.36775-1-runyu.xiao@seu.edu.cn>
	<20260819140337.36775-3-runyu.xiao@seu.edu.cn>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 25 Aug 2026 14:18:19 +0200
Message-ID: <87zeyagzqs.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_051830_926730_33BC585B 
X-CRM114-Status: UNSURE (   8.65  )
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

SGkgUnVueXUsCgpPbiAxOS8wOC8yMDI2IGF0IDIyOjAzOjM3ICswOCwgUnVueXUgWGlhbyA8cnVu
eXUueGlhb0BzZXUuZWR1LmNuPiB3cm90ZToKCj4gc3BpX25vcl9wcmVwX2FuZF9sb2NrKCkgY2Fs
bHMgc3BpX25vcl9wcmVwKCkgYmVmb3JlIHdhaXRpbmcuIElmIHRoZSB3YWl0Cj4gaXMgaW50ZXJy
dXB0ZWQsIHRoZSBjb250cm9sbGVyIHNldHVwIGlzIGxlZnQgYWN0aXZlLgo+Cj4gQ2FsbCBzcGlf
bm9yX3VucHJlcCgpIGJlZm9yZSByZXR1cm5pbmcgYW4gZXJyb3IgZnJvbSBlYWNoIGhlbHBlci4K
Pgo+IEZpeGVzOiA3NGRmNDNiM2Y2MjYgKCJtdGQ6IHNwaS1ub3I6IEVuaGFuY2UgbG9ja2luZyB0
byBzdXBwb3J0IHJlYWRzIHdoaWxlIHdyaXRlcyIpCj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmcKPiBTaWduZWQtb2ZmLWJ5OiBSdW55dSBYaWFvIDxydW55dS54aWFvQHNldS5lZHUuY24+Cj4K
PiBDaGFuZ2VzIGluIHY0Ogo+IC0gQWRkIHRoZSBjbGVhbnVwIGZvciBpbnRlcnJ1cHRlZCBSV1cg
d2FpdHMgYXMgYSBzZXBhcmF0ZSBwYXRjaC4KPiAtIFVzZSB0aGUgb3JpZ2luYWwgUldXIGxvY2tp
bmcgY29tbWl0IGluIEZpeGVzLgoKVGhlcmUgaXMgYWxyZWFkeSBhIHBlbmRpbmcgcGF0Y2ggZm9y
IHRoYXQgcGFydDoKCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC84N282ZjdtemJx
LmZzZkBib290bGluLmNvbS9ULyNtNjllMzg5ZjcwZWIzZTM0YzA1NzNiZjI4OWNiMDUwODI1ZjE0
YjUxNgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
