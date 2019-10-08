Return-Path: <SRS0=afzE=YB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94B69C4360C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 07:28:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 662A020640
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 07:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tdYi7k/E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 662A020640
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuu8DIWSql/Rlf7nVIKZ+lX3fd3G6fftcGK3TYrBoMw=; b=tdYi7k/E7+aPU1
	z4We54Mr0sLxQMp4guJokdT7ZHuEoYnFVVVuomQc/LVp/VuYb8KssREZm+eJgKdR3QSKOr/dMudek
	d+51GiRq9+6k2NeXfOrU5mQ+fnsqny2NqsITAtt9BtlAACSJ1z3A4sJeMSXszUVHRtk6gTgKJ31vT
	lKqoGGGDzgtTs0WtNXcjqBPQN/OU8BBQTHS5gKgEC14y6jVWSzD2NoERrIqmMH1eFNOPmmI+U/UUB
	vKXC82cIOul2NwUrhL0gHwMtJEw1iaQS+onaihNg+wBLbrALriWQUmxI6INsv4Jx49ABnmNoNLexg
	cpb/ZYoAotyQi2Yp6a7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHjvE-0004gs-Tu; Tue, 08 Oct 2019 07:28:40 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHjvB-0004gC-5s
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2019 07:28:39 +0000
Received: from dhcp-172-31-174-146.wireless.concordia.ca (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 2A6D028F59E;
 Tue,  8 Oct 2019 08:28:35 +0100 (BST)
Date: Tue, 8 Oct 2019 09:28:32 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: masonccyang@mxic.com.tw
Subject: Re: [PATCH RFC 3/3] mtd: rawnand: Add support Macronix power down mode
Message-ID: <20191008092832.54492696@dhcp-172-31-174-146.wireless.concordia.ca>
In-Reply-To: <OF147D635A.8968CD6B-ON4825848D.00088AD5-4825848D.000B9D06@mxic.com.tw>
References: <1568793387-25199-1-git-send-email-masonccyang@mxic.com.tw>
 <1568793387-25199-3-git-send-email-masonccyang@mxic.com.tw>
 <20191007104501.1b4ed8ed@xps13>
 <OF147D635A.8968CD6B-ON4825848D.00088AD5-4825848D.000B9D06@mxic.com.tw>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_002837_351008_1AF6E52D 
X-CRM114-Status: GOOD (  17.61  )
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
Cc: richard@nod.at, bbrezillon@kernel.org, juliensu@mxic.com.tw,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 frieder.schrempf@kontron.de, marcel.ziswiler@toradex.com,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 tglx@linutronix.de, computersforpeace@gmail.com, dwmw2@infradead.org,
 marek.vasut@gmail.com, vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, 8 Oct 2019 10:06:50 +0800
masonccyang@mxic.com.tw wrote:
   
> > > +   nand_select_target(chip, 0);  
> > 
> > On several NAND controllers there is no way to act on the CS line
> > without actually writing bytes to the NAND chip. So basically this
> > is very likely to not work.  
> 
> any other way to make it work ? GPIO ?
> or just have some comments description here.
> i.e,.
> 
> /* The NAND chip will exit the deep power down mode with #CS toggling, 
>  * please refer to datasheet for the timing requirement of tCRDP and tRDP.
>  */
> 

Good luck with that. As Miquel said, on most NAND controllers
select_target() is a dummy operation that just assigns nand_chip->target
to the specified value but doesn't assert the CS line. You could send a
dummy command here, like a READ_ID, but I guess you need CS to be
asserted for at least 20ns before asserting any other signals (CLE/ALE)
which might be an issue.

> >   
> > > +   ndelay(20);  
> > 
> > Is this delay known somewhere? Is this purely experimental?  
> 
> it's timing requirement tCRDP 20 ns(min) to release device
> from deep power-down mode. 
> You may download datasheet at
> https://www.macronix.com/zh-tw/products/NAND-Flash/SLC-NAND-Flash/Pages/spec.aspx?p=MX30LF4G28AD&m=SLC%20NAND&n=PM2579 

Just looked at the datasheet, and there's actually more than tCRDP:

- you have to make sure you entered power-down state for at least tDPDD
  before you try to wake up the device
- the device goes back to stand-by state tRDP after the CS pin has been
  deasserted.

I guess we can use ndelay() for those, since they happen before/after
the CS pin is asserted/de-asserted. Be careful with ndelay() though,
it's not guaranteed to wait the the time you pass, it can return
before (maybe we should add a helper to deal with that).
Another solution would be to describe CS assertion/de-assertion in
the instruction flow, but that requires patching all exec_op() drivers.

For the tCRDP timing, I think we should use a nand_operation, this way
we can check if the controller is able to deal with dummy CS-assertion
before entering deep-power mode.
In order to do that you'll have to add a NAND_OP_DUMMY_INSTR (or
NAND_OP_DELAY_INSTR), and then have something like:

struct nand_op_instr instrs[] = {
	NAND_OP_DUMMY(tCRDP),
};

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
