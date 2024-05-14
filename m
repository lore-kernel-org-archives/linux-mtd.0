Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF139C25B75
	for <linux-mtd@archiver.kernel.org>; Tue, 14 May 2024 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJ0VyLYPirS/aiVNwdSoqkZma3Xjj4ZBJrbdAJd9gvc=; b=T8P2mJiJi7VE4a
	U29tGZgLeuUBNd2mZu2/eTIymDKOfQaiSmeLkoNDmprAZHsdJhIjxMFtFH9zgg784Qp93fI9LPp0I
	qXlE16ZiGeBWEpvo5/51lOubKg+03YmWFVmcnIgedgWY6U8RrpqyL8ijXi7e3LJesrbvkNYRQb6Oq
	9LjoACAREmd+eldbekjwczxcR71dpwY/ythy1v8/hXz52j7irCNJS72ITnR3KVBg7ZRIm5uTguAuq
	tAp0QIxhUE6MUBntaqU78Zid6Z27mEksV8rn7c+yPWBpCyrn7wCG4CPTiB4CUkDb0jY4CSSVAV9FB
	Qd2hSNBAgME5fHeskPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sQV-0000000G4tD-2bPd;
	Tue, 14 May 2024 13:42:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6sQQ-0000000G4sB-0VZ3
	for linux-mtd@lists.infradead.org;
	Tue, 14 May 2024 13:42:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <sha@pengutronix.de>)
	id 1s6sQO-00030a-WE; Tue, 14 May 2024 15:42:37 +0200
Received: from [2a0a:edc0:2:b01:1d::c5] (helo=pty.whiteo.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <sha@pengutronix.de>)
	id 1s6sQO-001Mic-JP; Tue, 14 May 2024 15:42:36 +0200
Received: from sha by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <sha@pengutronix.de>)
	id 1s6sQO-00BHmS-1g;
	Tue, 14 May 2024 15:42:36 +0200
Date: Tue, 14 May 2024 15:42:36 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Using nand_change_read_column_op() in nand_onfi_detect()
Message-ID: <ZkNqTKPzfIJe_adv@pengutronix.de>
References: <ZkNPkzKmwMWzbyWJ@pengutronix.de>
 <20240514135316.4940a7b6@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240514135316.4940a7b6@xps-13>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_064238_191923_2135FC62 
X-CRM114-Status: GOOD (  26.19  )
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

On Tue, May 14, 2024 at 01:53:16PM +0200, Miquel Raynal wrote:
> Hi Sascha,
> 
> s.hauer@pengutronix.de wrote on Tue, 14 May 2024 13:48:35 +0200:
> 
> > Hi all,
> > 
> > I am currently stumbling over this in nand_onfi_detect():
> > 
> > 	for (i = 0; i < ONFI_PARAM_PAGES; i++) {
> > 		if (!i)
> > 			ret = nand_read_param_page_op(chip, 0, &pbuf[i],
> > 						      sizeof(*pbuf));
> > 		else if (use_datain)
> > 			ret = nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
> > 						true, false);
> > 		else
> > 			ret = nand_change_read_column_op(chip, sizeof(*pbuf) * i,
> > 							 &pbuf[i], sizeof(*pbuf),
> > 							 true);
> > 		...
> > 	}
> > 
> > nand_change_read_column_op() heavily uses mtd->writesize and bails out
> > with an error when the writesize is 0. mtd->writesize is still
> > uninitialised at that point, it's initialized a few lines further down
> > in the same function. It looks like this code never worked as expected.
> > 
> > Also it seems use_datain is always 0, see 1), so existing code only ever
> > reads the first parameter page.
> > 
> > The same pattern is in nand_jedec_detect() as well.
> > 
> > Not sure what we make from this.
> > 
> > Sascha
> > 
> > 1) https://lore.kernel.org/linux-mtd/20240514103355.817056-1-s.hauer@pengutronix.de/T/#u
> > 
> 
> Sorry for not mentioning that before, I sent two fixes about that:
> https://lore.kernel.org/linux-mtd/20240507160546.130255-1-miquel.raynal@bootlin.com/T/#t

Thanks for noting. This partly fixes my problem, see my mail there.

Sascha

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
