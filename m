Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348ECC48BF6
	for <linux-mtd@archiver.kernel.org>; Mon, 26 Feb 2024 14:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n3XhH9GAo33CMOVqHLTAMa7OBCKXde9iH/eD0vb9jiA=; b=gde1VOCEe4FHSw
	Ou9T+wIkmj1m378shPM2ZzyJhwQprMDk+5Xjf9OP31es1f5r56z2+W6pzzMpTnB2kLZ4krDo9dm5Q
	bPp4YVf71fKYzuU0gb2EMk4O75MECD4xiCEcNLJ/ha6N7zW3grMv0dxm/9Xyh8Iqdx7D9np9YI4s9
	gv8EFHaVBnjYW7m8eE97PrcKzMNn8D4UVLcL8RK1KZ1GKq3lVd8Eg7+Q8niBVjyE6M/nLrJBwZRZO
	SbnS8DFivyejcO8j995pODsWk8fAN3wEEFNXtQF4sBFD/DN4n8uGUYcJuv/IGFmbOl55gt/i+LftL
	DQnlB8LU8uSrL+qmLyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYO-00000000yL1-3mgR;
	Mon, 26 Feb 2024 14:02:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZQl-00000000PHK-2SIs
	for linux-mtd@bombadil.infradead.org;
	Mon, 26 Feb 2024 11:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5QHOzDnr2fZFc8mJv/ASjvc4DZGcBtF/FA4nRGxtHbI=; b=NY2F+T7CUSKxCzRYr3QG1NUaV7
	Ka1EzXlPZw7jG0GWIZi0hoHqMm4C9O5pFuf2poOkdKniCIz9HGzIKK2HauUDhvQLHX5Bmi4RFoayT
	siq6iHB0tfrEpWd/6h2V6XQwjjThKIpbjTrGoZmTxYjpL5Y/OZVwjHhWUWx7PGdBaeVgLZXs0V7K2
	b9pGioaFXsMIV8xc16k7wflq9tSo4BixowZw2LGdeAxsMij2Dtatap+snmy6UBZVMtJZDIGSZh6P6
	gZk3WaVkB6rCBK9jz12s0ES5TWWYvr0bwYd64lGBVAwThA3TmT5w/ke/J000sm057R91ekNeuO7xk
	N4CUCcOQ==;
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZQi-00000001AEO-1iWC
	for linux-mtd@lists.infradead.org;
	Mon, 26 Feb 2024 11:45:58 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so475808766b.2
        for <linux-mtd@lists.infradead.org>; Mon, 26 Feb 2024 03:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708947953; x=1709552753; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QHOzDnr2fZFc8mJv/ASjvc4DZGcBtF/FA4nRGxtHbI=;
        b=k/mS/p7v61D1Vihuph9h30DCiQMjrIawg3+VTOaYtXPPAFoptc9jWU/eLQA5hR5F5C
         EWJ1jnW7lusRG7i8QR8sJV210JuRpQLJUrbZNWfaxROG9SJcVlIAW81DDWa8VilI4ioS
         19JMw9zOyM8pxLQTjwalV6GJiLZBxJEwENhyyyQ801eMyIpKDzyvVPVC8k2dPVkeHlYB
         TdmwtzvSyT4WD3IB5AGU80+PPknH+eBsZ+mQozcMEJvXP/PQ2MkOC9jVmdaqq8NQ7U/k
         VBPFsfpt3sh1NkX/h9RlYI9AjbB3pvbW+adkCgfYcKeWwnsML0AjIAHowTTe4fpsLhrG
         OqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947953; x=1709552753;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5QHOzDnr2fZFc8mJv/ASjvc4DZGcBtF/FA4nRGxtHbI=;
        b=baLH8rPhx+ipTaVrRYQnB7ZkXbgjhhzSj8JlRbnW8RBWHguVH1jDGz+B1g78M7ptTI
         XKdmAbHlGL6PB7x6g4H1lHD6th7dPAwL7/R8jAF87fm3z5fZE2EEhf1Gd3mQT/5h61QS
         viY504/6/IYuXsFZCHXLowfdYdpAhHoHOGgpvbDgPMryaoCNX62LKCPNe4tIk3kFhWu7
         dUBqcdiNuK7Z7/TowICdS46WoEhWW5lxg3ApIKy9jbe0BVshPTaZogaHn7ctMSOHRXOW
         IQIxafdZb6nPtLOaYSONM+oXu27l9Z8Uzss0zBRrttQATpEf4EsDBJLha1GMNi+tF3up
         JG0w==
X-Forwarded-Encrypted: i=1; AJvYcCXZtfG9gYvmTWXxIWRyiwFkdLHOI9UsE+c3pMBJHduBrt+jIZlhIRlwZO9i1Bffz9cqIO3Ww4tuOOkMxy764nbPddO0ICHcrR3L6DBpdA==
X-Gm-Message-State: AOJu0Yw71/kC9cnLlyxEAhEB5T9JgbM6aTtncrJwN2oiXxHi43KEu3WD
	2okpOhLJbnZkarQ6M7oyikeLrWxXczZxA0sKAHymd1oi7yvuy9YS8x5CL9/32MXAI1BOUDvl+Nt
	p
X-Google-Smtp-Source: AGHT+IH8TtND5SHe97VFjkocDpWlBzqqd8/3crqG9Nh3OaWBEP6nmhxYTZJXMwvAZhqQ56h19IStNQ==
X-Received: by 2002:a17:906:2419:b0:a3e:f7ae:49b6 with SMTP id z25-20020a170906241900b00a3ef7ae49b6mr4000009eja.49.1708947953323;
        Mon, 26 Feb 2024 03:45:53 -0800 (PST)
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id vh12-20020a170907d38c00b00a3ee9305b02sm2337992ejc.20.2024.02.26.03.45.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 03:45:52 -0800 (PST)
Message-ID: <1d7b31a1-60c4-45b3-a7ae-a3a2c2e126a8@linaro.org>
Date: Mon, 26 Feb 2024 13:45:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove T Ambarus from few mchp entries
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com,
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-crypto@vger.kernel.org
References: <20240226094718.29104-1-tudor.ambarus@linaro.org>
 <20240226112132.22025454@xps-13>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240226112132.22025454@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_114556_588036_F061B164 
X-CRM114-Status: UNSURE (   3.89  )
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



On 26.02.2024 12:21, Miquel Raynal wrote:
> Could we mark these entries orphaned instead of removing them?

ok, will send v2.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
