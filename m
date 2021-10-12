Return-Path: <SRS0=HPMf=PA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD9AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 09:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F00761078
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Oct 2021 09:16:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8F00761078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=geanix.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HOURf6sYjWpP6OcubAvHMSnRx/BstXL33yS5mkmx4eI=; b=NxmGcTDENDj2Qc
	sajNqkJMw9GyR53+Ujy84DhmyNlmRN2IES2uDWnN35bkq0dkuWhS8t9l4Ep09kQOItKzk7EBRGNGk
	qKe9iV/THFGGxWpVK+XuPNAytTrpWQ9R6lJ654Ceo9OnLhqgG07e7kDfUTDGUMg0vr2JZmnsdY4dR
	yvgZzVXycSqgJvVkKxiyewxvDORWvjZzCnj1RxqDDzrwOLp8byfbvu/O7thY1Examb1kcUqotMNTH
	PUqWkxZYacdJEfHPied15c0i5zdRE0DkSocEo9Crw14F27Qqt28ZN518WAXz2h8X1e+VMN0/CRfb0
	7Z0u0GssC9z9d7HBRYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maDsm-00CCpd-81; Tue, 12 Oct 2021 09:15:36 +0000
Received: from first.geanix.com ([116.203.34.67])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maDsh-00CCme-5S
 for linux-mtd@lists.infradead.org; Tue, 12 Oct 2021 09:15:32 +0000
Received: from [IPV6:2a06:4004:10df:1:da27:a6d2:5305:fd0a] (_gateway
 [172.25.0.1])
 by first.geanix.com (Postfix) with ESMTPSA id 83DDCC43A5;
 Tue, 12 Oct 2021 09:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
 t=1634030127; bh=iPziXXY6hQbOF3fSF+PNBhkOoh7co7Wkv3SqqFjo8Uk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=i2FKwgjRuonMyezD4+pLThC8sjwnOzaNRcLUWFprVtJDmJF31GpGngomgCe4+5tkF
 SijBIQy+52Nz75+lHpoQFVjkTTRDe/enwl34OCr8wCpjHPyPtJ0uUfYBKBpQJNkWD2
 4SBEyyUKN94avDKVF0bEC0LTUk4qvUUMN/UoahbTaqfevuIA0zv+V7SuViHrQVfUHu
 baaC36Z++pVA+I7fZUYRcUdjeSRu1suudmeLgs0ZpEuqi4qqylkRIefTOazxH5m7HW
 WL4NTxfNtLJKagE0JMAXj+5y1VWa1xvxi3JtrVRsZUB3smKMKhaZxLmomkSEP4+0AO
 l2V6KO6IkdSYA==
Message-ID: <9f4ed2c6-7b3d-4933-2247-541855b800ba@geanix.com>
Date: Tue, 12 Oct 2021 11:15:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/2] mtd: nand: raw: gpmi: new bch geometry settings
Content-Language: en-US
To: Han Xu <han.xu@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, richard@nod.at,
 vigneshr@ti.com, linux-mtd@lists.infradead.org
References: <20210522205136.19465-1-han.xu@nxp.com>
 <13c975bc-b37b-8708-9ac7-acdc62ef7108@geanix.com>
 <20210525191308.jlxqvy7khptbuj4z@umbrella> <20210526094136.279976a6@xps13>
 <20210526141700.5gygssig4rnzn6mj@umbrella> <20210526173123.1787713b@xps13>
 <20210705104654.gko7ettkilrrosi7@skn-laptop>
 <20210706025001.bqvrdye4v3cidm5v@umbrella>
From: Sean Nyekjaer <sean@geanix.com>
In-Reply-To: <20210706025001.bqvrdye4v3cidm5v@umbrella>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_021531_558725_C2087927 
X-CRM114-Status: GOOD (  10.93  )
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


On 06/07/2021 04.50, Han Xu wrote:
> On 21/07/05 12:46PM, Sean Nyekjaer wrote:
>> On Wed, May 26, 2021 at 05:31:23PM +0200, Miquel Raynal wrote:
>>> Hi Han,

[ ... ]

>> 
>> Hi Han,
>> 
>> Is this something you are working on? If not I really think we need
>> to revert the changes to u-boot, to allign vanilla u-boot and
>> kernel.
> 
> I will send patches for both kernel and u-boot to use legacy bch
> scheme by default, and add some code to treat few MLC nand chips as
> corner cases.
> 

Have I missed the series patches for this? :)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
