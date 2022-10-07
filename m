Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F6EC43217
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Oct 2022 21:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DPg6ZD5+kYZB95icQ3uOaDsnQAEruwOVYP+lv7Z1/tk=; b=EZ0
	td4M3AxXKCzw5ZA1sQ6HHVq/tKCm4I8SpcQnXpGG38KReVpK9Wmf34tWWji2Nglm0GlihhJIsHnNC
	HuJdVTziWT8LiMCK6eCFEniCR0hzCN5FwonwOD8qi1fpBNUAo6cQhBOtlC+N6XjomdpTVVYchb8zK
	5zqVoqOULiBTvrAI1Sx0+nNmnu627bbgbCljPslfnfrbnY+kw3fORk88x0/vGgd5Cp4FBjypAyHRp
	dNWwHkIwtTdHoGHYZ9QZv4n7XTN75uSo2CAFkbrvTTJeZpxImnF7kUpJSyiT2uA4IF/wGOhprCjmi
	t88FLevJw7KLMynEtGTSmwCovtu5JHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogvEv-00Ahn7-9O; Fri, 07 Oct 2022 21:50:41 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogvEs-00Ahm2-G6
	for linux-mtd@lists.infradead.org; Fri, 07 Oct 2022 21:50:39 +0000
Received: by mail-pg1-x549.google.com with SMTP id b11-20020a630c0b000000b0044c0bb18323so3506216pgl.17
        for <linux-mtd@lists.infradead.org>; Fri, 07 Oct 2022 14:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7/yVcGYygsrAEZFYKV0NW4OziSMy6BZisPCxXiPujb8=;
        b=XpGN9HYFdv5WvEkOkY9rgpF+Wim45NNbn4P0GrEOPOWjMe79qqCr4xoXFYfdb60N+E
         gqhBtgKozIH+YI22jjyl4WlITO7bEx+bgr/3R7sOKOQ0oeFPTSzY0YR4mmdxO1H8imjj
         PQzw9ePzT5bpEdEM1vdyixSGBH7bkthNUTIKJ23QhMGkh+2M09RDtnZwUee/HpURCrmq
         fCGGgnWMv6rT3L0RWT4kEYR7+vzGo4kSRA3Qz7ZlJoRPTiOHnzADHAoI+77BonF2sWRl
         2uSGryYYdhi6tEva9spi3Oh3lxPFEUR+xVgx76UXjYPuIRllJosz59PsHzCjse+Vu2rL
         qxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7/yVcGYygsrAEZFYKV0NW4OziSMy6BZisPCxXiPujb8=;
        b=QAJLNUSa9zPurFkOeaEgDqbIxcAH6AocUmkmyaZgT6u2sZin4jBv0FfMWLdemHslG5
         OOE+gGmT+zPiXYubLuNDEuCEbmxhCgB/NnkV7ZpNVfLDnwuJUA27lbliNQeRCsZYae6p
         tk2hg0vp1Vere26lu595WzAXI+glQ6LZJBRdQfFeg2347Fho84dZvww5MpMWQ7mCWF/N
         BFtmuyJ9coBSpGG2V9eHBz9xKjlnnB3ElAb1CLxVNjXp9YWvknSsKPCbRBD6yjf4p33V
         iKh1tHyc/GahY5zCUb7QqBXcZVMKdj+BRgg3ckHgnzykSaBxVsXlyzjhaVjbCNaC1cyJ
         jLxw==
X-Gm-Message-State: ACrzQf1ZXnkVLpA8nMpYhCyS0bPskCbnyQZeGVWoUx/v7L7hSxLLzenz
	J+QbogC5IKzNFLicPWYZb5ED90+YqBpZ
X-Google-Smtp-Source: AMsMyM5y0wueuZvi4OVNCMErL2v02Mlg8WCBTvrXSuakRQLPoC4y79uu723Mc0rRIXk6ISJY9I9vsiR0f7JU
X-Received: from sgzhang.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3d89])
 (user=sgzhang job=sendgmr) by 2002:a05:6a00:1707:b0:562:e790:dfc3 with SMTP
 id h7-20020a056a00170700b00562e790dfc3mr990774pfc.59.1665179432707; Fri, 07
 Oct 2022 14:50:32 -0700 (PDT)
Date: Fri,  7 Oct 2022 21:50:24 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.38.0.rc1.362.ged0d419d3c-goog
Message-ID: <20221007215027.918507-1-sgzhang@google.com>
Subject: [PATCH v3 0/3] mtd: mtdoops: use pr_ functions, add and direct call
 mtdoops_erase function when panic
From: Ray Zhang <sgzhang@google.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ray Zhang <sgzhang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221007_145038_575276_935939CE 
X-CRM114-Status: UNSURE (   6.49  )
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

In mtdoops driver, to comply with latest kernel code requirement, change
printk() to counterpart pr_ functions. [Note: change to pr_debug() may
cause behavior difference.] Add mtdoops_erase function; When panic
function invokes mtdoops, if needed, call mtdoops_erase function
immediately.

Ray Zhang (3):
  mtd: mtdoops: change printk() to counterpart pr_ functions
  mtd: mtdoops: add mtdoops_erase function and move mtdoops_inc_counter
    to after it
  mtd: mtdoops: panic caused mtdoops to call mtdoops_erase function
    immediately

 drivers/mtd/mtdoops.c | 107 +++++++++++++++++++++++-------------------
 1 file changed, 60 insertions(+), 47 deletions(-)

-- 
2.38.0.rc1.362.ged0d419d3c-goog


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
