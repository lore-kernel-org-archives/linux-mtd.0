Return-Path: <SRS0=Bfvl=ST=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5089FC282DA
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 09:27:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 219E52173C
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2019 09:27:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oZ9S8Feo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 219E52173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEbm/3rtP5VKDvUsqyd80rCjnr9kmgOouMwx1jcav7o=; b=oZ9S8FeoMXUaEv
	ODNJFxJsfZousloOCy3WL3m5linf8pOrbrf5/BqXzfIQVPMP0gqjHZhKmmFh+s8ozm8/jdD3IhPbd
	Iu0ARhSHnAWhAeOq49f4TtePiehj857oDc1hj806b/laVn7jbUjKnPKi7IEtvvTFyYECqGTsnWm1v
	hie5Rxumg8vt0wxH0T/Dx64CCvoamuxaZGJyISRrFprGcZwWzp1mwoK0P2+a57FSQYkle/ha9kUWl
	O3evS33LrR2CKgny8sJ9JsVCcNzj6AEfjA3sJ3Co9o1b6td1RKVqH4C3x3/EGiHsclAz87UqwVGJ4
	Yu2/Ro2gutLx4tKLFzHg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGgqZ-0006zH-PU; Wed, 17 Apr 2019 09:27:15 +0000
Received: from mail-qt1-f196.google.com ([209.85.160.196])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGgqR-0006sN-Cc; Wed, 17 Apr 2019 09:27:09 +0000
Received: by mail-qt1-f196.google.com with SMTP id w30so26519962qta.8;
 Wed, 17 Apr 2019 02:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4u4xhfWbf3XY4Y+pcpPS6MedsvDzFzM06IvHIQZgNXk=;
 b=PCnTRTDVA0bPPZ1D+33n90VYg/JyAmULHiuMTLBPMDBHfo3kAgXPrzKI0o3g2YJY2N
 xRtmaKc+mj1hFeeI54ow8p1C+1HLNNw6jxyfaxN2DNOfKnOxv91Zq/LksQEyMHOv/Pz4
 iRVEcMKWHm40Ex7fypmL/0QPoOQkda+EazIvK79t3FS61C/d8JUrGED5Gbn+n84esi5V
 p1F7uZJywawAfx3TKCHy8vGuMRWFK46rIkahfW2lHWVkpp+98XX13bNktzsIpvxXd0Wb
 P4vD0K3Ny7XU0uujz1OwE9MGE+YF1Ue4qJ5w87ghB9BRP/PcGy0n6jZTUPQ47qJp0s6L
 JuVw==
X-Gm-Message-State: APjAAAWO3G3s+RmnJ9BILVqIqFocBbfrrsBFkF/+We5PGU3Fzi4jAWmQ
 m96yTZAf7wWbxZDp1Zh6wi1L3OoeoBPamtg4Tzs=
X-Google-Smtp-Source: APXvYqxMYD0WkcBhH5KMGg2GQrC8NQiLbvHHqXdWUyYN5FOPcRa84ZlsyMKbaUX6bPKbS+XpMs+SLZ47T6LYOQj2jl4=
X-Received: by 2002:ac8:276b:: with SMTP id h40mr71421815qth.319.1555493223409; 
 Wed, 17 Apr 2019 02:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190416202013.4034148-1-arnd@arndb.de>
 <c379ed8d-1f33-e391-a1b5-810da77605f2@interlog.com>
In-Reply-To: <c379ed8d-1f33-e391-a1b5-810da77605f2@interlog.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 Apr 2019 11:26:46 +0200
Message-ID: <CAK8P3a31L4isqsG_qPwjOhNZdxyu2KHLg11p9kFC=gtPNS0_UQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] compat_ioctl: cleanups
To: dgilbert@interlog.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_022707_429654_83388692 
X-CRM114-Status: GOOD (  28.86  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-nvme@lists.infradead.org, linux-iio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 IDE-ML <linux-ide@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>,
 sparclinux <sparclinux@vger.kernel.org>, linux1394-devel@lists.sourceforge.net,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 linux-scsi <linux-scsi@vger.kernel.org>,
 Bluez mailing list <linux-bluetooth@vger.kernel.org>,
 y2038 Mailman List <y2038@lists.linaro.org>, qat-linux@intel.com,
 amd-gfx@lists.freedesktop.org,
 "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-rtc@vger.kernel.org,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 ceph-devel <ceph-devel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Karsten Keil <isdn@linux-pingi.de>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-rdma <linux-rdma@vger.kernel.org>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 linux-btrfs <linux-btrfs@vger.kernel.org>, linux-ppp@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 12:33 AM Douglas Gilbert <dgilbert@interlog.com> wrote:
>
> On 2019-04-16 4:19 p.m., Arnd Bergmann wrote:
> > Hi Al,
> >
> > It took me way longer than I had hoped to revisit this series, see
> > https://lore.kernel.org/lkml/20180912150142.157913-1-arnd@arndb.de/
> > for the previously posted version.
> >
> > I've come to the point where all conversion handlers and most
> > COMPATIBLE_IOCTL() entries are gone from this file, but for
> > now, this series only has the parts that have either been reviewed
> > previously, or that are simple enough to include.
> >
> > The main missing piece is the SG_IO/SG_GET_REQUEST_TABLE conversion.
> > I'll post the patches I made for that later, as they need more
> > testing and review from the scsi maintainers.
>
> Perhaps you could look at the document in this url:
>      http://sg.danny.cz/sg/sg_v40.html
>
> It is work-in-progress to modernize the SCSI generic driver. It
> extends ioctl(sg_fd, SG_IO, &pt_obj) to additionally accept the sg v4
> interface as defined in include/uapi/linux/bsg.h . Currently only the
> bsg driver uses the sg v4 interface. Since struct sg_io_v4 is all
> explicitly sized integers, I'm guessing it is immune "compat" problems.
> [I can see no reference to bsg nor struct sg_io_v4 in the current
> fs/compat_ioctl.c file.]

Ok, I've taken a brief look at your series now. Unfortunately it clashes
quite hard with my series, but it's probably for the better to have your
stuff get merged first.

A few (unsorted) comments from going through your patches:

- the added ioctls are all compatible when using the v4 structures
  and mostly don't need handlers for compat mode, but they need to be
  called from .compat_ioctl to actually be usable in compat mode.
  With my patches you get that.
- One exception for the v4 layout is the use of iovec pointers, as
  'struct iovec' is incompatible. We should probably merge the
  generic compat_import_iovec() into import_iovec() with a
  'in_compat_syscall()' check, which would be helpful in general.
  bsg.c does not iovec, so it is not affected by this at the moment,
  maybe it would be better to stay compatible with that and also
  not support them in sg.c?
- Is there a need for the new sg_ioctl_iosubmit/sg_ioctl_ioreceive
  to support the v3 structures? Those are /not/ compatible, so
  you need extra code to handle the v3-compat layout as well.
  Supporting only v4 would simplify this.
- the lack of changeset descriptions is a bit irritating and makes
  it much harder to understand what you are doing.
- try to keep patches that move code around separate from those
  that change it in any other way, for better reviewing.
- in "sg: preparation for request sharing", you seem to inadvertently
  change the size of "struct sg_extended_info", making it 4 bytes
  longer by adding two members.
- You should never use IS_ERR_OR_NULL() in normal code, that
  is just a sign of a bad API. Make each function have consistent
  error behavior.
- The "#if 0  /* temporary to shorten big patch */" trick breaks
  bisection, that is probably worse than the larger patch.
- The split access_ok()/__copy_from_user() has fallen out of
  favor because it has caused too many bugs in the past, just
  use the combined copy_from_user() instead.
- ktime_to_ns(ktime_get_with_offset(TK_OFFS_BOOT)) followed
  by a 64-bit division won't work on 32-bit machines, use
  ktime_get_boottime_ts64() instead.

> Other additions described in the that document are these new ioctls:
>    - SG_IOSUBMIT    ultimately to replace write(sg_fd, ...)
>    - SG_IORECEIVE              to replace read(sg_fd, ...)
>    - SG_IOABORT     abort SCSI cmd in progress; new functionality
>    - SG_SET_GET_EXTENDED   has associated struct sg_extended_info
>
> The first three take a pointer to a struct sg_io_hdr (v3 interface) or
> a struct sg_io_v4 object. Both objects start with a 32 bit integer:
> 'S' identifies the v3 interface while 'Q' identifies the v4 interface.

I think the magic character was a mistake in the original design,
just like versioned interfaces in general. If you are extending an
interface in an incompatible way, the normal way would be to
have separate command codes, like SG_IORECEIVE_V3
and SG_IORECEIVE_V4, if you absolutely have to maintain
compatiblity with the old interface (which I think you don't in
case of SG_IORECEIVE).

For SG_IO, I can see  why you want to support both the v3
and v4 structures plus the compat-v3 version, but I'd try to keep
them as separate as possible, and do something like

static int  sg_ctl_sg_io(struct file *filp, struct sg_device *sdp,
struct sg_fd *sfp,
                                 void __user *p)
{
       int ret;

      ret = sg_io_v4(filp, sdp, sfp, (struct sg_io_v4 __user *)p);

      if (ret != -ENOIOCTLCMD || !S_ENABLED(CONFIG_SG_IO_V3))
            return ret;

     if (in_compat_syscall())
           ret = sg_io_compat_(filp, sdp, sfp, (struct
compat_sg_io_hdr __user *)p);
     else
           ret = sg_io_v3(filp, sdp, sfp, (struct sg_io_hdr __user *)p);
}

In my patch series, I combined the latter two cases and used a shared
get_sg_io_hdr()/put_sg_io_hdr() helper as well as a wrapper for the iovec
issue.

> The SG_SET_GET_EXTENDED ioctl takes a pointer to a struct
> sg_extended_info object which contains explicitly sized integers so it
> may also be immune from "compat" problems. The ioctls section (13) of
> that document referenced above has a table showing how many "sets and
> gets" are hiding in the SG_SET_GET_EXTENDED ioctl.

Agreed, SG_SET_GET_EXTENDED looks fine to me from a compat
perspective.

I've uploaded my patches to
git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
compat-ioctl-v3
This contains both the series I posted here, and my scsi ioctl rework.

Maybe you can take the bits you need from that to handle the v3-compat
structures and integrate it into your series?

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
