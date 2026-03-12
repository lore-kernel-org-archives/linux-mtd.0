Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC6D105A591
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Mar 2026 12:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVhHNKGUUOJ75zQhTcJ+QhKKjM7uPom28p37+z55mRs=; b=OQzc4GhaKmJjoz
	I9f0b/S+5zBgODO8ZWoqJSxRc0CfBQ2JfZ3DZ5F4wEMx267DnyCylYhbTsXUdVPC/yx2h/O/bOfNl
	PhMzhOmUS/MTcBRmZ/69kIs+YN2NEqmO+RZmqoiIhKQE2whJBn18VseQo2/Vv1OtZW5mG0DEYHS6X
	A8dk4hqp9uS6zLncf2/bxSs5xZQKyunZ1Lya7mVjWY1pdnQzQ9KoDsSKOp5GCev/wUKP4yZiDJRMe
	L2nTkmVO3r3cJmRFaTnV7i2l6oJQ3NtAqiLi24SjC9GMyamPJ9Be/JXq+YXsHgEQ9B/oZKT+ZbnTZ
	xyyg1f2yNxAqUh6keOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fbe-0000000E5cT-1X8P;
	Thu, 12 Mar 2026 12:57:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fbc-0000000E5bL-4B6F
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Mar 2026 12:57:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=; b=OayXmUV1mWCuIEwbhxfSAKrtBc
	5vJty8eYG3YdA1p5aystI+RU4bkKUYiPVZodPUL/6mBdnB5/Ypkta7TuRCQTJ4Hf+tCXw96BT4tMi
	weKK4hBAGNzqBy7feDe2/P31tl91dH3wz7MnrZnse29MkeJWsleD2qjUwcN0qXW+vbYkLAgIsTjpM
	gvFTdkY3e9wVF6Yd6l6zarhXAJfSAtf9D5VZFRJ/ic9XZTYyqJ7ernz2GTyicooFSSAwjxMQ22wkR
	SoO1qv156aw4hCPfJXlTE5Pm26aoaH8RczmyAQLV3vipRSygpWJjAc5EmLrkxWq88BDfTEGoeVD1E
	8U/h6CFA==;
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0fba-00000001AqV-11CE
	for linux-mtd@lists.infradead.org;
	Thu, 12 Mar 2026 12:57:35 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8cd73c4a827so89608785a.3
        for <linux-mtd@lists.infradead.org>; Thu, 12 Mar 2026 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1773320252; x=1773925052; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=;
        b=iw5qPPT34HDEMIsXfVuGQVadqiiLiCX9PSYu6mfSb5q8pG2Zta++Bi5jO5hu2g6YFJ
         wTc1x4CTfGSRObks11vRzEMH0mSz+45H7uSO3crnDdnisto+K8YOB10zRI6ki0FMCFsl
         quYIW0rxZamxVD0Dvo41iehkwXSFpyOoaEKCRjIdmnKSkyfT9qp/tn9EWTZSyUGjskqL
         L0tHRaj/DsG8f62JeRyuh3eRb4WbBZYm7Us9AVQUnVgVM7W9mZjWm7bYERmVff30jOwO
         3xQXwyYZejNFjkOKkdENzhA0keU8N9kA7HoVCtMQNarVUa6rmwTyDoQj4IqEckHnTW6K
         dJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320252; x=1773925052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J1SF1XBHkHR0j7NZVucv0LxpGoGXl67PUefLsfwpAbo=;
        b=oX+3vSyDj3L4t8AluxL+H10DgXD3YuaPYnsJtkiJsJJIvG/xza04TM73zvp5R6kZUF
         DG5mkPcJTgXe9TpTu1rXPKStzeTwwsIJl+rm+vpyg+Jf1B3p/2hWzICJ7HfT+OFSgaYL
         nmiP5XJuyMUgdLi3ei8sW5OXovJLN653GDy1uXoBpZlogq7CtYZPrybYJudQcSZozug7
         5cSY1YJ01QA04mcjTel5cL9FCydcPzOx5/kQ8uiGi5+s3mVlPvAV39J5HB+HJy6NeiTs
         yPGw0/IwMnHVPu8N2TKCNPJmx5YgU/J2a3Fg/k/bFIPXRVRbUGewKQh3k7OJDs2rHBou
         mUBw==
X-Forwarded-Encrypted: i=1; AJvYcCU0glJx1oOdWZ0mbzrnVo4JlxtozqyRup63qxuMp5eLx79CKVA0NbodE8ibl+4yv5rsRJniB1qZYTM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzCiwJ0QoGZI1gqLuQzZU6Rw0NKAmMTENg6j5H4LUQVEeR96f/
	ITmBjEdmiddUwgSasGpxDCoX/36qdU+zgZ+dDlZaGFwtXKqVy1AXiy+X0P5ij6bWbgU=
X-Gm-Gg: ATEYQzx2RpTJtBnanxCEITzhjS4ZBOnI0YW90YxNds/v5+pdDyx7DlZnaVNsJZ2DAgE
	28ZNRGk+kWWrwQGw6Dcur+ikuhmZz6aDUx55k6u6NoYVtFZOx0EGXMFU/BUGivOwFq1sEXkwyDr
	YrXOFzj8dgG3BjCai5XhQFKPyoEyB3i3jPepOm+solBpkDYLn2Ed9WvhMqKHpmL1ao35dChgm02
	5lAzVqJhrQjGHZgP84SmAMSXpNoAPtTDRx1J5D5djSkCMBP8Ji/kXFVSxF5zAlEzDqXo3fO5vLl
	Y9VXhKfF95buKdQK1uEiz8tnHJIDxkFJcDSxGRWqL/uNtEup0I3A4x1GIT/lJ3GOhBP6Nv+ffkx
	ffVMLO0BsqUY6ah7E8ob2Uog6tl5VVe5UxGBy7xj/T00aUKdcZGN8vzIRUTNx7oGmDe/zqVL3RT
	Yu0QKBa/MdAPjOWxZXNgWHMmPcwLlTBWHO0pvFNd5DJ5zJYshh19XeYX67K77P55IzmPFPLVm4Y
	Md8OeuD
X-Received: by 2002:ac8:5d4d:0:b0:509:cbc:127b with SMTP id d75a77b69052e-5093a1bd58fmr77950521cf.60.1773320251710;
        Thu, 12 Mar 2026 05:57:31 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd318fsm33341196d6.8.2026.03.12.05.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 05:57:31 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1w0fbW-00000006fKD-1POa;
	Thu, 12 Mar 2026 09:57:30 -0300
Date: Thu, 12 Mar 2026 09:57:30 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: Philipp Hahn <phahn-oss@avm.de>, amd-gfx@lists.freedesktop.org,
	apparmor@lists.ubuntu.com, bpf@vger.kernel.org,
	ceph-devel@vger.kernel.org, cocci@inria.fr,
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
Message-ID: <20260312125730.GI1469476@ziepe.ca>
References: <20260310-b4-is_err_or_null-v1-0-bd63b656022d@avm.de>
 <abBlpGKO842B3yl9@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abBlpGKO842B3yl9@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_125734_330996_22163659 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

On Wed, Mar 11, 2026 at 02:40:36AM +0800, Kuan-Wei Chiu wrote:

> IMHO, the necessity of IS_ERR_OR_NULL() often highlights a confusing or
> flawed API design. It usually implies that the caller is unsure whether
> a failure results in an error pointer or a NULL pointer. 

+1

IS_ERR_OR_NULL() should always be looked on with suspicion. Very
little should be returning some tri-state 'ERR' 'NULL' 'SUCCESS'
pointer. What does the middle condition even mean? IS_ERR_OR_NULL()
implies ERR and NULL are semanticly the same, so fix the things to
always use ERR.

If you want to improve things work to get rid of the NULL checks this
script identifies. Remove ERR or NULL because only one can ever
happen, or fix the source to consistently return ERR.

Jason

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
