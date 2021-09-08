Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58960C433FE
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 12:08:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26F8F6113E
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 12:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26F8F6113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4X0i6YjU9LWThL/zhoC4ooI1shei3UrgxnBReMNmpCI=; b=g8EOzSly3BFodq
	RK5W1xHFdVIonr3ZQvjBljSFt/91tyQamaWcQgtx60cyUS1DCTv51/uKI2MArPSoxqU20h8k27bTc
	ruAED2CrZc3/q+36esU4KNzvPFNP+/bBTavkabHmAYEVWDqDjIxwTn8Pgi2ZNswv+Q3T0MbP4TSfG
	KR6E75EORJ8USn0iVrcMGh9g+Yq3G1qX3K7+MLxwyQiljMO6R7dqHbx1+gUqJs3k1OXwogjb3jLsS
	H6oF+4daYM47vbCzvdymXB4f8eZJP9A6Nao+1pcSjEqRAz6eZYduoBKaGtogvnyg9j8plTD5Wj8EQ
	iuFxy4NrahFuiHBtsL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNwNF-006dyx-VE; Wed, 08 Sep 2021 12:08:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNwNC-006dx8-8a
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 12:08:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B86D96109F;
 Wed,  8 Sep 2021 12:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1631102893;
 bh=+2qr6IIO/UXLiJjbyRAgzuQXiygiL06LUjfWuxvrq7U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jcs7nucfDWnXMYxo5ee/D0ZZAPqmOq3Gvtv+E0miyvRG+OwrIE8sOqA4FK3hT4+wi
 atyLzSEjCkXrJl+bnpyYiVY1FZkXaUHxOKCkF/CqzLfbFz3j2oqiUMCBU5lTdOrIFa
 OxQTgGQ4h74+Oz78PjpHrzODtGnMgkj+tyADOD5M=
Date: Wed, 8 Sep 2021 14:08:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pintu Agarwal <pintu.ping@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sami Tolvanen <samitolvanen@google.com>, snitzer@redhat.com,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>,
 open list <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
 Mikulas Patocka <mpatocka@redhat.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, agk@redhat.com
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
Message-ID: <YTinqiH9h+Q9bYsr@kroah.com>
References: <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
 <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
 <20210830185541.715f6a39@windsurf>
 <CAOuPNLhTidgLNWUbtUgdESYcKcE1C4SOdzKeQVhFGQvEoc0QEg@mail.gmail.com>
 <20210830211224.76391708@windsurf>
 <CAOuPNLgMd0AThhmSknbmKqp3_P8PFhBGr-jW0Mqjb6K6NchEMg@mail.gmail.com>
 <CAOuPNLiW10-E6F_Ndte7U9NPBKa9Y_UuLhgdwAYTc0eYMk5Mqg@mail.gmail.com>
 <CAOuPNLj2Xmx52Gtzx5oEKif4Qz-Tz=vaxhRvHQG-5emO7ewRhg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOuPNLj2Xmx52Gtzx5oEKif4Qz-Tz=vaxhRvHQG-5emO7ewRhg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_050814_371990_11FCA675 
X-CRM114-Status: GOOD (  14.54  )
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

On Wed, Sep 08, 2021 at 04:57:45PM +0530, Pintu Agarwal wrote:
> Hi,
> 
> On Mon, 6 Sept 2021 at 21:58, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> 
> > On Tue, 31 Aug 2021 at 18:49, Pintu Agarwal <pintu.ping@gmail.com> wrote:
> >
> > > > No, but you can backport it easily. Back at
> > > > http://lists.infradead.org/pipermail/openwrt-devel/2019-November/025967.html
> > > > I provided backports of this feature to OpenWrt, for the 4.14 and 4.19
> > > > kernels.
> 
> Can you please let me know where to get the below patches for
> backporting to our kernel:
>  create mode 100644
> target/linux/generic/backport-4.14/390-dm-add-support-to-directly-boot-to-a-mapped-device.patch
>  create mode 100644
> target/linux/generic/backport-4.14/391-dm-init-fix-max-devices-targets-checks.patch
>  create mode 100644
> target/linux/generic/backport-4.14/392-dm-ioctl-fix-hang-in-early-create-error-condition.patch
>  create mode 100644
> target/linux/generic/backport-4.14/393-Documentation-dm-init-fix-multi-device-example.patch

If you are stuck on an older kernel version, then you need to get
support from the vendor that is forcing you to be on that kernel
version, as you are already paying them for support.  Please take
advantage of that, as no one knows what is really in "your kernel".

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
