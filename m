Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB5EC5CFDB
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Aug 2026 10:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YoVgMtoCUMvOnvzDEtaI3y9XM0T8VDVwrz4ERt6Y3m8=; b=fwQyftMxvuHAIJ
	iv8B8Si0OfXDU17d40QyvIi3JmVjk/Yq1eKa9F06IJ9Y5d7smmWe2eR4umKODL3vuSBot+1HSSn01
	pgr293Voq/BRUabWxoy4wIns3gJfhzUBSckFAXoaTKbG+Eir4/GPh26UXgQ8wLnBs1QFxZvUlOBMF
	EjZiv2xoWFE/+eGkvjSuTP9ZUbh+qqNwDc94CRSP0nU5EkPGkA6ECGWk62yG/0qSJT9D3NTj4NOp5
	cCsCaOcVLU7sm6kkbmkgHlwzO1lMZ8QP+uHsLbm6YFs0V3xQIwX9NTWyyQIIWRY0R1hc23MLKj6z7
	C9+UonPAc6YTQfjoUl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu63c-0000000Fs6p-2Fi3;
	Wed, 12 Aug 2026 10:19:36 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu63X-0000000Fs67-2iib
	for linux-mtd@lists.infradead.org;
	Wed, 12 Aug 2026 10:19:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-493b966dd74so4945435e9.3
        for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2026 03:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786529969; x=1787134769; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LPf4HeYAl4NMw83MZeHJ06u2OThCIdlBbBkd+71VTjY=;
        b=DU3VTEv22zLS9Ef/6d9y5GcMDWIHfJBuzIfZRzIfqnJpRl7zk8hQPRrY0MwOO1hw+n
         YjtiiJKHUet9Z1Uk4qQEA56TK4Lf9aJLRHZLMJnYRlv4KHXKNq36Dt49zPZq3pAWTldR
         1cPfHj4t2rMP5wuMg5hBBnuAANFyLqTAR6Pc0bxb/NZlzrShT6Y0oUE7HYVGQBQcyK0U
         jucXaAsc5qRJX7kTTl3+AegL7bHTD7wsFQhp7YyNEjALrjwwqyaPgtrndHF8OlvDE2AS
         rDgcYofRRa4429dIqX0+fXNPqP20Rz48dEOPbYjuCs63+dfh7JLE3+vUB7SVWSYZpoH3
         GlUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529969; x=1787134769;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LPf4HeYAl4NMw83MZeHJ06u2OThCIdlBbBkd+71VTjY=;
        b=Es/liZP2e6xPvksybVuRD+V0qEzFZZtM4ZymWsi+vD309pWNh+mVxHrbwIIC6hNqLD
         BhX0h8hBeNOG5Wk6l+sP4c+yBgs5iPCTogfTGbK9jxV0X/5DPMgV6Or7mvNY8ZSfG3XC
         QCNLK52sS/tiGgz6Ue2BXMH4M1Nfx1s7Dp0QE7eZt2Mi0GhWwPZw7ySlqhZxSFsWkECY
         YMsoy2hz57jRt2Cd1SEt/IhRRymW+LWvWFohtaHH2F3Ht0zJlwzwOrm86aY+uchQUeKz
         x+kNfMRtbDjhMMA+KfrBSb4aXJcAR14f6x9bkSC/EauSVRabQozW4RKqilYVbxgbs2C2
         BlGw==
X-Forwarded-Encrypted: i=1; AHgh+RphA4zce17DGWWMMmVUUvyzC5nuHzXDN874ZpO+dWxqfZaayLdsQ6nMtfzIwWw9xX/PW+jWdIWvfMY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwnET4bGKxsc1GeZwLhegy7t10lptrErRpLMAUFATuf7j2VuIM+
	sN0BtQyJeYNet0nmtJ1j2nsXqO0CEvCyD4fMMhbxZaq5ScFSk+/bGZNtW/EgVVrJyro=
X-Gm-Gg: AR+sD11RBQb1/6Sd3y13RKmNeGqlIhxAeRDwOtBWwd/cb7t3P6gBFAvArcigmZlJjZb
	3rCtKLr4/Trcb/WQjIuaQMKsr/JH5hDTtIvSN0uxSvt9KbQf2humTs+f/ZBWWNzRlGJ/bb4YKv+
	9vynALeTG+GYHh9E9a1YYMf+/9uXOn1J1dpSggSyLKWEKOU6m9MZqdy2li7pK/h7a7LbLiBOqJF
	UvOk+2aeJUhRGk4jd1XCsE/fUeSN0MzIUkvnakZkWkSEm3KlwnMc61JtZs6iVx9ypmJHG+ZeJXD
	evr/ANK34F6dhT0TG9xi0TdV2YvxZx4Y1RhnAHGUWYy/adW2ZW7+m0gy8+0cPV53Wnd2SHk9gYL
	b6Rhl/220s1/91gVOL81DdTtJjZDlVy6Vi4pAYl1dS8hDKCbw1mqVFXjktaHuqwg/McIhagpi7D
	5tQrU7oba9jE7ofYqB/SxHm7gJxIhKBnpxqRZa77Iy0Qm58SlQScZ4uVl8y860R71xbtZloA==
X-Received: by 2002:a05:600c:c178:b0:498:1595:be7b with SMTP id 5b1f17b1804b1-4997c0cd08fmr47953295e9.4.1786529969390;
        Wed, 12 Aug 2026 03:19:29 -0700 (PDT)
Received: from [192.168.0.252] ([79.115.63.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c98d264sm40995005e9.9.2026.08.12.03.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 03:19:29 -0700 (PDT)
Message-ID: <0a15f6e8-f1ca-4945-9bd5-2b64a2802a58@linaro.org>
Date: Wed, 12 Aug 2026 13:19:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mtd: spi-nor: use guard() in
 spi_nor_rww_start_exclusive
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>, Pratyush Yadav <pratyush@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, jianhao.xu@seu.edu.cn
References: <20260811041349.333176-1-runyu.xiao@seu.edu.cn>
 <20260811083111.403453-1-runyu.xiao@seu.edu.cn>
 <0ff8afdc-7a11-4a6c-9f62-6f8ba712c4ac@linaro.org>
 <56991b48-cbe9-45bf-a24c-d7aa771c55d2@linaro.org>
 <87jypwoha6.fsf@bootlin.com> <878q6coefo.fsf@bootlin.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <878q6coefo.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_031931_715558_3F4B2F9D 
X-CRM114-Status: GOOD (  11.21  )
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



On 8/11/26 6:38 PM, Miquel Raynal wrote:
>>> Have you seen sashiko's review at 
>>> https://sashiko.dev/#/patchset/20260811083111.403453-1-runyu.xiao%40seu.edu.cn?
>>>
>>> Both concerns look valid to me. Do you think you can allocate time to
>>> fix them?
>> Sashiko is becoming a nightmare. I'll add this to my todo list, but if
>> someone in lack of technical challenge wants to propose fixes, be my
>> guest.
> Actually, the might_sleep() warning seems to be an hallucination. It
> mixes different concepts in its explanation (might_sleep() is not a
> problem here, we are in process context) and I believe it got mislead by
> the current state of the code which lacks a mutex_unlock().

I haven't tested but sashiko seems sane on this.

wait_event_killable()
  __wait_event_killable()
    ___wait_event(wq, condition, TASK_KILLABLE, 0, 0, schedule())  <- TASK_KILLABLE!

Here there's a for loop where it calls prepare_to_wait_event() which calls
set_current_state(TASK_KILLABLE), setting current->__state = TASK_KILLABLE and
storing the callsite in current->task_state_change.

After prepare_to_wait_event(), ___wait_event() evaluates condition
spi_nor_rww_start_exclusive(nor) which calls mutex_lock().
mutex_lock() calls might_sleep(). You hit the WARN_ONCE in __might_sleep() because
state == TASK_KILLABLE. You should catch this if you enable CONFIG_DEBUG_ATOMIC_SLEEP.

Cheers,
ta

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
