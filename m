Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A8DC02198
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Feb 2025 21:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbtJFbKpdzjn3PAMXNQiBMhjetHwSRbGZ7W3bg+ENAY=; b=luhjzTVrqAO42Y
	Fb8Gp2eedsQEf8vQbkcktbmes0UK43B0IYEXs+xWf/GCo1Bul40ktYi5Vzjz8HNKztZtErvMLs7sB
	zJf3nGYHw1xgBnVZfFdUwpARRzQvx227Ya6uvz6wGug2eBb7Zdmp/MMkBpYeJu44MGzVoTEqOc9oo
	2/FpbNwkpAwNVbKGciLQriTD/Z53HkkORzNlXiSD52cvf14UItZ5I/RHXVn0m/jJ/dg3xpd0xr7x0
	VEPDvnsT53+wsN9PMkCyCyT2IKOqZ88QKbLfL+lr0TM7OUwRtAAK0Y/28+3ShiuDOFS+vJz/g7pCf
	x2AuGO/Tp46euXLnjKCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbkq-00000001Zl3-3IHg;
	Mon, 10 Feb 2025 21:55:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thadr-00000001OkM-2HKz
	for linux-mtd@bombadil.infradead.org;
	Mon, 10 Feb 2025 20:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6NEtmwV9Q2eVZm1Q+MnmM9n3jU9l+OA4FDiy13V9L+I=; b=T6oM/+muB30TfevffU2mDlXl/t
	wLotEmllD6E0zXaTT/GOjDH839lbw8XN9swnYBfnqfxOEjxpJH5/h+457FU6XehkYGxxiSF5Sp3au
	aixWJxLQWO1t1RU+QpNMDV41BlKgAJ8gdoLPd5eQ4ZeKaXTJRZQVMYflUR+BlS9wxLXtievboqLGU
	OVQLR0AbU1Aj8zaGEcqEOuW2Cj0oKLpaLcwT8qbYzCnO2I6btNbTLdGMk1iOeSuJpvo3uvDzn6G1j
	XhENz5cJaIkvXOePbbbWVkbogUgaOcn0rjTI3U/O3JFNnP7ZvwZaQQTDprqH2E90h1HsfoK0UmJzk
	QLsKPMvg==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thadn-00000000FXv-2fFW
	for linux-mtd@lists.infradead.org;
	Mon, 10 Feb 2025 20:44:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436345cc17bso33500365e9.0
        for <linux-mtd@lists.infradead.org>; Mon, 10 Feb 2025 12:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739220265; x=1739825065; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6NEtmwV9Q2eVZm1Q+MnmM9n3jU9l+OA4FDiy13V9L+I=;
        b=AXbS+ceUbE/3HAsY1S4fJDrMJMipm/PeZyW0tOLfasdE/Kgyf2+0wTJ7cGQYHwKVEY
         GzQRr0FCcbZLmppRl1MLfKqt0HYUBuscuq196diTpkmsjGUKzxW4+irJGdvMdKNgZZuB
         Lqj8o/dWUb/u05CcA3/8dJRSBmQR1MBiaUwRVepPiZiz/GJyF9y+7KAIKlRciZI5A/Sj
         paqNlPuhxDGuJfKN9TSgXB3ZYWdv+JTNXETOMme/XOioF8q05AX0AVbrTYcHoasxt6ZZ
         IcFl0vPF9wH8Zq9nyx37/uoOrFCineCApMJNTJY/BBl1Rhk5DHA2vc9T9okmgcBnagNB
         Q3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739220265; x=1739825065;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NEtmwV9Q2eVZm1Q+MnmM9n3jU9l+OA4FDiy13V9L+I=;
        b=imj2MkYunMlku2XTZhePwgJd6OgNPHmBdOUzxuqnf/GzUOrIFcfh/c18fa07uJ8Fc0
         tdv7YnqEnLEJu4mNL0ibZd8+VVMyIwQW0VoKEM5b0m7Kw8iZh8mawgqcGm885eWG/DqZ
         WCAiEvpRDVFF7RU4SrX/yfy5wghahfezPqlsMsbDOkOclwM8IWkpyfBHcPReUlX04uRs
         5cizNxfRXrnSE5oTUiohEEYGELd0DThCA7+dbI+XkP/Q9Hgq+CkovnNRSN0Z14T5MoRi
         RIrcukiGlyZJsrFETCZ9OmGoMp3/z4TIPRZmaL6KnWBlH5Utb1JER5lUyYmnMgNMnZ3c
         /Fng==
X-Forwarded-Encrypted: i=1; AJvYcCXLJgLPyC1erS8gNIED4We93tUXbZPQoAkXSdoCNmqibdWGz+UIaR1zowOY1XSkeoOBqxqX8n7osXY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMuwFvVl/aw1UR6Fv13MwTYMl9AveF5wt3Pt+rrKydjHsEyOl9
	keqORJ2Nh6YWKjslbW69PfDEb/h42KBKNMoJdQSE46R2oHbYkO8L
X-Gm-Gg: ASbGnctv3PquEVCafoWvJks8oXWHy3chmQkITxkheGS27jLvGqFXOYuexLlOnXDo/gR
	4l1NDsag4BvslLm3PkqiDqZgB9Vj3n1Glf+LsL8gVElfngz8mNbx/WJZtxbyeeoDm4yUETn3k3J
	y6d+jQG1Tg4DDKYGDB2fcai7g55dZLWBjwE0JDn3xUoj5OPnqHL0ojKkxdnCl2nNyjrwrB/JyH0
	/6bLobtBAgij9DE5ZSZuKQHjOitVq4lCi7UcHfcUj0/qm3Bwb22Y9OsKS+ifeJi8C3yt61lWT4D
	8DzV1mnYhDc9glJ2I8BaIPzOk6Mdwa22kbSYIURD21J1j18=
X-Google-Smtp-Source: AGHT+IEg6Ex9yGj6IiVO4T3XJmOEo5+UOLRM1MjE0cCRwNc4t8KclMZj/motXYPdvRG1V4Payg6/Yw==
X-Received: by 2002:a05:600c:4e13:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-4394c8538fdmr9875435e9.25.1739220264602;
        Mon, 10 Feb 2025 12:44:24 -0800 (PST)
Received: from Ansuel-XPS. (93-34-91-161.ip49.fastwebnet.it. [93.34.91.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db110dfsm194994495e9.36.2025.02.10.12.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:44:23 -0800 (PST)
Message-ID: <67aa6527.050a0220.173001.b011@mx.google.com>
X-Google-Original-Message-ID: <Z6plJSh-02AN7QaU@Ansuel-XPS.>
Date: Mon, 10 Feb 2025 21:44:21 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: qcom: finish converting register to
 FIELD_PREP
References: <20250209145439.19047-1-ansuelsmth@gmail.com>
 <877c5xu8yt.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877c5xu8yt.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_204427_740126_A10CE558 
X-CRM114-Status: GOOD (  25.03  )
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

On Mon, Feb 10, 2025 at 04:15:38PM +0100, Miquel Raynal wrote:
> Hello Christian,
> 
> On 09/02/2025 at 15:54:32 +01, Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > With some research in some obscure old QSDK, it was possible to find the
> > MASK of the last register there were still set with raw shift and
> > convert them to FIELD_PREP API.
> >
> > This is only a cleanup and modernize the code a bit and doesn't make
> > any behaviour change.
> >
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/mtd/nand/raw/qcom_nandc.c    | 36 ++++++++++++++--------------
> 
> I'm fine with your two patches. I was about to apply them, but the first
> one needs to go through fixes, whereas the second through next, and they
> are dependent on each other. I propose the following modification:
> - create patch 1/2 with the content of the cleanup done just below, but
>   only adapted to the very specific spot that is touched by the fix "fix
>   broken config...". It would be a prerequisite for the fix.
> - patch 2/2 would be the content of "fix broken config..."
> 
> And aside, a totally independent patch easy to apply on -rc1 with the
> rest of this patch.
> 
> Would that work for you?
>

Mhhh are they really dependent on each other?

I posted them in 2 separate patch as one should have priority and be
applied ASAP. The other is really a cleanup and from what I can see no
delta in the patch gets affected by the fix in the other patch.

In theory they should apply independently.

An alternative solution might be to just delay the cleanup patch and
post/merge it later in some week? Open to any suggetion to better handle
this but I feel they don't conflict on each other (please confirm if I'm
wrong about this)

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
