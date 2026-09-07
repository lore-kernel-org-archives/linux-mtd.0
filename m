Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1B4C79F89
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 05:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=TvFYReSWhe9N/9eWiihvsx3t+t
	NBjSODLmr62VMq5XFmbGM5Lvk1+oAxxShr9NrttckO7kPtMKFOCM3W6Zs1N+4gryWeq6gznLjPnME
	aWpXMeeJwai0BURpduGwlO92C4yauiQtwE4EMPwtfDWwgmYjNkDN7jArEgGN7ek13lXR4MnVFzlCK
	IDFLR/zCo7UmUyDo4WVTtwSuXpIoqJr6lWZXFg8HMk0A9rD6e14QMsU6qCgkuESNq2sVTmaog27fS
	Bc2u0u/imYt/n+8myOVTEK5hFTv/meYqBrn8ho7ddYX9AuFbWftJ3d20TcC6S5ygiNd42gBuxK0pZ
	YJdBM1Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ryy-00000005wAJ-1l6R;
	Mon, 07 Sep 2026 05:33:28 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Ryv-00000005w9z-0uE5
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 05:33:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so29206905e9.1
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 22:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788759202; x=1789364002; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=I+AWSWAUFtSemuoSvLFuimgIUGGoWclH16k56AIsTMC60smWkAhNnYanM+ViEkIsPN
         G14Ah7Dn+NSPNh27ZIitutEvzoLAdLdFhQixlK8Y8vuWybqFvRRQrKS4sienTF3As3xW
         cvDaXjoJ0GEGUhB8CCnh9o5E73IO6dA1Q88/nimppf0qmnp1FXEiW2yFCGZ5ffhUfkxM
         RQ42iGlYFD0B+9YTEfBtRf1qDYFawhcjF2C+DigVkQS/CLPBeeLON3MqnqilX0/Wbm6f
         XCHX87RgxujvP+05FZgOwyNYZ4IQAHXdzxtBmtam3e5sXdxtlZj0zpnWiyacKoxfTAUN
         nJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788759202; x=1789364002;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=DfdeF1DGGiljljk3lTfJfrESH8ZQg44RaK5a/pGiKWOQdQtFZlNu6DfxAx0elDZAOq
         Lm0G5GpBAQgUUv5CBtoVd4vIDAIcJvsHgXzS6BTHEGeWIBXrGhLLHP+HDMbEzmicCH7K
         yx+0i+NxcF/OtreLY6gsw+QwH5CvYxd6mVRtO/ZCfWHC0W6S1xUKNZTg8Ve0c8Xa2j5N
         m73rbkRN4Avm9xw4ZxfDqhw3h5DHgSkMw3RqjNdw9mRWfT6yi3qUy9GTcTWD3qG0S4dm
         aHSn0v5oqoLAvTTAcT3YZKHVsef9L3z+83DQfHinsHbfrNujZo2TUyftJOepSzQm3QXR
         mCsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfm2zXz/EeVouJLWeas3+Oqg5ZAvDQuPac+nh9NLuVohlgECXWsdEZRMYAmptyzf8v+6ky7w5cR1g=@lists.infradead.org
X-Gm-Message-State: AFuF++mjZeB03pOeXNViAlnW0/6BtGdbKr/gNVrGEk7qyaiczJoSc1ku
	raqAbkYb7DW61DteZvPypmMn7WvWjR+C/N0x3IZlj5N7JA5DCekSW4UT1FAQq0OwYqUXjJLDdZA
	3atx81J4=
X-Gm-Gg: AYBFou1kBJuMQHeTtb4aPrSVh9zTvPbgBuO7gPlg0FzirtqjJHz7qDxhhF7yR5gLkwo
	PLolfclIN4f69zj51vj5z5RPdijdv8+sKKUy7mktWcDcXq7xcDE3/MMGPr+A4UMTR3Qv8nK9hyN
	LYQbRfsz0Nr+WIN2kkDivjoZJtC7jxp+UOrUMoA+OsvwZUpwuU6siC3MP7SUjuub0sOTiM2ZUNG
	cq1KyvqLh+49wB8KTc3zdz6iUdjDCWAtbwsHYJ8wlDv7AALI1f48lWa5BQz9ABB+eEl8UNgf27/
	BVC+vmEbLnHdfCB7QZApJqMwSBBU9Y81Sk7c/jpzlehWdE1PE+MeTwI3bZGB2GMCGRKscPYbYe0
	9dJXsgQLBznRsbeua1ze7tItBXSbMLZHO/Jaluag6zivRlD/oSHx32g4sHpJk3s7vh0+H/UPaPc
	c2vVRpSR7tj+ZJlRDsgaiU4sxYVjmIORGPD/ty6icEXtU9yB0GeAj7KFlh5Ng6/F+cCb58F0H9j
	Sb5l5p9Ig==
X-Received: by 2002:a05:600c:3b11:b0:49c:f7c4:dc54 with SMTP id 5b1f17b1804b1-49cf82512b9mr361311185e9.14.1788759202553;
        Sun, 06 Sep 2026 22:33:22 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm252647005e9.11.2026.09.06.22.33.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Sep 2026 22:33:22 -0700 (PDT)
Message-ID: <056cb558-547c-4ed2-9341-b3adacba109c@sigma-star.at>
Date: Mon, 7 Sep 2026 07:33:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mtd-utils: don't include features.h
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org
References: <20260421011429.294896-1-rosenp@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20260421011429.294896-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_223325_580186_7E553FAA 
X-CRM114-Status: UNSURE (   3.52  )
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
