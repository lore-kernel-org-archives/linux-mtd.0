Return-Path: <SRS0=UIyM=HS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50E4C433DB
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 23:02:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61E3064DAF
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Feb 2021 23:02:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61E3064DAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mwdl6nZSPx6P8AZ7t6PJdwHMKjJapKje6m/jyVBKp4Q=; b=PmjkSRz9uJe+F2mhDV5q9b4my
	92gDeYOuMRjj8TqvZBhcDyJMKJiecx15S5sDpeomsDOXxfPzQ+A24faRRclmfKghqHuTEIQkv1Tfo
	xK9awNUxQT7CLJsU4sgTzM3+6NIt8XzKa24Qmd3js5sgPoeg7hFUNRM0rsTHyiCyGyOHYspzUhpkE
	FRLes8Vo8iZ/hZFegC+/KHEPcfnpKTJXqUX54I/dfvQ9SpbX2z26m0xy7R+pA2Qu5jtu7aaaLsvZ0
	MUSPdbRA13nRc0cvASQm2pmUmB1DOF9Z9fEnGMdjsPKR2Si/q7cp1QGmQNwz5Onora2C0iYhC+87k
	MYMmuw+Qw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC9M5-00049T-8H; Tue, 16 Feb 2021 23:02:05 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC9Lz-00048Z-4C
 for linux-mtd@lists.infradead.org; Tue, 16 Feb 2021 23:02:00 +0000
Received: by mail-qv1-xf34.google.com with SMTP id f18so5449979qvm.9
 for <linux-mtd@lists.infradead.org>; Tue, 16 Feb 2021 15:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j1mH25i+5j4AS5RGeOCsMNfIPg+OKcyjjs55ZXJKVEA=;
 b=j53dJJLXFVcltwxep4/sPJtJgEwrRlGVOVzWzOMamhER9IsJQ9OAsdvw3av7kl+l4v
 il9t5nshG2w/b4/WSw4WJgai0empDG7c0FiHA39O26H8l4tO16Fo+YteIeMPaYC1SPFk
 oq+tSqNJOqP1IoEuFEeM5Wv6ja9PRzHaXg6j1QS7v8A40Yyzlt+0ssKY5Hp2hQhxCJVQ
 d/prFPxoZOKUAeEEIxSu50B1MqrY7uFUBa+V+uG1HjkBgi9YyxMd+HrFnPmII/9uxEDH
 U0Fi0jEdWYBMyv0F9l0E8RuE9y3xBnFm2YyjHEukQ8cijJ7OsZ4mjoeGFqnboSrVTB6f
 9KrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j1mH25i+5j4AS5RGeOCsMNfIPg+OKcyjjs55ZXJKVEA=;
 b=dwh4PGwALpHXbAjGolYuyaYPHBU/tftlUMk2bk9XXakGtK/K9oLBIKaX6NL+5Jaiiv
 OpZ5lNFXNslpP2QD9J7x9NyarwcCqv1U3QN/OHk7QN+EAcj3Sh+FWDOfgLs+hium2ea+
 NEFMSML8bBQN3jQ+V2Z0/IJtxLWfamacyy6IL4o94DvNvpKzRviDz0MMNr7zw6TtiZvm
 /Ra8Kn1/QTIhtK9MUwO5TIExRadDXbyKcjdNot0bskm4i3d9ExDH5ZJ5F80Z02oY4qQc
 l/htKK3wH6K72CPL+qVAxYPB+MN05+KEF/MWIi87uC1Wch3I/aarK8qK/hskkHno+2B6
 /JUA==
X-Gm-Message-State: AOAM533QYLLClGKn1HEJud3U0ujfPGap8Po0g8lFeLo5lSPPupcsdLOQ
 N6A28FufLaoEyp4nrp66ESvE+NXSO0U0jbBcEqk=
X-Google-Smtp-Source: ABdhPJyTRThkQBHfeQxXbwJ3vmuF8znKW8qhz/X3H4YttohuY+V+RmPy9O0bK8Vodfy1/UG2Kt5Jmg5AV/xX0caP0sE=
X-Received: by 2002:ad4:544b:: with SMTP id h11mr22001531qvt.24.1613516514944; 
 Tue, 16 Feb 2021 15:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20210216181925.650082-1-tomas.winkler@intel.com>
In-Reply-To: <20210216181925.650082-1-tomas.winkler@intel.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 17 Feb 2021 00:01:43 +0100
Message-ID: <CAFLxGvwP5-O5DHQ07Fs_GnG12dsK24mer8LJfhz2z2UqW9e5cQ@mail.gmail.com>
Subject: Re: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
To: Tomas Winkler <tomas.winkler@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_180159_216415_009095EF 
X-CRM114-Status: GOOD (  18.65  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, linux-mtd@lists.infradead.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vitaly Lubart <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

)On Tue, Feb 16, 2021 at 7:26 PM Tomas Winkler <tomas.winkler@intel.com> wrote:
> Because the graphic card may undergo reset at any time and basically hot
> unplug all its child devices, this series also provides a fix to the mtd
> framework to make the reset graceful.

Well, just because MTD does not work as you expect, it is not broken. :-)

In your case i915_spi_remove() blindly removes the MTD, this is not allowed.
You may remove the MTD only if there are no more users.

The current model in MTD is that the driver is in charge of all life
cycle management.
Using ->_get_device() and ->_put_device() a driver can implement
refcounting and deny
new users if the MTD is about to disappear.

In the upcoming MUSE driver that mechanism is used too.
MUSE allows to implement a MTD in userspace. So the FUSE server can disappear at
*any* time. Just like in your case. Even worse, it can be hostile.
In MUSE the MTD life time is tied to the FUSE connection object,
muse_mtd_get_device()
increments the FUSE connection refcount, and muse_mtd_put_device()
decrements it.
That means if the FUSE server disappears all of a sudden but the MTD
still has users,
the MTD will stay. But in this state no new references are allowed and
all MTD operations
of existing users will fail with -ENOTCONN (via FUSE).
As soon the last user is gone (can be userspace via /dev/mtd* or a
in-kernel user such as UBIFS),
the MTD will be removed.
For the full details, please see:
https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git/tree/fs/fuse/muse.c?h=muse_v3#n1034

Is in your case *really* not possible to do it that way?

On the other hand, your last patch moves some part of the life cycle
management into MTD core.
The MTD will stay as long it has users.
But that's only one part. The driver is still in charge to make sure
that all operations
fail immediately and that no new users arrive.
If we want to do all in MTD core we'd have to do it like SCSI disks.
That means having devices states such as SDEV_RUNNING, SDEV_CANCEL,
SDEV_OFFLINE, ....
That way the MTD could be shutdown gracefully, first no new users are
allowed, then ongoing operations
will be cancelled, next all operation will fail with -EIO or such,
then the device is being removed from sysfs
and finally if the last user is gone, the MTD can be removed.

I'm not sure whether we want to take that path.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
