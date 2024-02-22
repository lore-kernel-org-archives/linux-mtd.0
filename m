Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45542C48BF6
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 00:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Clb1MVxqkY9L5DqhFCj8XXnSnvOn4fpYvZ19mjdHJZY=; b=SMMfk9YGFRedu5
	m4QfTGAbQI6Ar+HamjHCAatmQTXfZWj8sKU+9QMdU9mTYaNHKbxiARFebGwqKcgFjvwoUc8jwp/GS
	YwiGCSlVXYl6cdnKp4AJpsNFwXWFJiN4egaIF7dV+PROZBLT8wOKPgwi+6+Z48d2PDdPAcxjBeBr3
	v4KC1tHXN+8Eg/9KkwALNgAEhzx8HixkAJLKgJmcT0ujuBKJgg50+/BqWdjCVbMNAY01fimBiIC/U
	AeP4MUFt67VoH5ePTFjj9G1GtYDQgBn7JF4nY4rUuh9NZjv4uIl8HA3MpIAXCZe784FNJD38JxnP/
	gC9ihNWt4Jcjt4z1I54A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx8z-000000034hz-32y7;
	Thu, 22 Feb 2024 00:40:57 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcx8w-000000034hQ-3bQF;
	Thu, 22 Feb 2024 00:40:56 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-785bdb57dfaso30464585a.1;
        Wed, 21 Feb 2024 16:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708562452; x=1709167252; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G592VWMGGcABpadcIh5PdK0ygTD2cWhbQA79MbBz9fA=;
        b=KN9axOqGJ81f1z1a2NjiRtx4LX/9FQxL5TSWEdR172xTFj1oIlRlET9MrR7WlQRkzw
         DoOD6CgiUWC7g25VwaHyareJ5n5vWF1WkEqUYJAoExvOLXyuERdCfq4dCzV947Q3qZi/
         CzbrwIojUPE0FtUVOxnPeW6+6wC67m1n5zQBIKonOpR3HKhFhlxxjMopQaIoi4FrjqTD
         KOowe/Iq+2zrOPdKGpPgay6a2DPSsD3CodGgFXgcTUprqcqCddcDRdohEIVMDa43T2mG
         wnhDjp5WEoXKza2uzTNGdVjSuaWgWO5bG67HejYYrZuucfGVkCQKwoHyVPaIY2PvB0Ii
         WPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708562452; x=1709167252;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G592VWMGGcABpadcIh5PdK0ygTD2cWhbQA79MbBz9fA=;
        b=UcGnjEgnamvSb/CBkWK7YnNFZb6srv/g1lwpTco6NK2TGdMwnX8UF/Q4VQChUEZe7v
         wuk4XpE8y5gD5ZzU8dv3XeJec+RU6WCiQY76jgRagVqbQHRBepVNQ/O5K6TLEV1XDdXC
         aD8GxQFF+6VzZmwoyGxgkDBro26fCHsbh+yHdA9q10jJSaMWUwpEjWfHO1g2wYmQfOmg
         Ds3U34URT51s+Kngsuy9eMnMA1OcRXlU5aGyUzcAojHGGtpvDDSXfnLaSvrLgm9m5Mt1
         oVvcggVFKM7FNCVtXkZ0ZIfcK9aAbgc4RskJEHV0iN6iuwDt0y6Vc1X7oZmm+zvdhxu4
         ni5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVTMgP1wscVsNjd3PWsk4whtRGuLhp01Jm5HA6bfQTdz/4uhQe2pYjYzI58xdaMQBV9c1k/4KzwwE17kqbFksaqHI4ghcIHRxf3tfOt0m/ijZxWidsmh4R/FpYOe9MUVLSOlI2skS8GBlgzCLEoD0YnXkMJ
X-Gm-Message-State: AOJu0Yw+upqaEQYbr2SNxDOBoNTSVVTYlAUhFfxVUK17gnCXjYEKlSeD
	HcsbKK3AwIQqiK5Ite4tyJ8wwvULv74LdwKJXST/ckAeLp05MzOf
X-Google-Smtp-Source: AGHT+IFMZPcztj+yF88D81UW5dxTUX4mF799w8qju7MgkdsbqrbDoESIU7yGI5Z+WYNTzz8dKI2EGg==
X-Received: by 2002:a05:620a:2441:b0:787:8dd3:7c5 with SMTP id h1-20020a05620a244100b007878dd307c5mr1797283qkn.21.1708562452552;
        Wed, 21 Feb 2024 16:40:52 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id b15-20020a05620a0f8f00b0078401adad7fsm4811165qkn.133.2024.02.21.16.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 16:40:51 -0800 (PST)
Message-ID: <1e636620-d456-4bb8-a5f0-742be3a9d6ad@gmail.com>
Date: Wed, 21 Feb 2024 16:40:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/12] arm64: dts: broadcom: bcmbca: Update router
 boards
Content-Language: en-US
To: Florian Fainelli <florian.fainelli@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com,
 William Zhang <william.zhang@broadcom.com>,
 Linux MTD List <linux-mtd@lists.infradead.org>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>
Cc: kursad.oney@broadcom.com, joel.peshkin@broadcom.com,
 anand.gore@broadcom.com, dregan@mail.com, kamal.dasu@broadcom.com,
 tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-7-william.zhang@broadcom.com>
 <20240222003755.670359-1-florian.fainelli@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20240222003755.670359-1-florian.fainelli@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_164054_932651_64EE94F2 
X-CRM114-Status: UNSURE (   9.57  )
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

On 2/21/24 16:37, Florian Fainelli wrote:
> From: Florian Fainelli <f.fainelli@gmail.com>
> 
> On Wed,  7 Feb 2024 12:22:51 -0800, William Zhang <william.zhang@broadcom.com> wrote:
>> Enable the nand controller and add WP pin connection property in actual
>> board dts as they are board level properties now that they are disabled
>> and moved out from SoC dtsi.
>>
>> Also remove the unnecessary brcm,nand-has-wp property from AC5300 board.
>> This property is only needed for some old controller that this board
>> does not apply.
>>
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>> ---
> 
> Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
> --
> Florian

Actually no, cannot apply this just yet since this depends upon patch #5.
-- 
Florian


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
