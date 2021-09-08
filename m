Return-Path: <SRS0=xoN1=N6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39C74C433F5
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 11:28:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C2E60EE6
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Sep 2021 11:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05C2E60EE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bHckzmvZLHCHWeBafolsLMwdJkTeUah9o+nraKDdPk4=; b=rR5dd9HtrFLiPN
	kzA0RHn5ul0FVBiWMl3UUlJNXZ+OJOaYQ+n0M4XTwBrfBqF+0QwqKGIxUdwh5a+0Z2SCMKhQZgduW
	rEqoa7LT6W5tU0dSjv8PJR6+CVCrPO1pamXNuvC3wMu8ZocdhPubcd4hk5NsmmNdsCQgyAmjBMrM1
	XSn7/2R+kX8LOFfGpDV5dNgPzdOC4Tl+wm5QFM96hAPpz1fOv2HMKs7Ixs/dVNSPpLqlInIVS2CoU
	JPv1YnculxHrUIV/YQSB15Tpq+5C9OukPyMgduq8kuPtzNhPzMcFRgHOxlB1y9fZNicluaLOK/Sc/
	3uLZ9w0v51jVa2o+0PIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mNvkI-006XlI-S9; Wed, 08 Sep 2021 11:28:02 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mNvkG-006Xk9-K2
 for linux-mtd@lists.infradead.org; Wed, 08 Sep 2021 11:28:02 +0000
Received: by mail-ed1-x52b.google.com with SMTP id j13so2367620edv.13
 for <linux-mtd@lists.infradead.org>; Wed, 08 Sep 2021 04:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T8Mklz6VAwUy6oZgIvPmDqGWckAlnrdzULeYme94/4Q=;
 b=lkZxAaIGGHzgZlPLjUj8F2g/w4kqVFboovx1cwljnc6aG9d+053WJpn5h7J1mOG/hL
 dtsv95/oTcFq5WD049sZPSukw1181KcSYaBAbljNxQb0icgMraGga+TTsOtvgzlY6SKB
 OqGjH6T8o07JALS2uJBbJkrbW+ZKzfDIe5Kt2IaBwqPBoqAWuSmuoBOFEMzTmApUTnHh
 hDkAuI+bIdj1fv7990JlGAOKAEWSN0mMF9rrEDnxPEiNnt5GNaceLh5Yy10Y7Q/oBoVZ
 65jq4NpT9cyxvBnxLqRJfMoGjB/yuiQHP+Ei9zSrxWiLIf/dBBRNvhz3feewJTCCGxrH
 F7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T8Mklz6VAwUy6oZgIvPmDqGWckAlnrdzULeYme94/4Q=;
 b=sYDB37BUgmBajf3gnROe3pn7V/82aq9SyYaoD5+Qk+sc4AWJDKUMvMqleY5wKHDTgM
 1H1axEeLnkDWPmD5ymz72imJVVd28iaWUbXOHjeuf8jv8Fv/Gz80MtzMt9aZDHbgiAPy
 GRmxTeeVBmZam3u0eqz6nkHXqQ3rk5QGrIvKc/L0m0p396DsKySwXfpOxfZk29TaawRs
 YKJyqdgwe9LVDN01DObMx5hKgTyJpnWcl9FVRISBb+2uNeBO53vjCo6AD0+NgF/3oB8l
 3iuBB8LJbPVuq6QD8jMY3RRkeCCdNm8XvBoHP+NrKgg3Xq9JVQK4tdOamV0Xg25BCy6T
 OD+g==
X-Gm-Message-State: AOAM5326jQtyPmOyUo1b9vvN0w96uS05MPcLtH1H3FBRCJ0xycFYkY4+
 nQR8TQo/L8GHxA3bA+MouLj8twFJi0wGeZfDlqgOlMLOwlE=
X-Google-Smtp-Source: ABdhPJwGfD+i+VdCkJZ7IUmEUFHZnxm9TsQnDXHp+8EbX5wzCKF44hHkvqZBfYGx8AevvBsZcCM3G11fKO55WACtnZo=
X-Received: by 2002:a05:6402:4389:: with SMTP id
 o9mr3325324edc.306.1631100477257; 
 Wed, 08 Sep 2021 04:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
 <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLi-xz_4P+v45CHLx00ztbSwU3_maf4tuuyso5RHyeOytg@mail.gmail.com>
 <CAOuPNLg0m-Q7Vhp4srbQrjXHsxVhOr-K2dvnNqzdR6Dr4kioqA@mail.gmail.com>
 <20210830185541.715f6a39@windsurf>
 <CAOuPNLhTidgLNWUbtUgdESYcKcE1C4SOdzKeQVhFGQvEoc0QEg@mail.gmail.com>
 <20210830211224.76391708@windsurf>
 <CAOuPNLgMd0AThhmSknbmKqp3_P8PFhBGr-jW0Mqjb6K6NchEMg@mail.gmail.com>
 <CAOuPNLiW10-E6F_Ndte7U9NPBKa9Y_UuLhgdwAYTc0eYMk5Mqg@mail.gmail.com>
In-Reply-To: <CAOuPNLiW10-E6F_Ndte7U9NPBKa9Y_UuLhgdwAYTc0eYMk5Mqg@mail.gmail.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 8 Sep 2021 16:57:45 +0530
Message-ID: <CAOuPNLj2Xmx52Gtzx5oEKif4Qz-Tz=vaxhRvHQG-5emO7ewRhg@mail.gmail.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Mikulas Patocka <mpatocka@redhat.com>,
 open list <linux-kernel@vger.kernel.org>, 
 Phillip Lougher <phillip@squashfs.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, 
 linux-mtd <linux-mtd@lists.infradead.org>, dm-devel@redhat.com, 
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, agk@redhat.com,
 snitzer@redhat.com, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210908_042800_703891_9DA469EF 
X-CRM114-Status: GOOD (  11.69  )
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

Hi,

On Mon, 6 Sept 2021 at 21:58, Pintu Agarwal <pintu.ping@gmail.com> wrote:

> On Tue, 31 Aug 2021 at 18:49, Pintu Agarwal <pintu.ping@gmail.com> wrote:
>
> > > No, but you can backport it easily. Back at
> > > http://lists.infradead.org/pipermail/openwrt-devel/2019-November/025967.html
> > > I provided backports of this feature to OpenWrt, for the 4.14 and 4.19
> > > kernels.

Can you please let me know where to get the below patches for
backporting to our kernel:
 create mode 100644
target/linux/generic/backport-4.14/390-dm-add-support-to-directly-boot-to-a-mapped-device.patch
 create mode 100644
target/linux/generic/backport-4.14/391-dm-init-fix-max-devices-targets-checks.patch
 create mode 100644
target/linux/generic/backport-4.14/392-dm-ioctl-fix-hang-in-early-create-error-condition.patch
 create mode 100644
target/linux/generic/backport-4.14/393-Documentation-dm-init-fix-multi-device-example.patch

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
