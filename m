Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD97C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  4 Jan 2022 01:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bHuJPcjx8uJsj0bhjS12gEvFQdpVYzTr+xR+0WOOsk=; b=YFpeY0Esg/QL6u
	haOvRsTucvx8+YRmkvAe5rIKflgWw5hsFc87onzSiplTcJHhSIwoLL1GgdKtiunYddfLvS7zZt7/M
	XKfPyNt85SIjt0z+yysiaB4CQOpWy3mu88i7/bk04EXPy883pziYIO984wva/We+R13zFfl1GHoJV
	1Pk+pQ4jqScNJsDv4+1qIWB94tgFjAP7YZ+Vj5IbD5YP5U/8zMJQyzHRNfObaVr/Lbmm5GEikPgnY
	uNvND0uLNYsOVTbk5etnOVzRL8pxdlcn7ecdr27stA998TJGlr6i0osXyQOZ3OpIOMfvFIS6GB+Qm
	7MLWfWTvDbrKm3JlivhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4YCR-00AAY1-HX; Tue, 04 Jan 2022 01:01:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4YCP-00AAWL-5j
 for linux-mtd@lists.infradead.org; Tue, 04 Jan 2022 01:01:14 +0000
Received: by mail-lf1-x129.google.com with SMTP id j11so76451047lfg.3
 for <linux-mtd@lists.infradead.org>; Mon, 03 Jan 2022 17:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=drummond.us; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=FhCziXSDIVqEHeqdeTNAEnAmaxA2oTV83a7FYCmISUs=;
 b=F3tiUyofNHmKDjVKk2XPN3VpXToJGh87luR1ns6i8fTdNqA4z8KYh9xx+TznQjoZjx
 58TqlIC/Vj4aNPJdMn0Qd4bZbVRnPNzaiJsnWmPeQALXVgD8VLO6jDj+VHazpPTPSB/1
 HWADwSJX1ZZu/dty1WaUP2KxY3Sw8VXiOiuQVgSrT0HZK6iCenP0DqyTmiLJ/HLXpAkt
 XV2/Qm1/GSgSHGlTEcr7ZdTgUQFmUi8gJrn/bzNGljU+2Io9kcqa3WpeXo9FQyxn1hSi
 ZpXEpEI9CKyeqqjCKo8dnjdUhHcpVlmwW0nTMezbw0pCmHnuNbP25JEqrHIUEfMvPFzO
 WX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=FhCziXSDIVqEHeqdeTNAEnAmaxA2oTV83a7FYCmISUs=;
 b=fyUz1wdBIhOl0P09qe5QjICnd2EieRV5lorU1LVPZzIykTXYsKpajaixmtFUvHNVPb
 5X7ahjdR0+Z1Z8IwO7WrdR0H0q8TxxRT7jqgtZ+3uPHyBWGrzpW0k3TM7Ft5bnbyUEq5
 64Cjm+2p+bsV860q0LABkFOL2f0eszf2iA6VPakUxd8NahU6ynF1ZxJlN88suwk+yV2A
 /OLqnmDRgFi03zgDBidp9vwDC5J+Tj/6Nhcywzs87LUAO8Cotd3ZsSJVaxYfeux2jKhk
 9Muj+v2NUvfsOlhRTTG93nUs61o1Coi78sCA5fsVJHy/FpR9mZTyP/HV5/T8WXZ9jIVm
 G0pw==
X-Gm-Message-State: AOAM532xSWHoiQQwMExbV5k3zAmEe6plI7BirORJ0//zFzeT7WZImxdR
 OsUFHjYvoZlsFY164saj72DrdNpFuUVMZotoV9R13g==
X-Google-Smtp-Source: ABdhPJwcgc1Ga1+rLCxU1YpJid0/47ry1/i0pez4n8tVA8yyD2kMd606iUiB5mCcPG+LT0NFgOGKtjbLaTH04xucoSo=
X-Received: by 2002:a05:6512:2083:: with SMTP id
 t3mr41569950lfr.595.1641258069695; 
 Mon, 03 Jan 2022 17:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20220103181956.983342-1-walt@drummond.us>
 <YdNE6UXRT02135Pd@zeniv-ca.linux.org.uk>
In-Reply-To: <YdNE6UXRT02135Pd@zeniv-ca.linux.org.uk>
From: Walt Drummond <walt@drummond.us>
Date: Mon, 3 Jan 2022 17:00:58 -0800
Message-ID: <CADCN6nx4VWtR79TBDTENRExjsa=KAGuUpyz06iu2EGmSTPyc+Q@mail.gmail.com>
Subject: Re: [RFC PATCH 0/8] signals: Support more than 64 signals
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: aacraid@microsemi.com, anna.schumaker@netapp.com, arnd@arndb.de, 
 bsegall@google.com, bp@alien8.de, chuck.lever@oracle.com, bristot@redhat.com, 
 dave.hansen@linux.intel.com, dwmw2@infradead.org, dietmar.eggemann@arm.com, 
 dinguyen@kernel.org, geert@linux-m68k.org, gregkh@linuxfoundation.org, 
 hpa@zytor.com, idryomov@gmail.com, mingo@redhat.com, yzaikin@google.com, 
 ink@jurassic.park.msu.ru, jejb@linux.ibm.com, jmorris@namei.org, 
 bfields@fieldses.org, jlayton@kernel.org, jirislaby@kernel.org, 
 john.johansen@canonical.com, juri.lelli@redhat.com, keescook@chromium.org, 
 mcgrof@kernel.org, martin.petersen@oracle.com, mattst88@gmail.com, 
 mgorman@suse.de, oleg@redhat.com, pbonzini@redhat.com, peterz@infradead.org, 
 rth@twiddle.net, richard@nod.at, serge@hallyn.com, rostedt@goodmis.org, 
 tglx@linutronix.de, trond.myklebust@hammerspace.com, 
 vincent.guittot@linaro.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
 ceph-devel@vger.kernel.org, kvm@vger.kernel.org, linux-alpha@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-m68k@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-nfs@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-security-module@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_170113_449803_3553E206 
X-CRM114-Status: GOOD (  14.69  )
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

SSBzaW1wbHkgd2FudGVkIFNJR0lORk8gYW5kIFZTVEFUVVMsIGFuZCB0aGF0IG5lY2Vzc2l0YXRl
ZCB0aGlzLiBJZgp0aGUgbGltaXQgb2YgMTAyNCBydCBzaWduYWxzIGlzIGFuIGlzc3VlLCB0aGF0
J3MgYW4gZXh0cmVtZWx5IHNpbXBsZQpjaGFuZ2UgdG8gbWFrZS4KCgoKT24gTW9uLCBKYW4gMywg
MjAyMiBhdCAxMDo0OCBBTSBBbCBWaXJvIDx2aXJvQHplbml2LmxpbnV4Lm9yZy51az4gd3JvdGU6
Cj4KPiBPbiBNb24sIEphbiAwMywgMjAyMiBhdCAxMDoxOTo0OEFNIC0wODAwLCBXYWx0IERydW1t
b25kIHdyb3RlOgo+ID4gVGhpcyBwYXRjaCBzZXQgZXhwYW5kcyB0aGUgbnVtYmVyIG9mIHNpZ25h
bHMgaW4gTGludXggYmV5b25kIHRoZQo+ID4gY3VycmVudCBjYXAgb2YgNjQuICBJdCBzZXRzIGEg
bmV3IGNhcCBhdCB0aGUgc29tZXdoYXQgYXJiaXRyYXJ5IGxpbWl0Cj4gPiBvZiAxMDI0IHNpZ25h
bHMsIGJvdGggYmVjYXVzZSBpdOKAmXMgd2hhdCBHTGliYyBhbmQgTVVTTCBzdXBwb3J0IGFuZAo+
ID4gYmVjYXVzZSBtYW55IGFyY2hpdGVjdHVyZXMgcGFkIHNpZ3NldF90IG9yIHVjb250ZXh0X3Qg
aW4gdGhlIGtlcm5lbCB0bwo+ID4gdGhpcyBjYXAuICBUaGlzIGxpbWl0IGlzIG5vdCBmaXhlZCBh
bmQgY2FuIGJlIGZ1cnRoZXIgZXhwYW5kZWQgd2l0aGluCj4gPiByZWFzb24uCj4KPiBDb3VsZCB5
b3UgZXhwbGFpbiB0aGUgcG9pbnQgb2YgdGhlIGVudGlyZSBleGVyY2lzZT8gIFdoeSBkbyB3ZSBu
ZWVkIG1vcmUKPiBydCBzaWduYWxzIGluIHRoZSBmaXJzdCBwbGFjZT8KPgo+IGdsaWJjIGhhcyBx
dWl0ZSBhIGJpdCBvZiB1dHRlcmx5IHBvaW50bGVzcyBmdXR1cmUtcHJvb2ZpbmcuICBTbyAidGhl
eQo+IGFsbG93IG1vcmUiIGlzIG5vdCBhIGdvb2QgcmVhc29uIC0gbm90IHdpdGhvdXQgYSBwbGF1
c2libGUgdXNlLWNhc2UsCj4gYXQgbGVhc3QuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
