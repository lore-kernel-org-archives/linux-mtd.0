Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF24E77180
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Dec 2024 07:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N2sT++/L4uIxzofu5A7E0VMFrtlsqK6whTycJhgKoe4=; b=3nvURRaTJLXuZw
	ZW08VWLD7hJXEX9hGbx+HslwUrIIDKn4stl+4Ujlmx5KRZ8XbGLDvrqsgXxi2WcnJdYa+XLlN2RHB
	KZ/5gC7yX3nZQYWL5U3e1dQAWbKPhbOE76jgYHQB94wljWPAEaZB0D45JMuhkRy3MYFTPWMS2+KCs
	au5fpvWNcE4OaLWlu4Yyn6YR5osiD1zQPxkR7Chrs6f4x6q3VyW8EqUJFkgm8bkkaigyZNm2RRwuo
	QZ1Ohqq0f4HeqX94tLRAPs0Chjt3lK5aq6kxmSLaM3V8c96Y9swaRuYOUc3i6iJJxhxlAwbdAbrBa
	mDyUE5QhYfyiTM7cr5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYRG-00000006lVI-1K7E;
	Mon, 09 Dec 2024 07:44:18 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYR9-00000006lU0-0ibU
	for linux-mtd@lists.infradead.org;
	Mon, 09 Dec 2024 07:44:12 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-53e399e3310so2027098e87.1
        for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2024 23:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733730249; x=1734335049; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=95zALzZ9C1moiqNGj+0dTUHzbbBeCCJ9ZsiPoJT1Hrc=;
        b=acE3HZ7a4WTvnmNbNXIjPrxWt9pkLON/bDu5Dcqkios2dpqIVVDFA9RAZf9VE1QclW
         oEchjST84+6NrUsg2Kt6TYti0PngCV6QuYELspJJu+1cji0v6MJ9g5bJ935ivJ6Wq3WZ
         OnR+s1055mSUDxtXVn4yy/SFWIbzvDjadUwydJLBrSUQx9i7ltZwWD765hrAaHgySyya
         baQ8MApmgdmFXs4eMGd5ZgGwqiX1P3cjEgUIc88IGAeYOKorxMQWWSUb/smGX/c3f5j1
         EKcJKMlzIYNi+FMGuopmkDPFc81Hidn/cO1KRqA2E3WzEHDnRv9dFV+xglXMRU+eM37T
         7O0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733730249; x=1734335049;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=95zALzZ9C1moiqNGj+0dTUHzbbBeCCJ9ZsiPoJT1Hrc=;
        b=skUffaJzl2RDREASInOAcgpEnoSRmHld0FmzWPUKb/q2jh4P6/rsOnOJjnf6I8Ctup
         j8x/1KYI8K1sNlfy8BQTW+QukdRINI6XMwIYl1UAIL7lkpKpmMV/IiSEvAahONpo9DXi
         Kd4yrUzoDQw7HKaPKvZDiZpC16dCD/bM4nqUcalQ7xbXEf9tPhBZACyoev3BgDMvpySq
         HSiPo4QKlSrTn8XYyo407ZifXPkyTZZkVY3INbioyjE0PP0YUwqTo7NcZPllgj3KLcap
         UvgrgVKilYNqxJlUuKKXZdc9TrOm9XTRorcXCYpVvKb6ToMLH6bTGbzBXuD8dfu9xkHA
         qATg==
X-Forwarded-Encrypted: i=1; AJvYcCUx84TlQ+CqxgdrO+Yn9ASYkuRx9WiVwdBvyA6nqZNW2FwJUKNB4eil1mt4g5yRgGTeAzBxN84PWao=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4s1sAzUSTscODD3LG46U5KfQsZhjnWPTqHkGKXOJWBY0cLVAR
	qLqtoKMZcMkFJ9X0NmqhLg6HKReNUf1bK9+yMU1hH8Vy4dOLx4u4i/h+9HUp9jBUTqDHnAqy1xm
	U
X-Gm-Gg: ASbGncvsw8SNdW8b2tuKI6MztuFzdugHU+jH2KMYt+9ny5c9cKibgRbjWPFncpiL9Rp
	3YT/odLoH41bGxJEIwjfOu1JGOw1e9BBHbhdjqOw5APoORSujk6riWrdoklmMUOS0e93HpVtytk
	dk3swC5trc8UCqZaK0OyysXFp3dnIFO9FpT6f3qFekL7zuZYdZvYL4Yqr60j+nRrmZy9nsnUbLc
	xULL9C7vvDKhqeK133ZXJNSI2N2e3/MHy76P8yVxDUCyTMpyNUHQSU=
X-Google-Smtp-Source: AGHT+IENr6dXfV5Cj+7nBYzPXMOegzBfhEhe3lfd7H0VOqbFt4Ej3IU9BHMTxGGVa/FF5Ki/41qtuQ==
X-Received: by 2002:a05:600c:3ca3:b0:42c:c28c:e477 with SMTP id 5b1f17b1804b1-434ddecb0f7mr84483155e9.23.1733729858220;
        Sun, 08 Dec 2024 23:37:38 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f7ec35b0sm25804105e9.1.2024.12.08.23.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 23:37:37 -0800 (PST)
Date: Mon, 9 Dec 2024 10:37:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <0bc9812c-135a-49b8-aed8-67ee4e3d6d6d@stanley.mountain>
References: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
 <e3da1bba-9740-6b6f-385a-1bdf25f056a9@huawei.com>
 <6b4f7a14-297f-4fc7-bc4b-a9e7d822fb23@stanley.mountain>
 <fabbceb3-90a3-2cc8-c664-e53fcd504393@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fabbceb3-90a3-2cc8-c664-e53fcd504393@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_234411_206138_BCE2AFB0 
X-CRM114-Status: GOOD (  20.86  )
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

T24gTW9uLCBEZWMgMDksIDIwMjQgYXQgMDI6Mjc6NThQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzEyLzggMTowNSwgRGFuIENhcnBlbnRlciDlhpnpgZM6Cj4gPiBPbiBT
YXQsIERlYyAwNywgMjAyNCBhdCAxMjoxNzozM1BNICswODAwLCBaaGloYW8gQ2hlbmcgd3JvdGU6
Cj4gPiA+IOWcqCAyMDI0LzEyLzcgNDoyNiwgRGFuIENhcnBlbnRlciDlhpnpgZM6Cj4gPiA+ID4g
VGhlICJyZXEuc3RhcnQiIGFuZCAicmVxLmxlbiIgdmFyaWFibGVzIGFyZSB1NjQgdmFsdWVzIHRo
YXQgY29tZSBmcm9tIHRoZQo+ID4gPiA+IHVzZXIgYXQgdGhlIHN0YXJ0IG9mIHRoZSBmdW5jdGlv
bi4gIFdlIG1hc2sgYXdheSB0aGUgaGlnaCAzMiBiaXRzIG9mCj4gPiA+ID4gInJlcS5sZW4iIHNv
IHRoYXQncyBjYXBwZWQgYXQgVTMyX01BWCBidXQgdGhlICJyZXEuc3RhcnQiIHZhcmlhYmxlIGNh
biBnbwo+ID4gPiA+IHVwIHRvIFU2NF9NQVguCj4gPiA+ID4gCj4gPiA+ID4gVXNlIGNoZWNrX2Fk
ZF9vdmVyZmxvdygpIHRvIGZpeCB0aGlzIGJ1Zy4KPiA+ID4gPiAKPiA+ID4gPiBGaXhlczogNjQy
MGFjMGFmOTVkICgibXRkY2hhcjogcHJldmVudCB1bmJvdW5kZWQgYWxsb2NhdGlvbiBpbiBNRU1X
UklURSBpb2N0bCIpCj4gPiA+IAo+ID4gPiBIaSwgRGFuLiBXaHkgdGhpcyBmaXggdGFnPyBJIHRo
aW5rIHRoZSBhZGRpbmcgcmVzdWx0KCdyZXEuc3RhcnQnIGFuZAo+ID4gPiAncmVxLmxlbicpIGNv
dWxkIGJlIG92ZXJmbG93IHRvbyBiZWZvcmUgdGhpcyBjb21taXQuCj4gPiA+IAo+ID4gCj4gPiBJ
J3ZlIGxvb2tlZCBhdCB0aGlzIGFnYWluLCBhbmQgSSBzdGlsbCBkb24ndCBzZWUgdGhlIGJ1ZyBi
ZWZvcmUgdGhlCj4gPiBjb21taXQuICBTZWNvbmRseSwgY29tbWl0IGExZWRhODY0YzA0YyAoIm10
ZGNoYXI6IHByZXZlbnQgaW50ZWdlcgo+ID4gb3ZlcmZsb3cgaW4gYSBzYWZldHkgY2hlY2siKSBp
cyBtaXNzaW5nIGEgRml4ZXMgdGFnIGJ1dCB0aGUgbWVzc2FnZSBzYXlzCj4gPiB0aGF0IGl0J3Mg
dGhpcyBjb21taXQgd2hpY2ggaW50cm9kdWNlZCB0aGUgYnVnLgo+IAo+IEFoLCBJIHNlZS4gVGhl
cmUgaXMgbm90IGFuIGFkZGl0aW9uIG9wZXJhdGlvbiBmb3IgJ3JlcS5zdGFydCcgYW5kICdyZXEu
bGVuJwo+IHVudGlsIGNvbW1pdCA2NDIwYWMwYWY5NWQoIm10ZGNoYXI6IHByZXZlbnQgdW5ib3Vu
ZGVkIGFsbG9jYXRpb24gaW4gTUVNV1JJVEUKPiBpb2N0bCIpIGFuZCAwOTViYjZlNDRlYjEoIm10
ZGNoYXI6IGFkZCBNRU1SRUFEIGlvY3RsIiksIHNvIEkgZ3Vlc3MgdGhlIHRoZXJlCj4gc2hvdWxk
IGJlIHR3byBmaXggdGFncz8KCkFoLCBzdXJlLiAgSSBjYW4gdGFnIGJvdGggdGhvc2UgY29tbWl0
cy4KCnJlZ2FyZHMsCmRhbiBjYXJwZW50ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
