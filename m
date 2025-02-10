Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13EFC021A1
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 02:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jc/PjdNQBuKCimb+Mb8A9OWXXZ4XYDRs+zApMSwaUyM=; b=d0bL/ib7gRXVoE
	wQkLEJKYOBB9ItDYX2sK4DPJmsjl7FiBLfvpqyWD7ppboE6CSXu7R2h5HURK9HbfU+nu8OfkhXvBB
	E5E8qzkaURLm4sH1ZBwJyyKvbDNrIEEKIAE1/caXExFDkhCGFQWsq5kV1mTlfx839Ob6P4OeRpqZR
	cWlYhnsr6VOwgcXznn+axgJkJDVKnDjJjRyHpJgm3Lgki+vrCHC8H0aHbiZQOvaeJf1WH/0mgX2yv
	PcyuR53Vh7AGWn3hBCue3wpeAalQPXVg8NQjJmfegEp4ykowxLW3NcKUd3j/9Rsc7y746seAJzzSX
	JC+4NUXOydGfzaNLXNLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thJsh-0000000G1Dj-08Qj;
	Mon, 10 Feb 2025 02:50:43 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thJsf-0000000G1C5-04Qp
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 02:50:42 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f78b1fb7dso13905855ad.3
        for <linux-mtd@lists.infradead.org>; Sun, 09 Feb 2025 18:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739155840; x=1739760640; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCn7t+K1U3n4uOM/x7emrxEaBDWkk+oxjf8WC+Yk7bQ=;
        b=OKINN7fJUi0+f3BZYjm9fGGj4y2FmAMobc9ePCaXX6s8xuDsrwPRDBVTkSHL7V3wBJ
         /KJVrorzbzzRdzAPXY7YBN/mmgJ0oSXMV9pgBm6I2k99ulk7koBBKaVDzUasfK2YsRNj
         pt1ApaOYOF9UENNQK7a+mg1iDTM0poDJYX9K2WVmRUKZhkI1lMelhPACiEwnJG0p5zwy
         FqHSZIvFlJ54rx1pSvRB+uSdTMBzm19CU72vWSAFUoXV+CzLhJvD9bOUYNlh5SOHHTnl
         s+Fq7BCs2S5QllO5l+5nIHVlEJk0/P7QllkwLcbPMfuJ7HKLNoRUZFOI86dlc+IISc3P
         pOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739155840; x=1739760640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCn7t+K1U3n4uOM/x7emrxEaBDWkk+oxjf8WC+Yk7bQ=;
        b=uRpCaTv/rA2F6Aj3wSS+st0wYiDkN96JINtxcz8pcXgpra0bWKwvJAlrUcjbW5ZOrW
         2++XR3WdihHAQAKytIa2NfQZz+JiM86ylEDipro6JRcoC9SipuL2ZPLizTWziCZ6t0wg
         uiHGQA3q4hzY65csDlYg30awDHV01UwP62qu39HfmOzlzH/V9Z8xxVI91wgcKrf8Sn7C
         PC1Iz2rBdJ2DLGj8fASIfiJPcm0bCVwcs+CI+YSRGjUVkXarxdVMjvC1u+dOpw9+ACYK
         97qQxyddsuEPUp79OuQ5df7Ovc7ZxCDgODssL9brEpZEQ/Yftoyfs3aC/XU3Za4M2LyL
         0v2g==
X-Forwarded-Encrypted: i=1; AJvYcCU+RJtMKKIPepYU6A1P30ICug4Rzsp5SFsvx2y6G6OgmX5EKwN3qPzppIqkZZF1p44TBDJ1nIIqNK4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx84Uuawh+G7mqYOMDl41l1aEpK2WrRpC5YbYNQT71QboU06/m2
	RDx/+QHgJWZVrITNqQB288bdg5AS2DL66vi9QBTqcWJinfXyepbHR3X0EcKoHtR1EoqO/BkdQkj
	D5tWqdz1GJN8NSEsYAljfGP9X9L7/7A==
X-Gm-Gg: ASbGncuWJInPKWfMMBIyUb1C4VlE2u0jTu2IzlzLhnsYVtSW9EsLB/+sPDdDHdAtaMz
	qohS24kbdD1X148+K6MkpZq8yPPFutZP7XtYSiFTLlC8elRhkC4HKH+/OGrwaPmbSBxqugCYE
X-Google-Smtp-Source: AGHT+IEgXij4R24JRSThKYkKqbCQ7OkMggSfd9GXnvuwEm/Ffiyzp+cnvCiadhFNuK7pCtuOCyozDn5bSj2B15crrNg=
X-Received: by 2002:a17:902:ecc9:b0:215:9379:4650 with SMTP id
 d9443c01a7336-21f4e7596d3mr190576365ad.42.1739155840112; Sun, 09 Feb 2025
 18:50:40 -0800 (PST)
MIME-Version: 1.0
References: <20250122065605.285145-1-linchengming884@gmail.com>
 <20250122065605.285145-3-linchengming884@gmail.com> <87pljv3st9.fsf@bootlin.com>
In-Reply-To: <87pljv3st9.fsf@bootlin.com>
From: Cheng Ming Lin <linchengming884@gmail.com>
Date: Mon, 10 Feb 2025 10:46:31 +0800
X-Gm-Features: AWEUYZkdaxqmpCxih6PIQDxAt0S7tCGB_aE9jpN72ZcPk1pW_rnucJcJgUK-KtQ
Message-ID: <CAAyq3SZKS8+Bzh+bdbkrFffCPo8Z7Zf_9O7oit98HmdzJC7qVQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: spi-nand: macronix: Add support for read retry
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: vigneshr@ti.com, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, richard@nod.at, alvinzhou@mxic.com.tw, 
	leoyu@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_185041_061470_11C4CE01 
X-CRM114-Status: GOOD (  10.86  )
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

SGkgTWlxdWVsLAoKTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4g5pa8
IDIwMjXlubQy5pyIN+aXpSDpgLHkupQg5LiK5Y2IMTowN+Wvq+mBk++8mgo+Cj4gSGVsbG8sCj4K
PiBPbiAyMi8wMS8yMDI1IGF0IDE0OjU2OjA1ICswOCwgQ2hlbmcgTWluZyBMaW4gPGxpbmNoZW5n
bWluZzg4NEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBAQCAtMzc3LDcgKzQyNCw5IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qgc3BpbmFuZF9pbmZvIG1hY3Jvbml4X3NwaW5hbmRfdGFibGVbXSA9IHsK
PiA+ICAgICAgICAgICAgICAgICAgICBTUElOQU5EX0hBU19RRV9CSVQsCj4gPiAgICAgICAgICAg
ICAgICAgICAgU1BJTkFORF9FQ0NJTkZPKCZteDM1bGZ4Z2U0YWJfb29ibGF5b3V0LAo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBtYWNyb25peF9lY2NfZ2V0X3N0YXR1cyks
Cj4gPiAtICAgICAgICAgICAgICAgICAgU1BJTkFORF9DT05UX1JFQUQobWFjcm9uaXhfc2V0X2Nv
bnRfcmVhZCkpLAo+ID4gKyAgICAgICAgICAgICAgICAgIFNQSU5BTkRfQ09OVF9SRUFEKG1hY3Jv
bml4X3NldF9jb250X3JlYWQpCj4KPiBJIHRoaW5rIHRoZXJlIGlzIGEgbWlzc2luZyBjb21hIGhl
cmUgYW5kIGV2ZXJ5d2hlcmUgZWxzZSB3aGVyZSB0aGVyZSBpcwo+IGNvbnRpbnVvdXMgcmVhZCBz
dXBwb3J0PwoKVGhhbmsgeW91IGZvciBwb2ludGluZyB0aGlzIG91dC4gSSB3aWxsIGNvcnJlY3Qg
dGhlIG1pc3NpbmcgY29tbWEgaW4gdGhpcwppbnN0YW5jZSBhbmQgYWxzbyByZXZpZXcgb3RoZXIg
YXJlYXMgd2l0aCBjb250aW51b3VzIHJlYWQgc3VwcG9ydCB0bwplbnN1cmUgY29uc2lzdGVuY3ku
Cgo+Cj4gPiArICAgICAgICAgICAgICAgICAgU1BJTkFORF9SRUFEX1JFVFJZKE1BQ1JPTklYX05V
TV9SRUFEX1JFVFJZX01PREVTLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtYWNyb25peF9zZXRfcmVhZF9yZXRyeSkpLAo+ID4gICAgICAgU1BJTkFORF9JTkZPKCJN
WDM1VUYxR0U0QUMiLAo+ID4gICAgICAgICAgICAgICAgICAgIFNQSU5BTkRfSUQoU1BJTkFORF9S
RUFESURfTUVUSE9EX09QQ09ERV9EVU1NWSwgMHg5MiwgMHgwMSksCj4gPiAgICAgICAgICAgICAg
ICAgICAgTkFORF9NRU1PUkcoMSwgMjA0OCwgNjQsIDY0LCAxMDI0LCAyMCwgMSwgMSwgMSksCj4K
PiBUaGFua3MsCj4gTWlxdcOobAoKVGhhbmtzLApDaGVuZyBNaW5nIExpbgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNj
dXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW10ZC8K
