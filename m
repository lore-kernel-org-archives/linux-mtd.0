Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B69EC433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 10:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bq65UUhzujS3zTPxLN6oqsiS2QtR+VGqlg6htHwKK7c=; b=3TcFPy9hs/1Ynt
	qgNeXJDJrNCke3Qau2XLL5ut1Mwq1dPE3/gw9CnfwC9ub84j3KXusyh8ZMgvo3BM5fgMOAPktAXBj
	M4QqF72mDT0VPbofXsv15RUxgBrgxGftnDj/+w4GvRIxgHvvZEgao6y+m17bxKduUdGvJCwyMxjSk
	HhMcUjUlhUDjJygjqkeNnU55BV4oGc5g53qKYV/hlIRVtFIsZDYSIXH9czaZFB1qBD47ZmUc/Ww+/
	9VZ4VxWyyzq4Z7LpArcXBp6Tfn9tsB6MKVQCkNUW1319E4lQsIPawBZCG10ICTRnfJY+3ZXn0XalB
	hIuz2rAVYARopva/2pow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzFy4-001fPQ-B9; Mon, 20 Dec 2021 10:32:32 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzFy0-001fMr-U2
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 10:32:30 +0000
Received: by mail-pl1-x631.google.com with SMTP id n16so6989834plc.2
 for <linux-mtd@lists.infradead.org>; Mon, 20 Dec 2021 02:32:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=iUMs/OE1MY8fxNBJHXurX21ROoC2ObIFuVOynj9oSiQ=;
 b=UTct1/MEkPzHrsIfIaV0FflCTG3m8Etq58BD9iyg/XMatBVg1sUmzFWA3HtlGoWk7X
 yknMBYK02C2X/Op8NrwA10gUGB9Dr99JrdYPVgtOhIkiSPcpUhpGnMlPcsx4H5FGpFey
 mB/MW4D/rJTSaN9njPNlkOzr4DD9kakNs52jtUN1+CE20a+NFaDhx7pZoYT8NRwbOPRr
 S8q950iZ8sB5S7ibmlnZrvgnFzh5PwByrFE6NK0XwyCjtsjGFgzNQYgSK3sa0Cp8p2g2
 7Kjb1FUPxrESgtYt/u78YHtShVWjVmlnnWXO6H4cxtKAUEagRhf369yrZIG0XKv9fMC3
 wA7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=iUMs/OE1MY8fxNBJHXurX21ROoC2ObIFuVOynj9oSiQ=;
 b=7MQCYOprpl5XVUlCMXTzUDFApTwGBl0OMOKSGc9UeOFSe9AROLWwxLT5kAy6oL7Ymb
 QhkwzoPORZvZhE3LWPEwwX4yG23MaUQ8wf8bIabbHRceheu4IvFqGDqtPgKwjx27aFHI
 TKvAELkOg+37Khlt5LkCs/AGCpQ6Ke6R48Itai7eRxEIzOqt2wCXAplZNYjQZwF7zPy8
 +BWWD+ZnE1DfNwTLCQyYFFJdFGZuVEWbAhqYtEYe1jhSvJasgn28T3r3Giu9GQdLyHX5
 6w0GcYcCt8YjZ6+HmrtYHsL+Sz6sRSPSnl3FqiuoiwjFZO0YZRCJq9+trkUrhFs0Zzql
 wg0A==
X-Gm-Message-State: AOAM530ss++eKTKOsGU3cfecesW7OkAqTZHsPKvedWpviTJjkzj7McmM
 m47S2SPqHUWsDRGXCoQ+f2c=
X-Google-Smtp-Source: ABdhPJwtfXigdvVW4IqjnZzwHF5iThGGhOM8T5a6xtK29zDt1c5NtuYJD9KdbVcDwFZdbeZ7kyZ3gg==
X-Received: by 2002:a17:90b:1d90:: with SMTP id
 pf16mr27370540pjb.93.1639996340915; 
 Mon, 20 Dec 2021 02:32:20 -0800 (PST)
Received: from [192.168.1.3] (fp76ee264d.knge102.ap.nuro.jp. [118.238.38.77])
 by smtp.gmail.com with ESMTPSA id
 g13sm16591704pjc.39.2021.12.20.02.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Dec 2021 02:32:20 -0800 (PST)
Message-ID: <d40c879c-c419-82c4-c385-0a03e105a622@gmail.com>
Date: Mon, 20 Dec 2021 19:32:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: How does an SPI NOR handle a single byte write in Octal DTR mode?
Content-Language: en-US
To: Tudor.Ambarus@microchip.com, Takahiro.Kuwano@infineon.com,
 juliensu@mxic.com.tw, jaimeliao@mxic.com.tw, Bacem.Daassi@infineon.com,
 beanhuo@micron.com, shiva.linuxworks@gmail.com, sshivamurthy@micron.com
Cc: michael@walle.cc, p.yadav@ti.com, linux-mtd@lists.infradead.org
References: <f593ded7-6cb1-7645-a0b4-dc20b5576d1d@microchip.com>
From: Takahiro Kuwano <tkuw584924@gmail.com>
In-Reply-To: <f593ded7-6cb1-7645-a0b4-dc20b5576d1d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_023229_015772_66C2BD73 
X-CRM114-Status: GOOD (  11.19  )
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

In case of Infineon(Cypress) S28 devices, it can be done by de-asserting
chip select before clock falling (not sure typical controllers support this).
That means the device can take odd address in 8D-8D-8D mode.

Thanks,
Takahiro

On 12/20/2021 6:36 PM, Tudor.Ambarus@microchip.com wrote:
> Hello,
> 
> We're trying to understand how flashes handle single byte writes in
> Octal DTR mode, and since we haven't found this info in the datasheets
> that we read, you're our only hope. Can you shed some light and let us
> now:
> 1/  Do the flashes ignore the second byte in Octal DTR mode? Are we forced
> to first read the byte that we want to update together with the second byte,
> so that when writing in Octal DTR mode to write the 2nd byte that we've just
> read, so that we don't change its value?
> 2/ Can reads or writes start at an odd address in 8D-8D-8D mode? Pratyush
> proposed something at:
> https://patchwork.ozlabs.org/project/linux-mtd/list/?series=246518
> Are the assumptions correct in the patch set?
> 
> Feel free to forward this to anyone interested. Thanks.
> ta
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
