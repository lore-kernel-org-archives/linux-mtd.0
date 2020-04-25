Return-Path: <SRS0=IAjr=6J=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A96CC55185
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 09:40:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 623CA20714
	for <linux-mtd@archiver.kernel.org>; Sat, 25 Apr 2020 09:40:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ksXIqig0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="Go0nlJqH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 623CA20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sHUBmWr0Mcf79OURxM1/szu8mu8N531hEHFEI2+O4BA=; b=ksXIqig0NMpfrWq9LKRMDhw2E
	iKtiRvfcMeg50l2zMTzDgd4Vo39xbtrly7ib6h+AUAy8hQIFqrJe1E4pPSaci6mV3n+fS/qIObIOC
	aU1XbSICjYIlJe8QS0a5BP1YiYIrHvS5fO+dPRV3Wp+c9Dl6Ms5JHBzuD9RD8O6JxNo+FifrIgwCv
	KwFz2xL/nbWDFxaQ8WVSlJNb62LQgG2BUXG1GAwFhy2/7YyuzkQ98YHNNzC6zBigOesRm89+mfIzQ
	FXNxXFh6EH3sS0a7+ku8RT2weaD0nBrIdIBJt+8ZOsToISxIZhnclibng2gU4QVYOovHKA852DsES
	eW6oTLtRA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSHIO-0002e0-Ms; Sat, 25 Apr 2020 09:40:24 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSHIL-0002dB-0G
 for linux-mtd@lists.infradead.org; Sat, 25 Apr 2020 09:40:22 +0000
Received: by mail-lf1-x141.google.com with SMTP id w145so9760906lff.3
 for <linux-mtd@lists.infradead.org>; Sat, 25 Apr 2020 02:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XXLMhjR9CllxCwfxt59gj/WJpVeUwfWLZokasQqQa4E=;
 b=Go0nlJqHEu0fD9w/PFJAFszOq74RMGtxkitnptd118EVyv90ax1rCehQE/cgUhTBm8
 EJrQH/azNWv3Gw1wsJcpotNFD8+w1phTCqcgnxgCRgES6XMHdRop/1b0rmgz0LN6q9fy
 GI6RKlhdXSQk4Gcqk/yAnYkbU/W4y1q9XaZaOA389OoZ3zP1g6yThygUtxuFTEmJ+WAN
 kpbc+SSxKhB4mTDQqLbr/NaYXjzbGSMhe+RTL177sqSKbvVPzAHDKf7+oqeiSQ40XveL
 mF5TvA+GbXyEnU3jkqfUF2g3nu88158ZhSfU57ZHuKggp92OR6n4ip70JRq4gH/wURpf
 dyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XXLMhjR9CllxCwfxt59gj/WJpVeUwfWLZokasQqQa4E=;
 b=FA5ruXbloZp6jieerEPKO1KeA5Qgx1MAuO+7tXkv40isawCZw6dTTAmZvbANfz/5RL
 PQHE1qhrFsGsbmNB/s746QtHfc/zH3KnqF+m4d2SH305BUWeXpEIDnJy0zgQBfhI+fwD
 HBtI64coQIbT0YiefcfsZS/+/UTQnMglWirvlXJH+fl7PDyytLjblhyOIAvK2kTNlpJi
 jBfrRU0Yu+GSJlm3Qt/jjvZPRK43ZhxEnYpFIAzm56+N0TCl9+YJG2uPJdMc6w4p0lg/
 4DrM2CzYm875AW7TCDHW0JGAwHhLNF+bH3/wl9i75BA4EkwWh/2ysFvryorrZ3MHHdhd
 1O3Q==
X-Gm-Message-State: AGi0Puaym98ym/MSbwMnCebxGIc7Iqv/GwfUqABNvrnVBmZ1v/1dKofK
 1XO8Y3bhYmtY9fFb92vSI2vMuyoJA6jv1A==
X-Google-Smtp-Source: APiQypKf+baUR2odRGq1HGoS43RU/1OD01UGOiWsfTw2UEuA2yGVKOq5MVdxLzR3tGANcxBadZ5bFQ==
X-Received: by 2002:ac2:48b1:: with SMTP id u17mr8976036lfg.187.1587807618447; 
 Sat, 25 Apr 2020 02:40:18 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4665:495f:803b:99db:9ef7:e977?
 ([2a00:1fa0:4665:495f:803b:99db:9ef7:e977])
 by smtp.gmail.com with ESMTPSA id m13sm6432656lfk.12.2020.04.25.02.40.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 25 Apr 2020 02:40:17 -0700 (PDT)
Subject: Re: [PATCH v2 2/9] mtd: rawnand: timings: Fix default tR_max and
 tCCS_min timings
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
References: <20200424164042.26572-1-miquel.raynal@bootlin.com>
 <20200424164042.26572-3-miquel.raynal@bootlin.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <53e0aaf1-f522-1e71-58c3-d007a8cd19fb@cogentembedded.com>
Date: Sat, 25 Apr 2020 12:40:02 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424164042.26572-3-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200425_024021_197929_5406143F 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 24.04.2020 19:40, Miquel Raynal wrote:

> tR and TCCS are currently wrongly expressed in femto seconds, while we

    tCCS? Femtoseconds?

> expect these values to be expressed in picoseconds. Set right
> hardcoded values.
> 
> Fixes: 6a943386ee36 mtd: rawnand: add default values for dynamic timings
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
