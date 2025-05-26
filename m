Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A2DC54FB3
	for <linux-mtd@archiver.kernel.org>; Mon, 26 May 2025 19:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hq37P4ut5YcAPabgrFzuhyfgQcX8I4ute49qW0Pu0rw=; b=F8Jfcadob6/HgU
	k9Ejyu8xlWYt95FCZj2z+h1jPqPkYKjd7kTZYesQ1NiufMMYiDkVN3YfbYr5/wwgBe3bzywI175z2
	rDMZ8EiN5HBPh/k19RB8FPyl3Plph+yBo4DEFIa9SGt+khgLVmBhQvG0HHXfpaV96wAXW7iZcNT23
	VIybe1z8E6CPqHCJB1FrLRDxRLtLcoMGCYcDnuMvPVOnA30vqLpn9VE4gyxY3ocPCc9nao6ToJfTM
	rURNICANPGr2ZzF8lj3l3vxfNc8mZ8DVDcLa7jSGDNIvmXyX8uthx++dZBSU0yi+K4St0wGkCzMY6
	WjmUg/WV+oO1MImfahPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJd3h-00000009P1r-44Iu;
	Mon, 26 May 2025 19:00:25 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJd3f-00000009P1H-1C0F
	for linux-mtd@lists.infradead.org;
	Mon, 26 May 2025 19:00:24 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-601ab204085so6450464a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 26 May 2025 12:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748286021; x=1748890821; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W7HLJjnq943t9tfBsG6nEO+BsP0zHoqnaSW8DhhOz60=;
        b=D8jgJ3wYHcbhdvstGKYPnJxkzRzU7F38iO/aqd+S5/3kvSQDVZzlbX6X7CbsGf87g2
         do+kHDLIJaD3oIfHXR2h7ToVxudL5miVstEjT19ziGAmw/CZNx4cWF3qgo/71tJjvqz5
         i5Wv/M5sExvhq2bkpDK01M8iuVwZ1h2n2iqTAkJdTZpHCpt3VXiKAYDlZCvxaJXXaBfW
         EQdbjVyA+6vBB1dksTj3D6548hcpPIc098Ctuif2VALD4cKLp4v9KByog8Y4LGy2+1nq
         YElvnpEN1uqEjJ2ciDBD6CKI/rGGc9Y9JWSSIqVE0kqLA0scjyNvDjt0FnsF6CPxPUJ/
         QFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748286021; x=1748890821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W7HLJjnq943t9tfBsG6nEO+BsP0zHoqnaSW8DhhOz60=;
        b=Cjae9BTPCYolX8IhOCkkOWOqJCYAJ4lNTY6u5+J136/H9F/EZd0zhPmz6sTHRiTmlp
         RF79nItr69zjMeEHaR6u9GaiLSw8TzVda+isDzhYLPRJv8J+YjTEx6Xrc9hDKApCZjnP
         RtMfdn3GFPzW05Y+vUsfgb+3Nmu9cFmyTy760acT3tT7Sq8oDKvFL4gcGYtHWopb52AV
         eBXkbafofqR95j/CmVe3GDOUEFeRVG0zNZKa49GVVt2RBtAo4Ami6hlU33tbNfsE8mAx
         kM1e0W84TA2YLIrirpQo5wSH5deVghIoI9m7MIBTeadL7Px+1sh2FSjQDg0T8VSX2wzW
         /Rog==
X-Forwarded-Encrypted: i=1; AJvYcCVHx23jODhXYdc2bNjdT0jr7ZHjVWyStr8TqpMiL15+JFipTUZAzkVXpZUeow93iFAfwfff9oXtV0k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzyD86rMAhUg6TAdNtyekiIiCP7FNClB9L0iCk1NbUUU7Bo5kV6
	A63EXkaLkOt4mjDsmrfVk/PqTLG0J6cAMhJtPQmHBnaONmBaqb/bGYau
X-Gm-Gg: ASbGncsHs1mKNuda8M2bmTuMrbpmcjAplOT3iOPnYVZsaFODOqXhxjvGT+bhW0R5pML
	G87Cj++TUvpMMzJPnB+VZIfgqIm+4ZTOzQYGOPm4W84X936RmGyrSuKfg4qtw5BhH+dKf1s6T60
	n6K4RMofMkSclKxcPpZITS4FMhetGDQnajCPDRb991CAmfQaxdg2yvY5DoWJNYuq6E4dYCUa5bF
	9vufHV7+HDA660dA+520aX2fq2j2SgrAXb6EiuF5P7jv/7iu3WPRYWWZx3ISmNNkA4NWH5JpTEt
	XUhem5BKLB+cRS5XTnTy1DCNPIP8WSQxGI4SAFoGTzEZaDbY3h7DY5e7V+vW5SIi1q3s1neFoRI
	aV0dsRQUcSNzw5pmA
X-Google-Smtp-Source: AGHT+IGIry+aoCgx9x9cr71iQ7GQxeXVX+GF2ustchqL5GOThY2B0a+6W4khGGch4NApD0EjZ99GJQ==
X-Received: by 2002:a17:907:3fa8:b0:ad5:6622:114e with SMTP id a640c23a62f3a-ad64e8e0ee1mr1213181666b.30.1748286021072;
        Mon, 26 May 2025 12:00:21 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8859d7411sm75220066b.80.2025.05.26.12.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 12:00:20 -0700 (PDT)
Message-ID: <acca434f-30f3-4992-bcf3-e389563b356c@gmail.com>
Date: Mon, 26 May 2025 21:00:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] spi: spi-qpic-snand: overestimate corrected bitflips
Content-Language: hu
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250522-qpic-snand-overestimate-bitflips-v1-1-35c65c05068e@gmail.com>
 <875xhr5r2y.fsf@bootlin.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <875xhr5r2y.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_120023_323272_21896BBA 
X-CRM114-Status: GOOD (  17.10  )
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

MjAyNS4gMDUuIDIzLiAxNjozOSBrZWx0ZXrDqXNzZWwsIE1pcXVlbCBSYXluYWwgw61ydGE6Cj4g
T24gMjIvMDUvMjAyNSBhdCAxOTozMzoyNiArMDIsIEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwu
Y29tPiB3cm90ZToKPiAKPj4gVGhlIFFQSUMgaGFyZHdhcmUgaXMgbm90IGNhcGFibGUgb2YgcmVw
b3J0aW5nIHRoZSBleGFjdCBudW1iZXIgb2YgdGhlCj4+IGNvcnJlY3RlZCBiaXRmbGlwcywgaXQg
b25seSByZXBvcnRzIHRoZSBudW1iZXIgb2YgdGhlIGNvcnJlY3RlZCBieXRlcy4KPj4gSG93ZXZl
ciB0aGUgY3VycmVudCBjb2RlIHRyZWF0cyB0aGF0IGFzIGNvcnJlY3RlZCBiaXRmbGlwcyB3aGlj
aCBpcwo+PiBxdWl0ZSBpbmFjY3VyYXRlIGluIG1vc3QgY2FzZXMuIEZvciBleGFtcGxlLCBldmVu
IGlmIHRoZSBoYXJkd2FyZSByZXBvcnRzCj4+IG9ubHkgb25lIGJ5dGUgYXMgY29ycmVjdGVkLCB0
aGF0IGJ5dGUgbWF5IGhhdmUgY29udGFpbmVkIG11bHRpcGxlIGJpdAo+PiBlcnJvcnMgZnJvbSBv
bmUgdXAgdG8gdGhlIG1heGltdW0gbnVtYmVyIG9mIGNvcnJlY3RhYmxlIGJpdHMuCj4+Cj4+IENo
YW5nZSB0aGUgY29kZSB0byByZXBvcnQgdGhlIG1heGltdW0gb2YgdGhlIHBvc3NpYmx5IGNvcnJl
Y3RlZCBiaXRzLAo+PiB0aHVzIGFsbG93aW5nIHVwcGVyIGxheWVycyB0byBkbyBjZXJ0YWluIGFj
dGlvbnMgYmVmb3JlIHRoZSBkYXRhIGdldHMKPj4gbG9zdCBkdWUgdG8gdW5jb3JyZWN0YWJsZSBl
cnJvcnMuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEdhYm9yIEp1aG9zIDxqNGc4eTdAZ21haWwuY29t
Pgo+PiAtLS0KPj4gVGhlIHBhdGNoIHRyaWVzIHRvIGFkZHJlc3MgTWlxdWVsJ3MgY29uY2VybnMg
WzFdIGFib3V0IHRoZSBjb3JyZWN0ZWQgYml0Cj4+IGVycm9yIHJlcG9ydGluZyBjYXBhYmlsaXRp
ZXMgb2YgdGhlIFFQSUMgaGFyZHdhcmUuCj4+Cj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9hbGwvODdoNjFlOGtvdy5mc2ZAYm9vdGxpbi5jb20KPiAKPiBUaGFuayB5b3UgdmVyeSBtdWNo
IGZvciBhdHRlbXB0aW5nIHRvIGltcHJvdmUgdGhlIHNpdHVhdGlvbi4gR2l2aW5nIHRoaXMKPiBh
IHNlY29uZCBsb29rLCBpdCB3aWxsIG5vdCB3b3JrIGVpdGhlciBhbmQgd2lsbCBiZSBldmVuIHdv
cnNlLCBmb3JjaW5nCj4gd2VhciBsZXZlbGxpbmcgYWZ0ZXIgZWFjaCByZWFkLiBTbyBsZXQncyBu
b3QgY2hhbmdlIHRoZSByZXR1cm5lZCB2YWx1ZSwKPiBob3BlZnVsbHkgdGhlIHJlYWwgbGlmZSBp
cyBkaWZmZXJlbnQgYXMgdGhlIHRlc3QgY2FzZSBhbmQgbW9zdCBiaXRmbGlwcwo+IHdpbGwgYmUg
c3ByZWFkIGFuZCBub3QgY29uY2VudHJhdGVkIGluIGEgc2luZ2xlIGJ5dGUuIEhvd2V2ZXIgSSdk
Cj4gd2VsY29tZSBlaXRoZXIgYSBwcl93YXJuX29uY2UoKSBvciBhdCBsZWFzdCBhIGNvbW1lbnQg
c29tZXdoZXJlIGFib3V0Cj4gdGhpcy4KCk9rLCBJIHdpbGwgcmV3b3JrIHRoZSBwYXRjaC4gSWYg
aXQgdHVybnMgb3V0IHRoYXQgdGhlIGN1cnJlbnQgYXBwcm9hY2ggYmVoYXZlcwpiYWRseSBpbiBy
ZWFsIGxpZmUsIHdlIGNhbiBzdGlsbCBjaGFuZ2UgaXQgbGF0ZXIuCgpUaGFua3MsCkdhYm9yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
