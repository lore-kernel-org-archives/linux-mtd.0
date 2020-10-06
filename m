Return-Path: <SRS0=jvb0=DN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07BABC41604
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 15:33:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709A3206D4
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Oct 2020 15:33:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NFUdZcH3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pfw4pAbZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 709A3206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e+0CTTvZak6+vLuBwhIfO+4rRPv94e5TDVn/+jDn0P8=; b=NFUdZcH38eUDF6tp2tq96+VmD
	i8tsFEQsgFtcHcSgJYDMkhPqA7TXbf7Lqoh9NRlqz1rZsKA+NHYBauBCJEphtkbEGD87dHa3SUtgz
	6KnoIzSUQpB6KOPyqff0A5UOsjeK7jdnfaNkf2vAqNe+FSPabCyfQobnvzJm9E4OuEIYmafGiblDE
	HXMluDcanT1hhhzBHiXHjSEQyVgVmQR2EWpamMo9sZsFo66liC/gR3ZlbZunWfOFAgFh3doNFKVoX
	olucTTswJ6rIdponeWK6MCIfYT+eme3RJ4Vh6rcnIJcSPVYR3KujONNSr9x4g3jS+HCL3HE6d9PpT
	KeNnjxzdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPowv-00085V-6B; Tue, 06 Oct 2020 15:32:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPows-00084s-MO
 for linux-mtd@lists.infradead.org; Tue, 06 Oct 2020 15:32:19 +0000
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 02EE3206D4;
 Tue,  6 Oct 2020 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601998335;
 bh=OD1ShKWKDH57lAR1RIhr8UFUdjhFDgj040obC8b1vbg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Pfw4pAbZMMatXod0HLkTpwx5cm9AK9iAcdCbDVaUg/4Mx1J9OZfLXjdMhyDuTGjkN
 q0Q+JvGLvtE0saNTSE8Uey6xBof+lrGgjsG3oZ4YUje/u49Osstgc/6CH5o92Xz/JV
 z/L7ReAEff1KYUiPY8o+/IuSl5/Cqoqm5gOYeO7g=
Date: Tue, 6 Oct 2020 17:33:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Bert Vermeulen <bert@biot.com>
Subject: Re: [RESEND PATCH v2] mtd: spi-nor: Fix address width on flash chips
 > 16MB
Message-ID: <20201006153301.GC23711@kroah.com>
References: <20201006132346.12652-1-bert@biot.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201006132346.12652-1-bert@biot.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201006_113218_846542_E3FA30BE 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Oct 06, 2020 at 03:23:46PM +0200, Bert Vermeulen wrote:
> If a flash chip has more than 16MB capacity but its BFPT reports
> BFPT_DWORD1_ADDRESS_BYTES_3_OR_4, the spi-nor framework defaults to 3.
> 
> The check in spi_nor_set_addr_width() doesn't catch it because addr_width
> did get set. This fixes that check.
> 
> Fixes: f9acd7fa80be ("mtd: spi-nor: sfdp: default to addr_width of 3 for configurable widths")
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> Reviewed-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
