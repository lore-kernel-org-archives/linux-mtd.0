Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC32C87FD3
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Aug 2025 07:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Ofz0JhjmLo2Gi+sAbQL5GMp6lj/jcUAfFMnAqLRxq8=; b=pqiqObMuB/YYmG
	upwOULwTOZyIkeOrIEtJI7/mU+YZp/HiHGz287h7xtpRJzROrn0gvkWAMliMYiOToBjMEUnDRYjqU
	18wUNp7cLRPnKeHA64spmH7FmEgb1moHmZjqDZCs4VZM6zPNqQQV3q5OQ2hA9DHEYD7b29z3pF7Mv
	ewVzaCvgU3DnK7F80yu9/a2ccWlpUeG4DuOTjW37nCzafbOHNauNXsax4ebUIabAP8J7A+EDBmb32
	X/IcTqd/awOylsZ0+PD1KJMzj0fbPCZwokm/1em8CwhDr/UI73qQl7328jwP7MLYaQo4O8mtILm5K
	a9rn+b5BiGA9RmyL9UYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipoZ-00000009qJt-1xUk;
	Mon, 04 Aug 2025 07:40:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uipoW-00000009qJU-3oVi
	for linux-mtd@lists.infradead.org;
	Mon, 04 Aug 2025 07:40:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so1928963f8f.2
        for <linux-mtd@lists.infradead.org>; Mon, 04 Aug 2025 00:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754293255; x=1754898055; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqcKaT7eQkyPHjWKdc7YMZtzFXM2RtYZ2J7ldHCt+mw=;
        b=E6Ov5wGyOPEPN4VzUTQJ+HwTQt8fz95+6tywxjhDrBf2rCKPWzzGnQtUTS67lAA0Ws
         rRQMl3FYDboE/9WvRf5gCuFhRcGXRZCCm7z17VdLM7CPseo8KeX/rhupCipaEkdpzweA
         Hl/0p2s8lYO3mc3+EIllUEo3alK0BJI6LqCtkBr7/oNNmkeFTyviof4Lp4WHZLfZ5chz
         E2wE4EhgKf5km88pwMqKYTqhcGgAgFOyjsi60OSVo0eSOlhWM4K6zBhQP1hMzTIhHHpz
         MHvWlUyEo7/NZjl97OnjXVpEGm7DYZtt+Y+G8euq46mvyBvfK6Z493mrb6kAuBxjl0us
         bXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754293255; x=1754898055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqcKaT7eQkyPHjWKdc7YMZtzFXM2RtYZ2J7ldHCt+mw=;
        b=VYqKEWVrvWDtVxESTWQdgVfzTzo3m76tTRtNLMOWD/W9mBYH1GbcJ5Xt4HWqC49Jqo
         gjStY3S0JPgKHF82wluCDdGgNuvlyruVOJmTuS5N+7+aqAwpbZDktEqO3HS8jHaNc/JN
         Q1tfXGoRmFNbZMWJkoLHo2Mb239cRvzZ50uCi8eXtqhIwC1snYDFpnTpJYa7TNIfZ2Xy
         Pl65lforhJ1mEVqjVQH84SbQn0lJSLLo3VwUeVFdTxGhQXBwFOV90w+OQtGJcM/FszZL
         We1DJj+iPe3Yu1XbcBO9SlNYnxngSnvcMUvRR1b8XdCwbFL4c1B3dI/nR5JrKlVd0k0A
         3H5A==
X-Forwarded-Encrypted: i=1; AJvYcCVXBnlInial4hehwhh8ag7GR29w2mMrpmnSuHGEqhNclniodLpXjVHdzTSRZiqq/lQpXGdvmy5Ms8w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzxCvR1RyLebDJ5eXnvZ4udmiy9eVH9kRBu62kt7gMTDahMaj/i
	9YaI2m+5ZYE1lswh6781CNOAPVGk20pcNhvFz2bj8hNEIgTDp6E2mANC
X-Gm-Gg: ASbGncsfcbS+K3qsoUM1ael38C1Y+RFiDgMnRnyoC5lfwy6PEaXEAjpK7kk+G7RxDhI
	qgw7TAZ+CbDKfkfXsyB/qyC7FIkAA/XU+q10ckqltCNTxXZNT15hPj+pfMpsCOiWQ3VnbTfhLkX
	IujyDxXXnfGCBwHxa54Jd8K2kcAEp/DQk1cPr//8t/djxTcm0xqCNii129ZuvGava9oVBcpROWM
	LTOLAOhraltNHsxgSt+LKzeTwYqCHrKQM7/dl9WfEXUmmAPCKJGZMDZStc8yxfkcWXSliaHXmVf
	Fl/SSuoP4WLWMDV0gAIAUXKxVpiTbNpqF1S1owQUh5JN+nwaJAnIvep5zOYBt2z3UqbOUfq2+OY
	ptwMrq1/iMj5NelESLLJV/0C0IL5BqGs6qlVNk46Z6xOW31lYVDzUTADpypmRn4I=
X-Google-Smtp-Source: AGHT+IFaZRGYY+LVcJLGb3+yzvNqGobXgRtxAeFaCa1MEjST24PMX695hPY5+LjN6sz9970sBJdQsQ==
X-Received: by 2002:a05:6000:24c1:b0:3b7:96e8:7596 with SMTP id ffacd0b85a97d-3b8d94ca5bdmr5641955f8f.57.1754293255137;
        Mon, 04 Aug 2025 00:40:55 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2f03sm14376922f8f.72.2025.08.04.00.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Aug 2025 00:40:54 -0700 (PDT)
Message-ID: <1ba00a38-7293-4f72-9aee-f87f41a3dcc6@gmail.com>
Date: Mon, 4 Aug 2025 09:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: use correct CW_PER_PAGE value for
 OOB write
Content-Language: hu
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250801-qpic-snand-oob-cwpp-fix-v1-1-f5a41b86af2e@gmail.com>
 <b2e4d6b1-25bc-4b2e-ae54-6588f1573131@oss.qualcomm.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <b2e4d6b1-25bc-4b2e-ae54-6588f1573131@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_004056_948460_91FC8316 
X-CRM114-Status: GOOD (  15.20  )
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

SGkgS29ucmFkLAoKMjAyNS4gMDguIDAxLiAxMzowOCBrZWx0ZXrDqXNzZWwsIEtvbnJhZCBEeWJj
aW8gw61ydGE6CgouLi4KCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFu
ZC5jIGIvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYwo+PiBpbmRleCAwY2ZhMGQ5NjBmZDNj
MjQ1YzJiYmY0ZjVlMDJkMGZjMGIxM2U3Njk2Li41MjE2ZDYwZTAxYWFiMjZmOTI3YmFhZWEyNDI5
NjU3MWE3NzUyN2NiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL3NwaS9zcGktcXBpYy1zbmFuZC5j
Cj4+ICsrKyBiL2RyaXZlcnMvc3BpL3NwaS1xcGljLXNuYW5kLmMKPj4gQEAgLTExOTYsNyArMTE5
Niw3IEBAIHN0YXRpYyBpbnQgcWNvbV9zcGlfcHJvZ3JhbV9vb2Ioc3RydWN0IHFjb21fbmFuZF9j
b250cm9sbGVyICpzbmFuZGMsCj4+ICAJdTMyIGNmZzAsIGNmZzEsIGVjY19iY2hfY2ZnLCBlY2Nf
YnVmX2NmZzsKPj4gIAo+PiAgCWNmZzAgPSAoZWNjX2NmZy0+Y2ZnMCAmIH5DV19QRVJfUEFHRV9N
QVNLKSB8Cj4+IC0JICAgICAgIEZJRUxEX1BSRVAoQ1dfUEVSX1BBR0VfTUFTSywgbnVtX2N3IC0g
MSk7Cj4+ICsJICAgICAgIEZJRUxEX1BSRVAoQ1dfUEVSX1BBR0VfTUFTSywgMCk7Cj4gCj4gRldJ
VyBJJ20ganVzdCBhIGZseS1ieSByZXZpZXdlciBmb3IgdGhpcyBkcml2ZXIsIGJ1dCB0aGUgZG9j
cyBzYXk6Cj4gCj4gVGhlIHZhbHVlIGlzIHRoZSBudW1iZXIgb2YgY29kZXdvcmRzIHBlciBwYWdl
IG1pbnVzIG9uZQoKV2VsbCwgdGhlIGRyaXZlciB1c2VzIHRoYXQgZGlmZmVyZW50bHkgZXZlbiB3
aXRob3V0IHRoZSBwYXRjaC4gU2VlIGJlbG93LgoKPiAiTk9URTogVGhpcyBmaWVsZCBtdXN0IGJl
IGNsZWFyZWQgZm9yIGJsb2NrIGVyYXNlIG9wZXJhdGlvbiIKCiAgICAkIGdpdCBncmVwIC1ocCAn
RklFTERfUFJFUChDV19QRVJfUEFHRV9NQVNLLC4qOycgZHJpdmVycy9zcGkvc3BpLXFwaWMtc25h
bmQuYwogICAgc3RhdGljIGludCBxY29tX3NwaV9ibG9ja19lcmFzZShzdHJ1Y3QgcWNvbV9uYW5k
X2NvbnRyb2xsZXIgKnNuYW5kYykKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgRklFTERfUFJFUChDV19QRVJfUEFHRV9NQVNLLCAwKSk7CiAgClRoaXMgZnVuY3Rp
b24gaW1wbGVtZW50cyB0aGUgYmxvY2sgZXJhc2Ugb3BlcmF0aW9uIGFuZCBpdCBjb3JyZXNwb25k
cyB0byB0aGUKZG9jdW1lbnRhdGlvbi4gU28gZmFyIHNvIGdvb2QuCgogICAgc3RhdGljIGludCBx
Y29tX3NwaV9yZWFkX2xhc3RfY3coc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpzbmFuZGMs
CiAgICAgICAgICAgICAgICAgICBGSUVMRF9QUkVQKENXX1BFUl9QQUdFX01BU0ssIDApOwogICAg
c3RhdGljIGludCBxY29tX3NwaV9yZWFkX2N3X3JhdyhzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xs
ZXIgKnNuYW5kYywgdTggKmRhdGFfYnVmLAogICAgICAgICAgICAgICAgICAgRklFTERfUFJFUChD
V19QRVJfUEFHRV9NQVNLLCAwKTsKICAKClRoZXNlIHR3byBmdW5jdGlvbnMgYXJlIHVzaW5nIGEg
c2luZ2xlIGNvZGV3b3JkICh3aXRoIHplcm8gQ1dfUEVSX1BBR0UgdmFsdWUpLgpTbywgaXQgc2Vl
bXMgdGhhdCBpbiByZWFsaXR5IHRoZSBDV19QRVJfUEFHRSB2YWx1ZSBtZWFucyB0aGUgbnVtYmVy
IG9mIGNvZGV3b3JkcwoobWludXMgb25lKSB1c2VkIHdpdGhpbiBhIHNpbmdsZSBvcGVyYXRpb24g
ZXhlY3V0ZWQuIE9mIGNvdXJzZSBpdCBpcyBwb3NzaWJsZQp0aGF0IHRoZSBleGlzdGluZyBjb2Rl
IGlzIHdyb25nIGhlcmUuCgogICAgc3RhdGljIGludCBxY29tX3NwaV9yZWFkX3BhZ2VfZWNjKHN0
cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqc25hbmRjLAogICAgICAgICAgICAgICAgICAgRklF
TERfUFJFUChDV19QRVJfUEFHRV9NQVNLLCBudW1fY3cgLSAxKTsKICAgIHN0YXRpYyBpbnQgcWNv
bV9zcGlfcmVhZF9wYWdlX29vYihzdHJ1Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKnNuYW5kYywK
ICAgICAgICAgICAgICAgICAgIEZJRUxEX1BSRVAoQ1dfUEVSX1BBR0VfTUFTSywgbnVtX2N3IC0g
MSk7CiAgICBzdGF0aWMgaW50IHFjb21fc3BpX3Byb2dyYW1fcmF3KHN0cnVjdCBxY29tX25hbmRf
Y29udHJvbGxlciAqc25hbmRjLAogICAgICAgICAgICAgICAgICAgRklFTERfUFJFUChDV19QRVJf
UEFHRV9NQVNLLCBudW1fY3cgLSAxKTsKICAgIHN0YXRpYyBpbnQgcWNvbV9zcGlfcHJvZ3JhbV9l
Y2Moc3RydWN0IHFjb21fbmFuZF9jb250cm9sbGVyICpzbmFuZGMsCiAgICAgICAgICAgICAgICAg
ICBGSUVMRF9QUkVQKENXX1BFUl9QQUdFX01BU0ssIG51bV9jdyAtIDEpOwoKClRoZSBwcmV2aW91
cyBmdW5jdGlvbnMgYXJlIG9wZXJhdGluZyBvbiB3aG9sZSBwYWdlcywgc28gdGhvc2UgYXJlIHVz
aW5nIGFsbCBjb2Rld29yZHMKd2l0aGluIGEgcGFnZSB0aHVzICdudW1fY3cgLSAxJyBpcyBnZXR0
aW5nIHNldCBpbiB0aGUgcmVnaXN0ZXIgZmllbGQuIFRoaXMgYWxzbyBtYXRjaGVzCndpdGggdGhl
IGRvY3VtZW50YXRpb24uCgogICAgc3RhdGljIGludCBxY29tX3NwaV9wcm9ncmFtX29vYihzdHJ1
Y3QgcWNvbV9uYW5kX2NvbnRyb2xsZXIgKnNuYW5kYywKICAgICAgICAgICAgICAgICAgIEZJRUxE
X1BSRVAoQ1dfUEVSX1BBR0VfTUFTSywgbnVtX2N3IC0gMSk7CgpUaGlzIGlzIHRoZSBmdW5jdGlv
biBmaXhlZCBieSB0aGUgcGF0Y2guIEFzIGl0IGlzIGluZGljYXRlZCBpbiB0aGUgY29tbWl0IGRl
c2NyaXB0aW9uCnRoaXMgYWxzbyB1c2VzIGEgc2luZ2xlIGNvZGV3b3JkIHNpbWlsYXJseSB0byB0
aGUgcWNvbV9zcGlfcmVhZF8obGFzdF9jdyxjd19yYXcpIGZ1bmN0aW9ucwpkZXNjcmliZWQgYWJv
dmUgc28gdGhlIENXX1BFUl9QQUdFIHZhbHVlIHNob3VsZCBiZSBzZXQgdG8gemVyby4KClJlZ2Fy
ZHMsCkdhYm9yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
