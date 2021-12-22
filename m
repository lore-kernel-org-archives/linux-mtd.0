Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628D3C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Dec 2021 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Subject:References:To:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cZSi/GO53VIji7HTY52GpHG/HABGRUa4vuNFmk9n2pA=; b=N6lMqxmahb+sjX
	yBgLtJu/vzZgN6j0mDhh8G7Enwn79yakQewrYUTsF+LfyolC32F/bLShylfJmVvBpnnQq9A4tOOYd
	3IXPb3rHdnrsruZdLLb9+yLDqz8NheGJMBSHVZiQhj8l22dOYqhM+ryOZq7nOTLN54zXkH+/rebtW
	I2tcmu4C6eCjIvYMMSIC4pX/RVrScKwAQmXMh0owP3UmdIQYQsYGgEmmhPWWL2pMuNpWW/wZ84Hxj
	vLG80YTe3hL2tES+x2rTmU2hFL/pedBM+UgD2jJFnWkP2SkKMQJsEDVbfnZ2zerszE2mPqE1i+4WT
	Ix8A7FbNw4PZchzUnRcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzzwJ-00A90H-K1; Wed, 22 Dec 2021 11:37:47 +0000
Received: from mail.fmat.eu ([2a03:4000:21:70a:b8c2:1eff:fea5:fc02])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzzwE-00A8zZ-Ka
 for linux-mtd@lists.infradead.org; Wed, 22 Dec 2021 11:37:44 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id 3E3FCE0185
 for <linux-mtd@lists.infradead.org>; Wed, 22 Dec 2021 12:27:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1640172449;
 bh=z0U29W7tdWnMn3uSl/cXJ2pZy+dTed1DE1QfzDL6A5M=;
 h=Date:To:References:Subject:From:In-Reply-To:From;
 b=w0x9fm7dEo5SZE8DgWLbHV/RxIk9qDawAvVJUAdeEcQo/09u5m22y0EBH22XbsClS
 gYSKPbS6R3jC2dDLydxt0fYOYmx/wlctm9rWsSH1Fw+ZSOpCYHpJ+f8enUIrVKiKSb
 Tm/yjuaJO3uXSi34i9Nf7BMdh3nHA7PJHw1uvZcV5vkIAL7MI8bczvTIkaQi+N+sVj
 1MGMBUxWq1SqphyuMwxPy0xhCFBQR9ttVBso5M/JNLz3VoFnOJntajd41clVkh8RtG
 OiCCtWvmWPX+HyW+vkVK5CIItSbGVOkcvGFrlsNmZauI8XoEsL5LO6matdNFySauZ3
 OqqEi1qxM+zKA==
Message-ID: <b4d0a8de-0cfa-7e18-b7a7-55e4279228d2@matouschek.org>
Date: Wed, 22 Dec 2021 12:27:26 +0100
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <20210702195235.555620-1-felix@matouschek.org>
Subject: Re: [PATCH] mtd: spinand: Add support for XTX XT26G0xA
Content-Language: en-US
From: Felix Matouschek <felix@matouschek.org>
In-Reply-To: <20210702195235.555620-1-felix@matouschek.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_033743_041831_0610FFB1 
X-CRM114-Status: UNSURE (   6.08  )
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

Any comments on this one?

Thanks,
Felix

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
