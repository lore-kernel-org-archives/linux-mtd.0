Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A7C04A68
	for <linux-mtd@archiver.kernel.org>; Thu, 28 Jul 2022 13:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+RVLLJa6gGlio9MKC4idv4IZ64IoJ3nMh5W0D7jY0c=; b=MCBnLw+mEmyxNNGVkd+7kzv0/B
	Tr4MdAoaFHqwr5f8acSN5nVzpVXn0SRnaVpCqmhT5OmlFfkszZYL1Fkc8u0PNBmE8YJ8uWl3fMMxA
	acZwX5KvLCMqGdqt/VVk+08jZGIOlRYlbZjoeq3DhF5+XoGiyu2CxdL4/iX4XK872m8TWFDcqvXQ6
	O/+4m4L+BtOd3R/Ek9Zf+MDIImn0dggzBuUOjiyHMefNJyxym865oWvFKdkzXs8f18KirkoCTzzJY
	8fCIGLT9QgyWtP2dqLlzQIjW6+DChr+mz93k+yaD1lYIZF3V0wGdLmgyl1PWxOMa6QEBnxXnqJ2xA
	f+9DKxMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH3JL-009YgP-9o; Thu, 28 Jul 2022 13:12:19 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH3JI-009Ybl-1B
	for linux-mtd@lists.infradead.org; Thu, 28 Jul 2022 13:12:17 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id 4F0F12223A;
	Thu, 28 Jul 2022 15:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1659013930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+AM9Ba+r0a5Evo71nndoB7O7xd8smBijytRfC8ILpJU=;
	b=dVhtB81cBL1x5UE2KhrE4NpC71/op+Y/56XkmATxClbo2yLLQD565meQ3DwMkXc5uCMI8O
	/iinNdftYB70nUEbv4jIG3608GQozd5KNeh4qgrtVXbk6rYb+2CXer6rg3nxbaZRy2+83V
	PjdsAS6kh9B8+UPJn+usOrE88Jle6qA=
MIME-Version: 1.0
Date: Thu, 28 Jul 2022 15:12:10 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, quic_c_sbhanu@quicinc.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: introduce SNOR_ID3()
In-Reply-To: <41e6b74d-6973-60da-1556-82a1e879ffd4@microchip.com>
References: <20220510140232.3519184-1-michael@walle.cc>
 <20220510140232.3519184-2-michael@walle.cc>
 <160ddac1-6d0a-c922-1380-09e7823a285e@microchip.com>
 <41e6b74d-6973-60da-1556-82a1e879ffd4@microchip.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <ff6ffb3f8e77b29b44883d30c9b4385e@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_061216_261874_A6AE7EF9 
X-CRM114-Status: UNSURE (   6.11  )
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

>>> +#define SNOR_ID3(_jedec_id)
> 
> How about SFDP_ID3 and SFDP_ID6 instead?

Yes, probably a better name. I was also thinking about splitting
the id in vendor, device and additional bytes. But I haven't
thought of the actual implementation that much. Such as:

#define SFDP_ID(<u8 vid>, <u16 did>, <variable aux bytes>)
#define SFDP_ID_FULL(<num_continuation_code>, <u8 vid>, <u16 did>, 
<variable aux bytes>)

Couldn't make up a better name than that _FULL for now. Happy to hear
suggestions :)

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
