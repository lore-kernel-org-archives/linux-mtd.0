Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BF4C7EE25
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Jun 2023 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wRmYOBsTeFpHr3maG5eK3zW1am4rFlxF7ygIcYoYWp0=; b=SoKSNF5O3SS3xA
	p+lwgENgL9e1+igQYWFKx3zCKT8WdG1H0nIrXkYLMMUkLOUDsYDIvrMJwi+zJrbA5/1H5WTUCf1zF
	GIe4PKu2TWujRCNSfuXIbCf089UdczlibHBM9GTkzcLKB1GJQoXZN8XjQpU9t3Z/tttco63+LxZLV
	CbjGa1DKDbtYqHiaW4u5vngCFcOnmvJSM45lRAXeqdKWt5ttlKXvDcEVER8BBnRoJNANFa+f0Opoy
	pnuxfhg8ZWTynxUpMjcwzr10DCufEjOZrEz0H9nnlziK1no6+osvQziLFXNEYZ1WoVc7X8rDBkOPK
	0/L8NNzO7Iz4w2ULyA3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gQY-003xi4-2u;
	Mon, 12 Jun 2023 12:13:42 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8gQW-003xh6-1j
	for linux-mtd@lists.infradead.org;
	Mon, 12 Jun 2023 12:13:41 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9745baf7c13so627397166b.1
        for <linux-mtd@lists.infradead.org>; Mon, 12 Jun 2023 05:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686572018; x=1689164018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvuqJYDK+dp+3BFz8K+RFWWzcMubzxhseYInEnhEK8E=;
        b=TQB8IX8IssTBDGUFYY/qpGsO906d3NaUn6fESPQqjOUDS2PbAu5wPFg43DTsbuvwPh
         iznjZcRO1yO4CoJEQFDCskku/iEj87Wv1e5e+R0AGBjoKgpLvMPbyD4qJBxXktImTOe/
         9SMfjKeJbAh/Mblm+vNl8D6KRalspUB0EqT8XNm8xOpiVLALlZ1uF6tJBrs9aHMakYmT
         Xp3K5u4E/8SAA2MUsukXZUOgc/FQ8/5S+vo3riiThJHJo+8pS53yY89GKEHt3/+bv4sg
         r+o97Zc2rnZv9wej07EBZnrUPqDgi1uPFhURUlMMqxhJSxgsXYaAJhirFHoB2WL2fF5P
         6kFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686572018; x=1689164018;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvuqJYDK+dp+3BFz8K+RFWWzcMubzxhseYInEnhEK8E=;
        b=PWF3zq/pl3+zORJ8DN3vKbxDvDh31V7/II5iaBflrfZ8kGUMRX7K7ihySiBZFs2gnK
         VUDd4jHi6EFxTR0FGqsYKwQc0j+5L5XK/wydNICnnRW0yvZOspfDFbqU31NZ2hxo7mpi
         cAS2H5+PNMKR/KMNJdYbfYH5YEbwy2wLJgEACotduh+adr9wL1tNCRGjqRg5lmZzEWw+
         RgDT81WHsYs8aAEj35TGgUR6Z4l8pj+LpGxXyKw678efrIyBG+F0iIFhq7IT5dBJ2HlY
         TeDVipwTxICQ/ca/b8EYDWfMiiXECxkYljUba/6kq99EmRx8tEdDShTPDvDxnXqIsYU+
         tCAA==
X-Gm-Message-State: AC+VfDw9A4zoniAKoDmFa9gc9rKiIyUsqyHkfN8k/W5gu7rN7VNO0Umv
	CUIvGSeDaECh0UJgMwJK6A5nUw==
X-Google-Smtp-Source: ACHHUZ73NG4Ytw36QSfmHBAR4luRquku16lv9it8mGuDhNJYRFU29T3giI5huOmYGJPfdE5JaYip1w==
X-Received: by 2002:a17:906:7954:b0:959:18b2:454a with SMTP id l20-20020a170906795400b0095918b2454amr9836184ejo.76.1686572018149;
        Mon, 12 Jun 2023 05:13:38 -0700 (PDT)
Received: from [192.168.2.107] ([79.115.63.153])
        by smtp.gmail.com with ESMTPSA id q13-20020a1709060e4d00b00978886c7cdbsm5057242eji.183.2023.06.12.05.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 05:13:37 -0700 (PDT)
Message-ID: <3f74f8ca-2007-a340-cef9-92fef3a00023@linaro.org>
Date: Mon, 12 Jun 2023 13:13:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 3/5] mtd: spi-nor: spansion: Add MCP support in
 octal_dtr_enable()
Content-Language: en-US
To: tkuw584924@gmail.com, linux-mtd@lists.infradead.org
Cc: pratyush@kernel.org, michael@walle.cc, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, d-gole@ti.com, Bacem.Daassi@infineon.com,
 Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1686557139.git.Takahiro.Kuwano@infineon.com>
 <cac44f4d9ed06e250c2fa8aa900d8de3de4c4337.1686557139.git.Takahiro.Kuwano@infineon.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <cac44f4d9ed06e250c2fa8aa900d8de3de4c4337.1686557139.git.Takahiro.Kuwano@infineon.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_051340_585627_626425F7 
X-CRM114-Status: UNSURE (   9.09  )
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



On 6/12/23 11:04, tkuw584924@gmail.com wrote:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> S28HS02GT is multi-chip package (MCP) device that requires Octal DTR
> configuraion for each die. We can access to configuration registers in each
> die by using params->n_dice and params->vreg_offset[] populated from SFDP.

I wonder if we really need to differentiate between the MCP and single
chip package flashes. Do the single chip flashes that are currently
supported in spansion.c and support Octal DDR define the params->n_dice
and params->vreg_offset[]? Do they have the necessary SFDP tables?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
