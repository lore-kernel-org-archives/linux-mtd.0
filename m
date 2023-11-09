Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B656C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 09:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOZcYraySTpW+wslhR/mJpUYqCkv5cB5rkTMlffyuhQ=; b=osnNpPWcliwUlp
	vtxICgYT/d0i4jOsu7Fe1aCW5rE1VgeL7eF4Y0n+mWfeFVevaKhJ+GPSvH0DJQi/Z0mj9Zl6KoGgu
	SB5DicpOUiOkaUAr46ln8ogq/UPIPStq+81cf1o/B8OHRvFkCwuh5e/37wTPa7CIlA34pvKV5Jawl
	AZ+A+Afqm4J+IsgcKeqMO+0m9bVEKV1FKQL7C+dhhFuCsoQr7m3/wih9/SqsYk3GMYF+nplD8DSYs
	ggTqVZ2+zn4Tj7YyoRAmTIc5adM8vLiRBnLhQRGipSkB7T1oBA5noO+duc/mY4YsRedS5MKHylAdw
	LxX9CKiTHjl5C+KS/dmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r11AD-005kqs-0S;
	Thu, 09 Nov 2023 09:17:25 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r11A7-005kor-2V;
	Thu, 09 Nov 2023 09:17:22 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id B0F5A12000B;
	Thu,  9 Nov 2023 12:17:11 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru B0F5A12000B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1699521431;
	bh=bbSo/m0vSYcjPbzBQwrGodEysAY5jSopZaaAaAbrRcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=c0+ygr3yMenLOk+knqeJ0iLTt/zEwohclNi9i8s7p6MROGBuQoWjFzFxvaiFDz2CS
	 40YDX6OUWtFTX3F/azVR/AfepUrMx9YAHf5OWnDmsYtjhsgxEGiH059xB12CT3vzME
	 XKWtvhTjxx2RQJsU7x1HbSUiSiWYMo7Nkdup7aHhBm7wn56Ha0wz/c0lkWGi+bR0mT
	 Ec2nVMTkiHD092DA/brJ6i7Ei21jR/HRF/8YMyPUze45Vs0wHdOl1RWJ3/+vcXdFMT
	 Gbv7wxLupG9M0dUB/UxDyNk4QSOQoPGLQlI2a92LdAhndiuN6/kNu4AtICb+ncM8ZY
	 Hk2D1Sl3f1vjw==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  9 Nov 2023 12:17:10 +0300 (MSK)
Received: from [192.168.0.106] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 9 Nov 2023 12:17:09 +0300
Message-ID: <98c5a6ef-3865-9254-0af7-2d041a64d368@salutedevices.com>
Date: Thu, 9 Nov 2023 12:09:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1] mtd: rawnand: meson: handle OOB buffer according OOB
 layout
To: Viacheslav Bocharov <adeep@lexina.in>, Liang Yang
	<liang.yang@amlogic.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <oxffffaa@gmail.com>, <kernel@sberdevices.ru>,
	<linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20231109053953.3863664-1-avkrasnov@salutedevices.com>
 <5a82e3b96c94b45821707eb5d392384e1a026c2e.camel@lexina.in>
Content-Language: en-US
From: Arseniy Krasnov <avkrasnov@salutedevices.com>
In-Reply-To: <5a82e3b96c94b45821707eb5d392384e1a026c2e.camel@lexina.in>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181232 [Nov 09 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: avkrasnov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/11/09 07:10:00 #22435383
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_011720_168257_3E7A7699 
X-CRM114-Status: GOOD (  22.30  )
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

Hello, thanks for review!

On 09.11.2023 11:06, Viacheslav Bocharov wrote:
> Hi!
> 
> On Thu, 2023-11-09 at 08:39 +0300, Arseniy Krasnov wrote:
>> In case of MTD_OPS_AUTO_OOB mode, MTD/NAND layer fills/reads OOB buffer
>> according current OOB layout so we need to follow it in the driver.
>>
>> Signed-off-by: Arseniy Krasnov <avkrasnov@salutedevices.com>
>> ---
>>  drivers/mtd/nand/raw/meson_nand.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
>> index 561d46d860b7..0d4d358152d7 100644
>> --- a/drivers/mtd/nand/raw/meson_nand.c
>> +++ b/drivers/mtd/nand/raw/meson_nand.c
>> @@ -510,7 +510,7 @@ static void meson_nfc_set_user_byte(struct nand_chip *nand, u8 *oob_buf)
>>  	__le64 *info;
>>  	int i, count;
>>  
>> -	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += 2) {
>> +	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += (2 + nand->ecc.bytes)) {
>>  		info = &meson_chip->info_buf[i];
>>  		*info |= oob_buf[count];
>>  		*info |= oob_buf[count + 1] << 8;
> Seems something wrong with your logic here.
> I think this code should most likely look like this:
> 
> for (i = 0, count = 0; i < nand->ecc.steps; i++, count += nand->ecc.bytes) {
>     info = &meson_chip->info_buf[i];
>     *info |= oob_buf[count];
>     if (nand->ecc.bytes > 1)
>       *info |= oob_buf[count + 1] << 8;
> }

For 64 bytes OOB and 512 bytes ECC this driver reports free areas as:

AA AA BB BB BB BB BB BB BB BB BB BB BB BB BB BB
AA AA BB BB BB BB BB BB BB BB BB BB BB BB BB BB
AA AA BB BB BB BB BB BB BB BB BB BB BB BB BB BB
AA AA BB BB BB BB BB BB BB BB BB BB BB BB BB BB

where AA is free byte(user byte), BB - ECC codes. So to access user bytes
we need bytes 0,1,16,17,32,33,48,49. nand->ecc.bytes == 14, so 'count' is
increased at 16 every iteration, so i guess this is correct.

WDYT?

Thanks, Arseniy

> 
> 
>> @@ -523,7 +523,7 @@ static void meson_nfc_get_user_byte(struct nand_chip *nand, u8 *oob_buf)
>>  	__le64 *info;
>>  	int i, count;
>>  
>> -	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += 2) {
>> +	for (i = 0, count = 0; i < nand->ecc.steps; i++, count += (2 + nand->ecc.bytes)) {
>>  		info = &meson_chip->info_buf[i];
>>  		oob_buf[count] = *info;
>>  		oob_buf[count + 1] = *info >> 8;
> And there:
> 
> for (i = 0, count = 0; i < nand->ecc.steps; i++, count += nand->ecc.bytes) {
>     info = &meson_chip->info_buf[i];
>     oob_buf[count] = *info;
>     if (nand->ecc.bytes > 1)
>         oob_buf[count + 1] = *info >> 8;
> }
> 
> 
> This is more similar to the behavior of similar functions in the proprietary U-Boot.
> 
> --
> Viacheslav Bocharov
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
