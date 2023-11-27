Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7F4C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQ1jwpGjKLK7YbkU8EOehd1wfZKGs8beRxOWJc/xCoA=; b=Y+NByG2kSVk7Ka
	SmkJKVP5y4eZDnHDTdjvKHhy5uPc4v4QVixWVfHZC9wqphaTvl/5A61TzLoyAIps3OkubsnbFW12e
	uBoQEgXANWoHtKMlSUD80/Q+igUW5nTf2UOKcdR5cCa3iOKyIHv7w5Ig6gW83gsEVQCFPAJMwNpUL
	IMd6HBVPzreZPCaAX7R4S+hKQhGqqi+uIx9dWX4BD0DcChWFig0GMUX5QZsUxM8asGbjA88dxoV8T
	54PQjEy8qc3CLj6KlegcjLM1RPT9q1W0SPVnpQxSfOFSX2VPG18OnSbfobJWqIEgEl4He+fVyOwkq
	Hilq42QKv9Te+/7CmGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7X6d-001rM8-2o;
	Mon, 27 Nov 2023 08:36:40 +0000
Received: from gardel.0pointer.net ([85.214.157.71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7X6a-001rKr-1O
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 08:36:38 +0000
Received: from gardel-login.0pointer.net (gardel-mail [IPv6:2a01:238:43ed:c300:10c3:bcf3:3266:da74])
	by gardel.0pointer.net (Postfix) with ESMTP id 656E7E8039A;
	Mon, 27 Nov 2023 09:29:50 +0100 (CET)
Received: by gardel-login.0pointer.net (Postfix, from userid 1000)
	id A2C6A160252; Mon, 27 Nov 2023 09:29:49 +0100 (CET)
Date: Mon, 27 Nov 2023 09:29:49 +0100
From: Lennart Poettering <lennart@poettering.net>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: systemd-devel@lists.freedesktop.org, linux-mtd@lists.infradead.org
Subject: Re: [systemd-devel] How to properly wait for udev?
Message-ID: <ZWRTfaWFzgSfd9_Z@gardel-login>
References: <CAFLxGvxiy9ofrNkfGmu4TvZgdZhdTbZBiK4pDmL8=8kjcPWO2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFLxGvxiy9ofrNkfGmu4TvZgdZhdTbZBiK4pDmL8=8kjcPWO2g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_003636_641427_19E7B420 
X-CRM114-Status: GOOD (  20.97  )
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

On So, 26.11.23 00:39, Richard Weinberger (richard.weinberger@gmail.com) wrote:

> Hello!
>
> After upgrading my main test worker to a recent distribution, the UBI
> test suite [0] fails at various places with -EBUSY.
> The reason is that these tests create and remove UBI volumes rapidly.
> A typical test sequence is as follows:
> 1. creation of /dev/ubi0_0
> 2. some exclusive operation, such as atomic update or volume resize on
> /dev/ubi0_0
> 3. removal of /dev/ubi0_0
>
> Both steps 2 and 3 can fail with -EBUSY because the udev worker still
> holds a file descriptor to /dev/ubi0_0.

Hmm, I have no experience with UBI, but are you sure we open that? why
would we? are such devices analyzed by blkid? We generally don't open
device nodes unless we have a reason to, such as doing blkid on it or
so.

What precisely fails for you? the open()? or some operation on the
opened fd?

>
> FWIW, the problem can also get triggered using UBI's shell utilities
> if the system is fast enough, e.g.
> # ubimkvol -N testv -S 50 -n 0 /dev/ubi0 && ubirmvol -n 0 /dev/ubi0
> Volume ID 0, size 50 LEBs (793600 bytes, 775.0 KiB), LEB size 15872
> bytes (15.5 KiB), dynamic, name "testv", alignment 1
> ubirmvol: error!: cannot UBI remove volume
>          error 16 (Device or resource busy)
>
> Instead of adding a retry loop around -EBUSY, I believe the best
> solution is to add code to wait for udev.
> For example, having a udev barrier in ubi_mkvol() and ubi_rmvol() [1]
> seems like a good idea to me.

For block devices we implement this:

https://systemd.io/BLOCK_DEVICE_LOCKING

I understand UBI aren't block devices though?

If they conceptually should be considered block device equivalents, we
might want to extend the udev logic to such UBI devices too.  Patches
welcome.

We provide "udevadm lock" to lock a block device according to this
scheme from shell scripts.

> What function from libsystemd do you suggest for waiting until udev is
> done with rule processing?
> My naive approach, using udev_queue_is_empty() and
> sd_device_get_is_initialized(), does not resolve all failures so far.
> Firstly, udev_queue_is_empty() doesn't seem to be exported by
> libsystemd. I have open-coded it as:
> static int udev_queue_is_empty(void) {
>        return access("/run/udev/queue", F_OK) < 0 ?
>                (errno == ENOENT ? true : -errno) : false;
> }

This doesn't really work. udev might still process the device in the
background.

Lennart

--
Lennart Poettering, Berlin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
