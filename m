Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81E18C48BEB
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Feb 2024 09:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaFzE3O2ZmeqoiuPpPi1dMgwGuRAWD1h1Iv1F/EBrmQ=; b=bzZxGMraki19UM
	OtVcFFG85+KWm4nE18r0Okh83O/GUsE2v4GAIKAmXd0MhyoECqLERjBfIXIt7DDBYB23aBFNeIj87
	t7osyPyGdjAESsuToq57ro2ToNDmgqgunu6/V+m/riGyScjXILHFczjkWVKWxGabto0tXgxpKozXL
	f7Z5RViYVp8pMHw2t8tZhOP35j/bpYnjESRKVmVyicux+2upWk57yC482J+UmLcy1s9C0xVLrOh0m
	PPRstMMzMeNFsw2WZPrtAUgECR+Xk8rFHt1KNo7KSC1yVus2kIkIDG+8UNDlFmcSwrFHXCYL3+wCr
	YZCteiFeM2aqtxwTpuYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5nb-00000004NZe-1giw;
	Thu, 22 Feb 2024 09:55:27 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5nY-00000004NZI-3aqh
	for linux-mtd@lists.infradead.org;
	Thu, 22 Feb 2024 09:55:26 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e46e07ff07so2726747b3a.3
        for <linux-mtd@lists.infradead.org>; Thu, 22 Feb 2024 01:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708595724; x=1709200524; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eV7rTjQepxpRnQDP8ZB4CGBrul90QIFvGhK+2gQqZ5A=;
        b=c0KtBNPjvODir9WjcDhQ6CFZBHx7GbGg+I9MF3k8nKn1NoDIkt1WzomQCs0bO/wGOI
         7NDnU0n33kp3gym0YZ7f+uvyqEMbSzi+sGmiqJIKL7vnMS8Sqx6Z0cY3KnyEhRKpkRvv
         ARklJvdnr6pzsp3e0daldFpJJ3YkWGGAuaHbGOy2B5qYRnDkHltcA7Aopo0zvA/aRZpH
         vgan0g2ygnaxPDxXazOInN1VbGG9PxPN3TbLkFtN9gu4u+VckOaGNj6GpT1G/36NzI6r
         WtHap1Dimg6cQ3yTrdKQl1fxOkOHcRA/tQ5+Ffntt9BboyHJMEoyyJLkiFsBag/lfXP2
         FSFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708595724; x=1709200524;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eV7rTjQepxpRnQDP8ZB4CGBrul90QIFvGhK+2gQqZ5A=;
        b=HceqsjofuDrAGkDKEZDC1XmhhZvNSNtYqT1HzVitRQZYa6fDpiaULoyyDgAovTHJG5
         Uu3n7lmHMVDX8I1GAPoHCbpZjIWaB7eCmfq+PItB305jmu3AUlTgUoN9Cm2cg2ew5AuI
         QuIJDh+ovcOCOzs2wV1UoJUCjMsCR8r5Z/nmokvw/tuev0ATvzPHhKErVyilQ7nGabgl
         IYofCtfUdwW4+IFOycygF6aWIHuZbXADMIE/Td8ZbL2kWWaG14KfCBeBkA6r6YKYBL8k
         JWUVB9dksrup5hDAGpRUzFv1jm3biE9vr/QQhlJ0ByzCcUysMMKzXN/sCSczb4vZ0JVP
         WXHg==
X-Gm-Message-State: AOJu0YwVQE1ziWPxOEGylYd0fbR6kaCXkSiZxUG/Fl+/+xBegd9tHh/g
	7dJzXguf/zvoBYgx6/0Qh7Y29/tJ3SPw4b0Ab55buzYGw3J3bJqCvOzlJi+YtQiesr7LixobSKb
	fV22JmKBC3qlphN3TQ8JuSUojSx8=
X-Google-Smtp-Source: AGHT+IHLz+wfLZXB0YHFucWdo+7FnHBMr1ojJ2eMwKRBvswE1kGZqkyZ3NW1NgKGkliVjmLhobKy2dHSoFgD8cOq8p4=
X-Received: by 2002:a17:90a:8989:b0:298:bce9:47b4 with SMTP id
 v9-20020a17090a898900b00298bce947b4mr17359396pjn.48.1708595723772; Thu, 22
 Feb 2024 01:55:23 -0800 (PST)
MIME-Version: 1.0
References: <20240201094353.33281-1-jaimeliao.tw@gmail.com> <75a22482-0d2a-4e0c-86e8-3a8e71f2f403@linaro.org>
In-Reply-To: <75a22482-0d2a-4e0c-86e8-3a8e71f2f403@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Thu, 22 Feb 2024 17:55:09 +0800
Message-ID: <CAAQoYRkVYjs_+7cSc5oU4qKoi3_5My8xk32RWq3O5V5D_xBg0A@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Add octal DTR support for Macronix flash
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org, 
	pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com, 
	richard@nod.at, vigneshr@ti.com, broonie@kernel.org, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw, "alvinzhou.tw@gmail.com" <alvinzhou.tw@gmail.com>, 
	Alvin Zhou <alvinzhou@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_015524_942514_83BED1DE 
X-CRM114-Status: UNSURE (   9.07  )
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

Hi Tudor


>
> Jaime,
>
> You're so close to have these integrated, I see there are no major
> comments for the patch set. Would you please address the comments and
> re-submit?
This patchset would be take over by Alvin.
Thank you for always giving useful and kind advice.

>
> I plan to do the PR next Monday.
>
> ta

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
