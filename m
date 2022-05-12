Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EF5C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 12 May 2022 22:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sF0L/qVJTvMpj5ob0Ru05+61DkiMfpx9gXXgXR+ro7I=; b=ssHMC0ND82xdtN+Kk3brjAPhIR
	22QrvIyqKo0KRWiuuXOl9CW7xJgv94jybr+VmLos7eKlGJK5nYZ2X6daIhwG97PN78FQVe/HTChXq
	azCpyZKATNjYhCGSI8YihyysTLhgg4QMfuTP51xDQmrDt2P3JMvpn+Ui/9C4phwLeOjF2eEXRqDmU
	EoUn5cwd+MyS0u89bxVSg3OZuyeZVav49jSV720dZTgUQYVf64n+prthnMygcWNBKA3h3owFb0NXV
	ePFg1Se/vyY4KwdruRye4ykR6Ky59Q7amLtFzJWBcCSSKhyYUJrcKHO2RJZXczfvt51RXbOAcNcrx
	p8HjpZ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npH5C-00DiNs-GI; Thu, 12 May 2022 22:14:54 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npH59-00DiN3-DN
 for linux-mtd@lists.infradead.org; Thu, 12 May 2022 22:14:52 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id E5B052223A;
 Fri, 13 May 2022 00:14:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1652393689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2rvxiKfGTzGeBklEFYJuoi9aHzMWv5JsfdyxSKIH8k=;
 b=H9gjQrjLom9ZdJ3TQgUilC+XfkQmfrmDrwgCB1vDKdteQST8REl94856+eb9R47zstR0mB
 9WSjERm+6zCtotiNZMhMQYYWMgrbCI1FVKMdCgglLxlrTYZuhjeBZrWpa1uBAO54ybnwkP
 IkJhi+ciHXk1BMfyhO45lSBUluljJ9I=
MIME-Version: 1.0
Date: Fri, 13 May 2022 00:14:48 +0200
From: Michael Walle <michael@walle.cc>
To: tkuw584924@gmail.com
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, p.yadav@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
Subject: Re: [PATCH v15 6/8] mtd: spi-nor: Retain nor->addr_width at 4BAIT
 parse
In-Reply-To: <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
References: <cover.1652063152.git.Takahiro.Kuwano@infineon.com>
 <dac51af409be97ab316a9de5c0297359df7d2e2d.1652063152.git.Takahiro.Kuwano@infineon.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <99cf396f9210279e28dc1656a652efb4@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_151451_657651_ECF7FA26 
X-CRM114-Status: UNSURE (   8.49  )
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

Am 2022-05-10 00:10, schrieb tkuw584924@gmail.com:
> From: Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
> 
> In 4BAIT parse, keep nor->params->addr_width because it may be used as
> current address mode in SMPT parse later on.

Mh I'm not sure this is needed at all.

SFDP spec says
   Variable address length (the current setting of the address
   length mode defines the address length)

and
   When the length is defined as variable, the software or hardware
   controlling the memory is aware of the address length mode last
   set in the memory device and this same length of address.

We don't set any address mode until all the SFDP parsing is
over. Therefore we should always be in 3 byte mode, no?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
