Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F89BCCF2E3
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Oct 2026 14:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eaIxgP+ZfqiHhLm5qFVi0NQC4AuLtg6MJr4V0e9sznQ=; b=YzmzxS8yv0XhtM
	+5bdw5JJ2HLahj/nEpW/9sXiv7pR52zNirSP6x4REw/vN5olmumBFhoJOWdOn9iExHB4pqUvBE0sM
	Cns+Pyh9RRbSKfLY6Z8H9/ew66egZeMjSywvZ3+1Z/SP+yuJEg9qfTEquJOGUUxqSg3Sue7LQGDxO
	LmtXDFeLvLoS7b1O34xyplKfJQG0E1ztCOZUejMcUpxiLvdciB3RVQR653STLrM1Yow/t1Po5EYxW
	jLKXdL54CApj37RqWXnOJ0WVpePEqAK+raDVonyNTNteQpsX9WF/gDKoejxXwn056kpzzJbriWkzZ
	KrSPnKxXLz9fyciC4BQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoEZ-00000007jVs-1fJN;
	Mon, 19 Oct 2026 14:21:03 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoEX-00000007jUt-2AnV
	for linux-mtd@lists.infradead.org;
	Mon, 19 Oct 2026 14:21:02 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a018dc1f98so15485695e9.3
        for <linux-mtd@lists.infradead.org>; Mon, 19 Oct 2026 07:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792419659; x=1793024459; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPuSehC+2SizEm8Q590GYMEvYmrsbmRmwXKqW/CVDrE=;
        b=fEP/CPo72YXkh8lTNYrvL/tvUUqrSf6IHm/p2qa4wYgZkVVLvR99cnZeIOmfL9jQTr
         WLf0JWEqydcbGvzN7t9/7ef6UzUh7DP2euQwgJi9ZHx71BYCyLJvE7wUJKwUJIBUUcDL
         PhVJBueFRHb6PaAhcJsyJQZQXp1rfR1HJw0UwnBkS0yOYuLgmIkLWlJ+Iv7dlk9mQIA0
         IX5KRsFgqBsU2/i+feJ5C2R7NJ911DjqkPhKg0xgzNlzDKateNvXBsM0bi25zKIO+gqn
         qf6Cz+AwQFrg/bE5FTCC2F8lqLm6U/DuTU05gEkJzTQhwD8ZfWild5suBqpDxAiJkTDf
         yX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419659; x=1793024459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPuSehC+2SizEm8Q590GYMEvYmrsbmRmwXKqW/CVDrE=;
        b=u3Sxh3INl05w/GCPVHm0CM6oi6Vn9Yf/eZMrlItyQ702BH2dsuNqioKos0jpIY9321
         m2u6cG6gILvpE+WYQ8ch8oHo1vBXF2f158bpSeGp0PXPViXJfpgQ4kH2b3nP6aYvnOuZ
         HGhriJwDlimftgYMKzCzw33ECUZl1Nc2mD1kDgzjMlxment+7Kae2oR7kFFydzqvujYc
         zgjs/hDiXF7KgpkWbx2e5VfJCCgWm/rQxIsEfCGDg8mLAk2ha/qtYeLs8VK5rXdPJhqk
         bqPvPyASPVBrvISAfcYuZwLjZOmS/63kdLkCCWUDycwrKef2DE+8ft5Y2hzez8ahVNp7
         mxgw==
X-Forwarded-Encrypted: i=1; AKwUvBzmjOgwouNUjpZsOYAicxwEnD7NFSdwLbl+M0dMP6j1bKAVBtgZJ89yyX8qXsIzuHw/PtVCEeIigFo=@lists.infradead.org
X-Gm-Message-State: AFq9FYLqfkPYsFHUoIsZ0Ur5HyHiNapJi5Zd8TYkD16RFyoGjVcMDIL1
	JKL1Z51rsRJzYnUO/ZQikcQXqLdK1Zdownlu990NSxRlyOhFyc834zqu1jMTv3oBiIY=
X-Gm-Gg: AYBFou3MGhKqvtXuu/NGPIgqT08dCNDa6egIgjZCL4UBjsH/X7b2u4OiisL8mhE6ILu
	4OVmG12g58TjLypiyvLTuNB3w6jItsJ+i6rK4iDTyIcbFXJdrNYj1g2k7CI7NSqwK85+ePmIDPI
	xh6hjim1bmfG+fwgDEHBXDIWJPYBYYPf0b8qVnLjbwkhyeLPVmjCl2lTPJNapvaG1Q/2f0823KB
	BmnoiRn8sqWhvNhadYN9qqxf4SENmTDISwvfufHReB7uK/VALrT/c2tD3qWV+siXAC55MEkNwJR
	TpxAqCPxDEafzcn8kIh+NBFqn+cprPPLJ55hwj5bb4meDq2kixJHVpjY4m6yashHOyg5Ja3dlTY
	Ek2GVLOGhpHFYsewHiEpgt/8PIk1S8XusimVuCn6Fd4Ge6umOtOqNHulx1/iaJHAS67Ddi0q6Ko
	NdV+pYh3Sv7+TOcMSl8YbcCPfpJAw/eEfE8dDJchIQgn8FXLLdBceu1IB393A9PY8hBYZ3QTUfT
	8eBvP1jgm+Rvr2t5HO+QlSQ/0YMXdhUfjMnDomUjk46eGJWYKZHdJTdKzuLjddKcPGSyC1Oy6PF
	dCMvQy9PSHvZsBA/
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a1d75ffbdamr186069345e9.19.1792419659252;
        Mon, 19 Oct 2026 07:20:59 -0700 (PDT)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4e28bcsm23702042f8f.23.2026.10.19.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:20:58 -0700 (PDT)
From: Orgad Shaneh <orgads@gmail.com>
To: miquel.raynal@bootlin.com
Cc: richard@nod.at,
	vigneshr@ti.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v2] mtd: cfi_cmdset_0002: also clamp the write buffer of an x16 part strapped to x8
Date: Mon, 19 Oct 2026 14:20:57 +0000
Message-ID: <20261019142057.3973805-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <875wyy15c5.fsf@bootlin.com>
References: <875wyy15c5.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_072101_581961_FAC81DC2 
X-CRM114-Status: UNSURE (   7.07  )
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

Hi Miquel,

On Mon, 19 Oct 2026, Miquel Raynal wrote:
> We are maintainers, not chatbots. Please allow us reasonable time.

I apologize for pushing it so soon. Your quick reply last time made
me think this one had slipped through. I'll wait patiently next time.

Thanks,
Orgad

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
