Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641AAC433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Dec 2021 10:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3o6JNwkRuT6w9WAvj9Y0BgX+ExWAN2waRX9oVuB24HM=; b=GNvxHV6GH7lAjc
	MJwMa7KJL8sjGBw+EqQnPaMEht2EJcGYjG/yvLHud+zP2c7ljCOs5vbVyr0/UOUieY/dP56XfpBY3
	6VTDTEWG+bR2JvLDPikaVq9g/HxnwVUfPMMffK3VDG2GkVBDC+UnKvgLtJ/wFMxxeWCzEOmo2CNqg
	J0dU9GxFmOkUNxC5ZQb+x06XT4iQJPf8fQ71eRHL1jIpBg/oKdMQrMf3oDaNwECs7ACDvFJ1YGdL+
	pWFbXdNzb1fFp2UkNq1pg06cJPWYWPiJWqfv5N0m2lROx7iKib6ok5xyZsIoWOjXN8clYT4/0vdcJ
	FRWWBKSqiz2uZF76N+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myAqc-009bwJ-QC; Fri, 17 Dec 2021 10:52:23 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myAqV-009bu2-1k
 for linux-mtd@lists.infradead.org; Fri, 17 Dec 2021 10:52:16 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 21AA51F46C37;
 Fri, 17 Dec 2021 10:52:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639738330; bh=7OW2czdKX3FOlvIcEt9ndAFP8hy/VaLOI/2Yd90oy3o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W74HTJ6QKDRz52ZWbSD+FVBQv/wR3evutz2llqYeH5+ldowDRSPzWYz4FNTxwoPO3
 BFpRavydFEFe2rQuArOnIisUB8rEsBPK8npBUzG7Uj2suLuBMQv1yhXmiZjRviX0Oi
 +p7j59IhqOzqmiaCPF9LnUnZXsxQZiSzWDEK1CfyDmXFSbQ2ASczaWgzH2GEvSQSW8
 Ko6DS1t5Zwg1ZPhur7T+hjIVIb/N7OwUS7PbzWX1FHZ5gg0kZ2POrTKh/8V7rAlRG4
 dTf3i0uZKmxRlCdadqB9yRoxzD2/q9TmNI4D+9dyIgSwmo+aKhN8C1r5Fj3uHoY0+U
 X+gaoWysGFnDA==
Date: Fri, 17 Dec 2021 11:52:06 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>, Mark Brown
 <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>, Michael Walle
 <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Jonathan Corbet <corbet@lwn.net>, Mauro Lima
 <mauro.lima@eclypsium.com>, Alexander Sverdlin
 <alexander.sverdlin@nokia.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Hans-Gert Dahmen
 <hans-gert.dahmen@immu.ne>, linux-mtd@lists.infradead.org,
 linux-spi@vger.kernel.org
Subject: Re: [PATCH v4 2/3] mtd: spi-nor: intel-spi: Convert to SPI MEM
Message-ID: <20211217115206.33da307c@collabora.com>
In-Reply-To: <Ybxotgb927kpCizL@lahna>
References: <20211118130543.11179-1-mika.westerberg@linux.intel.com>
 <20211118130543.11179-3-mika.westerberg@linux.intel.com>
 <20211216115100.448351e4@collabora.com> <Ybtn1VTsspxdIeT8@lahna>
 <20211216174347.69cf611c@collabora.com> <Ybxotgb927kpCizL@lahna>
Organization: Collabora
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_025215_346119_F602F595 
X-CRM114-Status: GOOD (  15.67  )
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

On Fri, 17 Dec 2021 12:38:46 +0200
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

> Hi,
> 
> On Thu, Dec 16, 2021 at 05:43:47PM +0100, Boris Brezillon wrote:
> > Why no just
> > 
> > 	if (iop->mem_op.addr.nbytes != op->addr.nbytes ||
> > 	    iop->mem_op.addr.dtr != op->addr.dtr)
> > 		return false;
> > 
> > then?  
> 
> That would be too simple ;-)
> 
> I'll do this change in v5.

I didn't review the driver thoroughly, but it looks clean an tidy. Feel
free to add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

One more thing. I think it'd be good to implement the dirmap hooks (in
a follow-up series, not here), so you don't have to iterate over the ops
table every time a read/write request is issued. Should be as simple as
storing the exec_op() pointer in the driver-private dirmap pointer, and
calling this function when ->dirmap_{read,write}() is called.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
