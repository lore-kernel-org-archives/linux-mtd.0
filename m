Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA7FCA1005
	for <linux-mtd@archiver.kernel.org>; Tue,  2 Sep 2025 21:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmpRe0GCTYCPtZX7Ki/Go11SZ56EjznBD4a6aJCFe+0=; b=qEKErShSXZ11NJ
	hKUMWZrUzLBpzp0bKsetd6OLBTRblcC231mYyJ2x/WzDEGGw3lX5jSNp/MXUkNnsLX8WQ5yA6c6BM
	cxloH1Wh2o33Okg2Z27Louomo3XkgeTE23vHU3QOFtD4EK93YP6D2XaS1+tY52jk4SAMsdCH3FZx2
	JuA8PlLhZCxP0OwcofZq53DKO+UcyNjiDJFrar3y0dhN41DnUFtIsfBrY8qonpPiQY6QHTGIiezum
	OVXLnzxOm55VwiSQAkHAMxVmF3hdqoHNlg6g78m5QWdodBjMi58TcJVRKM67QQhNF7qTjF4bugfkk
	TLnWHcjtF9cucEHdePdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYpD-00000002EgY-0DMP;
	Tue, 02 Sep 2025 21:45:59 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utVtt-00000001Sq5-23eo
	for linux-mtd@lists.infradead.org;
	Tue, 02 Sep 2025 18:38:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b7d485173so35856295e9.0
        for <linux-mtd@lists.infradead.org>; Tue, 02 Sep 2025 11:38:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756838316; x=1757443116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HtIfgKLp3NVc3pSHlMfWF5VgNgJuRmHDA2CEfhOQ8+E=;
        b=CxuM0IooTmK2SB1SmzGQRYffuDyXgoMXvIpIbSUpVajraf8KUIEJEwqHsYv8cMA/nB
         Scl1YLGxdx7kfF6nes5wkZ9MeqZQXU5e6qmen9KV5LIy7kqgnRMibpBQunQZkSVGHwGw
         0hfTQP6jyVkwFHU0itxVlucdHzwXgxxdvc3NLZC69M9KBD7JYDfUSkU/et/V8/sOemHK
         Ht71h6H6A3pKXQCmu9Z4FrC5LqvC7x3b19yv2TI7qwLp6e7s49+sqQTwFLO2hzMl5Cnx
         cRDVEHyLn78BTJ33u2dYZZ4zLVMqmp9GPW6GPQP1MgnJFfZcTJPYal98uBVGI9Qva2vx
         QbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756838316; x=1757443116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HtIfgKLp3NVc3pSHlMfWF5VgNgJuRmHDA2CEfhOQ8+E=;
        b=ZTr6IYDM842rkfyw9QLh746oJiAnceyk+TWXly7IirRMdORLajNbtbZFjtdCbrGeWS
         4IziPMTT7hPXm6ioxabgqfsHCoVEocZfqWkUgKj//IT3T/4lKSrwTMimvUI7SOGAvAFl
         1y//QntLmjqGHUe7qH4+ZmB7IRdVdgqUSKy9soPLPndeJPb1KVyyVeNaKaGMJ3sjraGS
         r36SPm/SfLHAAgGX7YDDscuq91Qs44deWPE0Bu/90dfqQhcX3pcZDQvMqAX24fkBmYIy
         mkd1Wguj0LiuZpKVqY9GTA/NY3edL9t308u9l88BZU3CgOqHrhrTKHbiG5dIDg3h5hkM
         cayg==
X-Forwarded-Encrypted: i=1; AJvYcCXy5b0+Je5dxPoBkZ+HVmL6qU/S6f4pJALoquAXry4eUZ8kVBX3CAovlP0lIgSArjUTG54RF+GeNiA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/jhGGumKh5YkVm+U6ie0eN2uEXL5oedya44RsusF/FZr5MvSs
	iOAS9nS7i0TpTl2YGejwvED5r7zFSwbyBV5ZLSQjCOngMkDuodtSaOZF
X-Gm-Gg: ASbGncvVsT4g0eFVU6HsSprhBlznpIWWZVs6RVXOqMXgMN0JnNeInzl5wUhsmPUTBzT
	ZpyJTMAFA59Mi0evLe3MP4x5oEADvtgos4f/01zGbCkISeXr8re1tc/RRD2ygyeKBGmSGGGdIDi
	2+o3Fo/lX+DTTEScuuR4UoLRg/I5/FFJdq+H04AXZx1H8TqkHWAir03bFuac3Y2V1hV2PXDN+0b
	OFJLeICdQjqFDW7MirxSoYMF+i1bS/rq0p2k0wVMxNN9QuhjV/rIkkErpLU51rGRHU9HAtzz7fd
	fVTdpYaOlNMoCJRMzQud5Rubg5szG9DdQWhMR3nQMl6+w4XPNeVW8LuevWiQwdy7JXkKdjnNUtH
	JRFpePCPQSHyigRkR181GebBUJiXIDNIQdZMQ6g==
X-Google-Smtp-Source: AGHT+IFZOtGXHRvSGQGMQlxqtMFkysWL1TKTqsEmVYhRZ84LZTFvZGmQrrRX0tM8g8SIZ1TNTU5eUQ==
X-Received: by 2002:a05:600c:46c3:b0:458:c059:7db1 with SMTP id 5b1f17b1804b1-45b8557f254mr116499635e9.30.1756838315255;
        Tue, 02 Sep 2025 11:38:35 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.80.80])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b85090262sm157641835e9.17.2025.09.02.11.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 11:38:34 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	flaviu.nistor@gmail.com
Subject: Re: [PATCH] mtd: spi-nor: issi: Add support for is25wx01g
Date: Tue,  2 Sep 2025 21:38:18 +0300
Message-ID: <20250902183818.17415-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <mafs0cy8aw0yf.fsf@kernel.org>
References: <mafs0cy8aw0yf.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_113837_529411_9D1B2CC1 
X-CRM114-Status: GOOD (  16.44  )
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

> Hi Flaviu,
>
> On Mon, Sep 01 2025, Flaviu Nistor wrote:
>
>> Add support for the IS25WX01G 128MB (1Gb) ISSI Serial Flash Memory.
>>
>> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
>> ---
>>  drivers/mtd/spi-nor/issi.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
>> index 18d9a00aa22e..e4997f9bd557 100644
>> --- a/drivers/mtd/spi-nor/issi.c
>> +++ b/drivers/mtd/spi-nor/issi.c
>> @@ -126,6 +126,9 @@ static const struct flash_info issi_nor_parts[] = {
>>  		.flags = SPI_NOR_QUAD_PP,
>>  		.fixups = &is25lp256_fixups,
>>  		.fixup_flags = SPI_NOR_4B_OPCODES,
>> +	}, {
>> +		/* IS25WX01G */
>> +		.id = SNOR_ID(0x9d, 0x5b, 0x1b),
>
> It seems the flash needs no special configuration. IIUC it can be driven
> entirely based on SFDP data. In that case, I don't think there is a need
> for an entry at all. The generic SFDP-based driver should already be
> enough for your flash. Just add a "jedec,spi-nor" node to your DT and it
> should work.

Thanks for the review and the explanation. I now see in
the core driver that spi_nor_check_sfdp_signature() is
used if spi_nor_match_id() does not find a valid entry.

>
>>  	}
>>  };

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
