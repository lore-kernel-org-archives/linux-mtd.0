Return-Path: <SRS0=HQmt=IN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82E70C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 10:45:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B19564E6B
	for <linux-mtd@archiver.kernel.org>; Mon, 15 Mar 2021 10:45:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B19564E6B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OvZItixGqfaxDtkFglr9MBzIBSc/7v12fPeuEb/U+aA=; b=JCG7kP3Yji2QakOdMLtwEkDrv
	eIniDUtTVdzbmRKAlgcB8/kDsyNhZd9mQPJQPji6Sz0momFS+oycLq5pqLhgAiG5wQX9cAsOX6gyJ
	p+rRp+tj6dFcV5AT5TQdjh3UCBHcXsRga+2kTfXmWZXHtBgJkMaULVTluvmSFLLuMGL0uV3rsdMw8
	Xx3zWErRKhpNriIq7hH42WEch1OeSG5Z6Rmh2f+2FhwzkOLGy0+ATBWFychBKydDBCyvOPZTnfjaS
	5GRHK+xWd7qO5ykzzCSks5tBeL50teY2piGygrzjdDrEVdMKp1JufPN5DXON5yy8b98J5ZzhiWoZZ
	BIqrXqYag==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLkhL-00FY13-N4; Mon, 15 Mar 2021 10:43:45 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLkhB-00FXyd-UX
 for linux-mtd@lists.infradead.org; Mon, 15 Mar 2021 10:43:36 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1C50A2223A;
 Mon, 15 Mar 2021 11:43:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615805013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jCM+EVVq0CWc5+9HvUpHIQ1PrIbojDXOLOIwgPt/xc8=;
 b=wAVGM/qmN+S3ZAaoNfPf7QsBV3haTUQGT23CnQ000vPpFI9mzZD1zEz21yWWb3lpaN3wTq
 N/3Rvt4H7hjTn7hLiUIJtKe16qRx1Ze5hUUTJJQkpoxKq8DoHx4D6NtXn93DqwXCrewDRZ
 4yX7E9A0k8yjuTY4XLJ6JQkHKfjPcrQ=
MIME-Version: 1.0
Date: Mon, 15 Mar 2021 11:43:32 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v4 2/4] mtd: spi-nor: implement OTP support for Winbond
 and similar flashes
In-Reply-To: <5f820284-8c48-e111-c46d-f53bb5ed17cb@microchip.com>
References: <20210306000535.9890-1-michael@walle.cc>
 <20210306000535.9890-3-michael@walle.cc>
 <5f820284-8c48-e111-c46d-f53bb5ed17cb@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0ef810128e33f581d05ee394893e683d@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_104335_211393_373C7018 
X-CRM114-Status: UNSURE (   9.93  )
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

Am 2021-03-15 09:31, schrieb Tudor.Ambarus@microchip.com:
> On 3/6/21 2:05 AM, Michael Walle wrote:
>> +       nor->dirmap.rdesc = NULL;
> 
> why can't we use dirmap?

Dirmap is used if the controller supports (transparent)
memory mapped access, right?

As you see I'm not familiar with that, nor does my
controller has support for it, well at least the driver,
the controller supports it actually.

But it also seems like how the flash is accessed is
set up in

   spi_nor_probe()
     spi_nor_create_read_dirmap()

And because the read opcode has to be changed, that isn't
possible.

Plese correct me if I'm wrong.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
