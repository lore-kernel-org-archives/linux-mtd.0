Return-Path: <SRS0=e64P=HT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A24BC433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 08:36:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AECD264E2E
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Feb 2021 08:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AECD264E2E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6xM8azwWH7AoCcGdPNMTMcuY21GEupuobJfRvtVdwsQ=; b=yk43Vd8Y9ZC8S/tHFpqkhUaI7
	hX7gGIqONcYJqRO1HZXFX6zY2nw1Pf8kNZru4NH4EmcjIbn0Z21VvnJzeHzUZ8hcvZcJCxGDJ1WTS
	c3G0ic0rKNWN/h8MksXPNKq90W8uRfeIJ+44xnTryYy7hNl15Q+ufiFWhN8RZky3gEuieNv/I9qCE
	+rLabf0of6HsFrreIs67AaFr7NtkdkS8KCxzDUDOpIuCgXKHm6eOp/xGuoFBjfnFiihjth402l9TP
	6biGquR7vfj19yb2tJRi7QcnDZp7BQOQlkFYL/wJENSNt9Pa84BJXrHQ9LPMzof32qjXioYc3I3cl
	y7pVrfzdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCIIg-0005Tl-0i; Wed, 17 Feb 2021 08:35:10 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCIIb-0005SD-8D
 for linux-mtd@lists.infradead.org; Wed, 17 Feb 2021 08:35:06 +0000
IronPort-SDR: fmcjvNOAfTMt6vSzKUer89eHMIqcDtwH9kRwNuRTyZa4p7OSfPNPAUreATBGH9sAZhkUcnHmO0
 Eox/aDc/e3Sg==
X-IronPort-AV: E=McAfee;i="6000,8403,9897"; a="170271665"
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="170271665"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 00:34:58 -0800
IronPort-SDR: Jaxev6McBRp0iHVvWXdQ2L9Uhpf8RgR0i5eTb8DmCQthkKVtqzIqF5Zam1jCGnLV3/8TdFWYpD
 2Q46IQUkW7Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,184,1610438400"; d="scan'208";a="385035990"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 17 Feb 2021 00:34:57 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Feb 2021 00:34:56 -0800
Received: from hasmsx602.ger.corp.intel.com (10.184.107.142) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 17 Feb 2021 00:34:55 -0800
Received: from hasmsx602.ger.corp.intel.com ([10.184.107.142]) by
 HASMSX602.ger.corp.intel.com ([10.184.107.142]) with mapi id 15.01.2106.002;
 Wed, 17 Feb 2021 10:34:53 +0200
From: "Winkler, Tomas" <tomas.winkler@intel.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: RE: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Topic: [RFC PATCH 0/9] drm/i915/spi: discrete graphics internal spi
Thread-Index: AQHXBJBTlGMG4b5GwU+w3NO1EU5QQapbRLqAgAC+HMA=
Date: Wed, 17 Feb 2021 08:34:53 +0000
Message-ID: <cb20e706d494458a8957252eeacfb1da@intel.com>
References: <20210216181925.650082-1-tomas.winkler@intel.com>
 <CAFLxGvwP5-O5DHQ07Fs_GnG12dsK24mer8LJfhz2z2UqW9e5cQ@mail.gmail.com>
In-Reply-To: <CAFLxGvwP5-O5DHQ07Fs_GnG12dsK24mer8LJfhz2z2UqW9e5cQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.184.70.1]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210217_033505_546361_09711047 
X-CRM114-Status: GOOD (  33.03  )
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
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, "Usyskin,
 Alexander" <alexander.usyskin@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>, "Lubart, Vitaly" <vitaly.lubart@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


> 
> )On Tue, Feb 16, 2021 at 7:26 PM Tomas Winkler <tomas.winkler@intel.com>
> wrote:
> > Because the graphic card may undergo reset at any time and basically
> > hot unplug all its child devices, this series also provides a fix to
> > the mtd framework to make the reset graceful.
> 
> Well, just because MTD does not work as you expect, it is not broken. :-)
I'm not saying it's broken by design it just didn't fit this use case. 
> 
> In your case i915_spi_remove() blindly removes the MTD, this is not allowed.
> You may remove the MTD only if there are no more users.

I'm not sure it's good idea to stall the removal on user space.
This is just asking for a deadlock as user space is not getting what it needs and may stall
I think it's better the user space will fail gracefully the hw is not accessible in that stage anyway. 
> 
> The current model in MTD is that the driver is in charge of all life cycle
> management.
> Using ->_get_device() and ->_put_device() a driver can implement
> refcounting and deny new users if the MTD is about to disappear.

Please note that this use case you are describing is still valid, I haven't removed _get_device() _put_device() handlers,
You can still stall the removal of mtd, If this is not that way it's a bug

> 
> In the upcoming MUSE driver that mechanism is used too.
> MUSE allows to implement a MTD in userspace. So the FUSE server can
> disappear at
> *any* time. Just like in your case. Even worse, it can be hostile.
> In MUSE the MTD life time is tied to the FUSE connection object,
> muse_mtd_get_device()
> increments the FUSE connection refcount, and muse_mtd_put_device()
> decrements it.
> That means if the FUSE server disappears all of a sudden but the MTD still has
> users, the MTD will stay. But in this state no new references are allowed and
> all MTD operations of existing users will fail with -ENOTCONN (via FUSE).
> As soon the last user is gone (can be userspace via /dev/mtd* or a in-kernel
> user such as UBIFS), the MTD will be removed.

But in our case whole i915 is taken hostage, it cannot reset because of misbehaving user space.

> For the full details, please see:
> https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git/tree/fs/fuse/m
> use.c?h=muse_v3#n1034
> 
> Is in your case *really* not possible to do it that way?

Maybe it's possible but I don't think it's good to stall i915 removal. Also It's very easily to crash the kernel.
I've posted a sniped to the mailing list that tried to do that, the kernel still has crashed. Can you looked at?

> On the other hand, your last patch moves some part of the life cycle
> management into MTD core.
> The MTD will stay as long it has users.
> But that's only one part. The driver is still in charge to make sure that all
> operations fail immediately and that no new users arrive.

I think that case I would need to validate every HW access to make sure it's still valid.

> If we want to do all in MTD core we'd have to do it like SCSI disks.
> That means having devices states such as SDEV_RUNNING, SDEV_CANCEL,
> SDEV_OFFLINE, ....
> That way the MTD could be shutdown gracefully, first no new users are
> allowed, then ongoing operations will be cancelled, next all operation will fail
> with -EIO or such, then the device is being removed from sysfs and finally if
> the last user is gone, the MTD can be removed.

Isn't that already that way? You cannot open new handler. That I would need more of your insights.
> 
> I'm not sure whether we want to take that path.

Thanks
Tomas

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
