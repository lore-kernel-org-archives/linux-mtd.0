Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F31FD2D79
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Mar 2026 13:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6iBe+Fe4QWMEqxj0gvDyh9o3PIDFhOlxpKTMUsO8OP8=; b=LfJP2GppsbZMsg
	XZ5Kym1M0B45tuNkRFj7POjO7I7/qxetwRrmkG/DTIkf69WKVdr0SOr89Kaumv6ScA3wqnE+qyEH2
	ru/Lbu17eZ/fj9v02hRomwURZcWGFLu+4mdrsNRxfatY/QbvvjIgN4z+wdOFrFC/QRlEvG88PMvXX
	ZMViiUilPcFVgyv9sHXVKxvqygR1sU0WAT7pVNZly1FThbg67ofiedv+X0qhoOovskGw2IOvhBig1
	FRS94p0NCbe2bZZCiFbFKONMZNOP2B5ruJy2r3kS4de8eT3vvRcg/U2vKLupfy0XXw77ODr/78dcr
	St51LbWrf+XbBLQ6F23A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzx2K-00000009aJ7-41uM;
	Tue, 10 Mar 2026 13:22:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzx2G-00000009aHC-28mp
	for linux-mtd@lists.infradead.org;
	Tue, 10 Mar 2026 13:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773148927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
	b=E51kNjIN4UKbGW9DyZ5aBLaeo/X1fN08TYjWYCgYq8Q8qw25+tZQtb5W5ajU6MN7BBBW11
	0YDBivfD6ObYrVaZ07AfmguXniohVg3EyJDviAgsAuscNKdssFGgICyGTgh1yznjOgNpE3
	ekU6IHdwiHFWZVShb4nqu/2AD28lhx4=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-hErY53BGNCGlHPp9stnH7w-1; Tue, 10 Mar 2026 09:22:05 -0400
X-MC-Unique: hErY53BGNCGlHPp9stnH7w-1
X-Mimecast-MFC-AGG-ID: hErY53BGNCGlHPp9stnH7w_1773148925
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd81506677so1375228585a.1
        for <linux-mtd@lists.infradead.org>; Tue, 10 Mar 2026 06:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148925; x=1773753725;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5/adDEbR57gUpYJcJq84OoDVxrrM3xMPFmZCRo0jKXM=;
        b=NqmOTXaHdy5y178q/oIXUqPS8IYW1xtU1xQvp9+2vwATb+NhfbgvZSCh2FKeIlTL9D
         Yq+oZ0NcZ8D3ivthextsUuIGyQTda4EMiSF815PufmrvZsahKhPEzoSgrjPTMS6tLWh1
         DTWGAcXSsiVTK3aX+KZUmdPuh8fFJyXOKnRitiaMjiFfm5BP2bL7aObTMDZXUrfln7RC
         7ZRyYMwgapuz3c0RhQQkFdlwHzuHz2rsO3QWwMZnpol1FBFbiLm+r3mdRZMVrQ7fye4n
         IlMFRA01rs5GGdguzQo7BWmcAzs34pA0LZ/fOtaBCxzkisNcsf7WIzK3lvvlFKysE4Dy
         HC6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+4f84EtsGTNaY9fgJRBB5vIA8ayn5HsYwZSvE62OAwgBLo4gMf91QzchXLQWAZ9PmH8ELWPPbJ2M=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVzIhD0gn43E3C1TQZGLGDjeyVO2hUc2aQOx12P5QTDgE0Zyee
	xhcg70GyJWxijuNrXmrYBIMUWTwWGNarlAigrSYxnszJmS+PCnp3rcFq+wZLY0clu28DRiLCjtq
	MTDTbYfterLmSaRh9l6L2R+Yw+Zny3ZLk3ab0KyBf04W6S5ja65Z9xzUSn34JDxSWtLM=
X-Gm-Gg: ATEYQzyHgdePMfK991yR0pmrAYxWYFIMq5mqZr5P3eaydmZUa/82Mm2VD+kOvfnP7ZG
	OTYd+taN3581AAIrY6gzGU9+R2F9OC+M/xBH2ShTU+u2foXiJ6sxY1GnHo3DLXJu1+fs7uXRXtT
	EuYRs9aXjzE8IuziEjB7r1Y7vVrFcczQnM1P4SZ00vrXs0+J9zzIfgIUSIRcGIECDEmFEeadzeO
	Gg8Pl3yBu4/2TXWNe3SFJ6W88zrCWhVvlP8BYicxAQn2lEzc0iGpMdH4SftlLJ84lV7J8pC4Qc2
	IdiZkQimZ9yrfENr+5+QRdVrxkiSfzzeyPVgbKHVR1RJBJuXXRcHat4fueOzC16KS3Ch8+MkcyJ
	eStkTGvZpbjVUBYixNDokSq1SLzjzz5THi3hzkgnAmKNQl7kJ/CozJMdO
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id af79cd13be357-8cd6d4f9469mr1830786685a.45.1773148924719;
        Tue, 10 Mar 2026 06:22:04 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:8ca:1240:4991 with SMTP id af79cd13be357-8cd6d4f9469mr1830766185a.45.1773148922638;
        Tue, 10 Mar 2026 06:22:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8576db0esm474754485a.47.2026.03.10.06.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:22:01 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:21:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: Philipp Hahn <phahn-oss@avm.de>
Cc: amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
	bpf@vger.kernel.org, ceph-devel@vger.kernel.org, cocci@inria.fr,
	dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
	gfs2@lists.linux.dev, intel-gfx@lists.freedesktop.org,
	intel-wired-lan@lists.osuosl.org, iommu@lists.linux.dev,
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-cifs@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-nfs@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-security-module@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	ntfs3@lists.linux.dev, samba-technical@lists.samba.org,
	sched-ext@lists.linux.dev, target-devel@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: [PATCH 56/61] clk: Prefer IS_ERR_OR_NULL over manual NULL check
Message-ID: <abAa9vQg4BSxl1BJ@redhat.com>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
MIME-Version: 1.0
In-Reply-To: <20260310-b4-is_err_or_null-v1-56-bd63b656022d@avm.de>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WOYE1jlZVt9SzTCBrMxKMYwktZ44L6l9vlt-_5Ytzi4_1773148925
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_062208_743410_5700EB57 
X-CRM114-Status: GOOD (  11.70  )
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

On Tue, Mar 10, 2026 at 12:49:22PM +0100, Philipp Hahn wrote:
> Prefer using IS_ERR_OR_NULL() over using IS_ERR() and a manual NULL
> check.
> 
> Semantich change: Previously the code only printed the warning on error,

Semantic ...

> but not when the pointer was NULL. Now the warning is printed in both
> cases!
> 
> Change found with coccinelle.
> 
> To: Michael Turquette <mturquette@baylibre.com>
> To: Stephen Boyd <sboyd@kernel.org>
> To: Daniel Lezcano <daniel.lezcano@kernel.org>
> To: Thomas Gleixner <tglx@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Philipp Hahn <phahn-oss@avm.de>

With the minor typo addressed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
