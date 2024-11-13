Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69C0D41C35
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Nov 2024 10:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eeZFxzQm0XflGwaLVMc6copWq1YAtDuUZgoISpRIpg0=; b=XcmVzYoKEAGYVI
	zqmEUzDBuHNZN4ZdmXmZ3yvknPFkj6LhiyjKMN6KjWEuIsElL6Iafa/ExrgPiEKVTlmnmSiinr2tO
	XxWjcxYmWfnuECsaonS4fCtNa+/H67eutAtsLT2z9feWFLqsAGtV6UCki9MI8q7sFimbORntn9m/R
	yXoI5YEG9FKSmj9bcGUJf5a976JHgIHjWiOkuptM0L4ouZRIPBXKus5pe1jNlxXAJIHuyiQHN+YeZ
	5sp+Gs3L8Dxwgt2JL3IMZO+EMZ4Sig2p4gf7l+KVKen43YFpx6XF70KzFEUQJNa0riCabgBRZLcAS
	9mz4Qm9ksV1Vz8atn49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBB1y-00000006Vs1-41mW;
	Wed, 13 Nov 2024 10:55:26 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBB1v-00000006VrA-336B
	for linux-mtd@lists.infradead.org;
	Wed, 13 Nov 2024 10:55:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8F0F20003;
	Wed, 13 Nov 2024 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731495322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/pBLww4YxC/M6fY3ALfaV/Z1B7bVr4NbB9uCxlvcMow=;
	b=NwiLAHAk619Wvb/I387f3vNgmblZX/1Jpd9do/GD1ob9WShm8mYheYNSG2hqXY6ANsn3yG
	Q8zkypC5fFQ5YPQUVI8OBuZ76k/ld8bjgzXyl+n46YRtvb+S5vk6YV2AFtYy76V17yrbks
	D5bv6ULxy1fWxYe0jWv1dJzr+5Vv4TwXiiF2LjDqsAfD1tu1tT9K8v6DsCIAS0Xeh+Jhdm
	vMjQeh8h5V29x+ehi0Ti1qL0Mv+DwQbOuCEcaGiWzqnNWpg6FGfiUBB/wq5w8y58KqVsgJ
	M0r0slN/3PxWrlyQtBor5YoNwp0++qcPogRBJwbliq54K5f2fcqiI4OqAYBj9w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Santosh Shilimkar <ssantosh@kernel.org>,  Krzysztof Kozlowski
 <krzk@kernel.org>,  Richard Weinberger <richard@nod.at>,  Vignesh
 Raghavendra <vigneshr@ti.com>,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  Herve Codina <herve.codina@bootlin.com>,
  Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 3/7] memory: ti-aemif: Export aemif_*_cs_timings()
In-Reply-To: <20241113094938.44817-4-bastien.curutchet@bootlin.com> (Bastien
	Curutchet's message of "Wed, 13 Nov 2024 10:49:34 +0100")
References: <20241113094938.44817-1-bastien.curutchet@bootlin.com>
	<20241113094938.44817-4-bastien.curutchet@bootlin.com>
User-Agent: mu4e 1.12.1; emacs 29.4
Date: Wed, 13 Nov 2024 11:55:21 +0100
Message-ID: <874j4bqu7a.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_025523_917151_C4CA91EF 
X-CRM114-Status: UNSURE (   6.87  )
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

On 13/11/2024 at 10:49:34 +01, Bastien Curutchet <bastien.curutchet@bootlin.com> wrote:

> Export the aemif_set_cs_timing() and aemif_check_cs_timing() symbols so
> they can be used by other drivers
>
> Add a mutex to protect the CS configuration register from concurrent
> accesses between the AEMIF and its 'children'.

I'll let Krzysztof judge whether it is okay to use EXPORT_SYMBOL instead
of EXPORT_SYMBOL_GPL here, but otherwise looks ok to me.

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
