Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B352FE7717B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Dec 2024 17:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3u0PLVcl1uN/jkepkJYQLWuOn1zBwhiMWHCFaIPAtw=; b=JVTrVe4tgFLLyS
	b6GHhV/ZgfjdCiG1S4hXz2HBJ86nVZZHW/QHbDrqLAk6os5TC8C2VmCTJm+zlKCmV++paNHBW9I7G
	nE/LV3GymG9rg+u1z8QG5U7+Do1E2VOWsgD9SdAuSMZGn4cMHmZzwZQnueZ3fNxapjlVXTib8gl2B
	ohcWijbvWjPTF/ozVgK+xKumP4+3i1izHi48dMAUZygwmPCCx5/r5gpiQ/xsxtEq3DyOA3hfRDMDI
	I5vyFXy+hvbuFsmQUhvmnPTZsstTA6xbyZLiO7hD1JwiGI/fAugINx/6cqqNzS0TKrNjl1PM4+kxf
	glMg2A81zFkC6YfiM69g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJyFc-00000004BVG-0zCV;
	Sat, 07 Dec 2024 17:05:52 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJyFZ-00000004BUq-2UuX
	for linux-mtd@lists.infradead.org;
	Sat, 07 Dec 2024 17:05:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3862d6d5765so845760f8f.3
        for <linux-mtd@lists.infradead.org>; Sat, 07 Dec 2024 09:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733591147; x=1734195947; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pk4dOE8x4+OW5hLEkb16n/k4Vd2DfXIi8+SR8qfyj+w=;
        b=iH40tga8saun98ygVb4seQwm0DmKuX0+rusJ0llLKFu2vQ89gXH8qgpRZHLhdXBoEV
         mSqclfJBbShOnYXhL7wE50AN6iB1E4onKTIeHFbPI504DsjOQgGYaazazUJ9kQZcu1I9
         0oQ8NRIr64Fmw3NDwFUxbD4FqTMSaBTCVW5mwxEjPOMjLP+nc6KcnPuhMB9rZGfwQC3f
         8KRjXqriFkmlkvgirqiVpHBDC/+z0NREpqP+l1ImZRuaRnIfpQHLy/wnteRJ5KsBibON
         qhxt5o/RAx980ltisOP9nmhVX3dQIzqGtsJx7OKNNFjE/8G0weJC+x2EM22xSp6HpICX
         xb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733591147; x=1734195947;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pk4dOE8x4+OW5hLEkb16n/k4Vd2DfXIi8+SR8qfyj+w=;
        b=caQXz1lSao06+Okgb8HatOMBm948TrMLebtHjtGvL5kN7wRLxwWRnrudhW0OlQpBIP
         1seNjAG0hPRI4mRNt0xTiQE0opkL9a7hZ4CFbVlDd0Gy6VX/ShIrdagekNrhUDxxNkCx
         ibNxjgiGAZh2oYLQDC1mCCIp2xB7JqWd0duEdpbFyb0ZakECryl3f6uKggOXNmU7Icxw
         /4Tn4qQ7iZUDYIS/AwWJOmpqvaAOkvSPJG6jC6MMHtzZI/poqwX/dXME15O6UH/K1/Z3
         bEiQ9uvx/qYajaCBZ/FzNONgz8Q8eynzOelt6PMOPE2uNllXohTU7CPxWD7k86Qsb/hs
         M8CA==
X-Forwarded-Encrypted: i=1; AJvYcCULkxK/1SKFOK3RgpmKpRzwIWInljoIv++b0EsmeUOWHroN071y+5H+XpTpD/Jj3VGvxjHdbsloyb8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaoCETrX1s48fflD0IuY7KfGPGi1vRBzCKXXWvPygFZ8Xn5FiP
	jvGn9bVMXI3KnEjlHIkpHC/amG02M+eQcVzptMUL3dB234O1i6e5fB7UqX7GAYg=
X-Gm-Gg: ASbGncu/1ha8z2eRnvWcSRS8GduSfVmWSYtYt7ZRJAF5LBiB3NRdMxiVrhOUflSawJn
	S127W+PHp3FShYVHEWrACokTN47GVqXWt5UiuENPr5twFBiofLJdj9mL87jvhbNgrfx9nyzBFyY
	6tbEE+LTEeGDSNUq2r1NIKCkMtUvNlsL7ip5nfoqnQG1KSh9jPRDO+iWXKj9uxAAgQAVGpEAQqZ
	spkUcQBXBv02wYDlvjGu+4hzG6d0vxvx/oezkfKx4L/AHU6cz9iEF8=
X-Google-Smtp-Source: AGHT+IGg5h+0E5Jyx7sVuRubySPLaxRCj0fP8G8xiSLkhV7eNH7cjkBRQQuiu07DAS3WYMNZao+pPg==
X-Received: by 2002:a05:6000:784:b0:385:f7ef:a57f with SMTP id ffacd0b85a97d-3862b368e64mr4977264f8f.27.1733591147326;
        Sat, 07 Dec 2024 09:05:47 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f59ceb6sm7779925f8f.42.2024.12.07.09.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Dec 2024 09:05:46 -0800 (PST)
Date: Sat, 7 Dec 2024 20:05:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] mtdchar: fix integer overflow in read/write ioctls
Message-ID: <6b4f7a14-297f-4fc7-bc4b-a9e7d822fb23@stanley.mountain>
References: <020f98d2-eee1-434e-8236-775cca9fd157@stanley.mountain>
 <e3da1bba-9740-6b6f-385a-1bdf25f056a9@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3da1bba-9740-6b6f-385a-1bdf25f056a9@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_090549_691439_436C4DFE 
X-CRM114-Status: GOOD (  17.37  )
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

T24gU2F0LCBEZWMgMDcsIDIwMjQgYXQgMTI6MTc6MzNQTSArMDgwMCwgWmhpaGFvIENoZW5nIHdy
b3RlOgo+IOWcqCAyMDI0LzEyLzcgNDoyNiwgRGFuIENhcnBlbnRlciDlhpnpgZM6Cj4gPiBUaGUg
InJlcS5zdGFydCIgYW5kICJyZXEubGVuIiB2YXJpYWJsZXMgYXJlIHU2NCB2YWx1ZXMgdGhhdCBj
b21lIGZyb20gdGhlCj4gPiB1c2VyIGF0IHRoZSBzdGFydCBvZiB0aGUgZnVuY3Rpb24uICBXZSBt
YXNrIGF3YXkgdGhlIGhpZ2ggMzIgYml0cyBvZgo+ID4gInJlcS5sZW4iIHNvIHRoYXQncyBjYXBw
ZWQgYXQgVTMyX01BWCBidXQgdGhlICJyZXEuc3RhcnQiIHZhcmlhYmxlIGNhbiBnbwo+ID4gdXAg
dG8gVTY0X01BWC4KPiA+IAo+ID4gVXNlIGNoZWNrX2FkZF9vdmVyZmxvdygpIHRvIGZpeCB0aGlz
IGJ1Zy4KPiA+IAo+ID4gRml4ZXM6IDY0MjBhYzBhZjk1ZCAoIm10ZGNoYXI6IHByZXZlbnQgdW5i
b3VuZGVkIGFsbG9jYXRpb24gaW4gTUVNV1JJVEUgaW9jdGwiKQo+IAo+IEhpLCBEYW4uIFdoeSB0
aGlzIGZpeCB0YWc/IEkgdGhpbmsgdGhlIGFkZGluZyByZXN1bHQoJ3JlcS5zdGFydCcgYW5kCj4g
J3JlcS5sZW4nKSBjb3VsZCBiZSBvdmVyZmxvdyB0b28gYmVmb3JlIHRoaXMgY29tbWl0Lgo+IAoK
SSd2ZSBsb29rZWQgYXQgdGhpcyBhZ2FpbiwgYW5kIEkgc3RpbGwgZG9uJ3Qgc2VlIHRoZSBidWcg
YmVmb3JlIHRoZQpjb21taXQuICBTZWNvbmRseSwgY29tbWl0IGExZWRhODY0YzA0YyAoIm10ZGNo
YXI6IHByZXZlbnQgaW50ZWdlcgpvdmVyZmxvdyBpbiBhIHNhZmV0eSBjaGVjayIpIGlzIG1pc3Np
bmcgYSBGaXhlcyB0YWcgYnV0IHRoZSBtZXNzYWdlIHNheXMKdGhhdCBpdCdzIHRoaXMgY29tbWl0
IHdoaWNoIGludHJvZHVjZWQgdGhlIGJ1Zy4KCldoaWNoIGNvbW1pdCBzaG91bGQgZ2V0IHRoZSBm
aXhlcyB0YWc/CgpJIHNob3VsZCBoYXZlIGFkZGVkIGEgQ0MgdG8gdGhlIHN0YWJsZSB0cmVlIHRo
b3VnaC4gIEkgZGlkIHRoYXQgY29ycmVjdGx5CmluIGFuIGVhcmxpZXIgZHJhZnQgb2YgdGhpcyBw
YXRjaCBidXQgSSBtZXNzZWQgdXAgaW4gdGhpcyB2ZXJzaW9uLiA6LwoKcmVnYXJkcywKZGFuIGNh
cnBlbnRlcgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
