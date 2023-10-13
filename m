Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2E8CDB47E
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Oct 2023 08:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EK3msnmhP3VJQui9k9cJr7+Fkz27so6te4bfvc/0ZEI=; b=pdWk3inS501Cy7AJgp/uejcqJn
	FN8MOWgxFud0OinL34RamyxArNv/2PqJj1Nn/uJCMiCczJCAgIurLb1VkD2SvcQQmSc4snWqTU61n
	PihO3kT6jy33DYQpDnrvQdjSO3WaEk7X0/hWUZFCJYHsVflojqDhp/HWCr2A2DRRWN2uXW1wqUFip
	Q9ie73gz0d908NmDYIY1pbZ0MEIhIGoPXHZPOd0RqY6iq2RbAjPoIZ7Q7e+HEBPvzx064PG8wsME8
	/RuZwubumIGwQrzRbtaobpM56gMXtigbaz6o0kITGXpDVvOln9MrX7PfOKiQEJeVPb1esScOHyAEh
	5/hF1sVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrDC4-002mtW-1N;
	Fri, 13 Oct 2023 08:06:48 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrDC0-002mso-0N
	for linux-mtd@lists.infradead.org;
	Fri, 13 Oct 2023 08:06:45 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 7BAA2A55;
	Fri, 13 Oct 2023 10:06:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1697184398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VJsgeF+AvnMMxwurqQkL1tA1Qkpzq5o+y3Vn4KqwoGg=;
	b=hd3Kljog8bJJ3SnaVGnm1MFYEXTXSLqoiUmyrhTDY83OKccbFFMeXNIBTcjYKnxBVW5VtC
	Jm89WCmgn/Lk4sjotxAzPkjEJ7quLF6hehZ9UOaqbMcboogC8/qRW6G7aomTiIDpp1i7gB
	SCA5cv4Fsl5zGpsaukMMEoXbCJ2w4qawA0e/X4EiXDfL3+Gje3dPi0Aa7v9YfslLqFJ4UA
	dL5V0EImtYuDAhXbs/E4LpZUZTo+p7ZlIVWqcxqP9NJFgzAOGHQ02PuzCGjAaqUIjl+Wdo
	btERmJ5O8SHXRXX4u1ATFaUpg++Ei1f9qZSGD0IhpwiePx6i1Deo8LPBf3gF2w==
MIME-Version: 1.0
Date: Fri, 13 Oct 2023 10:06:38 +0200
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Pratyush Yadav
 <pratyush@kernel.org>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH v4 1/6] mtd: spi-nor: Add manufacturer read id function
In-Reply-To: <CAAQoYRn51R3Ok1KEbdRVvwEoU+A4DEK8h2f7jCvn-cotmzFx8A@mail.gmail.com>
References: <20230908064304.27757-1-jaimeliao.tw@gmail.com>
 <20230908064304.27757-2-jaimeliao.tw@gmail.com>
 <b998ea18-8ce9-83b0-f42f-18e5ea08175b@linaro.org>
 <mafs034yppc28.fsf@kernel.org> <f60995d3d02d7639204c2c16abf9bfd7@walle.cc>
 <54e5662f-baf4-4660-9fc4-7959d2405120@linaro.org>
 <29bb3d952b9f49961da5e01cf86f9c4f@walle.cc>
 <b705c36c-1d76-45a4-ab8e-dacdcb844509@linaro.org>
 <cdd8fb4d9261892345588388a5de262f@walle.cc>
 <CAAQoYRn9C2biQXfcJYK3SKQcGVZc3ibvP6q5pbk8v78CS+gWVA@mail.gmail.com>
 <5fcf12b6fdb2afbeb6fd1f0c22e691c7@walle.cc>
 <CAAQoYRn51R3Ok1KEbdRVvwEoU+A4DEK8h2f7jCvn-cotmzFx8A@mail.gmail.com>
Message-ID: <8ec055f3a5bb69e6d72d4f4c5c7946bf@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_010644_307347_2F436D3D 
X-CRM114-Status: UNSURE (   9.59  )
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

>> > After checking with Macronix designer, a-a-b-b-c-c is the data
>> > arrangement for
>> > read id operation of flash in 8D-8D-8D.
>> 
>> Could you please point to any specification? I doubt there is one
>> and every vendor will do it slightly differently. I mean we already
>> have some flashes which (apparently) reply to RDID in 8d8d8d.
>> 
>> For example, see the Semper flash datasheet:
>> https://www.infineon.com/dgdl/Infineon-S28HS256T_S28HS512T_S28HS01GT_S28HL256T_S28HL512T_S28HL01GT_256-Mb_(32-MB)_512-Mb_(64-MB)_1-Gb_(128-MB)_HS-T_(1.8-V)_HL-T_(3.0-V)_Semper_Flash_with_Octal_Interface-DataSheet-v03_00-EN.pdf?fileId=8ac78c8c7d0d8da4017d0ee6bca96f97&da=t
>> 
>> Have a look at Table 78 (or search for RDIDN_4_0) and Figure 28.
> For Figure 28 in this datasheet, I think it means that data latch
> while DS raising and falling edge.
> The data arrangement of read id follow the 9.2(Manufacturer and Device 
> ID).
> As below are the data arrangement for vendors.
> For Infineon, a-b-c-d-e-f
> For Micron, a-b-c-d-e-f
> For Macronix, a-a-b-b-c-c

So there is no standard among vendors, infineon as well as micron is
using 8d8d8d and macronix is using 8d8d8s. And - please correct me if
I'm wrong - the data strobe signal is optional.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
