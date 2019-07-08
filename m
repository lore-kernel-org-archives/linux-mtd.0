Return-Path: <SRS0=ZMxb=VF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F498C48BE7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 07:14:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73E2320665
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jul 2019 07:14:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cOVqAJLd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73E2320665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUujQgnhc7nP0+3eFXr0uFDzzhXKoAhYIsGPKndaOeM=; b=cOVqAJLdL8br/O
	dNQp4PE2cFT5/Yz5iB+QVuwpykJ4t48GfhKZiQlqu/R7yGQRT2VswHe3pHiM9LN41SqkwWVgGhLOc
	YKhI0pHb77VrNDK1ESF0CZFrhcGJjvwo6dh5B70maSqikLNzzHIIjTTb7WxBT+KvbFDPcOpSx6FVh
	kz3lKb6KAqSbbmAEF32QaLu1GNhlyxxNBfId0ewOZy6Re70Dwo3ej0Tlh7Lwzmfljyvibs7dhzJuW
	my1neGU8Ho+3u+04lsdpV05daWCaBdjZJ23dTPKp8RcDSjnWpP4TLLb+jGhX6N66yao8jT2yn2PI6
	z/QeF3XvDLJdD4Cqw8uQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hkNr1-00083Q-C4; Mon, 08 Jul 2019 07:14:27 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hkNqx-00082N-KG
 for linux-mtd@lists.infradead.org; Mon, 08 Jul 2019 07:14:25 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1hkNqt-0000Xy-P7; Mon, 08 Jul 2019 09:14:19 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hkNqt-0001y2-4P; Mon, 08 Jul 2019 09:14:19 +0200
Date: Mon, 8 Jul 2019 09:14:19 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: nvmem creates multiple devices with the same name
Message-ID: <20190708071419.eqhajizbipt24xl3@pengutronix.de>
References: <20190521085641.i6g5aijwa5zbolah@pengutronix.de>
 <a9ccac90-7b2f-41da-2ca9-ca3bba52781b@linaro.org>
 <20190521092107.zpdkkhaanzruhqui@pengutronix.de>
 <20190701080642.4oxmw7c3rmwrt5ee@pengutronix.de>
 <45d0cfaf-2511-4b1e-f4da-b67fa9f9e867@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45d0cfaf-2511-4b1e-f4da-b67fa9f9e867@linaro.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:02:28 up 13:12, 24 users,  load average: 0.18, 0.32, 0.32
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190708_001423_667353_705089BB 
X-CRM114-Status: GOOD (  22.06  )
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

On Tue, Jul 02, 2019 at 05:54:54PM +0100, Srinivas Kandagatla wrote:
> Hi Sascha,
> 
> On 01/07/2019 09:06, Sascha Hauer wrote:
> > Hi Srinivas,
> > 
> > On Tue, May 21, 2019 at 11:21:07AM +0200, Sascha Hauer wrote:
> > > On Tue, May 21, 2019 at 10:02:32AM +0100, Srinivas Kandagatla wrote:
> > > > 
> > > > 
> > > > On 21/05/2019 09:56, Sascha Hauer wrote:
> > > > > . Are there any suggestions how to register the nvmem devices
> > > > > with a different name?
> > > > 
> > > > struct nvmem_config provides id field for this purpose, this will be used by
> > > > nvmem to set the device name space along with name field.
> > > 
> > > There's no way for a caller to know a unique name/id combination.
> > > The mtd layer could initialize the id field with the mtd number, but
> > > that would still not guarantee that another caller, like an EEPROM
> > > driver or such, doesn't use the same name/id combination.
> > 
> > This is still an unresolved issue. Do you have any input how we could
> > proceed here?
> 
> Sorry for the delay!
> I think simplest solution would be to check if there is already an nvmem
> provider with the same name before assigning name to the device and then
> append the id in case it exists.
> 
> Let me know if below patch helps the situation so that I can take this in
> next cycle!
> 
> ----------------------------------->cut<----------------------------
>     nvmem: core: Check nvmem device name before adding the same one
> 
>     In some usecases where nvmem names are directly derived from
>     partition names, its likely that different devices might have
>     same partition name.
>     This will be an issue as we will be creating two different
>     nvmem devices with same name and sysfs will not be very happy with that.
> 
>     Simple solution is to check the existance of the nvmem provider with
>     same name and append an id if it exists before creating the device name.

This solution obviously works for me. I am not sure if that's really
what we want as the resulting names in sysfs are not predictable in any
way. In that case we might be better off using mtdx as Boris suggested.

Sascha

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
