Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C75C54E65
	for <linux-mtd@archiver.kernel.org>; Thu, 22 May 2025 17:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQK3dCS/f60xaqZS38y0mdZ5ebwYHbg6vkoYjXES8qI=; b=UOiibAkDbmYDvs
	Nk100z3as5MJs5+A/jhvMJPn/ufgdeBg9XKTIIO15GSegpyRL7TSrGzIzHd+bLgh3XtDvhXKaKPiC
	lCRV5046iNU6Y5T6Rf9Tlru5xOdydYa1CHJ9Jh0pI/CoIx1zXw+R7/ZPKi9+NRvb7ceFrrMo2uFOE
	iT42yR9uOBiP4tLIw0w24cpRku3+R9N/ZZi1kfKTQL9nFsYhC/yM/SVBoPsSNPDQ0enjibh8x+Nbv
	Wm07+m/wy0K3J5Mh08vQR3VhKvXSQo7+DSr8OaK3i4+dFsJPFGRIp5oI/jjgYVfsrscir3Wufysel
	2wjvtBmmpF4DSTadk2ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIA2r-00000001mfs-37hf;
	Thu, 22 May 2025 17:49:29 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIA2p-00000001mfA-1X46
	for linux-mtd@lists.infradead.org;
	Thu, 22 May 2025 17:49:28 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ad5394be625so559596566b.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 May 2025 10:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747936166; x=1748540966; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UXlb98Jq8xguu+7ZKl/TCFGce1LzzWdMVuvQ7hjHTWY=;
        b=m1obh1e7MNBLaGFVdZr2cz+4DbMwAXLdJTnFxAcQa8hG1D8TIn7jS3CyaIc+CfvWHV
         Fdmr5EVdzd6HcJAADRCVWW3IcgzmUkpDt3VuvKsmPD2nkkcWhxz9g47/B5WeFT0vsdRt
         JRU7UHfYIeUBpGb8RRzPqLQ8t2YPKMRpPLVh+PVdzi7C2tc0R19E+DhLaeFnI01DJ8Sd
         svtLKS4abmo43//PNJd+f4+yr9woxay7rwxKU21izX8APaPbqKq5vyVwHEvoBatoXBoK
         RrpuNya/BQ1l9YcGLXuLbyE/1vncnmbQHVLeMHtEyINp/aj1Fed5dQ3bTGXNJnmnZZSm
         Vt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747936166; x=1748540966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXlb98Jq8xguu+7ZKl/TCFGce1LzzWdMVuvQ7hjHTWY=;
        b=wCaAMHTSmX4ojDJWbR9d74fV907ITT8iXv46ezbvZF5jsQB0rYtZTyDvAthmdFAaV4
         zTIUPI6bHE1o11b/HixMNw2Lfm/TXCG4QWWvZSygWFRA4w/xpxZNQfjmD/uky8M/xo5N
         fcOwzjndH7SVDoejq/c5aiuVc3+LbrDVwAKP76LJmh2JOKgndm0gMc90l79/2M0xjoeY
         2vdiS2ikNQK8IrRJYDRelRwXt2A8eiJLSd3BZTKi16KWuPG8xGJ2sjvfIWJpE3NSB1jC
         Cls5KFoPbxbGUg+jn3hf19tEFiWJ46i04cfuoMJK7V11FiEVOu6pO45t9ChtWpLozTW4
         iJdg==
X-Forwarded-Encrypted: i=1; AJvYcCXsVSbc2wvmbFD2xQ0r09bf9eHIWCzEmw6Sm53cwf1z/LVlA816MHwLNHGMJz8XWpPhl507kCIUXog=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPXe1TI1ZTfPjfeAgjJdeBIYzPxdPTdkJyt4CLt4GHj2MtXZ12
	cCzgdYqD8QrR2wwIkqTl/ixmVcF1sF5Mfz+h4CdtFwx8bfUf0lg2Zhos
X-Gm-Gg: ASbGnctEif/IsFkYJitGUYSW+Bwy6X8ghnY4Gwj9BOlQqr8Bm5zcC9BIDBj8PvTC36E
	cHKEMIb38W6rHi15UV+ERIFxjyNQUjoWar/yTluOfXdaeAy9G19eu1wnQlLNvL/8iECNpt8xeq0
	fLSQX+wZ7e03bX5rRfduACFa0zgsQS9dCfk6K2qYI6GukBpZsiVgbpu2FU1LiRfnYVdGcmEHKs4
	SxmDISGFqfJ0IvMv8tfA/izSqj8vhjryVTHCDw1PHajW2Dfh3xPPcKAhSuU9BtiY38gmFaiGKYW
	086w0GwHMJ9oNSsRS940zRINsi2IaQGWZOVbcmcYKTGFEQDmzSd0f2ULZz7+dmbumNNtpZsTt6A
	x5Mna9/P4Wurr0reV
X-Google-Smtp-Source: AGHT+IEacT+OnQkIksGL3phaucP09y9PwnZSl4uyglfhmqkNpX/VieVElIyjZVOywJVl3/l2zAuGmw==
X-Received: by 2002:a17:907:3ea4:b0:ad2:49b5:8e0d with SMTP id a640c23a62f3a-ad536b7f1c3mr2350148266b.15.1747936165504;
        Thu, 22 May 2025 10:49:25 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d047c30sm1101122166b.6.2025.05.22.10.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 10:49:24 -0700 (PDT)
Message-ID: <dec260e9-8874-4727-9211-de939991a344@gmail.com>
Date: Thu, 22 May 2025 19:49:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next 2/2] spi: spi-qpic-snand: add support for 8 bits ECC
 strength
Content-Language: hu
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Md Sadre Alam <quic_mdalam@quicinc.com>
Cc: Mark Brown <broonie@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250502-qpic-snand-8bit-ecc-v1-0-95f3cd08bbc5@gmail.com>
 <20250502-qpic-snand-8bit-ecc-v1-2-95f3cd08bbc5@gmail.com>
 <8aa3d4da-da3e-2af4-e0f9-cd56d6259d8f@quicinc.com>
 <c1729d39-9f7f-4c6d-b8a4-72dfee4bfca5@gmail.com> <878qn2nsa0.fsf@bootlin.com>
 <16195524-1f31-4968-a3fd-f3d24f1c4223@gmail.com> <87msbhezjf.fsf@bootlin.com>
 <007881c9-e03c-1473-d8eb-53fbad8c6a8e@quicinc.com>
 <87frh4ej87.fsf@bootlin.com>
 <e9f460c3-a575-1014-cca7-27f1d79024e2@quicinc.com>
 <87h61e8kow.fsf@bootlin.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87h61e8kow.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_104927_406567_5A2D0B4B 
X-CRM114-Status: GOOD (  20.24  )
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

MjAyNS4gMDUuIDIxLiA5OjUyIGtlbHRlesOpc3NlbCwgTWlxdWVsIFJheW5hbCDDrXJ0YToKPiBP
biAyMS8wNS8yMDI1IGF0IDExOjA4OjAyICswNTMwLCBNZCBTYWRyZSBBbGFtIDxxdWljX21kYWxh
bUBxdWljaW5jLmNvbT4gd3JvdGU6Cj4gCj4+IEhpLAo+Pgo+PiBPbiA1LzE2LzIwMjUgNzo0NCBQ
TSwgTWlxdWVsIFJheW5hbCB3cm90ZToKPj4+Cj4+Pj4+PiBJbnRlcmVzdGluZ2x5IGVub3VnaCwg
aXQgcmVwb3J0cyB0aGUgY29ycmVjdCBudW1iZXIgb2YgYml0IGVycm9ycyBub3cuCj4+Pj4+PiBG
b3IgbWUgaXQgc2VlbXMsIHRoYXQgdGhlIGhhcmR3YXJlIHJlcG9ydHMgdGhlIG51bWJlciBvZiB0
aGUgY29ycmVjdGVkCj4+Pj4+PiAqYnl0ZXMqIGluc3RlYWQgb2YgdGhlIGNvcnJlY3RlZCAqYml0
cyouCj4+Pj4+IEkgZG91YnQgdGhhdCwgbm9ib2R5IGNvdW50cyBieXRlcyBvZiBlcnJvcnMuCj4+
Pj4+IFlvdSByZXN1bHRzIGFyZSBzdXJwcmlzaW5nLiBJIGluaXRpYWxseSB0aG91Z2ggaW4gZmF2
b3VyIG9mIGEgc29mdHdhcmUKPj4+Pj4gYnVnLCBidXQgdGhlbiBpdCBsb29rcyBldmVuIHdlaXJk
ZXIgdGhhbiB0aGF0LiBBbGFtPwo+Pj4+IEkgaGF2ZSBjaGVja2VkIHdpdGggSFcgdGVhbSAsIHRo
ZSBRUElDIEVDQyBIVyBlbmdpbmUgcmVwb3J0cyB0aGUgYml0Cj4+Pj4gZXJyb3IgYnl0ZSB3aXNl
IG5vdCBiaXQgd2lzZS4KPj4+Pgo+Pj4+IGUuZwo+Pj4+ICAgICAgQnl0ZTAgLS0+IDItYml0Zmxp
cHMgLS0+IFFQSUMgRUNDIGNvdW50cyAxIG9ubHkKPj4+PiAgICAgIEJ5dGUxIC0tPiAzLWJpdGZs
aXBzIC0tPiBRUElDIEVDQyBjb3VudHMgMSBvbmx5Cj4+Pj4gICAgICBCeXRlMiAtLT4gMS1iaXRm
bGlwcyAtLT4gUVBJQyBFQ0MgY291bnRzIDEgb25seQo+Pj4+ICAgICAgQnl0ZTMgLS0+IDQtYml0
ZmxpcHMgLS0+IFFQSUMgRUNDIGNvdW50cyAxIG9ubHkgKGluIDgtYml0IGVjYykKPj4+PiAgICAg
IEJ5dGU0IC0tPiA2LWJpdGZsaXBzIC0tPiBRUElDIEVDQyBjb3VudHMgMSBvbmx5IChpbiA4LWJp
dCBlY2MpCj4+Pj4KPj4+PiBIb3BlIHRoaXMgY2FuIGNsZWFyaWZ5IHRoZSB0aGluZ3Mgbm93Lgo+
Pj4gb19PID8/Pz8KPj4+IEhvdyBpcyB0aGF0IGV2ZW4gdXNlZnVsPyBUaGlzIGJhc2ljYWxseSBt
ZWFucyBVQkkgd2lsbCBuZXZlciByZWZyZXNoCj4+PiB0aGUKPj4+IGRhdGEgYmVjYXVzZSB3ZSB3
aWxsIGNvbnN0YW50bHkgdW5kZXJlc3RpbWF0ZSB0aGUgbnVtYmVyIG9mIGJpdGZsaXBzISBXZQo+
Pj4gbmVlZCB0byBrbm93IHRoZSBhY3R1YWwgbnVtYmVyLCB0aGlzIGF2ZXJhZ2luZyBkb2VzIG5v
dCBtYWtlIGFueSBzZW5zZQo+Pj4gZm9yIExpbnV4LiBJcyB0aGVyZSBhbm90aGVyIHdheSB0byBn
ZXQgdGhlIHJhdyBudW1iZXIgb2YgYml0ZmxpcHM/Cj4+IEkgaGF2ZSByZS1jaGVja2VkIHdpdGgg
SFcgdGVhbSwgdW5mb3J0dW5hdGVseSBjdXJyZW50bHkgdGhlcmUgaXMgbm8KPj4gcmVnaXN0ZXIg
ZmllbGRzIGF2YWlsYWJsZSB0byBnZXQgdGhlIHJhdyBudW1iZXIgb2YgYml0IGZsaXBzLiBCdXQK
Pj4gZm9yIG5ld2VyIGNoaXBzZXQgdGhleSBoYXZlIGZpeGVkIHRoaXMgaXNzdWUuIEJ1dCBjdXJy
ZW50bHkgdGhlIFFQSUMKPj4gUVBJQ19OQU5EQ19CVUZGRVJfU1RBVFVTIHwgMHg3OUIwMDE4IHJl
Z2lzdGVyIGJpdC04IHdpbGwgZ2V0IHNldCBpZgo+PiB0aGVyZSBpcyB1bmNvcnJlY3RhYmxlIGJp
dGZsaXBzIGhhcHBlbmVkLgo+Pgo+PiBGb3IgNC1iaXQgRUNDIGlmIDUtYml0IHJhdyBiaXQgZmxp
cHMgaGFwcGVuZWQgdGhlbiBiaXQtOCB3aWxsIGdldCBzZXQgaW4KPj4gUVBJQ19OQU5EQ19CVUZG
RVJfU1RBVFVTLgo+Pgo+PiBzaW1pbGFyIGZvciA4LWJpdCBFQ0MgaWYgOS1iaXQgcmF3IGJpdCBm
bGlwcyBoYXBwZW5lZCB0aGVuIGJpdC04IHdpbGwKPj4gZ2V0IHNldCBpbiBRUElDX05BTkRDX0JV
RkZFUl9TVEFUVVMuCj4gCj4gSSBiZWxpZXZlIHRoZSB1bnJlY292ZXJhYmxlIHNpdHVhdGlvbiBp
cyBoYW5kbGVkIGNvcnJlY3RseS4gV2hhdCBpcyBub3QKPiBpcyB0aGUgZmFjdCB0aGF0IHdlIGNh
cmUgYWJvdXQgdGhlIG51bWJlciBvZiBiaXRmbGlwcyBiZWZvcmUgaGF2aW5nIGEKPiBmYWlsdXJl
IGJlY2F1c2UgaWYgaXQgcmVhY2hlcyBhIGNlcnRhaW4gdGhyZXNob2xkICh0eXBpY2FsbHkgMi8z
IG9mIHRoZQo+IHN0cmVuZ3RoKSB0aGUgdXBwZXIgbGF5ZXIgaXMgcmVzcG9uc2libGUgb2YgbW92
aW5nIHRoZSBkYXRhIGFyb3VuZCB0bwo+IGF2b2lkIGxvb3NpbmcgaXQuCj4gCj4gWW91IG5lZWQg
dG8gaWRlbnRpZnkgdGhlIGhhcmR3YXJlIHJldmlzaW9uIHRoYXQgZml4ZWQgaXQgYW5kIHByb3Zp
ZGUgYQo+IHdhcm5pbmcgb3RoZXJ3aXNlLCBvciBhdCBsZWFzdCBhIGNvbW1lbnQgaW4gdGhlIGNv
ZGUuLi4KCkluIGl0c2VsZiwgbmVpdGhlciBhIGNvbW1lbnQsIG5vciBhIHdhcm5pbmcgd2lsbCBo
ZWxwIGFzIGZhciBhcyB0aGUgdXBwZXIgbGF5ZXIKaXMgY29uY2VybmVkLiBIb3dldmVyIHRoZSBk
cml2ZXIgY2FuIGJlIGNoYW5nZWQgdG8gb3ZlcmVzdGltYXRlIHRoZSBudW1iZXIgb2YKY29ycmVj
dGVkIGJpdGZsaXBzLgoKSSBqdXN0IHNlbnQgYSBwYXRjaCBbMV0gd2hpY2ggdHJpZXMgdG8gYWRk
cmVzc2VzIHRoaXMuIEkgYWRtaXQgdGhhdCBpdCBpcyBub3QKaWRlYWwsIGJ1dCBpbiBteSBvcGlu
aW9uIGl0IGlzIGEgcmVhc29uYWJsZSB0cmFkZW9mZiB3aGljaCBjYW4gYmUgdXNlZCBhcyBhCnRl
bXBvcmFyeSBzb2x1dGlvbi4KCkZvciBhIGxvbmcgdGVybSBmaXgsIHByb2JhYmx5IGl0IHdvdWxk
IGJlIHBvc3NpYmxlIHRvIGNoYW5nZSB0aGUgZHJpdmVyIHRvIGRvCnRoZSBFQ0MgY29ycmVjdGlv
biBpbiBzb2Z0d2FyZS4gIEFsdGhvdWdoIEkgaGF2ZSBubyBpZGVhIGhvdyB0aGF0IHdvdWxkIGlt
cGFjdAp0aGUgcGVyZm9ybWFuY2UuCgpbMV0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI1
MDUyMi1xcGljLXNuYW5kLW92ZXJlc3RpbWF0ZS1iaXRmbGlwcy12MS0xLTM1YzY1YzA1MDY4ZUBn
bWFpbC5jb20KClJlZ2FyZHMsCkdhYm9yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
