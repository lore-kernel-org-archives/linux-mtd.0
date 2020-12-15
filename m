Return-Path: <SRS0=cBb+=FT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17526C4361B
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 15:51:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD2F5224F4
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Dec 2020 15:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD2F5224F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FQzCky13kocICn7Xw1aKkkm8xhujUt7RJrfSvhSHtBI=; b=dEPU1lHVrhn+gMwmsOcB5FN+S
	ZVKGzzkwaqqTxSJGiulZuTsGvc4MA7F2Jc2uBDLqdzFCGa80+3ZddoV+WVDR+LP5GHBWnthy9Jh6j
	aRXjOcDB74/u2xEfumCyr2gOYGqs/3GQ+c5Axdqd95Ide/Bn0TfOZSigjenAr5wBfqtz7PbPvuFJN
	8bMQS6G5kyiN9GfPVy3i0/HzPkV83q7mUcgjbNSKctnj7HkjvrQTJrhOzJfrPVc4vPRFaJERRA9OD
	V2yXNuhJ8Q0hNANifoyred3aF1i4+ByL8vFOtFgBa3rpkorRfCjS/LVNHVYuSMMYrGPgZN0FGH3HA
	0bEi8PkaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpCb8-0003KU-Us; Tue, 15 Dec 2020 15:50:46 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpCb5-0003IV-NF
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2020 15:50:44 +0000
Received: by mail-il1-x135.google.com with SMTP id 75so7598044ilv.13
 for <linux-mtd@lists.infradead.org>; Tue, 15 Dec 2020 07:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=60WHejw5fk0Df3r0360kfq53jS9ZRhFaDT0T+8JURpI=;
 b=kp6gaBId0N3SQcb/lB8CCcL9eB6drWipd+icD9/VVy56r5GhBjXOMmhlDyEfhqPhkk
 U5wwXR0jf9LV258weciApzCXj0SjUASbjYqOYjVaGQDZyIG/02EjQIgmlIXUPtazcotP
 POaj3LUuSosx/Iq7gZ8CRmtBgvD33ndwWjX/mz4AajCboKFMDnqQlPmOPCVibXYzKod4
 L2GqwDHHz40kHMxn7eQPnYDx9onI42lJWC01QolVWqmc8kLORT9aDnFqp7Fi0s1Wn4Ss
 CeyWjQnz7H327DYIeKtDbrxhARa16yAtfRa72T7j+g2/8EIUKgoqumVmDHYo4h1rdWe5
 J/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=60WHejw5fk0Df3r0360kfq53jS9ZRhFaDT0T+8JURpI=;
 b=F2waZRA70yeeUSMC4cWbKt0r6T8W+kuNjwmqN9jgwKOcdb4kZwIV5h41138DBh/aqM
 GrvOhm9aZJd+oUMU0yNaDV1k+m1UFEJ5BytK7TpMxkjZ86gYcwKLoSWXyq0yq+tLY+Pd
 PRqCfF8+AzF5BQyLsu9pDP6tEX+iXX6l5bjSdADs9e8Bvj8BTFhSld9amsw0jUwIBt6/
 0VuIoK6iMRlaBzCbZknG1dZ/orfh1JHZgwZiY3YNUNK4FmITmZpynzi4LfntDxN8eCz8
 PELCYITVg/OczraJl1136yNGyZGHibeG7TiRTbFfZjDziTrOBJ9DLt4q+HDXLgWkdQGr
 vRhw==
X-Gm-Message-State: AOAM533v4cm7og+hpVmbLSrigOcVL7Emzm7aX8vXPerc8wa8C2wdxKhz
 s+wT9cRmiAIPPmKswMomla3E4e9qVCTvWJ9Iojmiowyphqk=
X-Google-Smtp-Source: ABdhPJzTDnx90/JHztlSIf5KekA9WbvoILTXsvcfVz2qYmA6WTidixvY2AXEwie6vPeVnFC86gxJQXyAutiIcZLuOFY=
X-Received: by 2002:a92:d11:: with SMTP id 17mr42018897iln.84.1608047441344;
 Tue, 15 Dec 2020 07:50:41 -0800 (PST)
MIME-Version: 1.0
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
 <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
In-Reply-To: <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
From: David Schaefer <david.tillmann.schaefer@gmail.com>
Date: Tue, 15 Dec 2020 16:50:34 +0100
Message-ID: <CAK+FTGhhFCVM4wazP5epp9E9kPf7=iAYRCmwZECXmszBmRERzw@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_105043_817539_3091946B 
X-CRM114-Status: GOOD (  17.48  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

V2VsbCwgSSBub3cgd2FzIGJyYXZlIGVub3VnaCB0byB0cnkgdG8gd3JpdGUgdG8gdGhlIGJsb2Nr
IGRldmljZXMgd2l0aAp0aGUgbGFzdCBrZXJuZWwgYW5kIGl0IGZhaWxlZCwgaW8gZXJyb3IuCgpL
aW5kIHJlZ2FyZHMKCkFtIE1vLiwgMTQuIERlei4gMjAyMCB1bSAxODoxNiBVaHIgc2NocmllYiBE
YXZpZCBTY2hhZWZlcgo8ZGF2aWQudGlsbG1hbm4uc2NoYWVmZXJAZ21haWwuY29tPjoKPgo+IElm
IHRoaXMgaXMgYSByZWdyZXNzaW9uLCBob3cgY2FuIHdlIGNvbnRpbnVlIGhlcmU/IENhbiBJIGdp
dmUgaGFyZHdhcmUKPiBzcGVjcyBhbmQgbG9ncz8gSSBoYXZlIHNvbGRlcmVkIG9uIHRoZSBib2Fy
ZCB0byBhY2Nlc3MgVUFSVC4gSSBjYW4KPiBwcm92aWRlIGUuZy4gYm9vdCBsb2dzLgo+Cj4gL0Rh
dmlkCj4KPiBBbSBNby4sIDE0LiBEZXouIDIwMjAgdW0gMTY6MjAgVWhyIHNjaHJpZWIgUmljaGFy
ZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD46Cj4gPgo+ID4gRGF2aWQsCj4gPgo+ID4gLS0t
LS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gPiBJIGhhdmUgY2hlY2tlZCB0aGUga2Vy
bmVsIGNvbmZpZ3VyYXRpb24uIEZvciA0LjE1LjE4IEkgaGF2ZSB0aGVzZSBzZXR0aW5nczoKPiA+
ID4gQ09ORklHX01URF9OQU5EX0VDQz15Cj4gPiA+IENPTkZJR19NVERfTkFORD15Cj4gPiA+IENP
TkZJR19NVERfTkFORF9QWEEzeHg9eQo+ID4gPgo+ID4gPiBhbmQgZm9yIDQuMTYuMQo+ID4gPgo+
ID4gPiBDT05GSUdfTVREX05BTkRfRUNDPXkKPiA+ID4gQ09ORklHX01URF9OQU5EPXkKPiA+ID4g
Q09ORklHX01URF9OQU5EX01BUlZFTEw9eQo+ID4gPgo+ID4gPiBJIGFjdHVhbGx5IGNvcGllZCB0
aGUgd29ya2luZyBjb25maWd1cmF0aW9uIGZyb20gNC4xNS4xOCB0byA0LjE2LjEsCj4gPiA+IGRp
ZCBtYWtlIG9sZGNvbmZpZywgYW5kIGNvbXBpbGVkIGl0IHRoZSBzYW1lIHdheSBhcyA0LjE1LjE4
LiBMaWtlIEkKPiA+ID4gc2FpZCBhYm92ZSwgNC4xNSB3b3JrcywgNC4xNiBkb2VzIG5vdC4KPiA+
ID4gSSBob3BlIHRoaXMgYW5zd2VycyB5b3VyIHF1ZXN0aW9uIHdoZXRoZXIgSSBzZWUgdGhlIGlz
c3VlIHdpdGggdGhlIG5ldwo+ID4gPiBhbmQgdGhlIG9sZCBtYXJ2ZWxsIGRyaXZlcnMgYmVjYXVz
ZSBJIGFtIG5vdCAxMDAlIHN1cmUgd2hhdCB5b3UgcmVmZXIKPiA+ID4gdG8gaGVyZSAoSSBndWVz
cyB5b3UgbWVhbiBQWEEzWFggdnMgTkFORCkuCj4gPgo+ID4gQWgsIHJpZ2h0LiBJIGZvcmdvdCB0
aGF0IHRoZSBvbGQgZHJpdmVyIGdvdCByZW1vdmVkLiBJIHRob3VnaHQgd2Uga2VwdCBpdCBmb3Ig
YSBmZXcgcmVsZWFzZXMuIDstXAo+ID4gU28gdGhlcmUgaXMgYSByZWdyZXNzaW9uLgo+ID4KPiA+
IFRoYW5rcywKPiA+IC8vcmljaGFyZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
