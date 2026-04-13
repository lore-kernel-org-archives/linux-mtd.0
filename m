Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8016CF3ED78
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 06:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chNqTMTp6lKOlpseihB8+Nn9/G9hF2cU/TJ8ojPi8Vo=; b=m0ES8/HOrKR3fHeNfawUyON+m2
	1cT0/YeNRfFxccfebwldqj9saivMptOP6s+EpKHjFOP7otcRhIjMhBFoammlvIGLhWNR9fxzvfvFF
	5uWAyKMqjYEbaR86lbkTsOCIpd65k052eXxB4kES8NPVS0YBEUTb7PYTllh6Gfh0vvccFEBdQMwh2
	p86UZHGZeckdrXd0W87uBGOMI9IWgwLnXj6Zj5AkVLndj/930oKeaqCbZ5ViAEy35MKgZzIYuXPo/
	GzqyuBadNPknvkjtMZIFPIo74fJChq419CHj7u/UNnJpjbhNKoiZWtc3TpzC+RGpW3Ro7JG5HAsoE
	tLEiuQGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAcX-0000000F3le-2DTN;
	Mon, 13 Apr 2026 06:18:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCAcU-0000000F3ku-0YgC
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 06:18:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-488ba840146so38099485e9.1
        for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2026 23:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1776061080; x=1776665880; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVEj969j16lBnXqUeOElFIMEKm5V6nh37Gy/MgYcWK4=;
        b=dDCiPNmFebmcr5DlgJxgneQiXqWget110YU2jkDMUNC+8hWQ4HXEXqo9c4AOTWlJe2
         k3b9Io4CScSFrGPOiA8mc1hiC8BGf7qgaOt6/O0Up85imljUsRzMY5SXD+xDjt3hi9YH
         nw9yPDN6jk6AeeIpWmn+Km5OY7rHKgew0KhAkcEaGW0HdolJqvjrNxQjSKvAXl6r32Bp
         0YpKJQOdWl+WXLm5QLeYYqT85huoYtX0xZXJ2q+TUk8Z67FDjlJseYFftTQgjzhjhiYl
         RQSWuVp0e/QmET61XBjDrh3QEoYuUyC97e6jYvrTUUUyH4kXimFa/JZR2dGmLPPE2WGR
         kMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776061080; x=1776665880;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fVEj969j16lBnXqUeOElFIMEKm5V6nh37Gy/MgYcWK4=;
        b=mRVsAuWYokKeiyAO3+Cr6YH+qeIITLR+6MNudK9Xihvf4vRxOKY1DAY08qynPRPbje
         a9nW1SFx5Un+EooThymcMbAS3G+T4bUaAGXMXyitRdL+agZQU1fiwNKiopfqD2VizqZ+
         bh35f7Tc6WISv94IG9lSJ8YUfb2XUVQrevtGHibHTGH1AZgMl/3aETGlA6gRKIaExzyv
         BtjmEKVC+d7R0zzPdrbDgKTarK1/aIJ9wXCm5frcPnSWeR1bFHdv8JI9n1fl6jwf4ok2
         rbHVEKWzDc+iYQ7am0AbRzgmhId+lrJe5KhsghyeE866HWuqoZszPhNvAfqIzRMy0fDV
         iRog==
X-Forwarded-Encrypted: i=1; AFNElJ/Bbd4e5xb9TvBlv9FEvndI46EqzoCXOHdq3eAbkeLo014oHoetHcplYP15bH1ejDS51U3g8N5n3VI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJraxtJxcVDg+dBnidRTlONbDbOthfYUHcmQSZGAp8w9LnkoO
	nNOS0/FM8eZfNtcJAVWIPwFk/qwRyGT7TMW5Dy+LI6uWxfqSbkMxudkodi1hfJJ0zis=
X-Gm-Gg: AeBDievsHlyzbw+gV+ZsMvzc8T78432gOmBZogxEU3nGhB1QrPdySR4abTLQtHqBLmi
	0W9ak0KjiRKv09RIqmi20ZvCO8ivxD5aJXBSi+oEBGTiuVUHAs1VLZ9eYVK/FfQexF4MK9+6kLh
	IHa4UI5ybxfClehHdAtsMMJyKT0mvkitoXStDMHQwBpohwAF/FIZLqgOM2DQy2Ugv++ql13sGCU
	cUK3APKckB5zBb8gG1BCxfki5Ps6HkoiVyHtKD2kzEfZTCRMZzJ/hY4iiz2Vozu4WAAEpu6A8Ey
	x3tAbAxm4ww/8iM5BX2T6KphhidMHytvHXHf0vM9r14QWqN3/fAidZPgQU5XxP+ojobjh4ZLhYs
	XCvaRUpKKzzzsAHHgHtsJgMXpKFS0BdeaL6mKKUL+B26amo5ngDoZBO0PYGVaAEreuVJGrI6CbR
	YSaBUVn5SPzV23f/d8WleAZ/9Zedp8dEfiNnHfF72wyv1ahw==
X-Received: by 2002:a05:600c:45cf:b0:487:243f:dc3e with SMTP id 5b1f17b1804b1-488d67b8d8cmr147582435e9.6.1776061080075;
        Sun, 12 Apr 2026 23:18:00 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm357225395e9.3.2026.04.12.23.17.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 23:17:59 -0700 (PDT)
Message-ID: <89474dac-72ab-4872-8394-98abdf5518a9@sigma-star.at>
Date: Mon, 13 Apr 2026 08:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nftl_format: prevent buffer overflow in BadUnitTable
 access
To: Anton Moryakov <ant.v.moryakov@gmail.com>, linux-mtd@lists.infradead.org
References: <20260127131609.53932-1-ant.v.moryakov@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260127131609.53932-1-ant.v.moryakov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_231802_207999_27D62940 
X-CRM114-Status: UNSURE (   8.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

On 1/27/26 2:16 PM, Anton Moryakov wrote:
> However, `BadUnitTable` is a fixed-size array of
> `MAX_ERASE_ZONES` elements (typically 1024 or 4096).
> 
> If the MTD device has more erase blocks than `MAX_ERASE_ZONES`,
> `ezone` can exceed the array bounds, causing a buffer overflow.
> 
> Fix by limiting the loop upper bound to `MIN(maxzones, MAX_ERASE_ZONES)`.
> 

I get that this would silence the static analyzer, but wouldn't that
introduce a different (logic) bug where the tool now silently fails
to handle erase zones past a magic limit?

I think the correct thing to do here is to dynamically allocate the
array based on the number of erase blocks.

Greetings,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
