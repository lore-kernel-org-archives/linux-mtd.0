Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E088EB4904
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Feb 2026 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v5Xa5GZWG3DuVswNswwqXjKpu3ry8GsO1gdr0DyQoUQ=; b=Ag4w1mL8Dq1KEg
	9aKZ8ZUOJ90JSkevbN3EA0FvmK1h6FXqwjU6/X0qcsEbd+J2II4JfeHqc2sJOAFWfF1TDIaUJe0NB
	omKHiO3BXMBJc40dHA2Dy5XslnHaoFSV9+x6d9OYWlUrV1t1aQUzRmEMU4bLLFfQuaKwqzNQtDHFS
	z1iClTvAzGZs2qpSwyd64WjN6Ss6JoEpHAKKlNk0zmrpmfnxhpxFyTlc3ieMc2QW6hRT55As5ZWme
	/fHxAxN6SsX/Sv9UWd6Tpia+91ymvgNtJglgdvWYHfGkmzOwdIr2pY0obAkBADeuOKmHmifZHm/TO
	VIrHd3WfykynsxJ/BKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUeL-00000001yic-1FIO;
	Thu, 12 Feb 2026 11:14:21 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqUeH-00000001yi6-0tul
	for linux-mtd@lists.infradead.org;
	Thu, 12 Feb 2026 11:14:18 +0000
Received: from localhost (unknown [IPv6:2a02:810b:4320:1000:4685:ff:fe12:5967])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 5CFFC27F;
	Thu, 12 Feb 2026 12:14:05 +0100 (CET)
Mime-Version: 1.0
Date: Thu, 12 Feb 2026 12:14:05 +0100
Message-Id: <DGCXTWSCAH6R.22SIL82AUVGYI@kernel.org>
Subject: Re: [RFC PATCH v2 09/12] spi: cadence-quadspi: add PHY tuning
 infrastructure
Cc: "Santhosh Kumar K" <s-k6@ti.com>, <broonie@kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <richard@nod.at>, <vigneshr@ti.com>, <tudor.ambarus@linaro.org>,
 <pratyush@kernel.org>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <praneeth@ti.com>, <u-kumar1@ti.com>,
 <p-mantena@ti.com>, <a-dutta@ti.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
X-Mailer: aerc 0.20.0
References: <20260113141617.1905039-1-s-k6@ti.com>
 <20260113141617.1905039-10-s-k6@ti.com>
 <DGAC4N62UZQQ.3R7TLX87PECU3@kernel.org> <87qzqqxml7.fsf@bootlin.com>
In-Reply-To: <87qzqqxml7.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_031417_395816_66EAE7D2 
X-CRM114-Status: GOOD (  14.45  )
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

Hi,

On Thu Feb 12, 2026 at 11:50 AM CET, Miquel Raynal wrote:
> On 09/02/2026 at 10:48:21 +01, "Michael Walle" <mwalle@kernel.org> wrote:
>> On Tue Jan 13, 2026 at 3:16 PM CET, Santhosh Kumar K wrote:
>>> +static int cqspi_get_phy_pattern_offset(struct device *dev, u32 *offset)
>>
>> ..
>>
>>> +	partition_np = of_get_child_by_name(flash_np, "partitions");
>>> +	if (!partition_np) {
>>> +		of_node_put(flash_np);
>>> +		return -ENODEV;
>>> +	}
>>> +
>>> +	for_each_child_of_node(partition_np, part_np) {
>>> +		if (of_property_read_string(part_np, "label", &label) ||
>>> +		    !strstr(label, "phypattern"))
>>> +			continue;
>>
>> There was already a review comment on the last version. Moving this
>> into the driver doesn't make it any better. In fact this might
>> create a (bad) precedent for future drivers.
>
> I remember complaining about it but not if there was a solution
> foreseen. In SPI NAND the solution has been found: the pattern is in the
> driver and we load it into cache before PHY tuning. But for SPI NOR I
> understood this wasn't possible. What would be an alternative?

I'm not complaining about using a partition for the pattern but
about the hardcoded name of it.

It was proposed to use at least a device tree phandle to point to a
partition (or so).

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
