Return-Path: <SRS0=td2l=V3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33FF1C433FF
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 13:56:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 061DD206E0
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Jul 2019 13:56:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kBngm23i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 061DD206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JSOwCpXtOMvXgG95NhrrujVz7+8a5qaMVCEYhxOocU=; b=kBngm23imkhpoX
	/N5QcJGzzCusPNs1hSvCOyKp9uGaaF9YDh6e5iAqp+V8J+pcwgdPnLJMiu+nCjiTeS58PbwUFeutJ
	q+005zkRYJpupCQu4eqyjqKfxd7CZm/Gbxkx2D5Ody/oVEr7BQccO33GJ6nwy7pNsRR1ceXiMW9+/
	9cq96c4cBHSTq7L2q1gRXKZ82hooiSDZlZy2Jp3lPlbsOb1hzR7Vad7l88x5kN6qDCM2RjVY8EcfP
	rFzkwEvqRff2inG0gbISSq13ayTJq4J4qJIXnBED9bA1jS+LBg5AaMlNj4ulGrv8bIBbyFS6L8UTT
	MsM/bAyyQcmKyk8z783A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsSc1-0000Iq-Ke; Tue, 30 Jul 2019 13:56:21 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsSby-0000IY-Bc
 for linux-mtd@lists.infradead.org; Tue, 30 Jul 2019 13:56:19 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 3260928A109;
 Tue, 30 Jul 2019 14:56:12 +0100 (BST)
Date: Tue, 30 Jul 2019 15:56:09 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2] mtd: rawnand: micron: handle on-die "ECC-off"
 devices correctly
Message-ID: <20190730155609.09331b24@collabora.com>
In-Reply-To: <20190730133748.dzzst6p6u77tvke7@pengutronix.de>
References: <20190729070652.12629-1-m.felsch@pengutronix.de>
 <20190729095715.2de79aea@collabora.com>
 <20190730133748.dzzst6p6u77tvke7@pengutronix.de>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190730_065618_530847_A9588531 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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
Cc: richard.weinberger@gmail.com, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, stable@vger.kernel.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 30 Jul 2019 15:37:48 +0200
Marco Felsch <m.felsch@pengutronix.de> wrote:

> Hi Boris,
> 
> On 19-07-29 09:57, Boris Brezillon wrote:
> > On Mon, 29 Jul 2019 09:06:52 +0200
> > Marco Felsch <m.felsch@pengutronix.de> wrote:
> >   
> > > Some devices are supposed to do not support on-die ECC but experience  
> > 
> > 		^ are not supposed to support  
> 
> Fixed both, thanks. I will keep you rb-tag okay?

Sure.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
