Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93175C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 07:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMSPvxDE74BgH57pjp9Zv3jxuSNTL3IpIq6gyOtqxnc=; b=ztptgbEsExw4lvyQawa/JtTxCK
	v3TgwHfhpFfQr79/AFaZljpiQU98Xsv/B2oZQ760g3d0dcdL5VTDWmQ0Xb9TMkTV48nZhY5OecepB
	cwANTniv6OtFIbJ3POTv3ctXzCACtUOTu3xkipPCVO7urybxISAE4sNda/XnWdINB2N1sX/yxGxob
	vO+C/UmnyjuZRwLyv9QO5X/zR8QIUHIyEqgCbera1OviJHn2eRra2/Anq4PSL1SQZH9Vef9CR3Bbf
	u1T7RHpFXAt/I/9QwFXp77sy45V7fyxNAr8BlEEw5SQzkOEQs/SBVrdVfP24mrnWpCl/N35/2K9Wi
	HuCvVNnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtPV-00Bu10-ID; Thu, 14 Jul 2022 07:37:21 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBtPS-00Btwg-Ts
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2022 07:37:20 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 1201A22246;
	Thu, 14 Jul 2022 09:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657784230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sj8dYrzAUpWONlRlYvGhP0wqfCyH1Y3205lfjeCKT90=;
	b=ryPrkb2gY1Qh9i3w6MtJUKWW9WlpibTjQVNXg/M3kLzmmbTNuZLkMG4BWh3I7/pleZdGGb
	6E6OeFXtOV608dMhZHC5cMj1kMffNjgYmC+aRyh2mZDlu3zavSlOl7IrVMcdeFTaB845R/
	gpBxhDd7bTcfJgF/dq86M2n8p6CLZzs=
MIME-Version: 1.0
Date: Thu, 14 Jul 2022 09:37:09 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav
 <p.yadav@ti.com>, Jamie Iles <quic_jiles@quicinc.com>, Graeme Gregory
 <quic_ggregory@quicinc.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: spi-nor: winbond: add support for W25Q512NW-IQ
In-Reply-To: <20220713211210.1945044-1-quic_jaehyoo@quicinc.com>
References: <20220713211210.1945044-1-quic_jaehyoo@quicinc.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <4d4a2abab1508fe80e36c2e524f98ed8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_003719_138184_58C006FA 
X-CRM114-Status: UNSURE (   7.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGksCgp0aGFua3MgZm9yIHRoZSB1cGRhdGUuCgpBbSAyMDIyLTA3LTEzIDIzOjEyLCBzY2hyaWVi
IEphZSBIeXVuIFlvbzoKPiBBZGQgc3VwcG9ydCBmb3IgV2luYm9uZCBXMjVRNTEyTlctSVEvSU4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBKYWUgSHl1biBZb28gPHF1aWNfamFlaHlvb0BxdWljaW5jLmNv
bT4KPiBMaW5rOiAKPiBodHRwczovL3d3dy53aW5ib25kLmNvbS9yZXNvdXJjZS1maWxlcy9XMjVR
NTEyTlclMjBSZXZCJTIwMDcxOTIwMjEucGRmCj4gUmV2aWV3ZWQtYnk6IEPDqWRyaWMgTGUgR29h
dGVyIDxjbGdAa2FvZC5vcmc+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAgKiBSZWZpbmVkIGNv
bW1pdCBtZXNzYWdlIChNaWNoYWVsKQo+IAo+IFRlc3QgcmVzdWx0IG9uIEFTVDI2MDAgU29DJ3Mg
U1BJIGNvbnRyb2xsZXI6Cj4gJCBjYXQKPiAvc3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2VzLzFlNjIw
MDAwLnNwaS9zcGlfbWFzdGVyL3NwaTAvc3BpMC4xL3NwaS1ub3IvamVkZWNfaWQKPiBlZjYwMjAK
PiAKPiAkIGNhdAo+IC9zeXMvYnVzL3BsYXRmb3JtL2RldmljZXMvMWU2MjAwMDAuc3BpL3NwaV9t
YXN0ZXIvc3BpMC9zcGkwLjEvc3BpLW5vci9tYW51ZmFjdHVyZXIKPiB3aW5ib25kCj4gCj4gJCBj
YXQKPiAvc3lzL2J1cy9wbGF0Zm9ybS9kZXZpY2VzLzFlNjIwMDAwLnNwaS9zcGlfbWFzdGVyL3Nw
aTAvc3BpMC4xL3NwaS1ub3IvcGFydG5hbWUKPiB3MjVxNTEybndxCj4gCj4gJCBoZXhkdW1wCj4g
L3N5cy9idXMvcGxhdGZvcm0vZGV2aWNlcy8xZTYyMDAwMC5zcGkvc3BpX21hc3Rlci9zcGkwL3Nw
aTAuMS9zcGktbm9yL3NmZHAKPiAwMDAwMDAwIDQ2NTMgNTA0NCAwMTA2IGZmMDEgMDYwMCAxMDAx
IDAwODAgZmYwMAo+IDAwMDAwMTAgMDA4NCAwMjAxIDAwZDAgZmYwMCBmZmZmIGZmZmYgZmZmZiBm
ZmZmCj4gMDAwMDAyMCBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYgZmZmZiBmZmZmIGZmZmYKPiAq
Cj4gMDAwMDA4MCAyMGU1IGZmZmIgZmZmZiAxZmZmIGViNDQgNmIwOCAzYjA4IGJiNDIKPiAwMDAw
MDkwIGZmZmUgZmZmZiBmZmZmIDAwMDAgZmZmZiBlYjQwIDIwMGMgNTIwZgo+IDAwMDAwYTAgZDgx
MCAwMDAwIDAyMzMgMDBhNiBlNzgxIGQ5MTQgNjNlOSAzMzc2Cj4gMDAwMDBiMCA3NTdhIDc1N2Eg
YmRmNyA1Y2Q1IGY3MTkgZmY1ZCA3MGU5IGE1ZjkKPiAwMDAwMGMwIGZmZmYgZmZmZiBmZmZmIGZm
ZmYgZmZmZiBmZmZmIGZmZmYgZmZmZgo+IDAwMDAwZDAgMGFmZiBmZmYwIGZmMjEgZmZkYwo+IDAw
MDAwZDgKCm1kNXN1bSBvZiB0aGlzIGZpbGUgaXMgbWlzc2luZy4KCkZvciB0aGUgcmVjb3JkOiB0
aGVyZSBpcyBzdGlsbCBhbiBvbmdvaW5nIGRpc2N1c3Npb24gb24gdGhlIHYxIG9mCnRoaXMgcGF0
Y2guCgotbWljaGFlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
