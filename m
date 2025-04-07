Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9659FC369A4
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=moNLqsacCq+fJbAQ72qGkN08lakTLbAxFpeF+YETRQk=; b=KhW+ndOwU9TGH/
	2oy/54k1Uvsxb1Fpg0Td+sCKvjM2Dt8xJ9mtWzvf8AReDCwEZRIX82gZbssn7mqg4HSY5tDDQ/LDo
	UCzxm7XKZ1+IDOSC3wrFo2rs43CRms52mlPKny6LZnx1JAU9dilS1jCCFRW92cYi3xYO5h6Xb8jDK
	4XT1vRyoH8+KlgIlZzVFAQw+yjA7O+hM73HrZTf4BiEsIdCUfxhDhePso15wOij7HdiFbf6W8igoV
	v/uhNmYfw7jrBljIPZRU+lZ/J/CaHYazFJwbp4SZqUwkc/EItSyF+V9rnljLxPnAPIdhFXwQSYG2T
	eCfRkO6ff6Yxh1CAw9mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oxo-000000013I0-0LQu;
	Mon, 07 Apr 2025 16:04:44 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1nF9-00000000gLF-3Tby
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 14:14:33 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7c57f2f5a1bso50120385a.1
        for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2025 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744035270; x=1744640070; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uwFW/Eb/R0FJBv28GaHOzSCwEzOQyTEr2FES8VqXhyU=;
        b=RXITuDJfwdi9hdk5NKn698IEBmfHE94iPXMfx9FJonLqhqVZV+JYYhENCFBpo2qAiy
         Ky3eb+Fg5SPP+o9vHGdf47dqfw2dOIUmpaQ1K5kac+HJGqVFbhYAz7G/O4IArSzxPXeO
         QM6hFOykQa2xmJ1hLc83PwOPB+Yu8NBC2HrY5urenbKMK8prJrDD3tGdLl/ZEHJC26D0
         WRJWJMi+Jl6Z8a8HxIj0YphSMVggEMnYyRo3VYkGtZAjqtc2ibaF6vbpCgLElINAFhJk
         f904d2HuD8axIqE8cITy+fdZI7Ef5TKHNn5JVrmT1Sjbc1c6pv1ypgwvniUstw0yX3T0
         pKqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744035270; x=1744640070;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uwFW/Eb/R0FJBv28GaHOzSCwEzOQyTEr2FES8VqXhyU=;
        b=JAbJWxlsag8c1XB86ttNzRkUOGX4b3f9a+99tUpFwKnzxxU0d2ECNR9HorBGugR0Cy
         2QCLtfyvZDzwCCO2GXNiiDaeyAasEOHrp/W8eMQ4EHpE1faCahOp3swHNHpELD0xXgnG
         9y3nos4BZ8jRbRUt28iAN1ik0GxdZ5fFtkEr5HKzzAIc6HhJl18f2Xysmzm5faKLmKwn
         NB7mYogtzsFCcxj1fAybXQMMoCDLB60rPoWkLt4BsPplhEvXbyjc/23kFUCnEDW5/UPa
         MffQYnVjSXkitQX4P0kxFrCOgXON7b5dcYVctOnX1KFEAnBR/AiEwZn8HAgVG3FJ3F89
         a3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCW2r22FGfQzZBHJW8xZtW5ARliJDWY5W9sh62RyHBy9AiGNbwQneEoAvlGhvZ1v1O/iav5rX19lPDU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQn5TusC3wKqTbh95t3uCVjYgD9mPBEcvuc1Q+RAt+yO1Lq+YI
	oV17nut/bviOUr3r7vK+wXvKjC8TYKhPJhTFmONPvwIgGJG+umVe
X-Gm-Gg: ASbGnct+R2gEOFbnOexP5ImqgGMvT2gwn2Ggdoq5hrK8W7PBVLm8EjKIl5wpoEVuUHe
	whdE4p7uXHydsbP1p01R+wz4rvLxkwSMEJlHJneqD0NVPXlkHk9T7fhueai4FxXqY/7PklNgThM
	0gnpVxad66gzjHeeJLOivKHA+VwrNizmjYH4AS5yZXBUWBGicDDv1SJRiY1hWd6nGGS9GM9sOlZ
	avYbRAIA6rIDgfxLjYfeAu9l1gWKHiJMja6qLD3P3Ta8HB08xSP4Bn47m+aNaKhaVtOPuR4OqM5
	81JILWORYPBMBVpTPGu3kp4l5tB/QEWIM6oUeYj3H4pwBSyUB3WfHsBUnTLrp0XLsql2fMIF+SQ
	KfVDnxPwbkgUKyJ1oXJIl
X-Google-Smtp-Source: AGHT+IGjFDuTUnh1KO8p1udDbzjbopvo23OYnSLVyEZ0yS5lxthcKxhsKsbqDXcWnscVY+yFVKr1dA==
X-Received: by 2002:a05:620a:17a6:b0:7c3:bae4:2339 with SMTP id af79cd13be357-7c774dbe6d1mr621761785a.11.1744035270111;
        Mon, 07 Apr 2025 07:14:30 -0700 (PDT)
Received: from [192.168.1.201] (pool-108-48-176-137.washdc.fios.verizon.net. [108.48.176.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76ea7eeabsm601695385a.94.2025.04.07.07.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 07:14:29 -0700 (PDT)
Message-ID: <a0ffa9b9-8649-1b63-3d56-3fc45fdfda83@gmail.com>
Date: Mon, 7 Apr 2025 10:14:28 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: bio segment constraints
Content-Language: en-US
To: Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
 <8a232716-74f8-4bba-a514-d0f766492344@suse.de>
From: Sean Anderson <seanga2@gmail.com>
In-Reply-To: <8a232716-74f8-4bba-a514-d0f766492344@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_071431_865928_DBD36098 
X-CRM114-Status: GOOD (  40.23  )
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

T24gNC83LzI1IDAzOjEwLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6DQo+IE9uIDQvNi8yNSAyMTo0
MCwgU2VhbiBBbmRlcnNvbiB3cm90ZToNCj4+IEhpIGFsbCwNCj4+DQo+PiBJJ20gbm90IHJlYWxs
eSBzdXJlIHdoYXQgZ3VhcmFudGVlcyB0aGUgYmxvY2sgbGF5ZXIgbWFrZXMgcmVnYXJkaW5nIHRo
ZQ0KPj4gc2VnbWVudHMgaW4gYSBiaW8gYXMgcGFydCBvZiBhIHJlcXVlc3Qgc3VibWl0dGVkIHRv
IGEgYmxvY2sgZHJpdmVyLiBBcw0KPj4gZmFyIGFzIEkgY2FuIHRlbGwgdGhpcyBpcyBub3QgZG9j
dW1lbnRlZCBhbnl3aGVyZS4gSW4gcGFydGljdWxhciwNCj4+DQo+PiAtIElzIGJ2X2xlbiBhbGln
bmVkIHRvIFNFQ1RPUl9TSVpFPw0KPiANCj4gVGhlIGJsb2NrIGxheWVyIGFsd2F5cyB1c2VzIGEg
NTEyIGJ5dGUgc2VjdG9yIHNpemUsIHNvIHllcy4NCj4gDQo+PiAtIFRvIGxvZ2ljYWxfc2VjdG9y
X3NpemU/DQo+IA0KPiBOb3QgbmVjZXNzYXJpbHkuIEJ2ZWNzIGFyZSBhIGNvbnNlY3V0aXZlIGxp
c3Qgb2YgYnl0ZSByYW5nZXMgd2hpY2gNCj4gbWFrZSB1cCB0aGUgZGF0YSBwb3J0aW9uIG9mIGEg
YmlvLg0KPiBUaGUgbG9naWNhbCBzZWN0b3Igc2l6ZSBpcyBhIHByb3BlcnR5IG9mIHRoZSByZXF1
ZXN0IHF1ZXVlLCB3aGljaCBpcw0KPiBhcHBsaWVkIHdoZW4gYSByZXF1ZXN0IGlzIGZvcm1lZCBm
cm9tIG9uZSBvciBzZXZlcmFsIGJpb3MuDQo+IEZvciB0aGUgcmVxdWVzdCB0aGUgb3ZlcmFsbCBs
ZW5ndGggbmVlZCB0byBiZSBhIG11bHRpcGxlIG9mIHRoZSBsb2dpY2FsDQo+IHNlY3RvciBzaXpl
LCBidXQgbm90IG5lY2Vzc2FyaWx5IHRoZSBpbmRpdmlkdWFsIGJpb3MuDQoNCk9oLCBzbyB0aGlz
IGlzIHdvcnNlIHRoYW4gSSB0aG91Z2h0LiBTbyBpZiB5b3UgY2FyZSBhYm91dCBlLmcuIG9ubHkg
c3VibWl0dGluZw0KSS9PIGluIHVuaXRzIG9mIGxvZ2ljYWxfYmxvY2tfc2l6ZSwgeW91IGhhdmUg
dG8gY29tYmluZSBzZWdtZW50cyBhY3Jvc3MgdGhlDQplbnRpcmUgcmVxdWVzdC4NCg0KPj4gLSBX
aGF0IGlmIGxvZ2ljYWxfc2VjdG9yX3NpemUgPiBQQUdFX1NJWkU/DQo+IA0KPiBTZWUgYWJvdmUu
DQo+IA0KPj4gLSBXaGF0IGFib3V0IGJ2X29mZnNldD8NCj4gDQo+IFNhbWUgc3RvcnkuIFRoZSBl
dmVudHVhbCByZXF1ZXN0IG5lZWRzIHRvIG9ic2VydmUgdGhhdCB0aGUgb2Zmc2V0DQo+IGFuZCB0
aGUgbGVuZ3RoIGlzIGFsaWduZWQgdG8gdGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSwgYnV0IHRoZSBp
bmRpdmlkdWFsDQo+IGJpb3MgbWlnaHQgbm90Lg0KPiANCj4+IC0gSXMgaXQgcG9zc2libGUgdG8g
aGF2ZSBhIGJpbyB3aGVyZSB0aGUgdG90YWwgbGVuZ3RoIGlzIGEgbXVsdGlwbGUgb2YNCj4+IMKg
wqAgbG9naWNhbF9zZWN0b3Jfc2l6ZSwgYnV0IHRoZSBkYXRhIGlzIHNwbGl0IGFjcm9zcyBzZXZl
cmFsIHNlZ21lbnRzDQo+PiDCoMKgIHdoZXJlIGVhY2ggc2VnbWVudCBpcyBhIG11bHRpcGxlIG9m
IFNFQ1RPUl9TSVpFPw0KPiANCj4gU3VyZS4NCj4gDQo+PiAtIElzIGlzIHBvc3NpYmxlIHRvIGhh
dmUgc2VnbWVudHMgbm90IGV2ZW4gYWxpZ25lZCB0byBTRUNUT1JfU0laRT8NCj4gDQo+IE5vcGUu
DQo+IA0KPj4gLSBDYW4gSSBzb21laG93IHJlcXVlc3QgdG8gb25seSBnZXQgc2VnbWVudHMgd2l0
aCBidl9sZW4gYWxpZ25lZCB0bw0KPj4gwqDCoCBsb2dpY2FsX3NlY3Rvcl9zaXplPyBPciBkbyBJ
IG5lZWQgdG8gZG8gbXkgb3duIGNvYWxlc2NpbmcgYW5kIGJvdW5jZQ0KPj4gwqDCoCBidWZmZXJp
bmcgZm9yIHRoYXQ/DQo+Pg0KPiANCj4gVGhlIGRyaXZlciBzdXJlbHkgY2FuLiBZb3Ugc2hvdWxk
IGJlIGFibGUgdG8gc2V0ICdtYXhfc2VnbWVudF9zaXplJyB0bw0KPiB0aGUgbG9naWNhbCBibG9j
ayBzaXplLCBhbmQgdGhhdCBzaG91bGQgZ2l2ZSB5b3Ugd2hhdCB5b3Ugd2FudC4NCg0KQnV0IGNv
dWxkbid0IEkgZ2V0IHNlZ21lbnRzIHNtYWxsZXIgdGhhbiB0aGF0PyBtYXhfc2VnbWVudF9zaXpl
IHNlZW1zIGxpa2UNCml0IHdvdWxkIG9ubHkgcmVzdHJpY3QgdGhlIG1heGltdW0gc2l6ZSwgbGVh
dmluZyB0aGUgcG9zc2liaWxpdHkgb3BlbiBmb3INCnNtYWxsZXIgc2VnbWVudHMuDQoNCj4+IEkn
dmUgYmVlbiByZWFkaW5nIHNvbWUgZHJpdmVycyAoYXMgd2VsbCBhcyBzdHVmZiBpbiBibG9jay8p
IHRvIHRyeSBhbmQNCj4+IGZpZ3VyZSB0aGluZ3Mgb3V0LCBidXQgaXQncyBoYXJkIHRvIGZpZ3Vy
ZSBvdXQgYWxsIHRoZSBwbGFjZXMgd2hlcmUNCj4+IGNvbnN0cmFpbnRzIGFyZSBlbmZvcmNlZC4g
SW4gcGFydGljdWxhciwgSSd2ZSByZWFkIHNldmVyYWwgZHJpdmVycyB0aGF0DQo+PiBtYWtlIHNv
bWUgYmlnIGFzc3VtcHRpb25zICh3aGljaCBtaWdodCBiZSBidWdzPykgRm9yIGV4YW1wbGUsIGlu
DQo+PiBkcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jLCBkb19ibGt0cmFuc19yZXF1ZXN0IGxvb2tz
IGxpa2U6DQo+Pg0KPiBJbiBnZW5lcmFsLCB0aGUgYmxvY2sgbGF5ZXIgaGFzIHR3byBtYWpvciBk
YXRhIGl0ZW1zLCBiaW9zIGFuZCByZXF1ZXN0cy4NCj4gJ3N0cnVjdCBiaW8nIGlzIHRoZSBjZW50
cmFsIHN0cnVjdHVyZSBmb3IgYW55ICd1cHBlcicgbGF5ZXJzIHRvIHN1Ym1pdA0KPiBkYXRhICh2
aWEgdGhlICdzdWJtaXRfYmlvKCknIGZ1bmN0aW9uKSwgYW5kICdzdHJ1Y3QgcmVxdWVzdCcgaXMg
dGhlDQo+IGNlbnRyYWwgc3RydWN0dXJlIGZvciBkcml2ZXJzIHRvIGZldGNoIGRhdGEgZm9yIHN1
Ym1pc3Npb24gdG8gdGhlDQo+IGhhcmR3YXJlICh2aWEgdGhlICdxdWV1ZV9ycSgpJyByZXF1ZXN0
X3F1ZXVlIGNhbGxiYWNrKS4NCj4gQW5kIHRoZSB0YXNrIG9mIHRoZSBibG9jayBsYXllciBpcyB0
byBjb252ZXJ0ICdzdHJ1Y3QgYmlvJyBpbnRvDQo+ICdzdHJ1Y3QgcmVxdWVzdCcuDQo+IA0KPiBb
IC4uIF0NCj4gDQo+PiBGb3IgY29udGV4dCwgdHItPmJsa3NoaWZ0IGlzIGVpdGhlciA1MTIgb3Ig
NDA5NiwgZGVwZW5kaW5nIG9uIHRoZQ0KPj4gYmFja2VuZC4gRnJvbSB3aGF0IEkgY2FuIHRlbGws
IHRoaXMgY29kZSBhc3N1bWVzIHRoZSBmb2xsb3dpbmc6DQo+Pg0KPiBtdGQgaXMgcHJvYmFibHkg
bm90IGEgZ29vZCBleGFtcGxlcywgYXMgTVREIGhhcyBpdCdzIG93biBzZXQgb2YgbGltaXRhdGlv
bnMgd2hpY2ggbWlnaHQgcmVzdWx0IGluIGNlcnRhaW4gc2hvcnRjdXRzIHRvIGJlIHRha2VuLg0K
DQpXZWxsLCBJIHdhbnQgdG8gd3JpdGUgYSBibG9jayBkcml2ZXIgb24gdG9wIG9mIE1URCwgc28g
aXQncyBhIHByZXR0eSBnb29kDQpleGFtcGxlIGZvciBteSBwdXJwb3NlcyA6UA0KDQo+PiAtIFRo
ZXJlIGlzIG9ubHkgb25lIGJpbyBpbiBhIHJlcXVlc3QuIFRoaXMgb25lIGlzIGEgYml0IG9mIGEg
c29mdA0KPj4gwqDCoCBhc3N1bXB0aW9uIHNpbmNlIHdlIHNob3VsZCBvbmx5IGZsdXNoIHRoZSBw
YWdlcyBpbiB0aGUgYmlvIGFuZCBub3QgdGhlDQo+PiDCoMKgIHdob2xlIHJlcXVlc3Qgb3RoZXJ3
aXNlLg0KPj4gLSBUaGVyZSBpcyBvbmx5IG9uZSBzZWdtZW50IGluIGEgYmlvLiBUaGlzIG9uZSBj
b3VsZCBiZSByZWFzb25hYmxlIGlmDQo+PiDCoMKgIG1heF9zZWdtZW50cyB3YXMgc2V0IHRvIDEs
IGJ1dCBpdCdzIG5vdCBhcyBmYXIgYXMgSSBjYW4gdGVsbC4gU28gSQ0KPj4gwqDCoCBndWVzcyB3
ZSBqdXN0IGdvIG9mZiB0aGUgZW5kIG9mIHRoZSBiaW8gaWYgdGhlcmUncyBhIHNlY29uZCBzZWdt
ZW50Pw0KPj4gLSBUaGUgZGF0YSBpcyBpbiBsb3dtZW0gT1IgYnZfb2Zmc2V0ICsgYnZfbGVuIDw9
IFBBR0VfU0laRS4ga21hcCgpIG9ubHkNCj4+IMKgwqAgbWFwcyBhIHNpbmdsZSBwYWdlLCBzbyBp
ZiB3ZSBnbyBwYXN0IG9uZSBwYWdlIHdlIGVuZCB1cCBpbiBhZGphY2VudA0KPj4gwqDCoCBrbWFw
cGVkIHBhZ2VzLg0KPj4NCj4gV2VsbCwgdGhhdCBjb2RlIF9kb2VzXyBsb29rIHN1c3BpY2lvdXMu
IEl0IHJlYWxseSBzaG91bGQgYmUgY29udmVydGVkDQo+IHRvIHVzaW5nIHRoZSBpb3YgaXRlcmF0
b3JzLg0KDQpJIGhhZCBhIGxvb2sgYXQgdGhpcywgYnV0IHRoZSBBUEkgaXNuJ3QgZG9jdW1lbnRl
ZCBzbyBJIHdhc24ndCBzdXJlIHdoYXQNCkkgd291bGQgZ2V0IG91dCBvZiBpdC4gSSdsbCBoYXZl
IGEgY2xvc2VyIGxvb2suDQoNCj4gQnV0IHRoZW4gYWdhaW4sIGl0IF9taWdodF8gYmUgb2theSBp
ZiB0aGVyZSBhcmUgdW5kZXJseWluZyBNVEQNCj4gcmVzdHJpY3Rpb25zIHdoaWNoIHdvdWxkIGRl
dm9sdmUgaW50byBNVEQgb25seSBoYXZpbmcgYSBzaW5nbGUgYnZlYy4NCg0KVGhlIHVuZGVybHlp
bmcgcmVzdHJpY3Rpb24gaXMgdGhhdCB0aGUgTVREIEFQSSBleHBlY3RzIGEgYnVmZmVyIHRoYXQg
aGFzDQpjb250aWd1b3VzIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3Nlcy4gVGhlIGRyaXZlciB3aWxs
IGRvIGJvdW5jZS1idWZmZXJpbmcNCmlmIHdhbnRzIHRvIGRvIERNQSBhbmQgdmlydF9hZGRyX3Zh
bGlkIGlzIGZhbHNlLiBUaGUgbXRkX2Jsa2RldnMgZHJpdmVyDQpwcm9taXNlcyB0byBzdWJtaXQg
YnVmZmVycyBvZiBzaXplIHRyLT5ibGtzaXplIHRvIHRoZSB1bmRlcmx5aW5nIGJsdHJhbnMNCmRy
aXZlci4gVGhpcyB3aG9sZSB0aGluZyBpcyBub3QgdmVyeSBlZmZpY2llbnQgaWYgdGhlIE1URCBk
cml2ZXIgY2FuIGRvDQpzY2F0dGVyLWdhdGhlciBETUEsIGJ1dCB0aGF0J3Mgbm90IHRoZSBBUEku
Li4NCg0KTWF5YmUgSSBzaG91bGQganVzdCB2bWFwIHRoZSBlbnRpcmUgcmVxdWVzdD8NCg0KLS1T
ZWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
