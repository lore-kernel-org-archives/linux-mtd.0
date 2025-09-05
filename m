Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3820CAC580
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RpIF+KV1E3+eztbDqnl2ZGNz2x14MnRVN/KlcwmLMcE=; b=HxJpllV1FxGPm3
	uZ1c+4NkrSd6Zk3iBoBk9oQX7m48+u2AzNgoJ33KNfY6nVZr6lavV007PKgJnQwLQM8W9SIu3anZP
	0B7gGn4/s5Z+mSrIIFMQRAlfca56qfKiLhfXl/AIYjqfAwb+c0LXCO5oycYqyS9+n3RLsVj19efw5
	loobrF12mrFSLx/AevENuW747gA2eRQ7VYPVRrzH6fSnxM11ozJGzulKXaCHHp6CtQwPQj5cCBqA4
	OyQvNhTXUUryqX1FpEib3nVVwz3CesUNwc3BJ9Z5tM5VqVAInArmprKElBrqoRMQuDNiXBLXjDwuK
	TiSJNpV2zgUhHUWIj+Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNbS-0000000GaRk-3bB5;
	Fri, 05 Sep 2025 03:59:10 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuN3Z-0000000GQFK-0ZQR
	for linux-mtd@lists.infradead.org;
	Fri, 05 Sep 2025 03:24:10 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-24458272c00so20136765ad.3
        for <linux-mtd@lists.infradead.org>; Thu, 04 Sep 2025 20:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757042648; x=1757647448; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2rwiOR30AUoK/1BMehI/foxTsycL/hQduhY8reQFMI=;
        b=QHzLKCnSkrVlRzNkHG31aexy6ixs+PTEuaTXJ9KjuiDHskPTleC7I0hDD2oSuln+tW
         S3Rkrf91kf09oLx10lmG9PLVvNsOcO8xeZNAjWUv9+6YLgqDpJDWy/qL9X8NW7H8pBfy
         6g0yPTYmYkE6qc4V/wW4aKH8zjUSKa2pJW0eKyZBT4IzVTn7GHgVYbljmPD2MyBd4arS
         DMdpXLn8yqzlshroYQ/NeWwLUFx2ym8yQJnwnGenJi4m0EE4khcMGlZ0LZT/KdRqFLhv
         u/qtKfoNF4dr5XrHleM5cdnMXHEQRjVy76Efhkp2ILEsOuymDbVoHL9d77H6Ja1UHl96
         jmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757042648; x=1757647448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2rwiOR30AUoK/1BMehI/foxTsycL/hQduhY8reQFMI=;
        b=hcp6JstFCDl3bG73Q90pz7tsA+dtn6XDbb3huLDvNmq/vtgrfMsamGA15ZnrV6XvxF
         Dqdxjp7QQU2rQHdFxsX1i8RovVYkHeNqR1IVfBhtr5V87BurZCXEA5qIRD3No6HQqFZW
         /96l6UkIyeE4T64WRqYpzxMCQjxL1OEuCStVH+Mytl/jIsE6u2IJREJ8Cmf8RM7XubFM
         pSok1AC+ldzwxQO6uHDxzVbRsIo62XOxG6Py5mOYY1KjgiyxYmfjQcpaQzq/65tWZ+nD
         grk2doW+3BiUC3IwW1biwnSjoDo5QoxdqkpPq1U4ohJum6pFWBba98/PncgjCb3ATVDy
         OPPg==
X-Forwarded-Encrypted: i=1; AJvYcCVrCyh+1G0bBegDxRtwbmnOkNKc/h5OfOAfV/NuMsUqOx7LuAz+ZAEqkz90Jz+waJHbforAbJ1f4wM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxP2KKrCpzzwNlK8RQHNHcqJzLIT2aCMhwDhnK0xlwBr96/2Nwd
	4J60/dZahUxqu8DDn1+Rd/AO/3W3apuP1tIbr2Yz6ebIcK1ZnNQv585Yx1Z65OT1QvEaqKRn4Lk
	sH8TER1Elu7RoQtrSoxS8pVNNZMay2AI=
X-Gm-Gg: ASbGncs++5aQlYV1xRMrWmkerlXWEVTjHqAQy1ci1eMOYWbumAI7sRo335pxRAWzaOc
	QiSZJUpWoIFHgD7pfore/Y24VCALtWNP2plNJScWGQ70GqR9Nn6m9L0ZLbe0KobmDLV4/eLCmzu
	erHmNPURHps0F6hPG1dhXm7G/PtPyiya3r4a6g83/ocfPhZRZxY7LyFtdghCgFYgzbrl3ClCRlR
	Mu7l8RNWnPx7AR9JU/G9dhCjDDDED5YJtulqqvWmJHgrXCA2Nr69XK5WKjlBhXgrTd/HuPpAUE1
	4B2xXU8Md2PNl2n6H8++58nT0us=
X-Google-Smtp-Source: AGHT+IGeoH/tnRINONrHIBmpzSB+8Y0C2HMREpMJp2NyyWL5F7495CGsYjLDD12r1W/V1nDjRZlt3kUFyeX9bcl9k+Y=
X-Received: by 2002:a17:903:3d0b:b0:24a:c62a:dede with SMTP id
 d9443c01a7336-24ac62aea77mr222773715ad.26.1757042648345; Thu, 04 Sep 2025
 20:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250812051949.983040-1-linchengming884@gmail.com>
 <152133202.103367.1754981828821.JavaMail.zimbra@nod.at> <CAAyq3SaEqYiKhbjYwLH0p6F2G=UR-MwZF28AG1xVMoKhznS3Og@mail.gmail.com>
 <608935583.115196.1755171013804.JavaMail.zimbra@nod.at>
In-Reply-To: <608935583.115196.1755171013804.JavaMail.zimbra@nod.at>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Fri, 5 Sep 2025 11:21:15 +0800
X-Gm-Features: Ac12FXwkUXz6rL-5DfcSPLCoQbbs0Z-FsPJFhS36yJIDnQdEPM7ZEt30Cl_gtlY
Message-ID: <CAAyq3SZT67uwggdNX99qEc4bwSkUw2U=sCc6mon064D=f7oH=w@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: skip programming unused bits in ubi headers
To: Richard Weinberger <richard@nod.at>
Cc: chengzhihao1 <chengzhihao1@huawei.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, Alvin Zhou <alvinzhou@mxic.com.tw>, 
	leoyu <leoyu@mxic.com.tw>, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_202409_176708_FE85CB78 
X-CRM114-Status: GOOD (  14.03  )
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

SGkgUmljaGFyZCwKClJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBub2QuYXQ+IOaWvCAyMDI1
5bm0OOaciDE05pelIOmAseWbmyDkuIvljYg3OjMw5a+r6YGT77yaCj4KPiAtLS0tLSBVcnNwcsO8
bmdsaWNoZSBNYWlsIC0tLS0tCj4gPiBWb246ICJDaGVuZyBNaW5nIExpbiIgPGxpbmNoZW5nbWlu
Zzg4NEBnbWFpbC5jb20+Cj4gPj4gSSBoYXZlIGJlZW4gdG9sZCB0aGF0IHdyaXRpbmcgMHhGRiBi
eXRlcyB0byBOQU5EIHNob3VsZCBiZSBhdm9pZGVkLgo+ID4+IFRoaXMgaXMgYWxzbyB3aHkgVUJJ
IGluaXRpYWxpemVzIHRoZW0gdG8gMHgwMC4KPiA+Cj4gPiBOb3JtYWxseSwgYWZ0ZXIgYSBOQU5E
IGZsYXNoIGJsb2NrIGlzIGVyYXNlZCwgYWxsIGJpdHMgYXJlIGluIHRoZSAweEZGCj4gPiBzdGF0
ZS4gUHJvZ3JhbW1pbmcgMHhGRiBpbiB0aGlzIGNhc2Ugd2lsbCBub3QgYWN0dWFsbHkgY2hhbmdl
IHRoZSBOQU5ECj4gPiBjZWxscywgYXMgdGhlIGRldmljZSBjYW4gaW5oaWJpdCBwcm9ncmFtbWlu
Z+KAlGVpdGhlciBieSByYWlzaW5nIHRoZQo+ID4gYml0bGluZSB2b2x0YWdlIG9yIHVzaW5nIGEg
c2VsZi1ib29zdGVkIHByb2dyYW0gaW5oaWJpdCBtZWNoYW5pc20uCj4gPiBUaGVyZWZvcmUsIHBy
b2dyYW1taW5nIDB4RkYgaXMgYSBub3JtYWwgYW5kIGhhcm1sZXNzIG9wZXJhdGlvbiBmb3IgTkFO
RAo+ID4gZmxhc2guCj4KPiBUaGF0J3MgdGhlIGNydWNpYWwgcXVlc3Rpb24uIElzIHRoaXMgdHJ1
ZSBmb3IgYWxsIE5BTkQgY2hpcHM/Cj4gRG8gYXZvaWQgbGFyZ2VyIHdyaXRlcyBvZiAweEZGIHBh
dHRlcm5zIGZpbGUgc3lzdGVtcyBzdWNoIGFzIFVCSUZTCj4gYWxzbyB1c2UgY29tcHJlc3Npb24g
YSBsb3QuCj4gQXQgbGVhc3QgdGhhdCdzIHdoYXQgSSBoYXZlIGJlZW4gdG9sZCB3aGVuIEkgYXNr
ZWQgMTArIHllYXJzIGFnbwo+IGhvdyBVQkkgd29ya3MuCgpZb3UgYXJlIGNvcnJlY3QgdGhhdCB0
aGVyZSBpcyBhbiBpc3N1ZSB3aGVuIGJsYW5rIGRhdGEgcGFnZXMgYXJlIHJlcGVhdGVkbHkKZXJh
c2VkLiBUaGlzIGNhbiBsZWFkIHRvIGNlbGxzIGVudGVyaW5nIGEgdG9vIGRlZXAgVlQgc3RhdGUs
IHdoaWNoIG1heQpjYXVzZSBwcm9ncmFtIGZhaWx1cmVzIGluIHN1YnNlcXVlbnQgb3BlcmF0aW9u
cy4KClRvIGFkZHJlc3MgdGhpcywgbmV3ZXIgTkFORCBnZW5lcmF0aW9ucyB0eXBpY2FsbHkgcGVy
Zm9ybSBhIHByZS1wcm9ncmFtCnN0ZXAgYmVmb3JlIGV4ZWN1dGluZyB0aGUgYWN0dWFsIGVyYXNl
LiBUaGlzIGtlZXBzIHRoZSBWVCBkaXN0cmlidXRpb24gZnJvbQpnb2luZyB0b28gZGVlcCwgdGhl
cmVieSBhdm9pZGluZyB0aGUgYmxhbmstcGFnZSBkZWdyYWRhdGlvbiBwcm9ibGVtLgpTdWNoIHBy
ZS1QR00gdGVjaG5pcXVlcyBoYXZlIGJlZW4gd2lkZWx5IGFkb3B0ZWQgZm9yIHJvdWdobHkgdGhl
IHBhc3QKMTDigJMxNSB5ZWFycy4KCkFkZGl0aW9uYWxseSwgSkVTRDIyLUExMTdFIChwYWdlIDYs
IHNlY3Rpb24gNC4xLjIuMSkgc3BlY2lmaWVzIGV4YW1wbGVzIG9mCmFjY2VwdGFibGUgZGF0YSBw
YXR0ZXJucywgaW5jbHVkaW5nIHNvbGlkLXByb2dyYW1tZWQsIGNoZWNrZXJib2FyZC9pbnZlcnNl
LQpjaGVja2VyYm9hcmQsIGFuZCBjaGVja2VyYm9hcmQtd2l0aC1maWxsIHBhdHRlcm5zLiBBY2Nv
cmRpbmcgdG8KcXVhbGlmaWNhdGlvbiBrbm93bGVkZ2UgYmFzZXMsIHVzaW5nIDB4MDAgY2FuIHNv
bWV0aW1lcyB0cmlnZ2VyIHNwZWNpYWwKZmFpbHVyZSBtb2Rlcywgd2hlcmVhcyB3cml0aW5nIDB4
RkYgaXMgbW9yZSByb2J1c3QuCgpBZGRpdGlvbmFsbHksIHRoZSBLaW94aWEgVEM1OE5WRzFTM0hU
QTAwIGRhdGFzaGVldCAocGFnZSA2MykgYWxzbyBub3Rlcwp0aGF0IGNvbnRpbnVvdXMgcHJvZ3Jh
bS9lcmFzZSBjeWNsaW5nIHdpdGggYSBoaWdoIHBlcmNlbnRhZ2Ugb2Yg4oCYMCcKYml0cyBpbiB0
aGUgZGF0YSBwYXR0ZXJuIGNhbiBhY2NlbGVyYXRlIGJsb2NrIGVuZHVyYW5jZSBkZWdyYWRhdGlv
bi4KVGhpcyBmdXJ0aGVyIHN1cHBvcnRzIGF2b2lkaW5nIGxhcmdlIDB4MDAgcGF0dGVybnMuCgpM
aW5rOiBodHRwczovL2V1cm9wZS5raW94aWEuY29tL2NvbnRlbnQvZGFtL2tpb3hpYS9uZXdpZHIv
cHJvZHVjdGluZm8vZGF0YXNoZWV0LzIwMTkxMC9EU1RfVEM1OE5WRzFTM0hUQTAwLVRERV9FTl8z
MTQ0Mi5wZGYKCj4KPiBUaGFua3MsCj4gLy9yaWNoYXJkCj4KClRoYW5rcywKQ2hlbmctTWluZyBM
aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
