Return-Path: <SRS0=01Ca=NV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF41DC4320A
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 16:56:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 683D760E90
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Aug 2021 16:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 683D760E90
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BmrspoIEkBwkni66TXDMdLqml6Lz45v1rn/Jj5p7Ls=; b=KDF6aJUPiuLzfZ
	YWBj8Ho8n4WWFI+ESfsPxBYltWsPQBdt2+RbGzH8W6hgLIrQXGuK8f6VG+NWBtf/OqoAVxpywmNob
	tJqjSkuPrBaDUglEpMuvODZErUwcaKmqsqfQhrq/hx+WNObC+nuDpHBRm2aFj1cEmtX77+yzV4DcE
	fmpxHIEbp48OooxVnX7GMeKtrgxsNqZGKZsUyub/iLNlovCnNc2TCYCFFrcjOymTJdOG7vi6uOa6I
	wQhTGmScUmmK/wGHYcO1sVdTYgnImIJSKZYKMNNplbcXkpqoEBoGLP3iqaVuFhZx2skWaq2OTcYp1
	yNsvuDLZzhbP+hNe8Eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKkZh-0007qq-AU; Mon, 30 Aug 2021 16:55:57 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKkZb-0007nu-42
 for linux-mtd@lists.infradead.org; Mon, 30 Aug 2021 16:55:55 +0000
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A31E1FF809;
 Mon, 30 Aug 2021 16:55:42 +0000 (UTC)
Date: Mon, 30 Aug 2021 18:55:41 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>, open list
 <linux-kernel@vger.kernel.org>, Phillip Lougher <phillip@squashfs.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, linux-mtd
 <linux-mtd@lists.infradead.org>, dm-devel@redhat.com, Kernelnewbies
 <kernelnewbies@kernelnewbies.org>, agk@redhat.com, snitzer@redhat.com, Sami
 Tolvanen <samitolvanen@google.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
Message-ID: <20210830185541.715f6a39@windsurf>
In-Reply-To: <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
 <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_095551_370833_C48E6AD6 
X-CRM114-Status: GOOD (  16.96  )
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

Hello,

On Mon, 30 Aug 2021 21:55:19 +0530
Pintu Agarwal <pintu.ping@gmail.com> wrote:

> Sorry for coming back to this again..
> Unfortunately, none of the options is working for us with squashfs
> (bootloader, initramfs).
> initramfs have different kinds of challenges because of the partition
> size issue.
> So, our preferred option is still the bootloader command line approach..
> 
> Is there a proven and working solution of dm-verity with squashfs ?
> If yes, please share some references.
> 
> The current problem with squashfs is that we could not append the
> verity-metadata to squashfs, so we store it on a separate volume and
> access it.

Here, it definitely worked to append the hash tree to the squashfs
image and store them in the same partition.

> By specifying it like : /dev/mtdblock53
> 
> Then we get the error like this:
> {
> [    4.950276] device-mapper: init: attempting early device configuration.
> [    4.957577] device-mapper: init: adding target '0 95384 verity 1
> /dev/ubiblock0_0 /dev/mtdblock53 4096 4096 11923 8 sha256
> 16da5e4bbc706e5d90511d2a3dae373b5d878f9aebd522cd614a4faaace6baa3
> aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7 10
> restart_on_corruption ignore_zero_blocks use_fec_from_device
> /dev/mtdblock53 fec_roots 2 fec_blocks 12026 fec_start 12026'
> [    4.975283] device-mapper: verity: sha256 using implementation
> "sha256-generic"
> [    4.998728] device-mapper: init: dm-0 is ready

Could you show the full kernel command line ?

> Do you see any other problem here with dm-verity cmdline or with squashfs ?
> 
> Is squashfs ever proved to be working with dm-verity on higher kernel version ?
> Currently our kernel version is 4.14.

I confirm we used squashfs on dm-verity successfully. For sure on 4.19,
perhaps on older kernels as well.

> Or, another option is to use the new concept from 5.1 kernel that is:
> dm-mod.create = ?

How are you doing it today without dm-mod.create ?

Again, please give your complete kernel command line.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
