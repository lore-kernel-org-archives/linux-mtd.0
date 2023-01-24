Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9EAC38142
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Jan 2023 08:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ktQKHQSOH6ar62zshEcdwa41jRVwJEkFI6UHz79RSPo=; b=4ndOUCNNemz73k
	GITXubGFcZaA5GCrlErGCmLaQmgy+hThYV7IJ3LWOPw/gNUC+ojOqDgGhNaZ4xA6dpjlTptY2sj9U
	BY8+La8RK4UVpucQMrsY8q8R2D4Tpc2UcllVPq+J/cJ5E5fjNN5W6E9Vpdl9nhVd2h241SU4yGgbS
	QWEhA323Kz/oVaCQqJbPuOLrH2FXSW8fKkXsgNqw3JEsVDESHTL0baMSynAobnk8y8verujyneuCm
	sUeoJABg5iewTyF6ShP+WGDCeGh24AjVH/+98V1c6VtADB9oBhS3/orPcnK+rFz1k05LES1YwrhRQ
	kmiIyfS9zN+FrjyQko+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEsd-002mVs-Rc; Tue, 24 Jan 2023 08:42:11 +0000
Received: from smtp-out-06.comm2000.it ([212.97.32.74])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKEsV-002mUP-NG
	for linux-mtd@lists.infradead.org; Tue, 24 Jan 2023 08:42:05 +0000
Received: from francesco-nb.int.toradex.com (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: francesco@dolcini.it)
	by smtp-out-06.comm2000.it (Postfix) with ESMTPSA id A6095562BC8;
	Tue, 24 Jan 2023 09:41:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
	s=mailsrv; t=1674549706;
	bh=kR7BaXHU+wnY37cKafti41b8P1PfU7Pryz9AuILmwEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eUoT0PxaIDi9B5slisnkIpWEBVFjN/zF41pdCU8uJGqYTi9Yg0gI7gUWl8t3oJYyw
	 jfwq0kx3+UZDLB80hsWtfVxoEK0ckneSBxLTijne3BKl4zGD3m6Vu/Qti/Q94p6YI4
	 Q12cfIJqevTytlIhoDI3Ud7xrXFekMGfZ5u1ooTxCL0GhHmBFtbjDMwE4BE7Ntpcqs
	 v6ZGQtGcpIiM9QpvMCuRsWvIdJ62rRAh2nhw2NhGuaUXOScxuiXpSaz2/nkxh124hz
	 bUh477FA40XK2z9904eA4002QuRGUDt2Y4znML9Fr9rVCZJtoF0U6GH985i4E3A7zR
	 CsoW56nv6nEwA==
Date: Tue, 24 Jan 2023 09:41:41 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, Francesco Dolcini <francesco@dolcini.it>,
	Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de,
	Marcel Ziswiler <marcel.ziswiler@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH v1 1/3] fdt: validate/fix cells count on mtdpart fixup
Message-ID: <Y8+ZxTu05BEu5knS@francesco-nb.int.toradex.com>
References: <20230113184547.487322-1-francesco@dolcini.it>
 <20230113184547.487322-2-francesco@dolcini.it>
 <9ed3b4e4-7336-baf3-5a5a-8e77543e210d@denx.de>
 <Y8VdR4iCcuj9/rT+@francesco-nb.int.toradex.com>
 <06279fe3-a3b3-f3c4-276f-7cd0d4773875@denx.de>
 <Y8WQsIHXEDuJJuLd@francesco-nb.int.toradex.com>
 <0584cc0e-eacb-ce71-0317-27d10264d3bf@denx.de>
 <20230123105610.38034a11@xps-13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230123105610.38034a11@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_004203_927202_9D0A1CE4 
X-CRM114-Status: GOOD (  23.05  )
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

Hello Miquel,

On Mon, Jan 23, 2023 at 10:56:10AM +0100, Miquel Raynal wrote:
> marex@denx.de wrote on Tue, 17 Jan 2023 01:59:54 +0100:
> 
> > On 1/16/23 19:00, Francesco Dolcini wrote:
> > > On Mon, Jan 16, 2023 at 06:54:44PM +0100, Marek Vasut wrote:  
> > >> On 1/16/23 15:20, Francesco Dolcini wrote:  
> > >>> On Sun, Jan 15, 2023 at 03:35:25PM +0100, Marek Vasut wrote:  
> > >>>> On 1/13/23 19:45, Francesco Dolcini wrote:  
> > >>>>> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > >>>>>
> > >>>>> Fixup #size-cells value when updating the MTD partitions, this is
> > >>>>> required to prevent issues in case the MTD parent set #size-cells to
> > >>>>> zero.
> > >>>>> This could happen for example in the legacy case in which the partitions
> > >>>>> are created as direct child of the mtd node and that specific node has
> > >>>>> no children. Recent clean-up on Linux device tree files created a boot
> > >>>>> regression on colibri-imx7.
> > >>>>>
> > >>>>> This fixup has the limitation to assume 32-bit (#size-cells=1)
> > >>>>> addressing, therefore it will not work with device bigger than 4GiB.
> > >>>>>
> > >>>>> This change also enforce #address-cells to be the same as #size-cells,
> > >>>>> this was already silently enforced by fdt_node_set_part_info(), now this
> > >>>>> is checked explicitly and partition fixup will just fail in such case.
> > >>>>>
> > >>>>> In general board should not generally need nor use this functionality
> > >>>>> and should be just deprecated, passing mtdparts= in the kernel command
> > >>>>> line is the preferred way according to Linux MTD subsystem maintainer.
> 
> Just to be clear, I'm perfectly fine with the partitions being either
> on the cmdline or in the DT without preference (well, the cmdline only
> works with the simple generic parser, but whatever). What I really
> meant is that tweaking the DT from U-Boot should be rare and in no case
> the "right thing to add partitions".

Miquel, should I send a v2 to clarify the commit message or you do not
mind keeping it as it is?

Francesco


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
