Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B0CCDB46E
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 10:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zGzGK2WNALZY1F8SZizWDU2qjfLNsLq8CHKs1OjjCEI=; b=wNUWV42NTLslzD
	+OIMjXPkEbks0vT9UNwx9USkhw0RpyfVvvegpl+H7zzJb1Qn4AqTWwiislSlxiUkquK7QXMfCnoqp
	sVgCvEEvOoRo3MMZfxLxuB+ccf7H9y5LAZxhlvO+lD7YfSp0p/h3Rpe0my6hm7+HsFWx4oz/22HeC
	GjIeSLvG1lfFFew2hI7Bkd2htpOYH6pZkfOpa0AXvrrnvV55lpyNt62+I75bIbbFcltf9n1MImoQu
	2PeIT67F744Bvoiz9dWAsBmx88HmQNkkNUK8GrgTmN9BU9G/ZzLUzchDzwxZl+cWBxyBMFOsUU1X3
	gJTVnzCd4vxZ6p6ZzYOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsaK-000WCB-35;
	Thu, 12 Oct 2023 10:06:28 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqsaI-000WAt-1Z
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 10:06:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DF80ACE2789;
	Thu, 12 Oct 2023 10:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30472C433C8;
	Thu, 12 Oct 2023 10:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697105182;
	bh=s/sZcf7nbHGgtGqnIcOjvr3LFAA8WfuaI+wbvCv/HyI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kZGe/FHAs9+4LTHdzHXm0+1PGY7i3nPHVD57gn6TDSc2Bb1npF2C35wRQ82wFC6m4
	 7cQS8FtUVc68v7i/MR/EnMNBVHJOfb3bW5ZLNE1D3PrsSEnCFZmXaUB1/34FQ25f7B
	 RzP7ryErVzHM4X7ovAsfcAlKeVNY4I9tF+a/6BvhNvc8jYH0ryJAXftTtgTnjJKZqU
	 eELZXoaLMm9NIhfJy0mnyc1l3bRdW9vMs0b8/eQ3DDxXe0xECnvDSe13tTTM09Fs7G
	 Fg5/qSG+nXV82eAvhnlXrU1MMKRzS4srhjnwPWmrNuwCd308hN8AYAz+SiLiVqJZuD
	 TExicGO5tUv8A==
From: Pratyush Yadav <pratyush@kernel.org>
To: Michael Walle <michael@walle.cc>
Cc: Md Sadre Alam <quic_mdalam@quicinc.com>,  tudor.ambarus@linaro.org,
  pratyush@kernel.org,  miquel.raynal@bootlin.com,  richard@nod.at,
  vigneshr@ti.com,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  quic_srichara@quicinc.com,
  quic_varada@quicinc.com
Subject: Re: [PATCH] mtd: spi-nor: Ensure operation completion before shutdown
In-Reply-To: <bb12db1205a5d1bfbee341d23defe0be@walle.cc> (Michael Walle's
	message of "Thu, 12 Oct 2023 11:11:09 +0200")
References: <20231012055148.2445303-1-quic_mdalam@quicinc.com>
	<bb12db1205a5d1bfbee341d23defe0be@walle.cc>
Date: Thu, 12 Oct 2023 12:06:19 +0200
Message-ID: <mafs034ygm9yc.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_030626_718486_669F94B8 
X-CRM114-Status: UNSURE (   9.42  )
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

On Thu, Oct 12 2023, Michael Walle wrote:

> Hi,
>
> Am 2023-10-12 07:51, schrieb Md Sadre Alam:
>> Ensure that there are no pending spi operation inprogress
>> when system halts.
>
> What operation might be in progress here? Did you encounter some problems?
> Please explain it in more detail in the commit message.

+1

Ideally we should never reach this function with a pending operation. I
think we should do a proper wait in the place we did the operation that
needs waiting rather than here. That would make sure operations other
than shutdown, like reads, also work properly.

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
