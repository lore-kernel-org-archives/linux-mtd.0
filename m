Return-Path: <SRS0=0U+/=U6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56CC9C0650E
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 08:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 295CD20673
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Jul 2019 08:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SeCJTMdE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 295CD20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lm8olYH38W67LguPDUthF5/YINIrIEJaPv3XYz6eP28=; b=SeCJTMdElrg83F
	QUytkYsK8jdXGmbloObEcWHLgv2Ou/G0auTQQ7XB5ONWJ2Ib7dp35suoy4e6HGJyhdurUPmqSNm4E
	cSrrRkZLOxvYsCkIlOnPmHg7SJh67CAwuAU0ncbzJ3qZAl+ZtJZofzgv518q1pp0DlDnsC7yyxgFw
	d5p3oPxl/42b5pzV6+bi3DtJGHhRRYiFJ3yyqdC4aBa4hBkyuOVdCf6ANiBoVdPnVwKYyOBkY6kN6
	Y3kzreYkbWA8xyCB8+qmCo1Ql3ERCklbYTtXClpYtFQ8RqPxYMjXvQppmcb0qb6Y3xA6bMX9qBxKG
	AwHpojJjzHU5YUwgFRdw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hhrKr-00086N-0J; Mon, 01 Jul 2019 08:06:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hhrKn-00085W-Er
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2019 08:06:46 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hhrKm-0007en-1Q; Mon, 01 Jul 2019 10:06:44 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hhrKk-0003dc-Sk; Mon, 01 Jul 2019 10:06:42 +0200
Date: Mon, 1 Jul 2019 10:06:42 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: nvmem creates multiple devices with the same name
Message-ID: <20190701080642.4oxmw7c3rmwrt5ee@pengutronix.de>
References: <20190521085641.i6g5aijwa5zbolah@pengutronix.de>
 <a9ccac90-7b2f-41da-2ca9-ca3bba52781b@linaro.org>
 <20190521092107.zpdkkhaanzruhqui@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190521092107.zpdkkhaanzruhqui@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 10:05:36 up 44 days, 14:23, 90 users,  load average: 0.31, 0.22, 0.16
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190701_010645_499806_CD8ABDD3 
X-CRM114-Status: GOOD (  15.35  )
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Srinivas,

On Tue, May 21, 2019 at 11:21:07AM +0200, Sascha Hauer wrote:
> On Tue, May 21, 2019 at 10:02:32AM +0100, Srinivas Kandagatla wrote:
> > 
> > 
> > On 21/05/2019 09:56, Sascha Hauer wrote:
> > > . Are there any suggestions how to register the nvmem devices
> > > with a different name?
> > 
> > struct nvmem_config provides id field for this purpose, this will be used by
> > nvmem to set the device name space along with name field.
> 
> There's no way for a caller to know a unique name/id combination.
> The mtd layer could initialize the id field with the mtd number, but
> that would still not guarantee that another caller, like an EEPROM
> driver or such, doesn't use the same name/id combination.

This is still an unresolved issue. Do you have any input how we could
proceed here?

Thanks
 Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
