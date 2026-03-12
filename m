Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB87106ACD1
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 16:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A94agFYxm+CxKtAyC8velIPsvJSckz+j9xJuzo1LIdA=; b=b1bMRfuivAZEis
	Xg1FJqTbX0r2XdznTW38XI7Ihww/WzKGUgdCrRB8sf4fkqfev71fwh8QY7fEDNWqGKuGFGkOJxHtL
	OWjGrKG/1QQMZkJbxzkjmo3IfY4KKpXda5o13oRiJ2ozpXmg9RHcIhAv/EUFAIVTbOe3plTWhAZnv
	nlojGuLtexA7QDciBJsXeBdNNnRZEAAkDZ3lbeY284sZaD81jvYPw7mlbaVygYGKl3WZBl+IS+ja3
	rYUL4MgBIvBHrFGcAG1mklharK4NPKI1uh/58FYbbXDcRAVe/kttm1a1BKpViqBb/35Tb2RPYLKEG
	xxkBVCMeIueaZjTm8eiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jJG-0000000EdaT-1mdF;
	Thu, 12 Mar 2026 16:54:54 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jJE-0000000EdYk-0PMN
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 16:54:53 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5094e1d17d3so7532911cf.3
        for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2026 09:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773334491; x=1773939291; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VQXCfPVu6b6dIVECzm0C8AUD7IL7VvpSkD5+M4S95sw=;
        b=UsdsnAJqPQvBZshtgN+VLLU3SwT08TUrr4ghixmMtGsByjJ1qVVWXYQ81GJLYPAQMS
         k/jsNU7shUhDXIm9x/y5r5vSBhTUYOwT5l/P9fRwoqHTWu6G/HMrTKt1nd8IppqVScK6
         oYfxrRlSnEh5Z6hLhagvYqI6BTSYgZug+uUPYF19v2CgPNzAKgDoxkDjOdqRROsxj8Zw
         RaTSGy0d7otss8KX82R3WOLZhr/WYFIyduQDfW7WxW8US8oQcLhN1K9MpJkylY5LU0Bg
         qkMEXYu6exBlWS3thd/XMLJkHngzIZGxE9nMIC2b6k0WkjohyfH7CrLt+vgd4O660HIX
         lRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773334491; x=1773939291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQXCfPVu6b6dIVECzm0C8AUD7IL7VvpSkD5+M4S95sw=;
        b=IbIOq92QAaZZL2GtVoxeQJgmJJkd0J8kwVcgclE0zVUdQfLOZAMfw2KAVhUg8HOHvC
         +TtNgSvJFyZRf0wFqpIixI60y1uOUo7VDaPaiO6o1ReyWfop5Cdhp+0Gjlygj0gsTBuW
         zg1oT853aWNcLP/bD0LH/UFfx5PgFe1K3wtTeG6SQnW1a6F3hIWreAbeqT1HAzJ/jzYF
         3IZBD6bbJYNUcLove1547Yp/1LFa8g4+XIc9sck7kfdTge4q/BMX1nyFiYmkGe+UmsM/
         RonUCGWSfhCjHOUYQHBjSVvJZyHJMxSrFFidHQ5+f1hGd+gjXvdKZ3cPKnUnE12icj9/
         EtdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVD3GJ32gRwpAdVy8rA19JAsVfSOdkGbA9aoLKbnJCoq7DV4wGEwfC5HnyWhTzePyrIfaGn9+cFoig=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxh38mofM2Z9iCvv49D2UMM/5fRnRQ6aJ6jrDHCW0UKoTjHI7z+
	srd+iNUmYsGTloKtYpE/kcRVE+cvyEIRx3rN2KpsML1yjqLEd9UieRWWX7JLebTd+LU=
X-Gm-Gg: ATEYQzxNnAf8zPf0mpx/4JIL57y1cfYrSTsvJVGH6vCfhQ1DYmB3l2yv8tw/HtFxEOn
	eJ4CYSng5Hc8B6pWDZo0S+csRL8dxBS80BBiGOL9O9rEVcBW4Pavc2UdWQG3Hxp1lec1UsVSviT
	0Bn15ZwNpjP/KrSgsGIuPackfEr6H/0KJImLEo41FEOBGA2YuN9f18c6G8YUl+TvhpGMavxZWBV
	G1PFgkY4yOz05RHVw2JLlUDTkfN0uz8clThX8sRaEaknl8+RSa2qkl9ACO5cevr0ZxthDaeL4sM
	8PeRE1iMeLHISMNIIQ++9fO+wSZ+qhpT/4t3UcxyH+jcLryfgUE8G5UTrQp+1KPqhxu222izL5K
	OqO0PpKZ9N25FowdPSpX39VWZ4+AdgxLY1sLDQ/wCji0MKlV181gFY8Dmgl4gD8S2eTxJQ3WXuV
	ZTYmdmp2T+wu+UrwX13jBPQsHWKgNB60S2p5dxdv3T0Gg6jddHrZ728+RqzuPH+ZWiSU/QplcS9
	x495Dl/xR3eMAteDJE=
X-Received: by 2002:a05:622a:289:b0:509:44c3:5ffa with SMTP id d75a77b69052e-50957e10673mr1403911cf.52.1773334490530;
        Thu, 12 Mar 2026 09:54:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5093a119602sm36658181cf.28.2026.03.12.09.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 09:54:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0jJA-00000006i8N-40X9;
	Thu, 12 Mar 2026 13:54:48 -0300
Date: Thu, 12 Mar 2026 13:54:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Kuan-Wei Chiu <visitorckw@gmail.com>, Philipp Hahn <phahn-oss@avm.de>,
	amd-gfx@lists.freedesktop.org, apparmor@lists.ubuntu.com,
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
	tipc-discussion@lists.sourceforge.net, v9fs@lists.linux.dev
Subject: Re: [PATCH 00/61] treewide: Use IS_ERR_OR_NULL over manual NULL
 check - refactor
Message-ID: <20260312165448.GN1469476@ziepe.ca>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <abBlpGKO842B3yl9@google.com>
 <20260312125730.GI1469476@ziepe.ca>
 <f5688b895eaebabae6545a0d9baf8f1404e8454e.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f5688b895eaebabae6545a0d9baf8f1404e8454e.camel@HansenPartnership.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_095452_239985_8B0A2FD8 
X-CRM114-Status: GOOD (  20.36  )
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

On Thu, Mar 12, 2026 at 11:32:37AM -0400, James Bottomley wrote:
> On Thu, 2026-03-12 at 09:57 -0300, Jason Gunthorpe wrote:
> > On Wed, Mar 11, 2026 at 02:40:36AM +0800, Kuan-Wei Chiu wrote:
> > 
> > > IMHO, the necessity of IS_ERR_OR_NULL() often highlights a
> > > confusing or flawed API design. It usually implies that the caller
> > > is unsure whether a failure results in an error pointer or a NULL
> > > pointer. 
> > 
> > +1
> > 
> > IS_ERR_OR_NULL() should always be looked on with suspicion. Very
> > little should be returning some tri-state 'ERR' 'NULL' 'SUCCESS'
> > pointer. What does the middle condition even mean? IS_ERR_OR_NULL()
> > implies ERR and NULL are semanticly the same, so fix the things to
> > always use ERR.
> 
> Not in any way supporting the original patch.  However, the pattern
> ERR, NULL, PTR is used extensively in the dentry code of filesystems. 
> See the try_lookup..() set of functions in fs/namei.c
> 
> The meaning is
> 
> PTR - I found it
> NULL - It definitely doesn't exist
> ERR - something went wrong during the lookup.
> 
> So I don't think you can blanket say this pattern is wrong.

Lots of places also would return ENOENT, I'd argue that is easier to
use..

But yes, I did use the word "suspicion" not blanket wrong :)

Jason

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
