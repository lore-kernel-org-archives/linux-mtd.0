Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EDFC433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Dec 2021 07:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6OXq3zcvVdUqCWI8kjqmkDGNFJ1kKEhsODX5qmSu6To=; b=Tbit8u0w8sp34H
	ot4Y7aWh4UhPUxL15kAVNNE+73TjpVFDwgS8zfstIk7Q6FgQTvS6BSrf3vvAgaS17SD6dCxCUsCFV
	RJb51UTlUOei913KdS3nAt6SCmm1KnSPGhXwWEinhOlwitn6EvNINeTqEmjr+nOQ9p+mxeOjwG4NZ
	ntvQbHblBSECzTC6hwkjYroPLDu6xFbe5JYNTkXGfSccGxN6H1fdcG6KFDb2QWRaaGnwkHXK6T7I8
	6xVPavsFy+U1lvZkBLQF+2QhRaPuvRTBY9HZk4Qv3d7hIavpDV1e6Khw3UZ56sZrSb5YZOoH3mJiY
	xZEEdhFxL3S7m2UTw9UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msJly-007btU-E4; Wed, 01 Dec 2021 07:11:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msJlv-007bsm-SV
 for linux-mtd@lists.infradead.org; Wed, 01 Dec 2021 07:11:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E9E47CE0AC6;
 Wed,  1 Dec 2021 07:11:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10A6C53FCC;
 Wed,  1 Dec 2021 07:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1638342676;
 bh=Eu6q86jxzxhUQPoYNyhalPx1LxUiHi1MZSvHbSR96CE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VPqkfhRCo7jYRKdny71KtcOFOX07JRz+PfTnNBbKvV6TqB4rVTH0LmGTMwglGDpce
 /zMJVvONnyXNk1TsW1cvo23Kfgml8Ep5T/vbQVFRDa026VZl98y+F3CAcEz3U5aoBB
 Rgr1QbLUybUuPgho3Vq4v8diZCDqcJz7ou1Q3hu8=
Date: Wed, 1 Dec 2021 08:11:11 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kumaravel.Thiagarajan@microchip.com
Cc: lee.jones@linaro.org, Pragash.Mangalapandian@microchip.com,
 Sundararaman.H@microchip.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 LakshmiPraveen.Kopparthi@microchip.com, Ronnie.Kunin@microchip.com
Subject: Re: Reg: New MFD Driver for my PCIe Device
Message-ID: <YacgD5QXJPg/AwDH@kroah.com>
References: <YYkEP62JRb4rCuXQ@google.com> <YYkGkEiPb+6J62hn@kroah.com>
 <YYkJsbbHH6wdPvB9@google.com> <YYkR/szsDirtj1FP@kroah.com>
 <CH0PR11MB5380791976D5837E024D5679E9999@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YZO+KktO3OhDEtlq@kroah.com>
 <CH0PR11MB5380439460BADE102D91C18AE99C9@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YZe6TPrf4Drh7HpI@kroah.com>
 <CH0PR11MB5380DAC79E3D01C7D1D6008AE9609@CH0PR11MB5380.namprd11.prod.outlook.com>
 <BL1PR11MB538172ECC1F112D2F6E0D734E9679@BL1PR11MB5381.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BL1PR11MB538172ECC1F112D2F6E0D734E9679@BL1PR11MB5381.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_231120_136592_98B0ECE9 
X-CRM114-Status: UNSURE (   9.19  )
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

On Tue, Nov 30, 2021 at 05:42:14PM +0000, Kumaravel.Thiagarajan@microchip.com wrote:
> Dear Greg KH,
> 
> In case you missed my last email below, I have tried to answer your questions in that email.
> Please let me know if you have any further questions or concerns.

At the moment, no, I was waiting for patches to comment further.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
