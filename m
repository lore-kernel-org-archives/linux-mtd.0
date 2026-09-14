Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB22C88E70
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Sep 2026 13:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8POeSLOP0t1bDnfqBcC3JdyLY0gYpNYA6zbspssK7M=; b=XaIevzwFVTSruJ
	+/meomB86pA/fp7CV8566Bs3dNOW/3P6b6ZhO8mC/xg6I2lrQdGCuDpIX83gejb21gCHvM+jv6wlN
	uU5LvjSE6d+YOMt2XYjGyQ0H95mKZfP8EciN9uh81ZbMPafqbfFMxz7F/Y1Vem49iEu7vwNs53yEG
	eLfOgBdM1iCBPyWw4OMySs5gVOJeWlzR8UdQkLIIs4jca3PR9ls0l32OvU6tMZGuCf/3h3UIG1Gve
	splW9pvE1nQxVWBTjDMPToZK4W5gNdqH20DCPG038wzyrhsWPhjFQYbwSqa/18r2+mf8t+ngrKdEE
	Sb4uB+NuOXaTO76gcdlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66T4-00000003hja-0tC5;
	Mon, 14 Sep 2026 13:11:30 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x66T0-00000003hgn-2Hxp
	for linux-mtd@lists.infradead.org;
	Mon, 14 Sep 2026 13:11:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E52421A0635;
	Mon, 14 Sep 2026 13:11:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AF7AD60323;
	Mon, 14 Sep 2026 13:11:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED17311C7AFE0;
	Mon, 14 Sep 2026 15:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789391479; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mZXhJAtzmuuuXlU9rBzQtuSa9QmpjCsIQYhnKWG9j90=;
	b=YpWGMQ6UbZG5fkZvLP4ZkOZw3aBPbmCdSLK74588bMJm+9FInTvn7SEvOSN8H+nsz6rQbI
	oUC/F2jMcEwEeZe3JMI85jS/009Col9icdoJy2bAMWU2geSfn0QJMTB9PChj558JxgOd9k
	es/39YrHisuiZYcoquXzHVN2+K2rl4p+E+52o8go0fle7lmSo3rouo62Sr6dENSWgu+hdQ
	+rW/l2zAcYd4egtxTvj6sRdA1R4oWVNm8JpqQ0Uv91jC2zwKom4bPZxAHKK0mFQW4MLyxD
	1zW8u6rchhxX8XMKlOtw4H5mfRyc3o/r5i6VlLJkQgzI9Leyjfw/LFNVKavq6w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Itai Handler" <itai.handler@gmail.com>,  <pratyush@kernel.org>,
  <linux-kernel@vger.kernel.org>,  <linux-mtd@lists.infradead.org>,
  <vigneshr@ti.com>,  <richard@nod.at>,  <takahiro.kuwano@infineon.com>,
  <stable@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: fix the lock left held by
 spi_nor_rww_start_exclusive()
In-Reply-To: <DLF1P95EJSHN.37NQ86W91QPUU@kernel.org> (Michael Walle's message
	of "Mon, 14 Sep 2026 14:41:16 +0200")
References: <20260914081149.1916589-1-itai.handler@gmail.com>
	<20260914081149.1916589-2-itai.handler@gmail.com>
	<87ld94owzj.fsf@bootlin.com> <DLF191CC4QMM.1SNYEHUFJ9GK2@kernel.org>
	<874ifsovtz.fsf@bootlin.com> <DLF1P95EJSHN.37NQ86W91QPUU@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Mon, 14 Sep 2026 15:11:14 +0200
Message-ID: <87tsnsnfkd.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_061126_734018_507918A7 
X-CRM114-Status: UNSURE (   9.47  )
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

T24gMTQvMDkvMjAyNiBhdCAxNDo0MToxNiArMDIsICJNaWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtl
cm5lbC5vcmc+IHdyb3RlOgoKPiBPbiBNb24gU2VwIDE0LCAyMDI2IGF0IDI6MzQgUE0gQ0VTVCwg
TWlxdWVsIFJheW5hbCB3cm90ZToKPj4gT24gMTQvMDkvMjAyNiBhdCAxNDoyMDowNSArMDIsICJN
aWNoYWVsIFdhbGxlIiA8bXdhbGxlQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+Pj4+IE1pY2hhZWws
IHNpbmNlIHdlIGFscmVhZHkgZ290IGEgY3ljbGUgd2l0aCBBSSB3YWxscyBvZiB0ZXh0IGp1c3Qg
dG8gdGVsbAo+Pj4+ICJmaXggdGhhdCBkYW1uIGNvbnZlcnNpb24iLCBjYW4gSSAob3IgeW91KSBh
cHBseSB0aGF0IG90aGVyIHBhdGNoLCBzbyB3ZQo+Pj4+IGNhbiBnZXQgcmlkIG9mIHRoZXNlPyBM
ZXQgbWUga25vdyB3aGF0IHlvdSBwcmVmZXIsIGFsdGhvdWdoIEkgZG9uJ3QKPj4+PiByZW1lbWJl
ciB3aGVyZSB0aGF0IHRocmVhZCBpcy4KPj4+Cj4+PiBJdCdzIGFscmVhZHkgaW4gc3BpLW5vci9u
ZXh0IHNpbmNlIGxhc3QgZnJpZGF5Lgo+Pj4KPj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L210ZC9saW51eC5naXQvbG9nLz9oPXNwaS1ub3IvbmV4dAo+
Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbXRkLzE3ODkxMzMxMTcwMS4xOTE1NjUx
LjQ3OTE2MjQyMTU3ODczOTYxODcuYjQtdHlAYjQvVC8jbWUzYjUxYTI0MjQ2OWE0ZDk3MjIwODll
MTg1NDdlODdmZGM2NWQ3YzkKPj4+Cj4+PiAtbWljaGFlbAo+Pgo+PiBTaW5jZSB0aGF0IG9uZSBp
cyAiYmlnIiBJIHdvdWxkIGhhdmUgbWVyZ2VkIGl0IHRocm91Z2ggYSBmaXhlcyBQUi4gSQo+Cj4g
QSBiaWcgb25lIG5vYm9keSBjYXJlZCB1bnRpbCB0aGUgcmlzZSBvZiBBSSBhZ2VudHMgYWN0aXZl
bHkgc2VhcmNoaW5nCj4gZm9yIGl0PyA6KQoKSSB1c2VkIHF1b3RlcyA7KSBCdXQgeWVhaCBpdCBp
cyBiaWcgaW4gdGhlIHNlbnNlIHRoYXQgaXQgaXMgYW4gb2J2aW91cwpicmVha2FnZSBhbmQgd2Ug
YXJlIGdvaW5nIHRvIGdldCAgbW9yZSBwZW9wbGUgcHJvcG9zaW5nIGEgZml4IGZvciBpdC4KCkkg
dXN1YWxseSBkbyBhIHNpbmdsZSBGaXhlcyBQUiBwZXIgY3ljbGUsIGFuZCB3aGF0IGNvbWVzIG5l
eHQgaXMgY2FycmllZAp0aHJvdWdoIHRoZSBtYWluIGNoYW5nZXMgUFIgZHVyaW5nIHRoZSBtZXJn
ZSB3aW5kb3cuIEkgd2lsbCB0YWcgYW5kIHNlbmQKdGhlIGZpeGVzIFBSIGluIGEgZmV3IGRheXMu
CgpNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
