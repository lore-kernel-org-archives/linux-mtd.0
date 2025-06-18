Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C963C71157
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Jun 2025 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VZvc7gLP2yTOU5JXWAj4/Dw8gEIYMqx2KQZUg39aexY=; b=H2tNiQdbO5mPPo
	laeOX92mXkhq3pyFgGls/7nmv7NhXJ6E1Q6Jsb6bmJVGIUrmI1R+HtXoTGcod+WzWqaagSbgaXqg0
	bI9Wb7Xqrm2Zl2jgc2lW+uepTiegMP+u6vYzYZk3BZQPPLSzydzECxdc/LvJ46q0YE7LD0CCPenVq
	cuPTI814cpum5Yi+dsRper0l0SL6PqbrHHZPZY+ikrSK4y3xlrnVXTQFgAt198cwrUUxkXe5paGNS
	uTinm9Mlra+aVbulppDNIH8bFmusASCOlPVG6QUh83c43WElTsDvXmg2hYAI8TkQMWSelZvXBUsNN
	n0wWces9LWVnaJHZ3AkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwIe-0000000AoaB-0db0;
	Wed, 18 Jun 2025 17:10:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRur1-0000000AcJI-1y0f
	for linux-mtd@bombadil.infradead.org;
	Wed, 18 Jun 2025 15:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7rots1tBuEj+icP+SlfA9bvZe/4e1MCmHxB3VSaBaYU=; b=UWkvAHVcqBaRapfNeuMnOT5eA+
	CFCm91gYaE5rhqjq0zEnZt976u7NPvv1JT9qUV5zmPrLEClLZg4NRwHDZ+iGkSudeMeq15IUar9y8
	UhcoEqlRaRiNwPfCjhKhLEgNfNu7taXOYlJEerOiuQlt5e3GWfNk5O2RKrsEAymNmZkRrT2db/MpG
	YrzAhbFtII8rjwjnAPFMeZBXH1/lLQrSqU+8G341i+mgQCKRdUhf2bWcJngjnrkZlg6RFNaQ/FQ3Y
	5POaMQloyurQJM5f9YgV4l6PGI6YdNOqo2VaUMLg47uL75fAFWxsWU4+h29BSWXRDfjus+1JfUEs+
	Sv/px23w==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRuqz-000000049YA-0NbZ
	for linux-mtd@lists.infradead.org;
	Wed, 18 Jun 2025 15:37:34 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so48172275e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2025 08:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750261050; x=1750865850; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7rots1tBuEj+icP+SlfA9bvZe/4e1MCmHxB3VSaBaYU=;
        b=gpVgdRJqi042cKDboLQozGSjF8V3/RivZJcZfq87itGklNDAunPTl66WleyXDPCyyC
         /GNE0DZgy0BSjUuqKPXBcddZ1ahneDhXuVxxF1vJhDQ75bRYFkScQwfySHFEF9XzPNNK
         UYGchSJ5WsaIqtmYWrv7pqVb2y2UclWnggXXI34tP8wwTQpua4Kf/OXZEe3TK6hwtLQP
         zIOhJonvu6DTplTs0OohZUd6AHrnFNSQ64uAy0MOIYwLt+OgKLhv8osDYH9QAM7U0hXC
         EC0os7IGj9XXKiH5KnHzRUPiVC4Or4w/RGEIY2XW5EPwNf47AYwldy6rgD1THrFC/ITA
         XbVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750261050; x=1750865850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7rots1tBuEj+icP+SlfA9bvZe/4e1MCmHxB3VSaBaYU=;
        b=UI2G8ez2DYKQjP8DtbH+Rwan9ySR7PpZFD4IunY+m5q7mChLfylDNLuKc+LpSMZpIy
         jZbzSXvEV3O+WhQVZYWM+cATLmuoX9YLN0w3+dz6eMV6xCAUce5yIPTCu6maXO2wlNnx
         sQxYxwkn3lXKSTp3Tvfjxo0yK4hWSu7WCcHNOdae7qw7aVADRu74dkH+7DLddX+wsvE1
         X9hj37v+gCq60o+n68rIhZX6RgtlrqtKmZu0aNtwSkf4CDIDSOz134SOtqYNKJAv6gwp
         pRePyy+VV5MgZ1pdD+3swieRfo+G57bLrCcp4+RFh74psih0anCQq1SkNaSjLlbg3fHj
         6t0A==
X-Forwarded-Encrypted: i=1; AJvYcCVyUFm+6bTSztex/D9pHs5Pi70XJ0J+h698gdROqFih4MHfrud3OT4jnJkZLp25JFgfeQyddIDI5+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXf5MjzFPQk67EDaozyM8iPdxWXYlPXiUoIt6ssb3UZHrWi37c
	Tq7MNQ+JqlmCV80fFbC6Xc9tXnqt5y/7w6AKqwObX3nq6VbbjK7KSx43
X-Gm-Gg: ASbGnctYE988GOafpFux5g4doUoNIRNxoVjO5u5Qd3vEHUyc2T1pmnUi/wdAWe2SUFN
	u+HZRuHCZMCKn0mJZAF/iKzJbRsDkEn48a0ebFUS/Epa2w5OdaxEcJIw+GiRMyydRaoLVroRPdd
	0PiPUoP71f7Ynfp+bqprOOYuKh08I/EAurxDydy8FWRIRNMNsGtJTdtr3B0jlbT0FsLdGleK+8P
	X/LNmGJPRM7A5tYUexby5s/QWTFPdEBpdMB07MMgtkXG9PsmualsKkq8+xIqK77fHWrpAOcQYa6
	2VQY1HKhphHo+P6O/WYJL6CZbAFmvHkUAhzVLJltMbUE6JS8W735CN8KjtT/9otGdSwZbWndmxZ
	SXF9v/JiTV44VyOzTMkeGoaQzjF9yqKQdqJ78Ug==
X-Google-Smtp-Source: AGHT+IF2VV+CTQDFvL+Rf1YFT4Teh7oJnJWmdd/7flA9WH+cFonugqwJIfxyEtFJSjjrtaGHyVPTeQ==
X-Received: by 2002:a5d:5f93:0:b0:3a5:1c70:5677 with SMTP id ffacd0b85a97d-3a5723676c0mr14030160f8f.7.1750261049844;
        Wed, 18 Jun 2025 08:37:29 -0700 (PDT)
Received: from [192.168.20.170] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b47198sm16964027f8f.81.2025.06.18.08.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 08:37:29 -0700 (PDT)
Message-ID: <96e2a25c-89d1-42c6-b2e6-eb51b6964849@gmail.com>
Date: Wed, 18 Jun 2025 17:37:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: spi-qpic-snand: document the limited bit error
 reporting capability
Content-Language: hu
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Md Sadre Alam <quic_mdalam@quicinc.com>,
 Varadarajan Narayanan <quic_varada@quicinc.com>,
 Sricharan Ramabadhran <quic_srichara@quicinc.com>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250527-qpic-snand-limited-biterr-caps-v1-1-61f7cf87be1e@gmail.com>
 <87zfe5l8g6.fsf@bootlin.com>
From: Gabor Juhos <j4g8y7@gmail.com>
In-Reply-To: <87zfe5l8g6.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_163733_234144_67C47482 
X-CRM114-Status: UNSURE (   8.99  )
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

Hi Miquel,

> On 27/05/2025 at 13:08:16 +02, Gabor Juhos <j4g8y7@gmail.com> wrote:
> 
>> The QPIC hardware is not capable of reporting the exact number of the
>> corrected bit errors, it only reports the number of the corrected bytes.
>>
>> Document this behaviour in the code, and also issue a warning message
>> to inform the user about it.
>>
>> No functional changes.
>>
>> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> 
> This change no longer applies on v6.16-rc1, can you please rebase and
> resend?

It is not needed since v6.16-rc1 contains the change already (57cf46cd1fe3).

Regars,
Gabor


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
