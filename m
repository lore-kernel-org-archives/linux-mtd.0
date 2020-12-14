Return-Path: <SRS0=YYID=FS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3CEDC4361B
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 17:17:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81E5322515
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Dec 2020 17:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81E5322515
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3Tsj3RccMXQnWx0ILm+eMInG/1rtMqFLn/Tr0dbTaBk=; b=U4P/UDCdpoFFiLHmgm2i+v2wX
	1p0zOPM1bybYjUHFVeQ1tr800BUCe2OBM81Af29NrD4zfPL5UuY9dfFQ6WCBYWXrGsMwh90I3aiRS
	w/gdTk/99Y1i8Y8x5ApSxMSUJ3EyhffQkAxUw6IOaBSwchkIgTZW4SaPz1OJGoeNpUmLd6BTnLizo
	i+Zj/O+cYW8ua+t97dxeEXHEX2JQnxVC3j3aVLsU3rTO+UQt1OP/Ij1Di9Olnvr4VrhuFlSuHPzV1
	JU19Y8yL5H7tcWKpt2c7ZmDODN/OeoVSlTp3F7gCe+s3u76WObJpDN2l37mSTeLdlWbtFkcOzCfBP
	UbHYYyF5A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1korSd-0003WZ-N2; Mon, 14 Dec 2020 17:16:35 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1korSb-0003Vk-4k
 for linux-mtd@lists.infradead.org; Mon, 14 Dec 2020 17:16:34 +0000
Received: by mail-io1-xd32.google.com with SMTP id p187so17607660iod.4
 for <linux-mtd@lists.infradead.org>; Mon, 14 Dec 2020 09:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Phu6mM0U2rni8FhjfHVEbfiaDKtSxfzXSEwWfAx4glM=;
 b=O9TUpLTZg4ezx+Q47jQOTqZoBcgOkuXDeppt5ZLKq6Elf3IXYFOv3fLuDtPDElxKBt
 gGBndx5LpjuX8sIT910OK9Ctk/A/TBKj/5EFXzspcHvK6InojmQwABMoxgcv0gM3GUaV
 Zge7j4SwSXi1AblX0d07oxnImZuyj+7jDeYUx3+WMfxVCvhGl1EEjXX/P5joMjbOKHtX
 0W2SFUjb4YHfaD+xOG+r/9ECN+zrydGIFg9IIBO8VUE00rrJJpL/c3AY1fK1lmNHft8N
 pWDs/43QqoMfo11kaIWCyDoBc8rp33aiJAM+uWJRNsUavVweOwPYS7ytCrqIx3ltyzb4
 u6NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Phu6mM0U2rni8FhjfHVEbfiaDKtSxfzXSEwWfAx4glM=;
 b=Nt+myDxQqQou7cXgTd/VniIswAMmm3oNISfcEJG5Y2TcOyWWx5rumcxhZbVEGGIysV
 i6CGWOwgWoHPhMBEWtEyXmizijhSCOCve+kZrNvshr5e5paIm5NP1MrYJePOh9r0uf51
 dQ5T3wp2z7ANaD/QM3608XvKFEY6V5lQbiId+qSpQw8cVtjYbOVqF5B+j993Pdpt6C3Q
 C8ueOtjVRwu7Jy+vHSRCiR81NE1+Iiz87RhB7w55KI7ugUl0ZRiLJrn1W0EPfh/ycxBP
 RYNDAvWTpN2HvBZk8I/b8JQMTkNvzSNMOolKSxPmnuYWMVtFaaaDU0JlmgpFaEi5rkSC
 0K8g==
X-Gm-Message-State: AOAM530UvuSXHGWdpYB3HlUHj29deBPun52FsMs/Lu+oayiQZTcTsEaq
 oz0C/85busxPlpqzNeAaCzp5hHyQIPmHDYkDDK1qrUOIjtZBVQ==
X-Google-Smtp-Source: ABdhPJwAjoad5u8y1w5Zd+txx+wfFBg1P9LBpHQlw5VOSyWSVjH7Ji1YbcdVWLOrYB7hHPB3tqZswe8TBuAvuv6KwqA=
X-Received: by 2002:a02:c608:: with SMTP id i8mr33857482jan.125.1607966190521; 
 Mon, 14 Dec 2020 09:16:30 -0800 (PST)
MIME-Version: 1.0
References: <CAK+FTGhwM02y_eg6cE=GNcOH8G8eQjia0PD+JVrR=eSedQxWAA@mail.gmail.com>
 <CAFLxGvyNtHOQZ1OnSsh=Md9Lx7e8j307uRCNvS_qvNp6FW1_pg@mail.gmail.com>
 <CAK+FTGjg1sMtE0Vk=mztO6_HP0VJ=mYy1b0nAEXDw6Dtx6AtUw@mail.gmail.com>
 <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
In-Reply-To: <2020191742.126461.1607959229137.JavaMail.zimbra@nod.at>
From: David Schaefer <david.tillmann.schaefer@gmail.com>
Date: Mon, 14 Dec 2020 18:16:19 +0100
Message-ID: <CAK+FTGirwvd5Sdww4kkYCy0BMmnZsP=Tq=cAePxraXa3AcGbiQ@mail.gmail.com>
Subject: Re: WD MyCloud Ex, Armada-370, pxa3xx-nand, marvell-nfc
To: Richard Weinberger <richard@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_121633_248925_923BF528 
X-CRM114-Status: GOOD (  15.07  )
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

SWYgdGhpcyBpcyBhIHJlZ3Jlc3Npb24sIGhvdyBjYW4gd2UgY29udGludWUgaGVyZT8gQ2FuIEkg
Z2l2ZSBoYXJkd2FyZQpzcGVjcyBhbmQgbG9ncz8gSSBoYXZlIHNvbGRlcmVkIG9uIHRoZSBib2Fy
ZCB0byBhY2Nlc3MgVUFSVC4gSSBjYW4KcHJvdmlkZSBlLmcuIGJvb3QgbG9ncy4KCi9EYXZpZAoK
QW0gTW8uLCAxNC4gRGV6LiAyMDIwIHVtIDE2OjIwIFVociBzY2hyaWViIFJpY2hhcmQgV2VpbmJl
cmdlciA8cmljaGFyZEBub2QuYXQ+Ogo+Cj4gRGF2aWQsCj4KPiAtLS0tLSBVcnNwcsO8bmdsaWNo
ZSBNYWlsIC0tLS0tCj4gPiBJIGhhdmUgY2hlY2tlZCB0aGUga2VybmVsIGNvbmZpZ3VyYXRpb24u
IEZvciA0LjE1LjE4IEkgaGF2ZSB0aGVzZSBzZXR0aW5nczoKPiA+IENPTkZJR19NVERfTkFORF9F
Q0M9eQo+ID4gQ09ORklHX01URF9OQU5EPXkKPiA+IENPTkZJR19NVERfTkFORF9QWEEzeHg9eQo+
ID4KPiA+IGFuZCBmb3IgNC4xNi4xCj4gPgo+ID4gQ09ORklHX01URF9OQU5EX0VDQz15Cj4gPiBD
T05GSUdfTVREX05BTkQ9eQo+ID4gQ09ORklHX01URF9OQU5EX01BUlZFTEw9eQo+ID4KPiA+IEkg
YWN0dWFsbHkgY29waWVkIHRoZSB3b3JraW5nIGNvbmZpZ3VyYXRpb24gZnJvbSA0LjE1LjE4IHRv
IDQuMTYuMSwKPiA+IGRpZCBtYWtlIG9sZGNvbmZpZywgYW5kIGNvbXBpbGVkIGl0IHRoZSBzYW1l
IHdheSBhcyA0LjE1LjE4LiBMaWtlIEkKPiA+IHNhaWQgYWJvdmUsIDQuMTUgd29ya3MsIDQuMTYg
ZG9lcyBub3QuCj4gPiBJIGhvcGUgdGhpcyBhbnN3ZXJzIHlvdXIgcXVlc3Rpb24gd2hldGhlciBJ
IHNlZSB0aGUgaXNzdWUgd2l0aCB0aGUgbmV3Cj4gPiBhbmQgdGhlIG9sZCBtYXJ2ZWxsIGRyaXZl
cnMgYmVjYXVzZSBJIGFtIG5vdCAxMDAlIHN1cmUgd2hhdCB5b3UgcmVmZXIKPiA+IHRvIGhlcmUg
KEkgZ3Vlc3MgeW91IG1lYW4gUFhBM1hYIHZzIE5BTkQpLgo+Cj4gQWgsIHJpZ2h0LiBJIGZvcmdv
dCB0aGF0IHRoZSBvbGQgZHJpdmVyIGdvdCByZW1vdmVkLiBJIHRob3VnaHQgd2Uga2VwdCBpdCBm
b3IgYSBmZXcgcmVsZWFzZXMuIDstXAo+IFNvIHRoZXJlIGlzIGEgcmVncmVzc2lvbi4KPgo+IFRo
YW5rcywKPiAvL3JpY2hhcmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
