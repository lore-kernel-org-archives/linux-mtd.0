Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57649C6FD1F
	for <linux-mtd@archiver.kernel.org>; Sat, 11 Mar 2023 10:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iq2N/4gtUhhw/Uvcn75c6jGWvH3AB70+V73ofroND+A=; b=EkslIJepAinyAp
	RMjyzwAHlPYf1o8bwTdcRzWxuyKcj/cVwe01tBuFgmzxRZSsd1J4eKA0jd4f4Cj+7nHRyGzpORpGv
	PimpZjqPv7JMI+9D1Xai4gcf426VLueeY41RjXiJwMUkhU8mIn7RmaBdTuJx1+58t8P+claF0niRG
	UKG2vmtvqZhRM6ml3nwL1lqvkDtYFPe+DWSEYHWwlccxcOjWaW8qMNsm76lmGl+StFV/OotuOfFfu
	mtx8MhRo0Ch5qL8XuwjzTgRTpumEmDFN2fEir+i6x4jGZDYOqswR/GlrDi9YxVgh5b5Jj7IUBCoYf
	lz0VJphOi0ji+hOT2TyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pawbT-0009mX-Dg; Sat, 11 Mar 2023 10:37:31 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pawbQ-0009m9-EX
	for linux-mtd@lists.infradead.org; Sat, 11 Mar 2023 10:37:30 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5416698e889so26537467b3.2
        for <linux-mtd@lists.infradead.org>; Sat, 11 Mar 2023 02:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1678531046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TWkeebSfJbGROfjN6P7AFQQg4m0f28050lcJ2wytDVY=;
        b=Hs3mq3/Vy8MFaT5UUoVU7ing5Vvo82jutW4nwsFZ8UQbU53fR8LDmdp8uzQtkr43SX
         z0npi1faggB94oIKzaMVlpJlPq9fiGoT01Ib8/q2LHSP6GDA1he16Xs6+eTaJ6ymAq2c
         igzFP1qAAM2Qg2QI3XvpRG3CjPViGsQTYbBOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678531046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TWkeebSfJbGROfjN6P7AFQQg4m0f28050lcJ2wytDVY=;
        b=aTVct1uSyBtjTG/Lh/qddu+II0lfBO6RJFlESGxZWdlILDwDhqRVmz7E6HDu3da0ZH
         6KnpGjm/t60HMn7Nha/Kl2FqRR+kddaFLjScgt+UI7quW6OI04c19uLKyXzB0Kh+NteJ
         kBrDAZPoerCha6yzGeedI6phgyvjDDNoK2DRGo5PscmrvoC5DAtg3sci++FCZlmOoOEw
         6XFGlkToW3VeqBAAEcZN6BbSHE78+zb+rsEN+gAvFklRwAscOZ2duDjrz7Vq5fzbvKcS
         eFwgbLcljJGpgNO+w0waBRfx5VgZ5eoM4J6cyV9zQhwP/ojweYdxtbyDQs7cZM0CcxL8
         noiQ==
X-Gm-Message-State: AO0yUKXgHsYOm8Da/RsuHXg/wmgCdrTNrz0XbgxhRssY0EZ/pq6YNxgN
	sA1gJ8/1ALXumJNeSfaDq/2LRwaYZjjexrsMaOcjlA==
X-Google-Smtp-Source: AK7set/zT53jfMaTJhyr+9DuEt+z1ce4le7ZoILliGh7A6Ixjk6cKZhd9minwkCYZRmXjEAn6xSG9+Agez3t5kFkq6s=
X-Received: by 2002:a81:ae1d:0:b0:524:5bc5:a3d5 with SMTP id
 m29-20020a81ae1d000000b005245bc5a3d5mr17891444ywh.4.1678531046310; Sat, 11
 Mar 2023 02:37:26 -0800 (PST)
MIME-Version: 1.0
References: <20230311092929.2827-1-richard@nod.at>
In-Reply-To: <20230311092929.2827-1-richard@nod.at>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 11 Mar 2023 19:37:15 +0900
Message-ID: <CAFr9PXkZgW7Ky7LEd1jXJYAOuG-KP5iOyR1MSyYJQP7EAbrBaA@mail.gmail.com>
Subject: Re: [PATCH] ubi: block: Fix missing blk_mq_end_request
To: Richard Weinberger <richard@nod.at>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_023728_759740_9E6E40CB 
X-CRM114-Status: UNSURE (   8.44  )
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

Hi Richard,

On Sat, 11 Mar 2023 at 18:29, Richard Weinberger <richard@nod.at> wrote:
>
> Switching to BLK_MQ_F_BLOCKING wrongly removed the call to
> blk_mq_end_request(). Add it back to have our IOs finished

Machine is booting again. Thanks!

Tested-by: Daniel Palmer <daniel@0x0f.com>

Cheers,

Daniel

---

Sorry if this e-mail doesn't get to the mailing lists. gmail is doing
something wonky and sending e-mails with HTML even with plain text
selected.
The original report bounced for a bunch of recipients due to that.
Guess I'm setting up a better mail client at some point..

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
