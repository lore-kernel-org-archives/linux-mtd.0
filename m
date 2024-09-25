Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2B2C369D9
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Sep 2024 12:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:To:
	Message-ID:From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hAOaUeA3r9qfUhpSptyUpD24o3jybrDeoblgyjqYe+M=; b=nv5A0LIzYB+ITe
	1r3vwI30712+z44ouT9dvHSRB5dgvvW4+ZO7/ple2HjoaJgJULpxXdorm3+OTugXoRCvkW4i4Vqpv
	QouHWguEH8lYTnLzQlzCpXHzhzhMnlAamxVO6FvArXR+QOfNR2VYNmH6RdSb9Z0IFbTrvDV4iYuGJ
	fhsZFGV7AYeor65SgCsLemwPhTeizNZm1Zuhqffo6sM8pt9YcgZuMtoA1S3FHKkpBtzPw8FqBkYOh
	cO0Y5vER99rfIHMWJzUlQixyU8leUOFsSOxkjfuQowlnPYzNEWb7nJETMZ+difdGM0W6OxrnkEDXB
	bX5z44a7hZ1kk6yJlTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stRWh-00000005FA9-3mlE;
	Wed, 25 Sep 2024 12:53:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stRT8-00000005E7I-2bSy
	for linux-mtd@lists.infradead.org;
	Wed, 25 Sep 2024 12:50:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2055a3f80a4so41984205ad.2
        for <linux-mtd@lists.infradead.org>; Wed, 25 Sep 2024 05:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727268608; x=1727873408; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=fhgVEr9OtkoHlTu1MI2nfCR5Kp07QWsHA5UJdSDlYIagFae0uiGRM09Ga2x24AmD0z
         l146v6KjncLq7fGxaTR/Tf++3C99rZTRLHbX1dwdiomiwTwYkUnvJj1BUZVXMZk28AbN
         iSV0Gk6yuxJhowcPdFcs8UfB5udd0qa0QeGXEr3c0wNmVxIPik7Vxq2OYimb8TeQmMz6
         DVwacCHp8xW5LGf1oudyZBBSoRRGp6EMdf10fXFTrhCRQqVqzbFnEz6sJf1n3h4IsP1G
         PxtEXvVHRXnHlw1ize9UI158ilJD2yoAb9agHOkhS1L33MA+0W2x7qOn68fm1dwH/y29
         tVnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268608; x=1727873408;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vcp0J7zk08bcGnG6ixoY9FJh5UMVRDDbvoFP3uqAdc=;
        b=UJ59Wt7470UZWGTKZjxmdT9cpPv8z1Ad6tD99XpXxB4VMVfAtIJaOZguFTtMCJ9uGL
         zUcfRPD2iuV5mwf+a2VRcQZMXezKZv0dX5sQ4rxygOVBr19qq0ishxST+AMehN8hod+1
         H/VpieNkGLRwTQDMrUnQ5Dj0yqCItw10opkn/ZN17t3Mx16x3iPur45im9OfGVN6HRrB
         qEuNh+fPD3M//fz5a1vjt/l4Ga3Ii7ILyJNhCFR5iwjYGTv5Otr8kXziIJnQDbBh8nWc
         GJtdLY81GkcSspAlgCS1Xi/i6NXJbo6amnreWrYC3StV/7NpSzIXftikofJ7WLfz0YMd
         Kg7w==
X-Gm-Message-State: AOJu0YxquB115pbCtzYyh5xIJR26grBnE14Gh8jsgBu/nKovY/dGmHR2
	0PdrT8qNAXxBfIFCgsMBbr0tSB5svRcrOfGSJ9tQPf2AwmU81Vw20J+2OQ==
X-Google-Smtp-Source: AGHT+IGzS+ZvsGFlWWBLmMs9MjNljeXjdv8yyfkjYcPJ5lV3kP315mG7Jx2QvK+v/DYzV437u7dvMg==
X-Received: by 2002:a17:902:ec85:b0:1fd:67c2:f975 with SMTP id d9443c01a7336-20afc4925b8mr36836985ad.29.1727268607927;
        Wed, 25 Sep 2024 05:50:07 -0700 (PDT)
Received: from [36.50.177.249] ([36.50.177.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af16e7f40sm24312185ad.8.2024.09.25.05.50.06
        for <linux-mtd@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Sep 2024 05:50:07 -0700 (PDT)
From: Teri Olson <amandavangile05@gmail.com>
X-Google-Original-From: Teri Olson <terrolso@outlook.com>
Message-ID: <dfb506d28ff6bca0c8ed19f8a387837fcbe835d1a10e63576e4a5b6f25914ca8@mx.google.com>
To: linux-mtd@lists.infradead.org
Subject: ` Piano `
Date: Wed, 25 Sep 2024 05:50:06 -0700
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_055010_819455_2C953313 
X-CRM114-Status: UNSURE (   3.29  )
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
Reply-To: terrolson22@outlook.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello,

I'm giving out my late husband's Yamaha Baby Grand Piano for free to any passionate instrument lover. kindly let me know if you want it or have someone else who wants it.

Thanks,
Teri

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
