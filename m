Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC774C54FB3
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 05:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kibbSIsSgPObItdlpy8jqXmZtVVFwm7rw1BTDuSRFVI=; b=JXunaXtP04CCJvvDBqwJhpbFbv
	lHiA2q0+/8mc0lGKAhhHsrkR4BG7nII0HTVGX+/K0oo8Fngsg5OceXcTcRnO4dyfBavj4qQuGnm37
	pzSxQWLeewzEvOu5S0M+82/RWRpu34hUMuoGmLlIPbcbOFD9nXACVIs8XhIBUsKkNUV/cKGeQDaak
	OgPtkgm4W+FjpvQRzeZrmyejKsboQI159Nyvy+471H7cMP5o6Xt45zTffBCkiMEt7Pu3GZ+k2ubs/
	+O5IwlKNxkFTqRe63vn+WvE1rPgd4e+yms3ob0MmUvu4ZXgeXrybmTIMZHnN8N1BN3bjGpmJx/Lzw
	5ZSohixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxwR-00000006lyy-0jvl;
	Mon, 02 Jun 2025 05:42:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uLxpy-00000006l5L-0whJ
	for linux-mtd@lists.infradead.org;
	Mon, 02 Jun 2025 05:35:58 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so22578355e9.1
        for <linux-mtd@lists.infradead.org>; Sun, 01 Jun 2025 22:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1748842552; x=1749447352; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=rzeXG0ekuhd0uXMZGUj4qYz+s6MmKTrAflgB/wkT9MmtdW+b1uyDh1gmhgp5xrFf3p
         qMaOQVxnvECwb0y9SPI5YzMB4dts1s5/u7dF77AHP+Lmz8IxOg3G1YbNyzR3OhwzCS2/
         GIbmdxNWauGkDXfC83d4FOS/xohXKPwB+K36SbN0QgNc1tmD+g8hN/mUwbw4JtIzjXtI
         qi+6y/prlKQakBALrxCESFt5l629ya1Y5q3dU532f5n8MP/as/o6cSS8rLwSrsfFRvhO
         szEHguNpyF7Mc17XvjYTMaCdqu3dyMBNIt857JdHrQI29CsJIKxRKN6Vz2NsSgqtr6UZ
         0CCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748842552; x=1749447352;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=hgs6dfx8bGTpAPg00kZdNfwy+AoxI9quruAHTyLR4UMk2IKJq5EqbQup5R7JGaJ56y
         OJgsMHeLmJEQ15CSICkhrGdRxFn4hqenxXGyTgaOE9lQYeiaT1WZ0b50ptJByvFGoRFG
         sN0IivMGjqS9p90d0X/u0JKSLKOSZuiF6JQAX1rZBOtGht9hOqo2ly77OhVAoSqKAy78
         K7QpQiV0EQaQaFpMQW+7ujUQ/nPCE9hXXgVXlKUUXbyTL9L26LmDgrms9gk2wISBycl0
         kjMBHToguhbvsvrISdmoj1AuEurrxn9qn7gpz1TQA8eIfIS9PACDVAZ87XhluP4x6O10
         1fvw==
X-Forwarded-Encrypted: i=1; AJvYcCWqjnVofali2mNoNUht3B6bDxI9p9CX2zhhG3aw9LnC2/vOJYopK4Xp4S0qNhtb89ZhHr8uKTtJKqA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRo6JaZn3d64DVbR9YGmrqoNNl/gF0koznQxREvKzx9mPb3sxw
	zFvcCvi15hCxeSfzcyjJbpe7rYL1KbD01FAo+UKdfH5bfI3JmsJFiUUmpZ4q7FLbDdg=
X-Gm-Gg: ASbGnctT3+e9MjpSufUfC4MXUylRbMXVGDHy52RjJwGrMV34bwu872RS4G/GupH5sFo
	Nri1rOpjzoh2uSxz4dGy/tLUaOcci2q02p11eW8Vuw5DjCykXfO34z4670aJ3yqu/UdWzus0uyz
	p9aIu+wgR2aVs/nWRpVoz/7O35Dl10IN7K1TttXatkFq/5RKxqJCqwf0nMsR7NnkTaUn7WUR7n6
	B+HzaFqDahqzgmLPeIJolCSUTu7zSplYSb9ct/r64AVelG2UZIf79UQurt3svCmk6/eGXT4QH3Z
	cw1Ods9AGGn8cWWPs84HFDI1m21rEjQYOzfLuJdVNj4gdFEcVrTNUuwiMH4Yp2Fx/m6D1pshE9S
	+dghvSP85
X-Google-Smtp-Source: AGHT+IGfDX7nwistma+PeH7pmpl/HeKjSFZm9i9CUuiscPFNQeOanqOHvRhnFqloyB7og80A8o35Wg==
X-Received: by 2002:a05:600c:1d29:b0:442:e03b:58a9 with SMTP id 5b1f17b1804b1-450d65506bdmr82058965e9.25.1748842552334;
        Sun, 01 Jun 2025 22:35:52 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7fb86d2sm107176765e9.30.2025.06.01.22.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Jun 2025 22:35:51 -0700 (PDT)
Message-ID: <e9a8ea6b-bc7f-4275-acdc-6339a0cc4472@sigma-star.at>
Date: Mon, 2 Jun 2025 07:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Improve check for GCC compiler version
To: Khem Raj <raj.khem@gmail.com>, linux-mtd@lists.infradead.org
References: <20250323040132.2297287-1-raj.khem@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20250323040132.2297287-1-raj.khem@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250601_223554_290979_09759E0C 
X-CRM114-Status: UNSURE (   3.97  )
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

Applied to mtd-utils.git master.

Thanks,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
