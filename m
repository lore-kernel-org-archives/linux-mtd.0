Return-Path: <SRS0=FSZL=DT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F26DC43457
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 07:03:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 440612078E
	for <linux-mtd@archiver.kernel.org>; Mon, 12 Oct 2020 07:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fQATCO8q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 440612078E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WiKi9GZRiL5/y7p2NtbCRYiBq5WcZWJSZpCtY5JTdf0=; b=fQATCO8qAVTeJSCdeMyhGkyqj
	CdCV+XdMNt8T1W2t7TuzQVLNz6VmcP/CN19AWQDWAFhWwH7beVBuq8JQx6HP43mfjxqHKLootBat2
	S2KL9qUX5b8cIcvtZY6gJg03VLyDqnf4IQkNGGjhjtM4fktMJWw0sMNdSrtDCdugoNldjJCR+Wn6/
	Z2qiTE797Ue4POFBJ23IWBlm0jGlC5U6HkCRwUFbGFs7R4XHdOR1N6Vr0ECfUO0IuJjYYE6Alymkf
	TKrqvEMha/yTVaiXSJh8XmOCqOuijDAFue/qUZH+RSlJhqgonJSsE1LlQZxRGaQV+r+waE2mpX7JN
	lMD4dBDbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRrqx-0001Qe-1c; Mon, 12 Oct 2020 07:02:39 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRrqu-0001Q8-GV
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2020 07:02:37 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 17FB267357; Mon, 12 Oct 2020 09:02:34 +0200 (CEST)
Date: Mon, 12 Oct 2020 09:02:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Kees Cook <keescook@chromium.org>
Subject: Re: use case for register_pstore_blk?
Message-ID: <20201012070233.GA2770@lst.de>
References: <20201006155220.GA11668@lst.de> <202010070007.8FF59EC42@keescook>
 <20201007075537.GA12531@lst.de> <20201007083715.GA15695@lst.de>
 <202010071130.7EA00291@keescook> <20201007184258.GA6157@lst.de>
 <202010071147.F6E57A32@keescook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202010071147.F6E57A32@keescook>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_030236_659310_DF40141B 
X-CRM114-Status: GOOD (  25.30  )
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
Cc: Richard Weinberger <richard@nod.at>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 WeiXiong Liao <gmpy.liaowx@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Oct 07, 2020 at 12:17:25PM -0700, Kees Cook wrote:
> Do you mean psblk_generic_blk_read() and psblk_generic_blk_write()?
> These are for writing to the block device... I'm happy to adjust this
> if you can show me the better API. (This was being developed in the
> middle of the iov_iter changes, so perhaps I missed a more appropriate
> way to do things.)

The problem is that you use library function for file systems, and
then call them on an instance you don't own, and you're feeding crap
into them like your own methods.

Now given that as far as I can tell you require 4k aligned reads and
writes anyway, there doesn't seem to be any need for this whole page
cache dance to start with, and you could just do the completely trivial
bios submission.  But if for some reason you need to use the page cache,
that needs to be done through fs/block_dev.c APIs instead of through
the side.

> 
> > and it uses name_to_dev_t which must not be used in new code.
> 
> What?
> 
> include/linux/mount.h:
> extern dev_t name_to_dev_t(const char *name);

It used to be a private API, but then the Chromium folks just exported
it in e6e20a7a5f3f49bfee518d5c6849107398d83912 without consulting any
relevant maintainer.  And now we have this mess :(

> Where did this happen, where was it documented, and what should be used
> instead?

Use blkdev_get_by_path only.  If you look at blkdev_get_by_dev it has
this very explicit comment:

 * Use it ONLY if you really do not have anything better - i.e. when
 * you are behind a truly sucky interface and all you are given is a
 * device number.  _Never_ to be used for internal purposes.  If you
 * ever need it - reconsider your API.


> > It also does not happen to share code with the mtd case.
> 
> What? Yes it does: it explicitly uses the pstore/blk configuration
> callback to get the details configured at boot to identify and configure
> the backing device. This is specifically designed this way to avoid
> repeating the mistake of having per-backing-device configuration that is
> essentially only actually used by the pstore storage layer. i.e. the very
> thing I'm trying to get away from in ramoops, efi-pstore, etc: storage
> configuration is tied to the pstore storage layer (i.e. pstore/blk and
> pstore/zone), not the specific backing device (i.e. MTD, blk, RAM, NVRAM,
> EFI variables, etc).

Sharing the config is trivial.  But it shared nothing in the actual
I/O path, which is entirely different for mtd vs block.  And the sad part
is that with fs/pstore/zone.c you have added the right abstraction, one
that totally makes sense.  But only when used by the block and mtd drivers
directly.  Adding another pointless layer of obsfucation and dead code
that doesn't share anything does not help.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
