Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1840DC4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 11:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hjijX8Diwbu4UYlWisfa+/XMepxEg3rrGp/rpz+m8HM=; b=l2Z411A8At9Ld6yTeB4ON/0wnH
	3PFxSyg2Db/R/ZJ7WAMe1OuyxXPKLbxewxRpnopU+55KN2SK8kN4Vh+VAPTUyKn+E80w8iT3gPO4/
	2sUXaCeseIVZ2XCY0qWSwr2Ica0i2HsOm6xfHYLBeZwT+gAQICaf4M+TPwrMzoUk4GAXHSQK2E+aT
	wsy5E3hfDosLRrq2FrUb5o7O8DeyI+2rDs7p8y3AATPykX8ZS7E0t5of8nJAlBNEs3kUpoZC+3HI4
	hARLaVA5jjGxFJND7C6eIFXtyXxsXKFsp6qMeeW9okJuVjeuN3+VXKjmsN4kmnHAS+lqSCd4TYkQ4
	5q/31/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aG4-002Olr-0w;
	Mon, 27 Nov 2023 11:58:36 +0000
Received: from 0001.3ffe.de ([159.69.201.130] helo=mail.3ffe.de)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7aG1-002OkU-35
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 11:58:35 +0000
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AAA34121;
	Mon, 27 Nov 2023 12:58:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1701086307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CbFVDXbsyDRSOBufcbcpXxnJGkGru0qH4qnT+lIdWmE=;
	b=c0r7iHho/PK8cy43jRgX7jElxPLBHQ+L5tMZv4VpDK8eY8tOLF4XqAMm7IkPILW5Dwqd6P
	eUPvrcQCJnfDWlaJphTc3cz7a5eun6/ZcK6aOx3Y2u/mjRzhDweCz+WKO6VQc4kas7OV6P
	tu+roVno0uDpZtCaD1gUqrlQsMGX2ja2L2cE7VKs58Vlv+WFTgA+46ahn7TyyNC8cXn0BR
	1J/NC4JxhmYcXDeGAvNim6VE7lLZXq0qzlOK1BMC35W87q/gVqwamYHQXirYkclc+ErJ/I
	xELRntHAgWNsJNbEYC5Xm0frEWxutD3SsYTu1NHs31fTvg4fmOhy4OxaKKybYw==
MIME-Version: 1.0
Date: Mon, 27 Nov 2023 12:58:27 +0100
From: Michael Walle <michael@walle.cc>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 tudor.ambarus@linaro.org, pratyush@kernel.org, leoyu@mxic.com.tw,
 jaimeliao@mxic.com.tw
Subject: Re: [PATCH v1 0/2] Hide flash name if it is not set
In-Reply-To: <20231127124948.163224cc@xps-13>
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
 <20231127124948.163224cc@xps-13>
Message-ID: <70b6b105435d891e937a36657fa5debc@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_035834_446039_60629244 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

>> hide flash name if it is not set
> 
> Is this really needed? I'm fine exposing en empty (or "(null)") name. I
> guess it shows to people that the name might be missing somewhere and
> might push people to fix the name instead.
> 
> What's your use case?

An empty string is not a bug. I'm trying to push the part names out of
the kernel and just expose the jedec id.

That being said, the description is really missing the point. See my
previous suggestion:

  The attribute is optional. User space shouldn't rely on it to
  be present or even correct. Instead, user space should read the
  jedec_id attribute.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
