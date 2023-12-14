Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683CEC4332F
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Dec 2023 10:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pdk5/LN7LU+C2tU088lGjXftYHt84t55U5AbcJiwvhE=; b=nZhVUlJzKJ+ZuA/6YPzKQZIPIw
	JXa4hebxjYS1gj+dBoMXi+9267+2Tn7Db/bbskGMkdt5TGyIxq+S5LPkAbqwS1hDa/l6BBW8C4UZh
	v7yIx3p1zuH+m265PCEBJTtq5a44Kp7pyIwIhcEtcz0xb3X0Jij2qomD6IujjfMwAtEE1xSE5gYc1
	jIq8unktXg8nCZmNIKhi/r4SS0pjLgzij7qYhg5MqYYVLkS2tH7HXkiag2Yzx96QFZwIj0nmrX39t
	ZYyTHJ8wxq2pPPMX4uNJtVHf+9xxOkiB6D3o3mh0Jikg4oeW0WhoqK80i0BzXYM4gEdGrL+Ae8ynB
	i1XNXD8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDifD-00HQfJ-1y;
	Thu, 14 Dec 2023 10:09:55 +0000
Received: from 0001.3ffe.de ([2a01:4f8:c0c:9d57::1] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDifB-00HQe7-0R
	for linux-mtd@lists.infradead.org;
	Thu, 14 Dec 2023 10:09:54 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4A0913B9;
	Thu, 14 Dec 2023 11:09:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1702548590;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FjYJCY1JnpTMQzNupjGdDq9Rjc5USrC21kT4+vZBfpU=;
	b=M/jbqpeRcQxLBbmMq+EYj4SyO0mM506KVz1vpqPILWAAMi3H2lP6xf1oq+xvtoNaBVpvfk
	ZLjSaWnf3X6uBAZFfRIyJUQcIdbYKVbZ+sE0Znf+bUxxGOHPFEGr6XpSgasn6wVS0mg9bW
	sCM3eiVMEIompYZDOIZMsnUglyKk847f26t1+umZYqdR/wCEledpKT4TqdUZdHGjZzLjb9
	ee7LyXsc9QVosfp1E6X9lBYhFpEv6f04Nth4JuuPuPnPli0L54F4e+zYlJCMdzLLJlOnJF
	hgdFjVJ1z2H2RR0puabUb2iHJFtFpmzhR6qiV3/KGwMeNPOdif9GQ25PTObrkQ==
MIME-Version: 1.0
Date: Thu, 14 Dec 2023 11:09:50 +0100
From: Michael Walle <michael@walle.cc>
To: liao jaime <jaimeliao.tw@gmail.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org,
 pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v2 1/1] mtd: spi-nor: sfdp: Get the 1-1-8 protocol from
 BFPT
In-Reply-To: <CAAQoYR=+gEwUuw-CbWio7-h9jAP4ESQshF_Ao=Q+pU5jhpejDg@mail.gmail.com>
References: <20231214073344.66644-1-jaimeliao.tw@gmail.com>
 <20231214073344.66644-2-jaimeliao.tw@gmail.com>
 <d0d1171b2fd3e77774cffcd7112653aa@walle.cc>
 <CAAQoYR=+gEwUuw-CbWio7-h9jAP4ESQshF_Ao=Q+pU5jhpejDg@mail.gmail.com>
Message-ID: <7eae51cda742c5e36d4a615a03bbe198@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_020953_325434_F8E8D35D 
X-CRM114-Status: UNSURE (   8.20  )
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

>> > From: JaimeLiao <jaimeliao@mxic.com.tw>
>> >
>> > BFPT 17th DWORD contains the informations about 1-1-8,
>> > Parse BFPT 17 DWORD instruction to determine
>> > whether flash support 1-1-8, and set its dummy cycle
>> > accordingly.
>> >
>> > Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
>> 
>> Reviewed-by: Michael Walle <michael@walle.cc>
>> 
>> > ---
>> 
>> no need for a 0/N cover letter just for the changelog. That can
>> be included here below the "---".
>> 
>> And you can also keep my Rb tag.
> Got it.
> Would this version be accepted or should I send a new one?

No need for a new one. Just for your future patches.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
