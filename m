Return-Path: <SRS0=1hFJ=W5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E82DCC3A59B
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 08:32:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB74721874
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Sep 2019 08:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZTjRw1s0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNtLpp1l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB74721874
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhIttLcuKf3fi/kE2m4wUhgYxxB0Vk7kMhRR0rVEe+s=; b=ZTjRw1s0brFcA9
	J815pS3BzzdarEibL9mSvHnjFxleZ7o2/Cc3eiMAv90ZcTUeEL80hDbRX8nYa+SXxiAeU2F+8fJ0X
	9DYOww4b3bhKdLMIAQnSFH0Z/vHEABfckrTPKAwekR8TRw+HCQX8dW9FB3VL9jdowTJYLpcMs8tLH
	V3zADHRhjOpH3k3IWJAoNcuB9xJQPw6YManQMjWppupFwvE7C+GDr3eqQHkJ6fwmZRnYS+cCMgnur
	yHB+w4Cs/lE69O6xs1pDfappyiGKdY7FMDImAc6hjoAqRcEhac/QO0lGzmjXYal7j/CfY1696LyP4
	RVhwdgqeHQcgu+cdjxdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i4hkm-0001bz-CI; Mon, 02 Sep 2019 08:32:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i4hki-0001bT-3r
 for linux-mtd@lists.infradead.org; Mon, 02 Sep 2019 08:31:57 +0000
Received: by mail-wr1-x42f.google.com with SMTP id g7so13082445wrx.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 Sep 2019 01:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fZMUZRdub4tmgnCfmBfhkmGrBwzTusRkzetXyOLstoM=;
 b=GNtLpp1lgYdweHoIOvWTS7DEYWdR2tjEbWL3zV2dSsjHBQMIFJd6HX+7uZannTv3NX
 9cAS1Ue7omKrmXDdhCQy1cuhqpIc8XfCDqhkg5MRRrN9AJLokvhIOd9lT7Eub482F+V3
 VSCsEr/XVWGSfLVCsvHbIEkb+iJScLITOgCNE5VIdchfhIw/puo0g81pcqEIMD5zaol9
 umywSQsY9TjlXidn1BwELUUEnbuZNfLVnqLTeW0js5Af9Z4WVCt4q3YxkjpaV9Palib0
 oeNMBXekQRwvdAhwmG0tGAfB78c3A2de4nLHFOiKJlx1k9oYd0y3zXKCkaqQpbF56Vys
 Yv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fZMUZRdub4tmgnCfmBfhkmGrBwzTusRkzetXyOLstoM=;
 b=ASO3lqHN8o40yqsoZFhkyQVrOG2LRnkFw/1+Wv50UtggfFhB30vvD/W3m3s/iubeFX
 Zow1EXkiD3/dU78G2heF3xIAVAM3sehe13iZ2PCsvuiEW3c11cqcwlBJGauorE8bE4ia
 j7fwuo7G3C4EmMvfXqpjjIEXJzV9gbPEVdVvNI59wR9TyzaSdaO/Z9HW21an8IzTokzU
 VGgRcsgg23WRegC/EPBScmmsTLMb5lInNK3vdkJNbzXVVtXB3OyN1n3trclJg4QZ7ZrY
 0wlqvuqdlGK9JrFhT+lH2UC4TEYzfmMvqYtsJ/RGUQnQNZ6AjtmkIn0RecBD5tp4IA9p
 QMLA==
X-Gm-Message-State: APjAAAXcAS/gDRc9DygRskII1LQGOvQECieriekDKp0CIaaIchpGTfFw
 RhaCb+b05QICqNpomkL4CWy4xjekTXrFyc+NmbM=
X-Google-Smtp-Source: APXvYqzkUBoKss/+ZEp0bBvbYxe2OXJEokpAuXDc9v3OHXdS4L370wYaSQYUxhUT32COq0EE3XwFnLZAg8S1OXdeJ0E=
X-Received: by 2002:a5d:4402:: with SMTP id z2mr1392271wrq.183.1567413114266; 
 Mon, 02 Sep 2019 01:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190817073253.27819-1-hch@lst.de>
 <20190817073253.27819-2-hch@lst.de> <20190902080715.GA29458@lst.de>
In-Reply-To: <20190902080715.GA29458@lst.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 2 Sep 2019 10:31:42 +0200
Message-ID: <CAFLxGvxLw_VR13Vx+mAtF7Dt+54688pWR__q5YUZOTRytiivtg@mail.gmail.com>
Subject: Re: [PATCH 01/26] mtd/maps/pxa2xx: use ioremap_cache insted of
 ioremap_cached
To: Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190902_013156_160851_715F3C1B 
X-CRM114-Status: UNSURE (   7.93  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Sep 2, 2019 at 10:07 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Mtd maintainers, can you pick this one up for 5.4?

Sure. Queued for 5.4

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
