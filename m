Return-Path: <SRS0=4hvs=RW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A7DBC43381
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 07:14:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32F3120872
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Mar 2019 07:14:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e+9SfXm2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=norrbonn-se.20150623.gappssmtp.com header.i=@norrbonn-se.20150623.gappssmtp.com header.b="mMLLWG9K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32F3120872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=norrbonn.se
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4QOTHFRfCFu8irBDz+K6HckTIVvKGNr7FLFHU+6ZJc4=; b=e+9SfXm2skQ+KTNUl0yPjFccb
	gyi74FP+qKRMNuyLFcWz0v89Po3i1T3LNFxV/iDAsM0PgHQ5UUFpo7irdOlLHbOvyltNrrzn0RMdu
	p/TF89zYUw7Psdsu8Pr7jjrZKUvuLyXdT2iprbiwbmsJWStQ8IQM+9P+NRj1vZg4kbXJynMfDJQOH
	gGOWFI+QlAXnFQFNG2T2oJ1R9VjfDNjpoE9GJa1jL5Cv4s3XkQ7VD1MDmFV+zQ6cCcGvyC1Md9a3S
	81BYxZAlgtTujW+FYDYJCYoCOeZ8LcvVDij7J+wbqU3FGaTBLg8v7ZpKxqls/eguezPiMzrLtf2E/
	zQUn1nAqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h68wm-0007qf-1A; Tue, 19 Mar 2019 07:14:04 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h68wh-0007q4-Us
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2019 07:14:02 +0000
Received: by mail-lj1-x241.google.com with SMTP id f23so2455737ljc.0
 for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2019 00:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=norrbonn-se.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xldg6TEiNplFyKLGiFHLDg2kWkWV4bwA9hjFfdn5uoc=;
 b=mMLLWG9K/5LMyigrfIwJOLncPCINcAW2B3eO6U0+m1YZpVy9PqMcvdJkfarbP+ZSi+
 QZuxrKTPVQL/hiT4ummUrN45gkkTQz8YyHSoVW6kmpz6vfZB+yxwWJ0F7t7lkhVDqB9z
 3bOH0gGIlKR0vfhvGPCqlPJIb8kmE3uZJigf0SURZ3A4N0CR+FdPVObdGQOBMT3xgPkz
 ILuMwh0ppffc9d3DQk9+sjY/w1w6hIHFylUijUv16VrOSjpCu8Uos25AJwmK/WBt8Hrk
 Fl0sa3IOxRckVHtBDLPgLwluB/RBV2BIdFzX0kwxMuPgYsIXhrHSH9+OEp9aKhiH3G66
 ag7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xldg6TEiNplFyKLGiFHLDg2kWkWV4bwA9hjFfdn5uoc=;
 b=YncBB9mzrHm+mbF9FJJ94DB2Dx2F3WtkdbuP0XsFqp8tZZejRtZu7J0gNHV5Ppq9vA
 AJ6VqbDwNAeA+yfSLyWhhMlmIe/GuhdeAiKgiFy9+ZhVRfMgog1ExnFCDWBzCLhE6iQa
 SBUADS9HxK42NKmOZh+ikTkYGHLKPDqQSivZFNZzb1Z2Q0TB84QHbfWdlpo8aZtoGl4A
 9Sfd6NKN2QY6PcdEUvx7hLX8VqIrttehEiQ6a1GMaSjJvfZHGD4WOe3Yr2uadcVedkLh
 /ISw60GG+HavBo50WkGgntC4uFn/ddqZrmJeCDPG1bbHSqh/Xydkcx9zpBUwZGuM1UTP
 ZxiA==
X-Gm-Message-State: APjAAAVPVtKhG32sgcrYImD2L3NZw+3ZV7CTpYj/wcK55hjNlkxKoNuP
 oU55qK3MtzxjR8T1lSoQN/FHSA==
X-Google-Smtp-Source: APXvYqyJLspUqJtEl3KP2k7lRnxAOsZUc9l1BR/DzlvlYZhyVeFbgIWzwRisVPUxMqDbVEG3alfFhw==
X-Received: by 2002:a2e:680e:: with SMTP id c14mr13097998lja.51.1552979636885; 
 Tue, 19 Mar 2019 00:13:56 -0700 (PDT)
Received: from [192.168.1.169] (h-29-16.A159.priv.bahnhof.se. [79.136.29.16])
 by smtp.gmail.com with ESMTPSA id
 187sm1240747ljj.46.2019.03.19.00.13.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 00:13:56 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
To: Tudor.Ambarus@microchip.com, Yong.Qin@cypress.com,
 James.Tomasetta@cypress.com
References: <20190129220705.5143-1-jonas@norrbonn.se>
 <20190129220705.5143-2-jonas@norrbonn.se>
 <db7aef53-43bc-2c14-12bc-2f0d452b4bc8@microchip.com>
 <cb41d4e3-d300-89da-3378-6305699d610c@norrbonn.se>
 <6e20b1c1-4eaf-bdcc-aec4-59dcbe2a8a34@microchip.com>
 <BYAPR06MB5893F6DEA9B0965E234983CD8F480@BYAPR06MB5893.namprd06.prod.outlook.com>
 <4ddb8f33-93b1-9aa4-3fdd-c60cfa1d1d7d@microchip.com>
 <BYAPR06MB58937598257ADB18DAF344C38F490@BYAPR06MB5893.namprd06.prod.outlook.com>
 <41859b7a-98ad-fc6d-242e-6e9ab810e038@microchip.com>
From: Jonas Bonn <jonas@norrbonn.se>
Message-ID: <9fcc328f-ae13-a294-a56c-0b5a6247b26a@norrbonn.se>
Date: Tue, 19 Mar 2019 08:13:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <41859b7a-98ad-fc6d-242e-6e9ab810e038@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_001400_133684_6F9BB699 
X-CRM114-Status: GOOD (  22.23  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: bbrezillon@kernel.org, richard@nod.at, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 19/03/2019 07:59, Tudor.Ambarus@microchip.com wrote:
> Jonas, Yong,
> 
> On 03/12/2019 09:27 PM, Yong Qin wrote:
>> Hi Tudor,
>>
>> Good question.
>>
>> The WP# function is not available when the Quad mode is enabled (CR[1]=1). The WP# function is replaced by IO2 for input and output during Quad mode. With that said, if CR[1] is set to 1 (Quad mode enabled), the registers will not be protected.
>>
>> Technically default SRWD bit can be set as either 0 or 1. However, as most customers (applications) don't use this feature to protect registers, the default SRWD bit set to 0 might be a better choice, and reserve the option to change to 1 for the applications do need this feature.
> 
> I think I found the reason why SRWD bit is configurable, and disabled by
> default: => to allow the installation of the flash in a system with a grounded
> WP# pin while still enabling write to the BP bits.

I think this is bogus.  Why would you ground the SRWD pin?  That's a 
design error.

/Jonas

> 
> Jonas, Yong, what do you think?
> 
> Cheers,
> ta
> 
>>
>> Thanks,
>> Yong
>>
>> -----Original Message-----
>> From: Tudor.Ambarus@microchip.com <Tudor.Ambarus@microchip.com>
>> Sent: Tuesday, March 12, 2019 5:30 AM
>> To: Yong Qin <Yong.Qin@cypress.com>; jonas@norrbonn.se; James Tomasetta <James.Tomasetta@cypress.com>
>> Cc: linux-mtd@lists.infradead.org; bbrezillon@kernel.org; richard@nod.at; marek.vasut@gmail.com; computersforpeace@gmail.com; dwmw2@infradead.org
>> Subject: Re: [PATCH v2 1/3] mtd: spi-nor: always respect write-protect input
>>
>> Hi, Yong,
>>
>> Thank you for the explanation. There are still few things to clarify.
>>
>> On 03/11/2019 10:14 PM, Yong Qin wrote:
>>> SRWD bit (along with WP#) provides a way to protect Status and Configuration Registers from been modified unintendedly or by a malicious actor.
>>>
>>> By default, SRWD bit is 0, which means no protection on registers alternations. Registers can be modified easily by WRR command. (this is most of the application use cases).
>>>
>>> If set SRWD bit to 1, then when WP# is driven low during WRR command, WRR command will be ignored and Registers can't be modified. This provides a way to protect Registers, meanwhile still reserve the capability to modify Registers when necessary by driving WP# to high during WRR command.
>>
>> Does the SRWD bit protect the Status and Configuration Register bits even when in Quad Mode? WP# function is not available in Quad mode. How can one release this protection when in Quad Mode and SRWD set to 1?
>>
>> If SRWD bit is ignored in Quad Mode, then why didn't Cypress enable Status and Configuration Register bits protection by default? I.e., remove SRWD bit from SR1, make BIT(7) a NOP, and consider the Status and Configuration Register bits protection enabled by default when not in Quad Mode.
>>
>> Cheers,
>> ta
>>
>> This message and any attachments may contain confidential information from Cypress or its subsidiaries. If it has been received in error, please advise the sender and immediately delete this message.
>>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
