Return-Path: <SRS0=22uX=KM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C3D9C433B4
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 17:23:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB48D60FE7
	for <linux-mtd@archiver.kernel.org>; Mon, 17 May 2021 17:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB48D60FE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oCPavPjzoBpV11eeAxxCxGJcdDqFzertbBiB76ynmXM=; b=Cijp/7Tjb681ykx5KcvO56pWl
	C51cGhscdL4zIZtpcvxP74qUc2kaM8ytF/e3qPK1P+c2tj69Y6dAL8RksRezAMoC+lmKjA/TFyAfe
	ZGjxkAzluabmRLaZ71v+foM3+KDowarhnf3rmhwEd0vCmsQ3nq0CP+Q6W1dKW2FKvzZfCijavyF/Q
	VewGKWc6cKKcrRMWBo3yEO38BhGPWCJNNbZxx2VBA6p4Gb4QcVdaO5sa3gg2/fwODL3AMYPXpQm+m
	KQNelNPvZBYDz5AtkOIDprJjWjbfo7UqCkWe3+hIeYhz5stHe8cjFG/znqfIbkFM6q7MUE3a5FAUp
	3wCMkUv6Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ligwP-00Fdvq-IJ; Mon, 17 May 2021 17:22:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ligwL-00Fduv-C7
 for linux-mtd@desiato.infradead.org; Mon, 17 May 2021 17:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=n0XeYHGKPn3tAk4NE5qtwy+82XOwHicwJhKVYd+Quu0=; b=fx2x3ARJsu8AAdl8jhNuP4331v
 lXtMlaTU/fAasfTXNE9pLhj+1OfAtFFzR03yFu+A9aW7ODUpne/UJ7X0xnM1qoZqOqUGEOMLXoBpB
 O1pwsw3GhI+p6YyKiaYosck5y8K+vYgwMkk73EucF0KqWsrYzUPfavZ9jgr/ywosRvECfp5uPfdWA
 f9/xySOPo4tvGWni+c/s/4/4dSgSfPXk18hdXN8v6zxcUv4wT2Q0ihLvQUF9O1M7igAe1QsLa/kVi
 gsSExfvC0o4eLs5V9jynEUv+EpMJZqnIZ3EVGl87HnUHjJ1IDAYtgF6Zatw+E0jMOjiL5zwW1fVVg
 xOvJzV9A==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ligwE-00E0vg-Ac
 for linux-mtd@lists.infradead.org; Mon, 17 May 2021 17:22:00 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 279C422205;
 Mon, 17 May 2021 19:21:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1621272104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0XeYHGKPn3tAk4NE5qtwy+82XOwHicwJhKVYd+Quu0=;
 b=NLt8ILfsYe7YGec6chkTMlUXi8czCzDDngpe0MJc9oiXEHZdKmD7nSj1TOeSwAe4cs56yF
 CfVr8FiXxt5qeluBrTq58lurxX/b6qcaH1XNsvAkETX6Rxfvp+Pwt8SoKquz5PG1aEjwzX
 Ips3+93bYN2qwlryvMcasvdoWSePluE=
MIME-Version: 1.0
Date: Mon, 17 May 2021 19:21:40 +0200
From: Michael Walle <michael@walle.cc>
To: Rob Herring <robh+dt@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, MTD Maling List
 <linux-mtd@lists.infradead.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: mtd: add YAML schema for the generic
 MTD bindings
In-Reply-To: <CAL_JsqK3Wym+ERaQ0np-v8HM39TyNUTAwbhKHPasOPx5xnMNsQ@mail.gmail.com>
References: <20210424110608.15748-3-michael@walle.cc>
 <20210510104411.11267-1-miquel.raynal@bootlin.com>
 <CAL_JsqK3Wym+ERaQ0np-v8HM39TyNUTAwbhKHPasOPx5xnMNsQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <9c95f93c218028898c01970bfd9f3e0a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_102154_550679_308F8014 
X-CRM114-Status: GOOD (  10.36  )
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

Am 2021-05-17 17:12, schrieb Rob Herring:
> On Mon, May 10, 2021 at 5:44 AM Miquel Raynal 
> <miquel.raynal@bootlin.com> wrote:
>> 
>> On Sat, 2021-04-24 at 11:06:05 UTC, Michael Walle wrote:
>> > Convert MTD's common.txt to mtd.yaml.
>> >
>> > Signed-off-by: Michael Walle <michael@walle.cc>
>> > Reviewed-by: Rob Herring <robh@kernel.org>
>> 
>> Applied to 
>> https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git 
>> mtd/next, thanks.
> 
> This is causing a warning in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/spi/spi-mux.example.dt.yaml:
> spi-flash@0: $nodename:0: 'spi-flash@0' does not match '^flash(@.*)?$'
>  From schema:
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml

For reference, the patch which fixes this:
https://lore.kernel.org/linux-devicetree/20210517153946.9502-1-michael@walle.cc/

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
