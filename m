Return-Path: <SRS0=xpyr=QG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9D0C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 14:53:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70CF861154
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Nov 2021 14:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70CF861154
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kckxhEXZMcRn/KEmGVTZc6Ca95GlqI5IKlh1MAUSh4o=; b=jx5JW6HsL1q2rZ
	/MPscdY/jcO6AA/9b44AjQCdHB+cawUSF7DhM2MS0LRuTLvdFC70mIRKCF989ug9gDA83RvYEud2u
	4zY35Qqn/SJumDmBRuYzMCpBbDFRHirTuG52/2jzhM18BdG0RIp/Dw6w4ueOYa40kiNTqcLuahezW
	6zWW1CjRbixeGu8IrAC7VcycNbChzNnFqPR+ZPZjkEpTm1537O9woYv2jShQlDnG70Mk+8S18OJUV
	Ji4v/J1tvWgcyRfrItbfttFPrUduSZiZUuNO5cBCnG+pWhtusGQSAbR5pv6lX+30/ZcFEuCaNXzzq
	VylLjq4pw4XRWrV2J6vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mo5GE-00AjGP-Cm; Fri, 19 Nov 2021 14:53:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mo5GB-00AjFB-Pk
 for linux-mtd@lists.infradead.org; Fri, 19 Nov 2021 14:53:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7E178615E2;
 Fri, 19 Nov 2021 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637333583;
 bh=a6WLrgJ5At75ApGLxwNCqBp4zXbio5sU4DQJ1u+W7Rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VJ3mRcfP6tO+xSL7Dl9ozHY5vfMOb4grglxa4itdEcphpz8Ndc+32OGSwuJiRPtH+
 UHi6xskn7ETcyFzZAOLCh6y34YiGwsxDDJ76Qzc57rfPUtkXvK+wMkocOe9hYrvMNS
 JqN2tDF4Yc0QAAXJ1ywQpcPv0HXBQ0P5CmUO+dUM=
Date: Fri, 19 Nov 2021 15:53:00 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Kumaravel.Thiagarajan@microchip.com
Cc: lee.jones@linaro.org, Pragash.Mangalapandian@microchip.com,
 Sundararaman.H@microchip.com, axboe@kernel.dk,
 linux-block@vger.kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 LakshmiPraveen.Kopparthi@microchip.com, Ronnie.Kunin@microchip.com
Subject: Re: Reg: New MFD Driver for my PCIe Device
Message-ID: <YZe6TPrf4Drh7HpI@kroah.com>
References: <CH0PR11MB5380F5BD18F15014BA8B8479E9919@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YYkEP62JRb4rCuXQ@google.com> <YYkGkEiPb+6J62hn@kroah.com>
 <YYkJsbbHH6wdPvB9@google.com> <YYkR/szsDirtj1FP@kroah.com>
 <CH0PR11MB5380791976D5837E024D5679E9999@CH0PR11MB5380.namprd11.prod.outlook.com>
 <YZO+KktO3OhDEtlq@kroah.com>
 <CH0PR11MB5380439460BADE102D91C18AE99C9@CH0PR11MB5380.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH0PR11MB5380439460BADE102D91C18AE99C9@CH0PR11MB5380.namprd11.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_065303_895026_8DF75C8C 
X-CRM114-Status: GOOD (  13.52  )
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

On Fri, Nov 19, 2021 at 09:16:29AM +0000, Kumaravel.Thiagarajan@microchip.com wrote:
> Dear Greg KH,
> 
> I went through the documentation of aux bus and felt that it would be the correct way to go as you said.
> I will migrate from MFD to aux bus. 
> 
> I have one more architectural question as below.
> I have written the driver such that it enumerates the OTP memory and EEPROM memory as two separate block devices or disks each of size 8KB and this enables me to use the linux dd command with "direct" option to dump the configuration binary onto OTP or EEPROM devices.
> Also, this enables me to use the application like hexedit to view the OTP or EEPROM devices in raw binary format.
> These devices are not based on mtd (memory technology device) architecture as we don't have any erase functionality here.
> Can you please let me know a suitable location in kernel source tree for my block or disk device driver?

So they are a read-only block device?

Why use a block device and not just the "normal" eeprom driver?  Or a
char device node and mmap the memory?

Anyway, no idea where to put them, drivers/misc/ ?

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
