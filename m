Return-Path: <SRS0=Kp2M=JG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C20AC433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 02:07:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2AF2610F9
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Apr 2021 02:07:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2AF2610F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9hhrZtHj+hzEjvRyfsreitrCPnZueKHB+nQCXS5STUI=; b=BXo0oWF79M9/rdtEDZsts8Osh
	2qn/0ofBT/rGyYDBNkh6pURSc6wC4J5TDCMwIEE0VI6IxSXASomDJeVQYHN+GZmRTCJcWjwjrDXfF
	QKBLZtQ+oQWNHWhpP7ebaZon6fztL8Apjdkih8UVS3sjxJ/TkW52qIkhpMXJ8Vf6hMALCT2NO3FUD
	BBkxZSKQ599OgGVuN7H+YacJ9VmucNp0vdlLyz+POgwfdndXsKnrLrpjfJ6bFzT2UvC2SdyZa635j
	2er1UhH8yDXYx+qSgSWLosUlJrd3Kz0f5YHwcqqeslXq3bxm2lBmrKwHfjwwmWBUlQnlTFm8Vw5N/
	aKXxGNB9Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUgXG-009gx1-Pf; Fri, 09 Apr 2021 02:06:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUgXB-009gwc-4H
 for linux-mtd@lists.infradead.org; Fri, 09 Apr 2021 02:06:11 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so5722865pjb.0
 for <linux-mtd@lists.infradead.org>; Thu, 08 Apr 2021 19:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NEQV+eyOgii4JhYwpfPbASD2YoO7ylb77DWd+7nNuzw=;
 b=LDxvpucN3nhvLTn1O26UPh2NwpUTTxo8CDAbr0Q57hzFAD79Aya20HMLSAe2c31mwz
 hvLsqBGOm8p1KWPNygJhT+v0hPN1a8dCT+HwGzGGXlHhkFqGTEQYv7jkeg69J7n5Q7Dg
 5wuCd6ULQrX4vrcXDYB+gujAnJs/KQLJcamrQR7quzvzw5xbprabt9sOWMqNnr2U+3a0
 oG57pWJS1m4AOpi1o560bgtjENsaOW5awVvhtWHrcGZnqUjqLJSKaiQzkncNFxQXh1c2
 XgprH3jgEV/WF4rKjjJi8Us+5EgT63nZXZdtdIefgOACuFhsvy/IQQG3TpdnQ9lPjEzB
 EoTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NEQV+eyOgii4JhYwpfPbASD2YoO7ylb77DWd+7nNuzw=;
 b=Fujvewf+SuDXjwMVO+GDNGGKnxp44rmMgtdi9oecGzFNo60QMmFd4zI9Arv7gGL57K
 eO4eDtG274CSzf+AsdoZlaWNv56xni9uqSxrk/mM756YWpGF9Sp2IfCWhXESFAaBqegk
 LZC7Yo9/Lwok+hy5ue9zZoPq6I5bZ3u9P6gfOOMNvGUI896zNO/RZ6+rzEKPHljwWVot
 Z4vctt5c5pVs2BazUN/VIWlC0exWbTMDB7q5yuMdtZLAXx5J8WOycvwkqJGOpLOGUubs
 L4eYd/rwoqjMeesjKdPkDv11Tuiej1tzrtecFXppYhmIiMBHLDmkBDSpMSCe9Mfxx3M+
 To2w==
X-Gm-Message-State: AOAM533Q618NrBaG8bmZD4dyX2u3BI4+6GCxela8DyGEPHaB38RCN9Vx
 fYL/JyJuCmm4fB1grNmQgrQ=
X-Google-Smtp-Source: ABdhPJwljsSecmUsxgYKXFKyTeWVH9tPTLyTfYyM3OIMaTpMud5O2CEh5wiwAfqU6FaLpNvlqCssbg==
X-Received: by 2002:a17:902:7246:b029:e6:78c4:48d8 with SMTP id
 c6-20020a1709027246b02900e678c448d8mr10920716pll.18.1617933966995; 
 Thu, 08 Apr 2021 19:06:06 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id g26sm547019pge.67.2021.04.08.19.06.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 19:06:06 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] mtd: spi-nor: spansion: Add s25hl-t/s25hs-t IDs
 and fixups
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <76a55d9be126067c631065f31e3e970f90b2c080.1616130675.git.Takahiro.Kuwano@infineon.com>
 <aae2c29f-a6bb-18fd-627b-bd11910c2009@microchip.com>
 <bcd8e956-c00e-df74-62ea-9cb746ae24eb@gmail.com>
 <ec9d4e56-8ace-f55d-a999-54a553b903ed@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
Message-ID: <a5ecdaac-3375-a898-59a1-646da26b5afb@gmail.com>
Date: Fri, 9 Apr 2021 11:05:53 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <ec9d4e56-8ace-f55d-a999-54a553b903ed@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_030609_433641_DB63A5C3 
X-CRM114-Status: GOOD (  13.45  )
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

On 4/8/2021 7:03 PM, Tudor.Ambarus@microchip.com wrote:
> On 4/8/21 11:21 AM, Takahiro Kuwano wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> Hi Tudor,
>>
>> On 4/8/2021 2:06 PM, Tudor.Ambarus@microchip.com wrote:
>>> Hi,
>>>
>>> On 3/19/21 8:58 AM, tkuw584924@gmail.com wrote:
>>>> +static int
>>>> +s25hx_t_post_bfpt_fixups(struct spi_nor *nor,
>>>> +                        const struct sfdp_parameter_header *bfpt_header,
>>>> +                        const struct sfdp_bfpt *bfpt,
>>>> +                        struct spi_nor_flash_parameter *params)
>>>> +{
>>>> +       int ret;
>>>> +       u32 addr;
>>>> +       u8 cfr3v;
>>>> +
>>>> +       ret = spi_nor_set_4byte_addr_mode(nor, true);
>>>> +       if (ret)
>>>> +               return ret;
>>>> +       nor->addr_width = 4;
>>>
>>> Takahiro, you are bypassing the core functions. spansion_set_4byte_addr_mode()
>>> will be called at set_4byte_addr_mode() time, resulting in an illegal op?
>>>
>> Since the spansion_post_sfdp_fixups() adds the SNOR_F_4B_OPCODES flag,
>> spansion_set_4byte_addr_mode() is not called actually.
> 
> right. Do we have to undo this somewhere, i.e, call
> spi_nor_set_4byte_addr_mode(nor, false); ?
> 
No. The Read/Write Any Register commands take 3 or 4 byte address depending
on the Flash's current addr mode. Since the spansion_read/write_any_reg()
use nor->addr_width which is always 4, the Flash's addr mode must always be
in 4 byte mode.

>>
>>> Are we safe to modify the core and do the spi_nor_set_addr_width() and
>>> nor->params->set_4byte_addr_mode() before parsing SFDP?
>>>
>> It sounds not safe to me as there are some discussions about addr_width.
> 
> oh, yes, of course, because addr width and 4byte addr mode opcodes are
> discovered when parsing SFDP. I need to drink my coffee before writing
> emails :D.
> 
:)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
