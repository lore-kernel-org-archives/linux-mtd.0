Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63D7D2E9C9
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Nov 2024 09:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7NA5aYCn5XpYvM84Xz/eD0BKRLMn5GT/bptpygK7IMA=; b=k/P
	DOudg4nQ2tK8GLQP5U072PoeEYiirv7M/K7QqsKJy/IiQWfV8369LFg0EhQKZysMYVQh4f39XZQKm
	6WktX/GyRhBp2qXO/uCFUFr8PfDt35TdQ5oH7JU6GNDUL6gPQ24lj3wZ7JOPBEFDMldTYPjpKYOHK
	BDSauzOgnYJpnUw+DRIlm43H6+E3jJvCRlSE16e78dqolRuIM7kzpK+5cjus3uv+Zb4QVrLaZEo/N
	hslKsf6Q4E49xY5sxCnMGps25C3D4JN+0xqbYC2IfogbFJOgw6YVBecXoAqHHa4nEJJ3sGWgodxAy
	1leyB7UwQITEvhPCgkjdjrZKEXXWnsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQtM-0000000H8Ly-2WUG;
	Mon, 11 Nov 2024 09:39:28 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQri-0000000H7zf-0ut8
	for linux-mtd@lists.infradead.org;
	Mon, 11 Nov 2024 09:37:47 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso2975840a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2024 01:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1731317865; x=1731922665; darn=lists.infradead.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hM3YhjV8cwJ258TZOP6tIflpF5xNc5nuc1LlwBuo6YQ=;
        b=ac0TWSUl7PmVMznyAMV+oIs02wpyiVLKyuK6pg5hhSLoQGneo8tuhwvDr9iMWvKAra
         297MhkZYg0S/TGELUxyOp8EM5nnV9Ku9cBKKt6LcBO+Tabvb/fd8rr9SiY/vaC5473F+
         YMVFqVsR8wkm2YALn8HZnnUZnj6yX7ouWGmU0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731317865; x=1731922665;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hM3YhjV8cwJ258TZOP6tIflpF5xNc5nuc1LlwBuo6YQ=;
        b=L5528aVxnLSVeZ6zNpXO4hRLTT1jC8NIlvFB5Qc740kCLLTLou/OpNqpc0WJXXxl+y
         s6C8ut3adIzSXmdmy90ggPml1sBHpW1M4Cr9BLJYRxBd0zFGm+pqV3hxsuy4KtlGpcj/
         OawCFZdK0WQmyvgdH7oC/prcpoZPJEsGFDQG4f6e6xlcPhOBY7cKYgrir4uLFqCJACiM
         dM/wnCyRB/d5M3wD5nQH9ziEad2Uzq8reDD9lLQhdm4E8rAFGG7oETvJ02XKqGQs2zeI
         Mkz49otm3DHeOSCOAXgr5jvrTmmF5Qaqi0UDfgZFEEeJJQPZ5nB7Gi9dOUUTo1TplxMj
         onrw==
X-Gm-Message-State: AOJu0YyR3VBq5bmpCS5dZM0IyKacdBpGNbZVMGUBw8wiQ6ql7r4dh1vm
	l4munQebAE1ikfMTZCgtzNKMGPJ2Oo18EJKiyqt5o6d+O6ZQVyX3JLLsH4wTN3WskYw0Xjn2FMh
	CqWCYgY5UJaHp8Hq0wKl/DszHBc65pHQ8sNKrq41KI9fQpKNQ
X-Google-Smtp-Source: AGHT+IFkc7LhWHvnsBxZtk1DaEa/Gh2DA8z9UYuYm7Be5mHPk9ccpy2QaUSdp/C4upnu5RhWJ8GVbSsS4uKqLfcMZOc=
X-Received: by 2002:a17:90b:1e0c:b0:2e2:7f8f:3ad5 with SMTP id
 98e67ed59e1d1-2e9b0a14ad8mr16178399a91.2.1731317864796; Mon, 11 Nov 2024
 01:37:44 -0800 (PST)
MIME-Version: 1.0
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Mon, 11 Nov 2024 10:37:33 +0100
Message-ID: <CAOf5uw=e1wZh2ifvSXYMe4H28R5DNuos7uPziFMGs8T6nVeYWA@mail.gmail.com>
Subject: Some information about direct-io support on ubifs
To: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>, 
	Zhihao Cheng <chengzhihao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_013746_303677_216535D1 
X-CRM114-Status: UNSURE (   9.44  )
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

Hi all

I would like to have some information on how to implement direct-io
support in ubifs. I have tried to mount squashfs image as file in
ubifs using loopback and direct-io but it seems that loop can not
handle when this is on top of ubifs. From what I understand from the
code it seems that the requirement is that the direct-io is
implemented in the filesystem where the file is stored. I have
simulated using nand sim. The idea is to reduce the buffering. I'm
open to have other suggestions regarding this too.

Michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
