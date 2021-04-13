Return-Path: <SRS0=Vrwx=JK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1229C433B4
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 21:14:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90CC161176
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Apr 2021 21:14:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90CC161176
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mleia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KQ8+7pMx1EClD8G2k4lZPQosP5/Z6cwqpeTZbB1E768=; b=XvuF8El/iepDgpnCG7H0vZx65
	0qdIav5ShCuTAUFW/eeBwF4m+JYLR5ytnpEfVd/Z1Wyzh/rW2S2vjKTLvJ8eVrd23z0ZEm1m1Z2bS
	oU2KUucuB3DnGV+b0R+T/X/JgfnrvuyxSQQXKIF3DEQSfYBqPVi9XfTuE30pWYCUdEA6IQPO46wTS
	jYq/4vd1TNhDlNSGfQzuHv9t7Mt+Q28d97AISg+ACRowSTp5vPr1ogl0Tx6yTdoU0HAe96iC8EhoD
	BZRPmo4l8rX4t24fq6pdYnCciv5IbfhophV+0yLQ8yGuMecCMpRZkiWMXahfNyics+DeRhEbSZ6XH
	ERa/EhdDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWQLW-00AUoU-Pe; Tue, 13 Apr 2021 21:13:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQLT-00AUnp-5B
 for linux-mtd@desiato.infradead.org; Tue, 13 Apr 2021 21:13:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=wcZq3L/vAxMMhsAH7lMluGxiGqqotIrxZPcIhyWM5mg=; b=n0ylq+SRC4bnVz2kw8lZ56CUOI
 FORs+wWvexFebvXQ8SqOka5vUGzjhTc7GUWJ2rVDJaH2ma07XhinUBpbnzXMhZUU1n9EpwDe6dSQ/
 0A0dU/JlbdUL1gIWznotteR+5UQmX3is1QORMBeNVlYinKb31gI4pbVf1SoSGwUsKlGGB7lbMajJS
 3JpO59DIa/nomN1jfpWHQ+YWvLN1Er5wZDg94WzJevFyMxy1SFVRQ8Yh6udtcfNSgvbdUCwIi1FHu
 HFCPYBvlB/ih4wLjy2UOcAVWpqCqkFneYDsHXa5Lu276bZNdMxi8KgLI+NsWxLOQUNu7hH9LYUUy+
 M2CFhcBg==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWQLQ-007KNF-KN
 for linux-mtd@lists.infradead.org; Tue, 13 Apr 2021 21:13:13 +0000
Received: from mail.mleia.com (localhost [127.0.0.1])
 by mail.mleia.com (Postfix) with ESMTP id A5CBD4775D2;
 Tue, 13 Apr 2021 21:13:08 +0000 (UTC)
Subject: Re: [PATCH v3 3/7] mtd: rawnand: lpc32xx_slc: Fix external use of SW
 Hamming ECC helper
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
Cc: stable@vger.kernel.org, Trevor Woerner <twoerner@gmail.com>
References: <20210413161840.345208-1-miquel.raynal@bootlin.com>
 <20210413161840.345208-4-miquel.raynal@bootlin.com>
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <776fbfb9-526e-c66b-f6fa-bf7a258c4bd6@mleia.com>
Date: Wed, 14 Apr 2021 00:13:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210413161840.345208-4-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20210413_211308_702609_23D3E18B 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message. 
/bin/ln: failed to access
 'reaver_cache/texts/20210413_211308_702609_23D3E18B': No such file or
 directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_211308_702609_23D3E18B 
X-CRM114-Status: GOOD (  11.83  )
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

On 4/13/21 7:18 PM, Miquel Raynal wrote:
> Since the Hamming software ECC engine has been updated to become a
> proper and independent ECC engine, it is now mandatory to either
> initialize the engine before using any one of his functions or use one
> of the bare helpers which only perform the calculations. As there is no
> actual need for a proper ECC initialization, let's just use the bare
> helper instead of the rawnand one.
> 
> Fixes: 90ccf0a0192f ("mtd: nand: ecc-hamming: Rename the exported functions")
> Cc: stable@vger.kernel.org
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Reported-by: Trevor Woerner <twoerner@gmail.com>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Tested-by: Trevor Woerner <twoerner@gmail.com>

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

--
Best wishes,
Vladimir

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
