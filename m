Return-Path: <SRS0=BWs3=QP=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA6EC169C4
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E9C2081B
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Feb 2019 18:46:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pTBUajZK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3e4H6un"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E9C2081B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BdOrYpTeBSZtcT/SC+Cxk05PaipoP53agWW8W14bpA=; b=pTBUajZKviQunI
	pOY4O+mJTlfLRpFgmwjGFqXDVfJf+b60RZebNHjL1dfc0XOlk0ZhjO8rMhrA71SDI06g86+4NmZqf
	9/EN1l4jEOgn4ap5llCmaPnmFt3hs6b2K0syJfRteJNRRHDIoWN1VClz9Fqs+i1k0Nk5mNgY0nBP2
	tCztrvfWNIOt8AprJrMJXJm284+mPJ0AdR9kbipbpFChXt2VUgq7SK6gFM+x0ZYHicA6Krrnpp5BM
	A+imsHlUaj4pD42kasWKTNmzr1Zi0TXYm3pSwfpBM/EEvWJcSWGWNYk88ud1juetbIa1i8+hcFaVQ
	WP7vVuA0Xrkz/ulnP6SQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gsBAW-0003gb-Cu; Fri, 08 Feb 2019 18:46:32 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gsBAU-0003gK-1f
 for linux-mtd@lists.infradead.org; Fri, 08 Feb 2019 18:46:31 +0000
Received: by mail-wm1-x343.google.com with SMTP id v26so4735671wmh.3
 for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2019 10:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tkvry6DhbzfjyBca+lSPtgCkSaDPcnAkTuoWxDH6XYw=;
 b=Z3e4H6unAQw+B3d197hzsZRn7vAaX+FZUvva8drgLh/YZBVcIC6wF1cNu53U1HlZP1
 a6Re7OXV7gjgdk/rAHRSSPLEILXPbBFCHJKEo+gHnO3MJsnOQNQEqQxEesk98d4+5Cxg
 VdgU5ivzrh8YU3IOXPUd2vOlrXyY/vY1bg9JxzX1RqHQA005Xq86IcuxJe3CVvlMs21w
 qqQEcijTld6BLFKxWonX0sk3tYks1XoS+xteV93GnUvOYTzEPb50SUdA5CP+b8CRgWT9
 B6/b9rgus6iyvRAmS2hwMrDyGscXj4kMd9uRnC0kLApt7TT+74BWhjjGsXBIJ7Gw+9qj
 Mamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tkvry6DhbzfjyBca+lSPtgCkSaDPcnAkTuoWxDH6XYw=;
 b=rMs2UdSkGusUomo7NdA61WVRuihyVwG/P9+7Wy1H1VdfMJXryhyuhIPhKy/UZHgZjv
 dTmJHaVuDf+hrtXdvroqS2nXbkLT/J9ebfw1weV7F77rHai5ac8AtOSMk488LAiWonam
 26IGJgH4Md6Svf8JDSENx3ome7qP5wfPPxZPXaLa2ekOKafoZGC0gJWSthoKcjpHdvbF
 JNRyOt5Fc5SvrHFC5+nQL9Nayc3BOMHxQLlHQZGzNDDQ0MPpSJlEoGJtMxM1/qPdVZ3l
 47itOKyCd64Wcijd2Z5zKdicFbOLivVILEKX2LKloqWT6nZgf8UAlgk6NntxlSMQC/d3
 seJg==
X-Gm-Message-State: AHQUAuaVjpJsvHuRal9EExi+V7SVVl2lPUuOx3P1CEfzE+Qid+cs7Z/D
 rJnFqIVkd0cGJ5MKb+Y6Mr8=
X-Google-Smtp-Source: AHgI3IZ/Ilbjoy05oU4ZhxiEw/59BpCgKWq4fL32woPQ8K8TJUIhEj6rfdeYNqEF9iKvx2sF93oDJQ==
X-Received: by 2002:a7b:cd14:: with SMTP id f20mr11846055wmj.93.1549651587886; 
 Fri, 08 Feb 2019 10:46:27 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz.
 [86.49.110.70])
 by smtp.gmail.com with ESMTPSA id y12sm3002105wmi.7.2019.02.08.10.46.26
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 08 Feb 2019 10:46:27 -0800 (PST)
Subject: Re: [EXT] Re: [PATCH v2] mtd: spi-nor: Fix wrong abbreviation HWCPAS
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>,
 Boris Brezillon <bbrezillon@kernel.org>
References: <BYAPR08MB4533C8EA6B775C7514FA7F82DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <298d18cf-094b-d5d0-45d1-39c7b75ba309@microchip.com>
 <BYAPR08MB45335415CC3690816C1FD603DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <a83a9655-0ce7-da15-ec17-80ef88764e21@microchip.com>
 <BYAPR08MB4533DB0A7F4E30543750C83FDB690@BYAPR08MB4533.namprd08.prod.outlook.com>
 <20190208184718.3c488d0d@kernel.org>
 <BYAPR08MB453327FB53F7DFE50C55C1B4DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
From: Marek Vasut <marek.vasut@gmail.com>
Openpgp: preference=signencrypt
Message-ID: <7278fa87-bfe4-3d95-9a9a-5ef4c0277d78@gmail.com>
Date: Fri, 8 Feb 2019 19:46:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <BYAPR08MB453327FB53F7DFE50C55C1B4DB690@BYAPR08MB4533.namprd08.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190208_104630_094989_131E71BC 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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
Cc: "Tudor.Ambarus@microchip.com" <Tudor.Ambarus@microchip.com>,
 "richard@nod.at" <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 2/8/19 7:43 PM, Bean Huo (beanhuo) wrote:
> Hi,Boris 
> I sent three times, seems last time is successful. would you check that is correct?
> 
> git send-email 0001-mtd-spi-nor-Fix-wrong-abbreviation-HWCPAS.patch
> 0001-mtd-spi-nor-Fix-wrong-abbreviation-HWCPAS.patch

git send-email --annotate --to=... --cc=... --cc=... 000*patch

This will likely make your life easier, rather than having to paste
various email addresses to git send-email queries.

[...]

-- 
Best regards,
Marek Vasut

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
