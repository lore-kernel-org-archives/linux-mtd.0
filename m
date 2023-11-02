Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED517C4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Nov 2023 18:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ykQ5J4VMq/97HOuo8TYpySawpWD09y0daEWRNfsEp4s=; b=RIyiU3nTtO2uCRFu4gHh/D1Ham
	XXe5+iRGdQGWgX0AYU6OIWxsizI9ydN5auD8x8j6P9aUqsJItC7C0Rsi/Rww7vgVTxnL4XqrFlKjm
	b/uB8JSd1vnl4yGx7uJosWDjlrQJ8a45eAfyiddBec2/xvtyhiQyFRj73pfoIEaPJgkoDPZ2NxBzh
	HOEIxqETSkVOAwNzqV8yTtA+kCtANIc5bi0yq6/QhZmHFZOGv183l3X/dKVmYDxtWKjQBfPZs8LIp
	12ooiaFaGAjhrlRmKjnusYuZipqTckI4sW3LPkg61uP3evyFv5w83ithqp5Voq6DP1qZN924NDUgH
	Rp2w9t1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyc0g-00A2fu-00;
	Thu, 02 Nov 2023 18:01:38 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyc0Z-00A2e1-2R;
	Thu, 02 Nov 2023 18:01:35 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 03FAA87652;
	Thu,  2 Nov 2023 19:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1698948089;
	bh=u3IzhYd4EK60v1pfsWzSUN36KiXm8Y/y/nKoo2CWg6g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=sLHTpUrkCD2Ts0/fT+AQOOGnUnnMXl0THhw+esnTswhZu8TFbdzD3e8gzhsHdqT0k
	 E0HU8JZg0pns8uFl8g9M4n12jshOPrwkVcjouCOIt+lYop7QKjRw2toRE22j0h+fsL
	 2CO4eAI2vRttlgDC8hgHwMQpHlIEDEOr7bRAvfdkVmBSALuLokywLE75xAh9sB/mVr
	 TXz1vz3uaM/BMxD53tHVzZX0QdH6JuKahT8asdRcDnigqflbp2sXwN2ZpKpWaNbVAl
	 rsUkg6fsaq+SQ/oEHSktKqc114A2EszaluR2WNxNm8ewVMhpPIqsPsqRv3bw09R9vx
	 Urj6i97pknMKA==
MIME-Version: 1.0
Date: Thu, 02 Nov 2023 15:01:28 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: michael@walle.cc, takahiro.kuwano@infineon.com, pratyush@kernel.org,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 bacem.daassi@infineon.com, miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
References: <20231101145853.524045-1-tudor.ambarus@linaro.org>
 <20231101145853.524045-3-tudor.ambarus@linaro.org>
 <7fc95ddf-c860-49b9-93de-ef32b9383e42@linaro.org>
 <216d99d671caa2465519fcc3360c5001@denx.de>
 <e3901646-c918-426f-b219-e1670dc1e854@linaro.org>
 <5c48f93a9dd9b2bdc1874dd4eebbf5bb@denx.de>
 <a7bee4f0-8591-411a-a105-0284df22c464@linaro.org>
 <632457ed6b022856496537bdf8a738ba@denx.de>
 <aa123456-7ec9-4bdc-a521-66c9582d5d45@linaro.org>
 <c26f6623-2d58-43ed-95bb-957870890a02@linaro.org>
 <6f1aa670-b3f7-4ea3-bc80-773a57e46c36@linaro.org>
Message-ID: <968ba4c249926e986b02440ad0421e98@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_110131_940498_56EF4590 
X-CRM114-Status: UNSURE (   6.34  )
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

On 02/11/2023 14:59, Tudor Ambarus wrote:
> On 11/2/23 17:54, Tudor Ambarus wrote:
>> Does this help?
>> 
> 
> I guess not, because you used the full flash erase in the first place,
> but still a bug. Ok, I'll add some prints.

Yes, it did not help:

root@mcde3000a:~# time flash_erase /dev/mtd0 0 0
Erasing 131072 Kibyte @ 0 --  0 [   27.693305] ****** n_dice: 2
% complete [   27.699053] ****** die_size: 67108864
[   27.703650] ****** multi_die_erase: 1
[   27.707342] ****** addr: 0
[   27.710070] ****** len: 134217728
[   27.713406] **** Logic addr & (die_size - 1): 0
[   27.718017] **************** spi_nor_erase_dice 1
[   27.722793] spi-nor spi0.0:  **** Die size is 65536KiB
[   27.727964] spi-nor spi0.0: ***** nor->params->die_erase_opcode: 0xc4
[   27.734430] spi-nor spi0.0: ***** nor->addr_nbytes: 4
[   27.739498] spi-nor spi0.0: ***** addr 0x0
[   27.743614] spi-nor spi0.0: ***** multi_die: 1
[   27.748094] spi-nor spi0.0: ***** SR before erase: 0x2
[   27.753278] spi-nor spi0.0: ***** SR after erase: 0x2
[   27.758387] spi-nor spi0.0:  **** Die size is 65536KiB
[   27.763559] spi-nor spi0.0: ***** nor->params->die_erase_opcode: 0xc4
[   27.770017] spi-nor spi0.0: ***** nor->addr_nbytes: 4
[   27.775085] spi-nor spi0.0: ***** addr 0x4000000
[   27.779724] spi-nor spi0.0: ***** multi_die: 1
[   27.784249] spi-nor spi0.0: ***** SR before erase: 0x2
[   27.789496] spi-nor spi0.0: ***** SR after erase: 0x2
Erasing 131072 Kibyte @ 0 -- 100 % complete

real	0m0.110s
user	0m0.001s
sys	0m0.107s
root@mcde3000a:~# hexdump /dev/mtd0
0000000 a1d4 168c 4dad dfb2 2a3d c2af 0aae c18a
0000010 2d5f 177a c39f 46a4 f9cd b880 331e 2543
0000020 dd47 8981 1eaa aab4 9626 336c 4f74 2b22
....


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
