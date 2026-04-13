Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAA5EBFD01
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Apr 2026 06:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X4yLKP8nV1MWHh/4KtPOg+w1mcMDFKZJ3Z2VBVAwBbw=; b=KPUS9426netIJiQ9yMbKbDNtvZ
	q7r0Zabk8F1zDpbpEQrqN0tz5bndjnaZvymdIXDzCGM9r2QIcLieyp6ZqlhzdfrSl5UavSnaiySli
	jlQJVMnYGfl4FeU/BFGEerWXOXzSur/ZalnBZYzMotW9/HtYtS6DYVz7u20sQxxkZuFQ+NypSh4NW
	inMse5ul7NMnuLkZV7abawvR7rjFKNHEMTV+A+XEh9tLRVlju47nrasjwYuDBF1T1EcZTeDiawhgG
	iwofALx92kplLX0afCauqdevosip2US+16DD9xc9Uh0ZI2p30nhf6XeligaepB4PZia4atM6bXtnc
	lCKUpUAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCB2C-0000000F5cr-2Avk;
	Mon, 13 Apr 2026 06:44:36 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCB29-0000000F5cV-3TiK
	for linux-mtd@lists.infradead.org;
	Mon, 13 Apr 2026 06:44:35 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso21509095e9.0
        for <linux-mtd@lists.infradead.org>; Sun, 12 Apr 2026 23:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1776062672; x=1776667472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=P1bJTW2aGUAL/a8wavbEh1Edfd4+sscEOl2OBtBBQfz7Q1/NuZxozesPSPyGltAXKq
         qXKO8YIsRkVJxs2K3GWiMPt8KhUxo+fAGUGDaRPLu/WBTC4bL4XW0GOe+uUVnM3PSFaz
         scWXlJKk/vcSL2G+1clnc9saWaxliLGd+nEBdPUjYWTpMzNJYJVu30Uo9odaU9z1f1tq
         5148q2cSpGB5tAEp89HIwZLzyBsuX79ftJEm+jXRfJ4e8BPHa5d1RNixAz71dGwoHV5s
         Vy0zXPAde3VMSf0g6IKkuZULHo5zAygqne/8RRtBSuGFCLYs/sx5ZVA26D9OGCRR7KuC
         3uLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776062672; x=1776667472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MqSNiwa/UAtmNvnHHz2pJKBZRyVaTikg4qj3JO/V5O0=;
        b=BuJofv4RoOWe64xF0CCoaZ6pwEHTGG3KRqBOkinl9Q0u3VXwbTGP7eD8AtojPbmGGF
         lg/T+ZeZt9kXAaw/C+yXPcV/kjo9+mKrN6fO4zriT+VT110ADuk6J2y/IWkv2xtS3Drc
         rtLvm0VgYIzdjnNbm8lIrEEHjKhZn4K5uCMkiciQXPaWp9ruaRHQ5/HPl2sUNc8PD3bb
         NX+I09X97bV5FknzbA/EFvQL3dRH+CcaqnG8Ct29Cxk18HkzTd3JCtf0iq44gV5/kAVy
         O2bGNzVy/C+mZD9bmTPS+VEYQMDQRsrAp3E7MJCOW+1MV5Hfd9+Z/+ArBbXAX/1W3IuZ
         cNfA==
X-Forwarded-Encrypted: i=1; AFNElJ/B+8O+fko9N+SYQvfJ4zScfCecMKpODF49auTCSPz/V50ZpfrW4wSJ9be3r/LLRDWPe8/GEuDhhto=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBbE69Vdg8eqge67OMF4vg1xAdPD/fq10drMBkfWelyD+OKlBZ
	f01X/VaWcBx9TJhW9Ozo0hRHqlPyhaw+7gMGE3P25xlPlhICn108NQT8a6jjdMFXJzRaF0+lDrr
	vqbpE
X-Gm-Gg: AeBDievteRl22VQm6YTIUtEfh7Uqxw8FUWHP0VqGrDLtW7F6bs2CFHgIuA2GjOhbxYV
	LK3HNwXeZ6IjYf/kXmJcGfJ5b71/rBiGBSP1vivtalEaP0J4rQySGy6cT5HYMGfyjFUj+V1dx0H
	DRcTR7QaWrI7a0OfVnKatPAQMaKnlsASfXefcQtvaRdUTr9JRo6wK50ANBq/jqkpkg6NheleFeU
	BgHEAENx10zlc/jrmlhic+tLvoQcreTbaEy6s1uVeyxN8iK/hv1O+HdFTHGst+acd4dPtPESVxT
	5/UZlWGFeTGQ5oEbGIEykicq27dtyUZiO+1h2CHKR0m3nKa1Om21N3IZqOnx/Iapv2g+ziR4sxO
	KnYIq/ITHOzKnIvqecQjgp7wZ75u0X/82b4QhcWFlUwBsBk8I08B6B4Mj/K57hOUdJL6yeXYfUu
	vn103+2hLw2sTEU7qB2f60T1SYHmfDLi+Wy/ZtEPn+pl+0gg==
X-Received: by 2002:a05:600c:8709:b0:485:4135:5c92 with SMTP id 5b1f17b1804b1-488d66580e3mr167681495e9.0.1776062671857;
        Sun, 12 Apr 2026 23:44:31 -0700 (PDT)
Received: from [10.115.255.165] ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538a296sm275527925e9.12.2026.04.12.23.44.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 23:44:31 -0700 (PDT)
Message-ID: <ad7db7cc-bf78-49c1-9e51-570684db60b9@sigma-star.at>
Date: Mon, 13 Apr 2026 08:44:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misc-utils: docfdisk.c: fix potential integer underflow
 in partition size calculation
To: Anton Moryakov <ant.v.moryakov@gmail.com>, linux-mtd@lists.infradead.org
References: <20251027225032.45788-1-ant.v.moryakov@gmail.com>
Content-Language: en-US
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <20251027225032.45788-1-ant.v.moryakov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_234434_197722_557B822D 
X-CRM114-Status: UNSURE (   3.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Applied to mtd-utils.git master.

Thanks,

David


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
