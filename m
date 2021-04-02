Return-Path: <SRS0=9wI6=I7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB6BC433ED
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 07:14:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E4D610E7
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Apr 2021 07:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E4D610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:
	Cc:To:Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4ppiCYA2x76jAqKjOF1UXAu6pc33af15e6syuQzxxJU=; b=NQ/Bu+veD6k6+7DDYNT8cfyRi
	XPZXQhGJrxL2VcDtDmlvq8PPUAti1qalyY3cBZI8K1E0A8+NVa084NBiOEu7W/dgvBW4Hyn7R/3AR
	vu+jdMhUmJi5bkMBeIjWfRF8cCyvCW5Ksj2iAVE67NDjRyoKDgEARuxefi0o+10sRSIP6zBC6iqKR
	2+mb/nmiGQOCgF43ZnT37oSJLk3DZuaajndxfTpULSUUBOjA93kqyc73S+Ecwu2VxRTAtJ7IYDwXB
	vH0YjV28J5Sp2YIVKMSr8EMSNWhcqbpFY4zJnvRbLbsGM+JOqCRgQMt3EzZHBSz0i+r8rWJQUVDq+
	5z6IxT+qA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lSE0B-00CBPR-EJ; Fri, 02 Apr 2021 07:13:55 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lSE06-00CBOl-97
 for linux-mtd@lists.infradead.org; Fri, 02 Apr 2021 07:13:52 +0000
Received: by mail-pl1-x62a.google.com with SMTP id y2so2158112plg.5
 for <linux-mtd@lists.infradead.org>; Fri, 02 Apr 2021 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cWS70xvkSyW7S/sD0/DSRbtT9gX+jEgnyfKeJJIEDpA=;
 b=oDmTJKmB+BdO1k3uoFAXr9Q30YHl+lLqMT+WJ5pH39o0n0V3AMCzxBgC3Mau8RRxSo
 l6avN+L/+bJmNLcyKqIIsX+tZiFkDhTzcLNq2FA7MVmN1CB/7gt+4rj0gr6h2UF9gvjh
 vigeVju8sJ6/p43+50zk+YF7G0Dmqj4Y0DR5iHFAfvpgYlTswafjtIiHdBv/u2r5el1u
 sip0SHT/l+AYadzfXrfjB/S02c91OZ/TrE++i9u3hDxtQdnRxTTZNUOvhF0A6cETx0xm
 Gt3cdHcoKzPF6L725WKXYd9i+km4FxRWCznQcUclIfLUes3rSfHclYIEI5ZS9RxbS4/j
 gfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cWS70xvkSyW7S/sD0/DSRbtT9gX+jEgnyfKeJJIEDpA=;
 b=h/KHFiwTd6Rif7uGZ3ZfuAkrs+7lU5kufFCGUbkLWuM1YsFTzDByzOiZpaL64PucgH
 ii+xE8n56rN0melUplX98Qp3XrV5A89P6T6Vg6DOSY0imrPrvEIANseQsm0LtK0/z2O7
 Ix+6VqvpbHdC26gRYfIxyZG3RqqEWKbzR3gvjMBzCTPp71HJR3xXpTqjsQ7mqy+R6IOt
 Tu/9+KJgETGv25hIzuzBzR17PD5tIRRTA1m4PpDgGYJy1dwn0bdVKB3LUWLja5QzjkPa
 3FEJLtJDUx67MIirwY43kyptzxV/OKsrSkawxq7bbFyRF06YNSvuNhqpicqWW9nZKMyR
 1QJQ==
X-Gm-Message-State: AOAM532H7a9iByEDHO9pAwhZrQxx5bUWcP2yetx+Bkie8aWYxcIVI6xL
 5Wzti4t7bHCWHuYY8PTcJ5U=
X-Google-Smtp-Source: ABdhPJyMXchi4TZKlOQDwsIEeK2tE/nkGlwz39zaknX5k2mDPq3kTNKJxseQjsNvfxhCSsvLJwieFg==
X-Received: by 2002:a17:90a:db01:: with SMTP id
 g1mr12724832pjv.127.1617347628065; 
 Fri, 02 Apr 2021 00:13:48 -0700 (PDT)
Received: from [192.168.210.40] (zz20174137476F6254EB.userreverse.dion.ne.jp.
 [111.98.84.235])
 by smtp.gmail.com with ESMTPSA id e6sm800106pgm.92.2021.04.02.00.13.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 00:13:47 -0700 (PDT)
From: Takahiro Kuwano <tkuw584924@gmail.com>
Subject: Re: [PATCH v4 0/6] mtd: spi-nor: Add support for Cypress
 s25hl-t/s25hs-t
To: Tudor.Ambarus@microchip.com, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 p.yadav@ti.com, Bacem.Daassi@infineon.com, Takahiro.Kuwano@infineon.com
References: <cover.1616130675.git.Takahiro.Kuwano@infineon.com>
 <561ec6a4-5e64-8a82-043e-9e825aa00a3f@microchip.com>
Message-ID: <50b9d6c9-c501-bc08-7f39-5e49b9e76782@gmail.com>
Date: Fri, 2 Apr 2021 16:13:32 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <561ec6a4-5e64-8a82-043e-9e825aa00a3f@microchip.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210402_081350_517851_F91EFB33 
X-CRM114-Status: GOOD (  14.55  )
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

Hi Tudor,

On 4/1/2021 3:09 PM, Tudor.Ambarus@microchip.com wrote:
> Hi,
> 
> On 3/19/21 8:51 AM, tkuw584924@gmail.com wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
>>
>> The S25HL-T/S25HS-T family is the Cypress Semper Flash with Quad SPI.
>>
>> The summary datasheets can be found in the following links.
>> https://www.cypress.com/file/424146/download (256Mb/512Mb/1Gb, single die)
>> https://www.cypress.com/file/499246/download (2Gb/4Gb, dual/quad die)
>>
>> The full version can be found in the following links (registration
>> required).
>> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-Semper-Flash-with-Quad-SPI/ta-p/260789?attachment-id=19522
>> https://community.cypress.com/t5/Semper-Flash-Access-Program/Datasheet-2Gb-MCP-Semper-Flash-with-Quad-SPI/ta-p/260823?attachment-id=29503
> 
> Takahiro, looks like I can't access the dual/quad die full datasheet, not enough rights,
> even after creating an account.
> 
My colleague helped on this. I hope you could access the datasheet.

> How are multi die ops handled when crossing a die boundary?
> 
The existing erase/write ops are done by sector/page size alignment and
never cross a die boundary. The read ops does not care about die boundary
but still works because the Semper dual/quad die parts continue to output
data from next die when crossing a die boundary.

>>
>> Tested on Xilinx Zynq-7000 FPGA board.
> 
> Have you tried to erase/read/write multiple dies with a single request?
> 
Yes, I did 'mtd_debug erase/write/read' with address ranges that involve
two dies. You can find errata info in the datasheet about cross-die read.
My test does not cover the trigger condition of the failure actually.
I will submit another patch that work around the issue as needed.

Best Regards,
Takahiro

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
