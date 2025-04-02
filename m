Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 540A1C28B20
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Apr 2025 15:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i+zPADKKjyi44lhrKQYtg02zraYwNngHVuDCls/F+Aw=; b=T81lCAn4Xx7XTJ
	xumLK5Qy+KEUOUlz3AveZ0plyH4s4D2SSzz4VVeavY01nAdQoZhgrkzR2+BUqUcwHed2OgZFicVca
	N8YwDMwREid5LFXjkT+iOGCIj/M5GptojhVq0pJPpztyU12eQQYITOLljpbq9s9pDHbvO0FoGTrBN
	wN3lvXuCs1YHr8IRPwBKELV8Qs/OMlG4d+lridRCfiGoek8iNlHPH5KAxFRhFbGuBDDXNHCG3dI1H
	3oxHtTWMIzCwzUoZGXVvz3Z6FgozUE0H5CXuvKC9as5hSeSb0TpbderFPU6HPNmSDlWySCgxQ+/Uq
	3BuxG1ELe4H6xdR+bs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzeR-00000006SW4-3pMi;
	Wed, 02 Apr 2025 15:05:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzeP-00000006SVZ-3qZI
	for linux-mtd@lists.infradead.org;
	Wed, 02 Apr 2025 15:05:11 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso65242155e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Apr 2025 08:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743606308; x=1744211108; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=XNCtD4oDkr3fN1u0ayRtNXEWWBQgX8OC8RsjA9m1/RBv35ZwLbBhZdythjLOQdAkMH
         9byudM3ag/EXiLfBUmvi+/CfQuehhgpwarFlTcAh9U6DBFuqhjL3eOWCSzhBvlOcqBUT
         2dNWj5l3aKuN+ESfTRXV+llpXrPvo7lI97kj8Ho8BrghiR3pUFAsEGAz1mZuUAaErvfM
         7WbImHr6hnA2inDXFa2AKuF+Ust43LTpniQcn8b/uS0MQ8+kzqrIb3dVF+hdvBh+4uVS
         wWwjZq8hof1urcnnuS4+TD6mTg74p3gTmI9P4vtt5oTA8qdOrf7fAsguoiNsDSfitRDC
         /T1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606308; x=1744211108;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=EthbguTgiLuBA9t4IfgvbbYCPY41UOfGsV19L7A4DBr2/+V8TPQBqNxZd4Pz77mBb5
         der2v1QiFlmqReeEFDzqJNxyW9dxYlDY9/TYbFnKsxr2COkSkEs1CpR7PPchwNS4bjol
         lSy4pN3EoUh2QWztNSI9jS7M7S4Da0XoQRzJU3TzMHHTKUENd31uYAUa+msCOHRKtqEv
         mC3qLNCUykxWGIin5EahGgEVD1+Lv62XdcwhTNLzQ246OoJR1aQnrbC7jX/xPeQte/gO
         x5CVPzSc2Ilt9CELkhY1Von3sqiaLI6RAyTHpaw/d8U19n2OsYE7mz+f7ZG39u62qjyo
         Ef1w==
X-Forwarded-Encrypted: i=1; AJvYcCUWxXIN8U7tq/MlYF70f4dgHpa/TfdupJ5QAtxVlzov5rzcCOebV6Q9Mpo6M+qJ8ZxV2IweGDq6ve4=@lists.infradead.org
X-Gm-Message-State: AOJu0YybN8G1ytPhF2sKfQJCxlsz4ZdT7c5GpmALsTb8NUO+19FA0SIe
	CiafPWEjcXYTHCCGPJky5dX5R+Ch0cAoUVx2LswHBCTBPw667PN7JHUitsWr+KM=
X-Gm-Gg: ASbGncvIgR8GKVhrFRbstQjxckd9aAeMd29olkfzfSbPYzgl38EbXSinddGpzvRLkgk
	giay+5p3pjcZrwxSIal1w9B9C6uk4/hpF2b5pbVA/jgEi9ogo7ir9orKdYDZ1kv+e7s0R9+QTuo
	JM8Zt6tEyW6wziSV5HLzLQQeYwbgB+W7Vk2f7Pz24T6sgI4g0XHlj7o1Ygqnh26lq+R/f8Fvd3F
	Qkk7cjUpffpLrGS7/C6gKSfQq6qSzue8Nf+6Ok8tD7U2jbKgVJpM+EmBIOApTSFYNG9ftn2EriX
	akMUnrq2WmrT6NRd58qwOI45eKwJHlKhlpSLA93BzYfiwefPnhz6kyRvQugHsmr0
X-Google-Smtp-Source: AGHT+IH/IctG7myIORO/EzXrC3V+Om4UPDBH7NpSniE6hYbkLj57G56aoDo7s5vsIlXA9aB5eig1ew==
X-Received: by 2002:a05:600c:46d1:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43db624aed9mr159095505e9.18.1743606308125;
        Wed, 02 Apr 2025 08:05:08 -0700 (PDT)
Received: from [192.168.0.14] ([79.115.63.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a962sm16969806f8f.46.2025.04.02.08.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 08:05:07 -0700 (PDT)
Message-ID: <abec749e-c382-4907-8f49-960595c9d3b0@linaro.org>
Date: Wed, 2 Apr 2025 16:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/21] mtd: spinand: Use more specific naming for the
 (single) read from cache ops
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Santhosh Kumar K <s-k6@ti.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <stlin2@winbond.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250307-winbond-6-14-rc1-octal-v1-0-45c1e074ad74@bootlin.com>
 <20250307-winbond-6-14-rc1-octal-v1-7-45c1e074ad74@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250307-winbond-6-14-rc1-octal-v1-7-45c1e074ad74@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080509_972786_B040898B 
X-CRM114-Status: UNSURE (   5.03  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
