Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4357CC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TM8/30GvqFUMQrnUQNmdLELdDb/k/gHFb++gurqfTYo=; b=uVXzxv25QtoyMHBEqeDes/VHta
	QnjhBkSiY3nbKXT9a43opptin/x3QHTqfpV8kmzRI96B1lVvH4ooI7qd8iG+ePbQCJHQwBmkYLWmG
	daeuul9n9apuEqesj659ajBdNlw6iJ34D4Ogd3jPdjVqhZQL3KMfaMdu7/xPoxUhu5XvG3NC9Pdnn
	9TbLoTR9frIYpwgy1D06s+TpwZlBSw0Nxm/Xf5OhsaSV5FEdwadksuDaK0IkMvNzOclDXx2VfPpyY
	Geq6yPSJslkCQD4JsSTfzoh10NT1t3OTMMCiMudj2LtzdcgY+w/ZUdCj6RFpjXIMzJPCzxx+Zcrun
	0AeHZu1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuyj-00BYlJ-1C;
	Fri, 03 Nov 2023 14:16:53 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuyd-00BYhe-0a;
	Fri, 03 Nov 2023 14:16:51 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C956A8715F;
	Fri,  3 Nov 2023 15:16:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1699021004;
	bh=1Ui78Z0QryBc5/nyUGeQqQ16vGuEzXyaOA+NprPq3yo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fTbghmUCj9EAVG9/qDIRrMHN8AgplJn9b0273XpCSR5zXuhrN1/3tKHddzMFT3O+5
	 W6fY1EiMDbGFRJrLw3FCpa9oLKc+fPDs6TIGn7T9sAQlFesHpScfg1OyXSYTRb5woK
	 31LGY8ipOjcqlS9PKTKQpWlpJ9KC+oclk29Z+69X53hPsD4q3XMkQZmJ/qXV7l/91f
	 DMCwzp01h6aCtVJDSnfbnylxtWlero+ZNqqWk81+pWje975potdnHujj/kVYTg2rzk
	 ieTfXhZAVdZ/wQ4PpfTL2r3Vhhdq/Qt/lP5NzZn0OAcpPZKHnKbG2w003vMmAVm8Sa
	 dBMKtVHCMz74A==
MIME-Version: 1.0
Date: Fri, 03 Nov 2023 11:16:44 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
 <968ba4c249926e986b02440ad0421e98@denx.de>
 <f2141a88-13d4-47b8-8382-5df8cc1bc42b@linaro.org>
 <cf0e4284f2e3193ddd57b715196ca202@denx.de>
 <25ca1a4c-683c-4b6d-938b-07323b211815@linaro.org>
 <c3f2b8a6-8b23-4a33-948e-62ff64db9a2f@linaro.org>
 <5872f7233bc0dc4669aa1324f3ae3cf0@denx.de>
 <95c16eb0-a785-4a8d-bb42-c5a09b034d0a@linaro.org>
 <e665266fc1565f9d346c95215df39f12@denx.de>
 <085ba0f9780b1f8b34bc9e1037fec5e7@denx.de>
 <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
 <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
 <a3ccb98e-b8bd-4ea3-98c4-df429602a7ef@linaro.org>
Message-ID: <c533a2af60f27d21c9c703b6cb34ff77@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_071647_605056_0F349287 
X-CRM114-Status: UNSURE (   7.11  )
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

On 03/11/2023 10:48, Tudor Ambarus wrote:

> Yep, it's strange, we'll have to check what's happening. I found my
> n25q00 flash, on my side all its 4 dice are erased in 5 sec.  SFDP
> defines how long the erase die should take, see BFPT dword 11. You can
> start with that.

Where does BFPT dword 11 reside inside SFDP?

~# hexdump -C 
/sys/devices/platform/soc@0/30800000.bus/30bb0000.spi/spi_master/spi0/spi0.0/spi-nor/sfdp
00000000  53 46 44 50 06 01 01 ff  00 06 01 10 30 00 00 ff  
|SFDP........0...|
00000010  84 00 01 02 80 00 00 ff  ff ff ff ff ff ff ff ff  
|................|
00000020  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
00000030  e5 20 fb ff ff ff ff 3f  29 eb 27 6b 27 3b 27 bb  |. 
.....?).'k';'.|
00000040  ff ff ff ff ff ff 27 bb  ff ff 29 eb 0c 20 10 d8  
|......'...).. ..|
00000050  0f 52 00 00 24 4a 99 00  8b 8e 03 e1 ac 01 27 38  
|.R..$J........'8|
00000060  7a 75 7a 75 fb bd d5 5c  4a 0f 82 ff 81 bd 3d 36  
|zuzu...\J.....=6|
00000070  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  
|................|
00000080  ff e7 ff ff 21 dc ff ff                           |....!...|
00000088

Do we need a fixup to tell the erase die to be faster?

I haven't found the 'BFPT' term in the JEDEC spec.

> real	0m5.485s
> user	0m0.000s
> sys	0m5.461s

Before erasing, did the flash contain 128MB of random data on your test?

On my tests, when the flash contains 128MB of random data, the first 
erase
takes 4 minutes. Subsequent erases take only 2 seconds.

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
