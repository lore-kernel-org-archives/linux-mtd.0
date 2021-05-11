Return-Path: <SRS0=SBmy=KG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736FBC433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 11:35:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB02961207
	for <linux-mtd@archiver.kernel.org>; Tue, 11 May 2021 11:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB02961207
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2C53TQqihlRHQu23QWAxV6BCLkv2yPitH5mNp1tsea8=; b=FWp7gfFYkSIGW0CZy2+Vjx1HA
	PG/DpsziFQijXj5QRPGSQES6ySHRpcCtq7b4acGKHnhv5fEEUJICEW6JUG/NEYUGvSwsyFCPFP2Ru
	jtMZQIS3N6fNN+k7Io0r/yRVd6Jdh26dU2Skm6iL3RHkOCRzhviGBF6nUc2XXsALyxg89nV7lpBnt
	NZAv/30/fS5zVKcoAxaRL/Q94fHCMKcGYZ2H0J4Ig4rdzhTNwMQtC+qy1lxjd1NmYOOoyySwcZqjL
	Mx4C1Lp0f7hUZXTgTA20ujm3zdSqmZyk5KMOayhIwap1NhuY88FEOaoSnfabM+Sh+N4FJ+t6Aj0zN
	2p9EauOpA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgQeh-00H9Lf-Fz; Tue, 11 May 2021 11:34:27 +0000
Received: from [2607:7c80:54:e::133] (helo=bombadil.infradead.org)
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgKdk-00GJak-1e
 for linux-mtd@desiato.infradead.org; Tue, 11 May 2021 05:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=QLE3o90E49U7T7E2EaAiVQzI6e3pwpnYjQ4vmP3po24=; b=oucO4RJ8IbIzw201xcFpnh971I
 1oOopnIT9i4hiGXYLFy/jYqrzr93nwnpdBnL0rJXeeZFJUNp+S55VLPi2mrA0BsGccEo2yzM3PLKt
 owC1tNy45VprWAUIOB/P4SPYE7wWkyBA7K74mmlB0e0Su+ADmT0tJHpsK0u2/IIuSs51naVi0uiol
 SvksDlAmjH8QP7N3H2jNDblkeKTY9BcOjvckvGh3QTiy6rPUiO/1xRjYbUBIXXueA/xJQUl2J/TrV
 YcIItUaYdpK2h7NCQMD9mBtk4wUKBfh9HZo/+x2/5BMsQZeUzxWSQhHMOiRDdoIsOQQgbBHQxptaX
 tKy9HgRg==;
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgKde-009JHt-L1
 for linux-mtd@lists.infradead.org; Tue, 11 May 2021 05:09:00 +0000
Received: from [192.168.100.10] (unknown [185.233.254.173])
 by first.geanix.com (Postfix) with ESMTPSA id C5864468C80;
 Tue, 11 May 2021 05:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1620709731; bh=dnaY5G48mDPZXiZy0gnBZfDsipVpKdX9HOupqxOgRf4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To;
 b=F7gRkd/F0caTrO8bPt0wmMfEleGb6g+ZNd/w8BlZMLpxnmxJW+8a22SdlO5X0FU1s
 Zat4XRZf+AlILAPkJvPo4/vyxTyQEiLtklOWsBGD62aCR5xGFaQF76UssHKS5mIkQd
 h6+QBh72sHSb+lzFFFznhiCjm7Aq6Z/c31qun6UQ0Tu0YwbhFr54x2PPuRYD1coC7y
 0gm5XyaMSJEtD1Q9Mbq+BCbUj1sQAq+NM5G6PGyB2nPxB6tFUq7HWOBAsvHcQqGYGC
 XkWWrX3lRLHcyNlOiNt8/MtWCgbWt+nirHO5xHXckRONrbTCd/zItFOFPe03gWF7O6
 LM05cOZSYlD/A==
Subject: Re: [EXT] [PATCH] mtd: mxs_nand: default to legacy bch and rename to
 modern bch option
To: "han.xu" <han.xu@nxp.com>
Cc: peng.fan@nxp.com, ye.li@nxp.com, alice.guo@nxp.com, sjg@chromium.org,
 seanga2@gmail.com, u-boot@lists.denx.de, miquel.raynal@bootlin.com,
 linux-mtd <linux-mtd@lists.infradead.org>
References: <20210510100043.449294-1-sean@geanix.com>
 <20210511024926.t6kunesknbwe7k2x@umbrella>
From: Sean Nyekjaer <sean@geanix.com>
Message-ID: <a33cac1f-7988-08ea-7d9d-c9b76b80cc3e@geanix.com>
Date: Tue, 11 May 2021 07:08:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210511024926.t6kunesknbwe7k2x@umbrella>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_220859_329752_773429A1 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_220859_329752_773429A1 
X-CRM114-Status: UNSURE (   7.92  )
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

On 11/05/2021 04.49, han.xu wrote:
> On 21/05/10 12:00PM, Sean Nyekjaer wrote:
>> Caution: EXT Email
>>
>> Linux kernel defaults to use legacy bch setting, this was creating a
>> mismatch between U-boot and Linux default settings.
> Kernel uses the NAND chip specified minimum ecc strength and steps by default
> not the legacy bch setting, unless users enable it in DT file.
> 

Hi,

Adding, mtd-list and Miquel

With u-boot dtb:
&gpmi {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_gpmi_nand1>;
	compatible = "fsl,imx7d-gpmi-nand";
	nand-on-flash-bbt;
	status = "okay";
};

With linux dtb (mainline 5.10):
&gpmi {
	pinctrl-names = "default";
	pinctrl-0 = <&pinctrl_gpmi_nand1>;
	nand-on-flash-bbt;
	status = "okay";
};

U-boot prior to commit 51cdf83eea selected 18 bit ECC, after that commit it selects 8 bits.
With legacy option it selects 18.
Linux is selecting 18 bits ;) So now we have a mismatch.

I have been searching for the legacy option in the mainline kernel can't find it ;)
Please show me where it is (is it in the NXP fork?)

/Sean

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
