Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7732C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 22 Feb 2022 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uq7tT/qS6ldHnqLuNn7rKF1ccaYvxoC31Dlmbe6cM5k=; b=bnPbSC1PbZ/0cdSc6G+WE6if+t
	/09aT++VXrlCUnriNB+tQGXsag12eFP6zXeYcwSQTokT6tuNY9FFTEB2aqYC+SJIKyDgFuucFLhJC
	hRCgibF0MT2esI5gIcCAuOqIMEwwKz7mL3et6Dklb/AXvRYUsDzIwTBypeqaogmteA2HWj6zHks2D
	bl1HD9l4l7j45JK+qwTma9QFs8OCRxqWTyykPBtwngqmXawEm9sGAK680kQRCh+ZZFjf1XHgsDPs9
	WYLo3eSjUjemLbYk0FWVMfQ3Kx5i4szYQzqrYFTnOd61JJjXy9UaS4rRZRyhaaDeT2BLwKaE6NI40
	QkUFX8tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMVvO-009poX-3r; Tue, 22 Feb 2022 14:13:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMVvK-009pnA-Vl
 for linux-mtd@lists.infradead.org; Tue, 22 Feb 2022 14:13:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 8E37022205;
 Tue, 22 Feb 2022 15:13:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1645539228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BmG1AZbDpC+bakClgYmNF33qqjmHjp2EK9xSPXkgubg=;
 b=hF8LDMA23dfd/43QNi8Lf4jflujl+1s/h1sDqDEcIsTGZGWSPQFw+jPogd+jtqg3MSUnDF
 KZcyhbBS9l0vlrlEvECgGGRpeL68deeBTYqNo2chKI6gyMmulsnEQ+450z4W4IwTA4MO49
 Ik0o7OGwpFk9i1VmE9cWdNjydbGCVFc=
MIME-Version: 1.0
Date: Tue, 22 Feb 2022 15:13:46 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, broonie@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 Nicolas.Ferre@microchip.com, zhengxunli@mxic.com.tw, jaimeliao@mxic.com.tw
Subject: Re: [PATCH 0/4] spi-mem: Allow specifying the byte order in DTR mode
In-Reply-To: <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
References: <20220218145900.1440045-1-tudor.ambarus@microchip.com>
 <44f655d027b49b87065915f6ba2744d2@walle.cc>
 <81d7c569-d6c2-9167-e007-eda72f34842b@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <23fbbf2dde387e3832b4ca23d46816c0@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_061351_229151_4CCBEEC4 
X-CRM114-Status: GOOD (  10.90  )
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

Am 2022-02-22 14:54, schrieb Tudor.Ambarus@microchip.com:
> On 2/21/22 09:44, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2022-02-18 15:58, schrieb Tudor Ambarus:
>>> Fortunately there are controllers
>>> that can swap back the bytes at runtime, fixing the endiannesses.
>>> Provide
>>> a way for the upper layers to specify the byte order in DTR mode.
>> 
>> Are there any patches for the atmel-quadspi yet? What happens if
> 
> not public, but will publish them these days.
> 
>> the controller doesn't support it? Will there be a software fallback?
> 
> no need for a fallback, the controller can ignore op->data.dtr_bswap16 
> if
> it can't swap bytes.

I don't understand. If the controller doesn't swap the 16bit values,
you will read the wrong content, no?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
