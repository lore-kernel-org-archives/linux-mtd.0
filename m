Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4D7CA0EC4
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i/0dY3Go5D3jKcTcsrVSuQkg7Lp6F0Go0PG7woAn7Ug=; b=lFQMjQAtK1pEDV
	SvFcaU6FXg4lWwiEVvXcOwLkxCbY+6IWTBloVevktpPJAs8E+ET8+Lf3kIRGMumlPNzSF0XczhUHP
	nmkNm03bRN9Yds+5ZQwB3gJMsD582NjfQXyiOT2AGl0BhS4/iLph0v7ltcseiw7GIAgQInOWH1vzQ
	zZ8kBKsAeNrlZKsiVZ6vpFPHo1yRFJxWyJhTjJH0Sp+jAemu7GSERXVOxA0oCol1SyMCtljlNpe5X
	gp2MBM7SLs9ZMkarW5D0yAqfnJg3cCfN83YFCTCAXKSSegtMaEmbDpjA0fof7IcEboh01J7dHr2MJ
	o3jZPJUPR9xrW2DrL6Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjU-0000000BJcN-1YPw;
	Tue, 12 Aug 2025 16:20:16 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmq8-0000000AZ2v-2VBS
	for linux-mtd@lists.infradead.org;
	Tue, 12 Aug 2025 11:06:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3b78315ff04so4529925f8f.0
        for <linux-mtd@lists.infradead.org>; Tue, 12 Aug 2025 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754996807; x=1755601607; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e4LYi0dRz3wz8Z6NYKWbJ5ci0Q9fM0Vpn15hTfKF8nE=;
        b=ICxvFjp8/naO3PD5fpfLxPSa+2OpEVxn0dv9cktL1o/qst/kCTfMqKAfDCjN6BcsnG
         CrjJcWTCwz0aIyPVVcpU5UsJlp8qv4YR+dsjWOy2uF4kVz4o7lWxk/JTHlTPv4Z4ivgi
         cvpbrsNcBaM+RMBDD8GwW8dWNSYtLujWok8ScPFrBdWrPq1imF7MGqK8Hp0MMha81yjK
         UXYba6/8+W9GOsMv4nQSiewUry536HEUSpc9HbSBEIluu4cmotTvGVOpXsqIhagZ0ROE
         DaB7cwBQ6+MBr1uR3S1uAesz/miKMwqeBmHRY5pEiBflvBZIRFbqtwq+nXNgmPoJUbMd
         JXhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754996807; x=1755601607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e4LYi0dRz3wz8Z6NYKWbJ5ci0Q9fM0Vpn15hTfKF8nE=;
        b=J6nea8g4LGa5rsV5OhWnlzYlMHJ5eky/a0k6ZVYoO4Mm/p7r+Ztr+5Z1MyfEl8BmR2
         IwmEJvmgMevuAHhDywdq0FRhTmSUh8MdIpM7t8lCRrHjT8cff2acrrgpzOYgnM4sjwoo
         tk4E+uwma4i9pnbUe1t2/+atyfNuEsg2GTxd6ChJ7dgygQlcvL5KS4UTepP5N7/FTyCJ
         B+OqfVbLw0EKmedom9M3U0Oe/QR+t2qx9x0hLBpuVFswQWaVC8noM/qa7yquNJKyQ1/N
         zh9zXbn3TBJDI97Ktd2NMAG9FwnaDUWi2dDe+pGRBFWMgcSDWNrLWA+CvnhKzYJRQJaH
         BNoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVENa4dJLVEWPNaNvOhWgM87Q60XUy/QADQ1VVrK2cU+HMKE69CbcaEa7CwGHt73ozW70S9fZYicWc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoWFGigIKSnE6nBftGpadjQvY/eGGFWdOuD+qlZuXDYTp3YkE2
	yV7QxnO1f7yAvEdw7xaWnk9U6NZL21gy11XbT3ekLsoFyGU9L4mweYFSHoJojg==
X-Gm-Gg: ASbGncvScRc57veSBEuwsXCAMQLfo1vs2uJEJiDmIsU1aopYsqXxbavX20Cta3e1SUQ
	7ghftW8KKIzByVW9Dl9vDdp0kYwYp4wJCJRrMLQ004qIych0jEnit3ywubVqzr1nLqFcXZrnq5X
	UYZlCimP1kx3XalM60IbGp1ogNfmxNF3KqLa7dW8XkGpG312CVwMcGbzNldpbO389O/+2yb57K5
	q6hMt2Cp4Fb7XkIdAkB5+FYOK1Ox2XH9BDhovMXzHuebDEQ40u+9TyP+cbFOVaiByMp9qEEOGDn
	ulI8nbt808np05aokpJGiZEOiL4Y43gmTNMZChdMIuCTtxt5EtYiT7RHFbzLBCKyeRrVIurp91N
	eNg1h0XZXbl3E2GsX/eaGGSHiRvydymYBTIdo1c9BtEpRw7ASmsBuQXVwGDMBhis=
X-Google-Smtp-Source: AGHT+IEfJzsl5sTUuHlfZV/CGAVouPssfIUHFzITNiPwgJ1+5lm4U750mnHyvBWvz6wm/EyMnnOAmg==
X-Received: by 2002:adf:f590:0:b0:3b9:13a4:72f with SMTP id ffacd0b85a97d-3b913a40db1mr890893f8f.14.1754996806833;
        Tue, 12 Aug 2025 04:06:46 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459ee17535bsm257946505e9.16.2025.08.12.04.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 04:06:46 -0700 (PDT)
Message-ID: <e5b981f8-9b6b-42c6-b432-537d23f7fd58@gmail.com>
Date: Tue, 12 Aug 2025 13:06:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: handle 'use_ecc' parameter of
 qcom_spi_config_cw_read()
Content-Language: hu
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250808-qpic-snand-handle-use_ecc-v1-1-67289fbb5e2f@gmail.com>
 <3e790d99-5c6c-4148-85f5-0023a621afeb@oss.qualcomm.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <3e790d99-5c6c-4148-85f5-0023a621afeb@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_040648_639333_8E0CD92D 
X-CRM114-Status: GOOD (  16.29  )
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

MjAyNS4gMDguIDEyLiAxMTo1NSBrZWx0ZXrDqXNzZWwsIEtvbnJhZCBEeWJjaW8gw61ydGE6Cj4g
T24gOC84LzI1IDc6MTUgUE0sIEdhYm9yIEp1aG9zIHdyb3RlOgo+PiBEdXJpbmcgcmF3IHJlYWQs
IG5laXRoZXIgdGhlIHN0YXR1cyBvZiB0aGUgRUNDIGNvcnJlY3Rpb24gbm9yIHRoZSBlcmFzZWQK
Pj4gc3RhdGUgb2YgdGhlIGNvZGV3b3JkIGdldHMgY2hlY2tlZCBieSB0aGUgcWNvbV9zcGlfcmVh
ZF9jd19yYXcoKSBmdW5jdGlvbiwKPj4gc28gaW4gY2FzZSBvZiByYXcgYWNjZXNzIHJlYWRpbmcg
dGhlIGNvcnJlc3BvbmRpbmcgcmVnaXN0ZXJzIHZpYSBETUEgaXMKPj4gc3VwZXJmbHVvdXMuCj4+
Cj4+IEV4dGVuZCB0aGUgcWNvbV9zcGlfY29uZmlnX2N3X3JlYWQoKSBmdW5jdGlvbiB0byBldmFs
dWF0ZSB0aGUgZXhpc3RpbmcKPj4gKGJ1dCBhY3R1YWxseSB1bnVzZWQpICd1c2VfZWNjJyBwYXJh
bWV0ZXIsIGFuZCBjb25maWd1cmUgcmVhZGluZyBvbmx5Cj4+IHRoZSBmbGFzaCBzdGF0dXMgcmVn
aXN0ZXIgd2hlbiBFQ0MgaXMgbm90IHVzZWQuCj4+Cj4+IFdpdGggdGhlIGNoYW5nZSwgdGhlIGNv
ZGUgZ2V0cyBpbiBsaW5lIHdpdGggdGhlIGNvcnJlc3BvbmRpbmcgcGFydCBvZgo+PiB0aGUgY29u
ZmlnX25hbmRfY3dfcmVhZCgpIGZ1bmN0aW9uIGluIHRoZSBxY29tX25hbmRjIGRyaXZlci4KPj4K
Pj4gU2lnbmVkLW9mZi1ieTogR2Fib3IgSnVob3MgPGo0Zzh5N0BnbWFpbC5jb20+Cj4+IC0tLQo+
PiAgZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYyB8IDExICsrKysrKysrLS0tCj4+ICAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYyBiL2RyaXZlcnMvc3BpL3NwaS1xcGlj
LXNuYW5kLmMKPj4gaW5kZXggN2I3NmQyYzgyYTUyODdkZjEzZWU2ZmNlYmM0YWJiZTU4Y2E4NjFl
ZS4uMTE5MDAzYzQ3ODQ4OTA0NThhNDFjNjdmYThiYzE3ZDcyMTAzMGIwZCAxMDA2NDQKPj4gLS0t
IGEvZHJpdmVycy9zcGkvc3BpLXFwaWMtc25hbmQuYwo+PiArKysgYi9kcml2ZXJzL3NwaS9zcGkt
cXBpYy1zbmFuZC5jCj4+IEBAIC00OTQsOSArNDk0LDE0IEBAIHFjb21fc3BpX2NvbmZpZ19jd19y
ZWFkKHN0cnVjdCBxY29tX25hbmRfY29udHJvbGxlciAqc25hbmRjLCBib29sIHVzZV9lY2MsIGlu
dCBjCj4+ICAJcWNvbV93cml0ZV9yZWdfZG1hKHNuYW5kYywgJnNuYW5kYy0+cmVncy0+Y21kLCBO
QU5EX0ZMQVNIX0NNRCwgMSwgTkFORF9CQU1fTkVYVF9TR0wpOwo+PiAgCXFjb21fd3JpdGVfcmVn
X2RtYShzbmFuZGMsICZzbmFuZGMtPnJlZ3MtPmV4ZWMsIE5BTkRfRVhFQ19DTUQsIDEsIE5BTkRf
QkFNX05FWFRfU0dMKTsKPj4gIAo+PiAtCXFjb21fcmVhZF9yZWdfZG1hKHNuYW5kYywgTkFORF9G
TEFTSF9TVEFUVVMsIDIsIDApOwo+PiAtCXFjb21fcmVhZF9yZWdfZG1hKHNuYW5kYywgTkFORF9F
UkFTRURfQ1dfREVURUNUX1NUQVRVUywgMSwKPj4gLQkJCSAgTkFORF9CQU1fTkVYVF9TR0wpOwo+
PiArCWlmICh1c2VfZWNjKSB7Cj4+ICsJCXFjb21fcmVhZF9yZWdfZG1hKHNuYW5kYywgTkFORF9G
TEFTSF9TVEFUVVMsIDIsIDApOwo+IAo+IFdoeSBhcmUgd2UgcmVhZGluZyAyIHJlZ2lzdGVycyAo
dGhlIDIgaW4gdGhlIGZ1bmMgY2FsbCkgaGVyZSwgLi4uCgpCZWNhdXNlIHdoZW4gRUNDIGlzIHVz
ZWQsIHdlIG5lZWQgdGhlIHN0YXR1cyBvZiB0aGUgRUNDIGNvcnJlY3Rpb24gZnJvbSB0aGUKTkFO
RF9CVUZGRVJfU1RBVFVTIHJlZ2lzdGVyIHdoaWNoIGlzIHBsYWNlZCByaWdodCBhZnRlciB0aGUg
TkFORF9GTEFTSF9TVEFUVVMuCgpIZXJlIGFyZSB0aGUgcmVsZXZhbnQgZGVmaW5pdGlvbnMgZnJv
bSB0aGUgJ25hbmQtcXBpYy1jb21tb24uaCcgaGVhZGVyIGZvcgpyZWZlcmVuY2U6CgojZGVmaW5l
CU5BTkRfRkxBU0hfU1RBVFVTCQkweDE0CiNkZWZpbmUJTkFORF9CVUZGRVJfU1RBVFVTCQkweDE4
CgpTbyB0aGUgdHdvIHJlZ2lzdGVycyBjYW4gYmUgcmVhZCB3aXRoIGEgc2luZ2xlIERNQSBvcGVy
YXRpb24uCgo+IC4uLiBidXQgMSBldmVyeXdoZXJlIGVsc2U/CgpXaGVuIEVDQyBpcyBub3QgdXNl
ZCwgd2Ugb25seSBuZWVkIHRoZSB2YWx1ZSBmcm9tIHRoZSBOQU5EX0ZMQVNIX1NUQVRVUwpyZWdp
c3Rlciwgc28gd2UgZG9uJ3QgaGF2ZSB0byByZWFkIHR3byByZWdpc3RlcnMuCgpSZWdhcmRzLApH
YWJvcgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
