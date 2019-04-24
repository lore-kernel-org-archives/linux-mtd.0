Return-Path: <SRS0=0gGT=S2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EA6C10F11
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 07:09:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12C0E2148D
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Apr 2019 07:09:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jve+uTDZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12C0E2148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wPTWNdOdnxNDbOdR1XM2niL3EcbN63lU1PZtgIqZQoY=; b=jve+uTDZxMguxG
	A0lU7Z5p9QlBqmoR10KqkJ4xHQG5XgPGZwidRitpBCuwfFB8oNUJTqWmP7VSeIOvAfJabZUCdHc9C
	vPT8dgrfNNNRbA1G92m82k6qbti9ncQhtb/asmiBCzISR8ybtbmuX1VzaxjnQDGNVWrvdVavGS8b0
	dWSHToiY6J7XZCsVMyZAGjG/Wy9a6roSNc8Lbf+s+JjpJRfto489cjsivbitiF+sdxn+CdxNROqNS
	Ynnth6MBpkWrJpVfR36KsRKUSo9WEHrfBilhwHoy357FoxOcgFkktST29eaZkq/pESHSEG2VjLNOh
	tXCExq8/2DtWkcVEEudw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJC2M-0003Gx-Se; Wed, 24 Apr 2019 07:09:46 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJC2J-0003GO-VR
 for linux-mtd@lists.infradead.org; Wed, 24 Apr 2019 07:09:45 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hJC2I-0002SP-3t; Wed, 24 Apr 2019 09:09:42 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1hJC2G-0008Kh-W7; Wed, 24 Apr 2019 09:09:41 +0200
Date: Wed, 24 Apr 2019 09:09:40 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 14/14] mtd: rawnand: gpmi: Implement exec_op
Message-ID: <20190424070940.gonhzo6bwbcljplq@pengutronix.de>
References: <20190409113421.3037-1-s.hauer@pengutronix.de>
 <20190409113421.3037-15-s.hauer@pengutronix.de>
 <20190417123355.529297e2@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190417123355.529297e2@xps13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:05:27 up 36 days, 18:16, 83 users,  load average: 1.67, 1.28, 1.20
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190424_000944_169793_1E2F2795 
X-CRM114-Status: GOOD (  13.25  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kernel@pengutronix.de, Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Vinod Koul <vkoul@kernel.org>,
 linux-mtd@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>,
 Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


Hi Miquel,

Thanks for the review. I fixed all of it.

On Wed, Apr 17, 2019 at 12:33:55PM +0200, Miquel Raynal wrote:
> Hi Sascha,
> 
> > +		case NAND_OP_DATA_IN_INSTR:
> > +			if (!instr->ctx.data.len)
> > +				break;
> > +			buf_read = instr->ctx.data.buf.in;
> > +			buf_len = instr->ctx.data.len;
> > +			nbufs++;
> > +
> > +			desc = gpmi_chain_data_read(this, buf_read, buf_len,
> > +						   &direct);
> > +			break;
> > +		}
> 
> So there is no limitation for the controller in terms of
> address/data cycles that can be asserted in one go?

No I think not, at least not a practical one. I can't find anything
about it in the reference manual.

Where is your question aiming at?

Sascha


-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
