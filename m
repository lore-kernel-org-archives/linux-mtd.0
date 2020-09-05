Return-Path: <SRS0=qoSA=CO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE8E5C433E2
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 06:14:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A3D7208DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 06:14:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sLCxyTY4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="achJHD1B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A3D7208DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5ZlNGN9NclDy3O1m+E0wlSVTk5svHHyzhEUKpa8dhTI=; b=sLCxyTY4lpJPffEOaL9L0d0WS
	KivEiSrzLlElXpCnvl2Axg+2yw8uJpOQuYtiI/NJWP5jbWoQA2BAIc01VIfuWyz5LrX3u6BE61FM2
	loNhjbGOQDg71Hs4pDklvOV+N6hgWB67MAYabh4+mKS2LL5MvbZSICqi9dDYTUjNRB3pY6PEXCQjP
	vv1yalNNPLa5oMfUXxCEjfXg1WxCqHXJ22fZw66pSU0kFqahrMJPD9KG4LxWmMpoGEFdupbskVjiW
	bvYaMochRn5ypnCB48zd9fPlxwx8BMb8p1G5Q7mCW022kRJEt3JP66wWK6LUy1TBemXqSZMds3OBi
	4uRdJ1mow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kERSN-0008MJ-PB; Sat, 05 Sep 2020 06:13:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kERSK-0008L5-4X; Sat, 05 Sep 2020 06:13:44 +0000
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E892208DB;
 Sat,  5 Sep 2020 06:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599286423;
 bh=gF8z6IMg04Hohcdpu5CQHq7CjyqhOzXb2nz5Nbkx1o4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=achJHD1BwLksR8o/3miSjDGfRBwoIDvs4LWt4X1743GTvJxhe2NpLD9tGmHdHBuap
 VhvwptGRzDRwALRMnI8x06RVKtiC0LpmKbvCWr4cN8ufUaf4ZZJsXFrmJKXS3048VR
 FlR/QGQKpLqrzk6LgGtWPMa7daEsg7N/cGOJTSHQ=
Date: Sat, 5 Sep 2020 14:13:37 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 09/19] arm64: dts: imx8mm-evk: Align pin configuration
 group names with schema
Message-ID: <20200905061336.GC9261@dragon>
References: <20200828164750.10377-1-krzk@kernel.org>
 <20200828164750.10377-10-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200828164750.10377-10-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_021344_243668_270D0310 
X-CRM114-Status: GOOD (  11.49  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Anson Huang <Anson.Huang@nxp.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Han Xu <han.xu@nxp.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 28, 2020 at 06:47:40PM +0200, Krzysztof Kozlowski wrote:
> Device tree schema expects pin configuration groups to end with 'grp'
> suffix, otherwise dtbs_check complain with a warning like:
> 
>     ... do not match any of the regexes: 'grp$', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied #9 ~ #19, thanks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
