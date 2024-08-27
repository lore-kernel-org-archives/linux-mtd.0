Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CD35C54731
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Aug 2024 17:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cObciV+10+oNYNBcbEq8o0eMrWPkZGdADJ3XTle+94o=; b=tigyyY943tUNkR
	QXjyxWOuNQ/U7GuaZX+cgQZSWmjPmJ6SApOGyY4wa0cm4G4GsPVv9aZMFi71EnX8L9gac31wn+/rV
	Ns3YI9V6e4/k5Ymu+4Ic0UhIdwyyQGgHfmC4HWT35XjJNcGYa0sCPsbCYqEGkvtwCmLpZ4L5XTkLM
	QCDaeCRHXEkfU6mT1bbrhN0rTzngJcr0P+7YS+3SlxMt2LgPe9KBnEUzJwb9q7HZg1VdxdAQaxruK
	viTQZwsQOsz3WFRs0EugTyw5hllKtyfggCpUajvrbMAuz7Jpbd7KY6GkQ6IdGElK5wY95B8Y3ZIqm
	uxsc+6Z2eod94BOAeBJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0Sd-0000000CO6e-0zOt;
	Tue, 27 Aug 2024 17:58:31 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj0RH-0000000CNqQ-29qG
	for linux-mtd@lists.infradead.org;
	Tue, 27 Aug 2024 17:57:51 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id ED750100002;
	Tue, 27 Aug 2024 20:57:05 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru ED750100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1724781425;
	bh=U2ci6JcFVWV1xQ922NnZ/fyC+kd/ELTpXWy2qyn4+ns=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=PU27pTUz9HsVfSkBsPJiMbBaH/NVtquwCVxb9NuEnqHZPn5OmQHuAEBi9vEEjRptm
	 rppEfSr9sWugoNH3kku8zGNg/TMPQV/f45FlmhfZU1P20k1Vf85mFsTFek5f31eQxD
	 DhN0k98wIR9BzeabRYx+HE4pKfyCd5kymqzajM6Z8B7HVBKGSezd819w+sw0hJyoAz
	 DQNGgDm9QCuNNPV2aXVZk3XKxQSYZnme16Mom1FbrkpNEjAgWoUcFeWIZlypqSzUG3
	 42LHzbOZjC7Onxj0mDqha/xE3/KywK0Q6hXTo9VGVPLuiECdwUK4oJpgaSSrwjAvVU
	 g4ef3i36zylJg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 27 Aug 2024 20:57:05 +0300 (MSK)
Message-ID: <bb137aef-4ca9-4825-99b7-12f7e17c9550@salutedevices.com>
Date: Tue, 27 Aug 2024 20:57:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] mtd: spinand: add OTP support
To: Miquel Raynal <miquel.raynal@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
	<kernel@salutedevices.com>, Richard Weinberger <richard@nod.at>, "Vignesh
 Raghavendra" <vigneshr@ti.com>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Michael Walle <michael@walle.cc>, "Mark
 Brown" <broonie@kernel.org>, Chia-Lin Kao <acelan.kao@canonical.com>, "Md
 Sadre Alam" <quic_mdalam@quicinc.com>, Ezra Buehler
	<ezra.buehler@husqvarnagroup.com>, Sridharan S N <quic_sridsn@quicinc.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>, Alexey Romanov
	<avromanov@salutedevices.com>
References: <20240827174920.316756-1-mmkurbanov@salutedevices.com>
 <20240827174920.316756-3-mmkurbanov@salutedevices.com>
Content-Language: en-US
From: Martin Kurbanov <mmkurbanov@salutedevices.com>
In-Reply-To: <20240827174920.316756-3-mmkurbanov@salutedevices.com>
X-Originating-IP: [172.28.129.118]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-a-m1.sberdevices.ru (172.24.196.116)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 187372 [Aug 27 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: mmkurbanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 27 0.3.27 71302da218a62dcd84ac43314e19b5cc6b38e0b6, {Tracking_arrow_text}, {Tracking_uf_ne_domains}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;lore.kernel.org:7.1.1;salutedevices.com:7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/08/27 07:21:00
X-KSMG-LinksScanning: Clean, bases: 2024/08/27 07:12:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/08/27 16:21:00 #26445643
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_105707_920552_9CA3750C 
X-CRM114-Status: UNSURE (   6.48  )
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

Hello, Miquel. Thank you for the review.
Regarding your question ( https://lore.kernel.org/all/20240717103623.6d6b63be@xps-13/ ):

>> +int spinand_otp_read(struct spinand_device *spinand, loff_t from, size_t len,
>> +		     u8 *buf, size_t *retlen);
>> +
>> +int spinand_otp_write(struct spinand_device *spinand, loff_t from, size_t len,
>> +		      const u8 *buf, size_t *retlen);
>> +
> 
> Why exposing spinand_otp_read and spinand_otp_write ?

For the SPI-NAND chips we have (Micron, ESMT, FORESEE), the command
sequence for reading/writing OTP is the same. I decided to make these
functions global because other chips probably have similar read/write
OTP operations as well.

-- 
Best Regards,
Martin Kurbanov


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
