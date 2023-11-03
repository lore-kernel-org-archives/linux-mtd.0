Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37675C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  3 Nov 2023 13:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8fi+poAfuMT50uY1FIiGz/NqMXl52cIMyQCUpx2lsw=; b=E27LvUspgJIbiU2Esybv2asCRd
	/4Wy1IJx7nU7/MNvcdxOPPv5CRhTMJeXAlQaOGph5i/CKW8/AeKQYz2qh+4Eu1CaJyLfYbn6+QAHP
	zxjg2IyWxuUZBzZqrM4bqDxxRFFsfCWOAMWU0LRGW4DIhT2LP/ZceRIItJRvn2k5OekLdv8LoGgii
	cml5bR2Wpdx95wxej4aGm6LMwAdU2c5XuIGmBjuUYVLFvfohfWBp19iF3qj9RBSJ6gWlX0OGQhMSN
	quY7TQLYJrhBunsMjELb4wlAQk4/wvsORR+lLwAsm15u21LEe/e8UI+kP9X+2PAyzlzWLzrE7SyaR
	jNqHTx6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuMW-00BUfQ-18;
	Fri, 03 Nov 2023 13:37:24 +0000
Received: from phobos.denx.de ([85.214.62.61])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyuMP-00BUew-0I;
	Fri, 03 Nov 2023 13:37:21 +0000
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 8DF4886B2E;
	Fri,  3 Nov 2023 14:37:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1699018635;
	bh=O5Wtg13JS+wTmdg+vC6J+scDcKvz3fS0drluh5dglMM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vOCnpvYJIMWOcuNygSio4pLF2vBALWflL8Pczcu6JZ6J2x+xcBjvUTLZKAohh4Tc2
	 H/GmYlMGKXLFfS85bu9edM+vqg2flg9q1+U+uE/CLc6GcX+/jxGopEA9web/qPXAah
	 VzQCEeAXnUdTm8vHmavzC7aGG8xYx8xDErG2PMkQsX6Bhei/lwugWSfOCJwOrw0yix
	 NudRCzcGAnbofV3SAQxsH6tvym/GvzkQubuBZSkd8z24CwuWCLfDmsXK0dzIEunZi1
	 gxCedbIbGEmbyH7DzoGW867A1dhe6X52bqA04CLCKztaFvdoZ5h3LC83Z50jLpYM45
	 Sxw2PUfII1ckA==
MIME-Version: 1.0
Date: Fri, 03 Nov 2023 10:37:15 -0300
From: Fabio Estevam <festevam@denx.de>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>, michael@walle.cc,
 pratyush@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, bacem.daassi@infineon.com,
 miquel.raynal@bootlin.com, richard@nod.at
Subject: Re: [PATCH v2 2/6] mtd: spi-nor: add erase die (chip) capability
In-Reply-To: <b5c1d4d7-1583-4469-a604-dcf5bb3f96a4@linaro.org>
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
Message-ID: <9004acceea77d2f06aaff0ca5f916cd7@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231103_063717_520876_2F17B2DB 
X-CRM114-Status: UNSURE (   6.98  )
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

On 03/11/2023 10:26, Tudor Ambarus wrote:

> Which version of mtd-utils are you using? I guess the flash-erase

mtd-utils 2.1.5

> utility is written in a bad way. Please use the following while I check
> what flash_erase is doing:
> 
> time mtd_debug erase /dev/mtd0 0 134217728

"mtd_debug erase" gives the same time as well:

root@mcde3000a:~# time mtd_debug erase /dev/mtd0 0 134217728
[ 4322.114967] spi-nor spi0.0: ***** nor->reg_proto = 0x00010101
[ 4322.120861] spi-nor spi0.0: *****
[ 4322.124210] spi-nor spi0.0: ***** op.cmd.nbytes = 0x01
[ 4322.129478] spi-nor spi0.0: ***** op.cmd.buswidth = 0x01
[ 4322.134903] spi-nor spi0.0: ***** op.cmd.opcode = 0xc4
[ 4322.140154] spi-nor spi0.0: *****
[ 4322.143491] spi-nor spi0.0: ***** op.addr.nbytes = 0x04
[ 4322.148831] spi-nor spi0.0: ***** op.addr.buswidth = 0x01
[ 4322.154341] spi-nor spi0.0: ***** op.addr.buswidth = 0x0
[ 4322.159761] spi-nor spi0.0: *****
[ 4322.163098] spi-nor spi0.0: ***** op.dummy.nbytes = 0x00
[ 4322.168524] spi-nor spi0.0: ***** op.dummy.buswidth = 0x00
[ 4322.174118] spi-nor spi0.0: *****
[ 4322.177439] spi-nor spi0.0: ***** op.data.buswidth = 0x00
[ 4322.182948] spi-nor spi0.0: ***** op.data.nbytes = 0
[ 4439.966060] spi-nor spi0.0: ***** nor->reg_proto = 0x00010101
[ 4439.971920] spi-nor spi0.0: *****
[ 4439.975252] spi-nor spi0.0: ***** op.cmd.nbytes = 0x01
[ 4439.980511] spi-nor spi0.0: ***** op.cmd.buswidth = 0x01
[ 4439.985928] spi-nor spi0.0: ***** op.cmd.opcode = 0xc4
[ 4439.991174] spi-nor spi0.0: *****
[ 4439.994504] spi-nor spi0.0: ***** op.addr.nbytes = 0x04
[ 4439.999834] spi-nor spi0.0: ***** op.addr.buswidth = 0x01
[ 4440.005335] spi-nor spi0.0: ***** op.addr.buswidth = 0x4000000
[ 4440.011272] spi-nor spi0.0: *****
[ 4440.014604] spi-nor spi0.0: ***** op.dummy.nbytes = 0x00
[ 4440.020018] spi-nor spi0.0: ***** op.dummy.buswidth = 0x00
[ 4440.025606] spi-nor spi0.0: *****
[ 4440.028937] spi-nor spi0.0: ***** op.data.buswidth = 0x00
[ 4440.034438] spi-nor spi0.0: ***** op.data.nbytes = 0
Erased 134217728 bytes from address 0x00000000 in flash

real	3m57.384s
user	0m0.005s
sys	3m35.211s

Thanks



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
