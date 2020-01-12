Return-Path: <SRS0=jxJ8=3B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B482DC33CA9
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jan 2020 22:52:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 857BA21556
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Jan 2020 22:52:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oVXw0d86";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RoM+OAwL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 857BA21556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lww/3R+BdHRKwmLHezjsooxxr9khDt0XDg2VP62syVw=; b=oVXw0d86KE8J3t
	jJY++M843mQDkAKLnwsHrv0n71zSzoGeObWqILO7th9A7vUJ8n6bUW2OR/2R0tyAZhyIiA7ZKzUUh
	GYiKomjvGUkgO3bsVRmA6q4lTuctcmdHTGOQPLJnKPpbMzAKVvix8n4u69sUa5T3K5ToFT5cSdPYg
	niVmIBEcNGDo+5ta8noprvE9UE8bUcQOJPvpfNtDGrT0NvKneWqu0BP2jrgEV2PS5HfEP9yqIPWxQ
	rt41Ge6eu6sHOmK9I6kEtWHDnAJChLvU7RIaDQoruljqDOoArAg8g5eEGamcgcFk/JXqheuRF6FOx
	1aV9YZeWKfaRAS13vUZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqm5K-0007wM-Fc; Sun, 12 Jan 2020 22:51:54 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqm5H-0007vz-92
 for linux-mtd@lists.infradead.org; Sun, 12 Jan 2020 22:51:52 +0000
Received: by mail-wm1-x344.google.com with SMTP id b19so7655224wmj.4
 for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2020 14:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nueiCWenvWJovLAC3radXN55V9P8T2MWBdfE0Yq2kkQ=;
 b=RoM+OAwLhq5klt2Mq4YA0HgbCnJBleUwVayI9mIxK2hTEwPyWTtbyql+MwF2o9dHYx
 r/8Z+EOH6Fj+TcgeZD6G2hdXFEPDgJcTWiG2t4St2a7EN4vsyvtMb40MdSAXAIsJovSD
 E0kH3DnIX+InIv7YgItjAwG+63VEZmiErEx7IR13wkIKsMoiuzAE42yukd/nOkNpzPyq
 LAGltpqVhVZDyyvoDvEuwI+A/BLQ3HRs7aF6GuxA7Tqd5ejhTWSLVkjwJQZCe3Ygrs0+
 vcOHA8NeU0PPi9z7gopYAgmioWS2rmoG1jRnhYZlryspsFOwgbZGQitXswnoXWCvjTam
 ur4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nueiCWenvWJovLAC3radXN55V9P8T2MWBdfE0Yq2kkQ=;
 b=TLBPV5GIUFrYZ9aAcGgCS3KvWYxrgoBEACd0kLsSSKkrZT7WEY+QkEwOM+2Vfs+2Qa
 qH81gmuD/e0vUJfw/4HVWBNMGx/IbYb0/sb8kOw45r0yg+/fW7KOVc/wROrYBV9aVMWZ
 EeMkUsjH0UGLzt7k7sM17ySsTEu1oBbYw+SSEPWMiwdzRQWfhfXj3YfdSf2r47C6spau
 uKYS6rdofid2ueiof9yD7zHty0BAewXzULGlQLdOswuwDIWA3uhLd2qarbMLlTz98Czv
 neIQd4P4iePv2jt45T3WlZhE+gvHaCbSs1/N+qbcjkQmt15fAMiweUgcC9ot2mI5xJmW
 v1iQ==
X-Gm-Message-State: APjAAAXyKawhy2BlY031tsGYNEdmmPRFSCdBVGl5llmL7OUFI9ae5YOz
 rA9IPCW/J9rdQakAsHunZBk0dT5elluBmJEjas4=
X-Google-Smtp-Source: APXvYqywO4WjH6xHyx2b1VE7jn5ehVsfcSd7K26wbVG7K5a0ptKjNMo9bCa6WmEtdN1EkVMeeFRnjrDOFAcJh+l0098=
X-Received: by 2002:a1c:6585:: with SMTP id
 z127mr16339801wmb.113.1578869509719; 
 Sun, 12 Jan 2020 14:51:49 -0800 (PST)
MIME-Version: 1.0
References: <0000000000006d0a820599366088@google.com>
 <20191220021449.120639-1-houtao1@huawei.com>
 <20200106090215.q346oxb532bhypnu@pengutronix.de>
In-Reply-To: <20200106090215.q346oxb532bhypnu@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sun, 12 Jan 2020 23:51:38 +0100
Message-ID: <CAFLxGvw7F3MwxQ1KMXohAZctvipjzeTKwhubiXuVsEZo_WEyBw@mail.gmail.com>
Subject: Re: [PATCH] UBI: Fastmap: free unused fastmap anchor peb during detach
To: Sascha Hauer <s.hauer@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_145151_322659_19E6D711 
X-CRM114-Status: GOOD (  11.44  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Hou Tao <houtao1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Jan 6, 2020 at 10:02 AM Sascha Hauer <s.hauer@pengutronix.de> wrote:
>
> On Fri, Dec 20, 2019 at 10:14:49AM +0800, Hou Tao wrote:
> > When CONFIG_MTD_UBI_FASTMAP is enabled, fm_anchor will be assigned
> > a free PEB during ubi_wl_init() or ubi_update_fastmap(). However
> > if fastmap is not used or disabled on the MTD device, ubi_wl_entry
> > related with the PEB will not be freed during detach.
> >
> > So Fix it by freeing the unused fastmap anchor during detach.
> >
> > And also don't generate the initial fm_anchor when fastmap is disabled.
>
> I think this part deserves an extra patch. Otherwise the changes look
> good to me, so:

Yes, please split this patch.

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
