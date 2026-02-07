Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4DEEE6B7B
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Feb 2026 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JXzEOWEnhfo3B11alcaFgyayHRD/0bX1xJl7pOkOKZk=; b=btpRa5HcyQapgi
	LA9Se1NOvukGU/dva/JE27CsoXLutD1xfSoOtMai2nz3nW3h6qIApqkJr9zCOFnc3fezjShVEU0JB
	szEJo4jqdddUxQhn07kXajU3u+IsIdLqXXFf+DauRsuSnlfy4mFO6XcM7gCozA1E99psMyrk/3bNi
	4jF9q7/Egkqegiw3Y72rxFzPUk42/cgU9OZhRZRCnmnN6x0vU96Mqo7w2RsNCuz3QnxgrZEkyJTtX
	NZme1Q1dOI7cvyN24aR7CeOKLifmUvEzl5cafYHb9K616bxhoFNa2C8qxUzxyAL1mLQf5fhymFVIZ
	k0c20zwSdmd3WIZf79uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vocvJ-0000000CDVT-1Qqr;
	Sat, 07 Feb 2026 07:40:09 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vocvG-0000000CDUs-35N0
	for linux-mtd@lists.infradead.org;
	Sat, 07 Feb 2026 07:40:07 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-82458495219so88383b3a.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Feb 2026 23:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770450006; x=1771054806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bvuGBu+OxumgU+D2haW3SONr3nadlQK9e2+mmYZ7LE=;
        b=M34gPL2JnXE2U23GU9WTL9wbufRQyZpRPlw0x95I/OHKvLdjWqnXGwT4AzC/6y9qq0
         mItLnyqSktUeIsm47wDdGIB+lAk8JwxOoKQauHsdn2ZfmO6i22JXXUywrmuTK4Mi4iVC
         lgv1g106NAG/cMolQ/Vh8MC2qM3AQDAe+MxwepVZ9YtpFlwXFq8sbRgQ0iCNXYaNB5ti
         Z7nONwabpPpKKh5UlXKe9iL7e0s9o/2d7zK7lw629rWHgtDfKzr03fvwzCt6LJJjVQaX
         0piJQ6XkVaDAWh6OuOMGdLsa0jOPJznMXiFhfD6wThVlQJaaNSvCyX6qv1KYkyb517TQ
         ZwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770450006; x=1771054806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0bvuGBu+OxumgU+D2haW3SONr3nadlQK9e2+mmYZ7LE=;
        b=BvoKxu2GSdu/yaK41CRsFx8bMiTCaEcke6CITTXFhFejJvKIQGAGGKm2QWvJHJUhrh
         5D/9TyB6irfh89BVjEPQSuG3mjuEt157r89beSkP0++cBPmbCjAhhVIAaIVCUx3OHG4L
         OFpRBdfpU3P+s/Qf+1MvlB9SiTL72S+mvwojVape/pbYnYlGAGbsMQwgegM0mODG2RmG
         /AqsgtdkqTlQt3MolJN98tCABqWcUty6s4tqOwvEF4pTfHoUBqSJJ44OSBfZ+cfo+gRb
         W9Fjl6E5KvEyRAEc+/TJGp4ch62IMh+UpAVmvphOzvVKhEQ8tHTvgZd+Yy35PvdPPESV
         H4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1A99MoAl+TwIcXkrp2wL0CPgiZ+dHU3FkP0W5oU+b2Q83m0Yop50B+oqvdGQ+pyRixmtl4310ocQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxNzXufJ1NBRzWeTZ7NKXplrogvaZsQ16dY4h91ENdj68TQ8f3+
	S/8ao63Uuz0iqnPCAsvcVY/hHK6im+znoQGwnRZ6wGJB/iamYKa9Q1S2j4WeGA==
X-Gm-Gg: AZuq6aKkiIHdUDB5VLi97xkkA9Pu47lqoqDZqLmLB78epMNP6X5iRf151P9p1iigvkO
	qUO+M4SuJ2rwgv1EkzTmT+n1P7JzQf1i9mWnRNrnTeB75bWhpwJhqe5wIpbmUX/Uc21POgOYeem
	sFJAo2U0RJ9g2NLFGerJFcY9Q/R1bgPTeLvGvNCwWNOfY8xJNW4oqmSMJsYZf0EKMX+ZP2YMUIR
	Co5LpvGja3x5kgipCCo8R4ZdwN5tiqO8L8exiP7m+pLFTVlWPxJJZ9haATt4sDuPJeXMwzu/ul2
	teGx1M63JffQc5me8e5yqWS4i3ljlzdGNoBLxTlj0EEqBSaKXn9X3uUSCcfW/2jquEYlUwfzhi4
	B8hKoPgYJFQCUOCCtIPtoYFCF+OOsjUYRhq9+mHsIHgPHm2064otQczJvvqxCKUnyRR1Q90+ieG
	VGnqgWFk2KOw==
X-Received: by 2002:a05:6a00:94c7:b0:7fb:f87d:a0aa with SMTP id d2e1a72fcca58-8244173a71amr4103036b3a.52.1770450005724;
        Fri, 06 Feb 2026 23:40:05 -0800 (PST)
Received: from archlinux ([45.119.31.85])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8245b62d773sm457535b3a.36.2026.02.06.23.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 23:40:05 -0800 (PST)
From: Adarsh Das <adarshdas950@gmail.com>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: dwmw2@infradead.org,
	richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adarsh Das <adarshdas950@gmail.com>
Subject: Re: [PATCH] jffs2: use fs_umode_to_dtype() for dirent type
Date: Sat,  7 Feb 2026 13:09:48 +0530
Message-ID: <20260207073948.48144-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <134dec36-3bcf-89a4-2817-a880afa4280f@huawei.com>
References: <134dec36-3bcf-89a4-2817-a880afa4280f@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_234006_801912_0546E4B4 
X-CRM114-Status: GOOD (  10.54  )
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

Hi Zhihao,

Thank you for taking the time to review my patch!

I'm trying to understand the issue you've identified. I looked at the 
fs_umode_to_dtype() implementation in fs/fs_types.c:

    unsigned char fs_umode_to_dtype(umode_t mode) {
        return fs_ftype_to_dtype(fs_umode_to_ftype(mode));
    }

From what I can see, it seems like the function does produce FT_FIFO (5) 
as an intermediate value, but then converts it back before returning. 
Here's what I think happens for S_IFIFO (0010000):

Old bit-shift code:
    type = (mode & S_IFMT) >> 12
         = (0010000 & 00170000) >> 12
         = 0010000 >> 12
         = 1 (DT_FIFO)

New fs_umode_to_dtype() code:
    Step 1: fs_umode_to_ftype(0010000)
            = fs_ftype_by_dtype[S_DT(0010000)]
            = fs_ftype_by_dtype[1]
            = FT_FIFO = 5

    Step 2: fs_ftype_to_dtype(5)
            = fs_dtype_by_ftype[5]
            = DT_FIFO = 1

I'm not sure how FT_FIFO (5) would remain after the function returns, since 
it seems to get converted back to DT_FIFO (1) in step 2.

If there's an issue with this approach, I can edit my patch and keep changes in only jffs2_mknod.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
