Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C62C79F9E
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Sep 2026 04:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQ0B0LeAFLyRsMeSyoShVoNlSM/KpGAz2ncL6/NxIfE=; b=QHi/1ymjSUKbXF
	OB2/D5HZ7shW3GUH7x+jTDpcXoRqhFsYy/WkJH/eQ7tMHoprGn2j9TpXUpkI6KFLeX/Qm7QwZ3VeB
	+GCi76s94XSXzZKrQmOrvXuHaYHAWMdn4to5YWQz0I/nzWCHAFlsSbHKoIm5wQtxrkO9kSHJkS45R
	ucmkEX/raDsywhaqeehnlX6Eh9HBG7mDBYsq4v37PtzHqDwa3LFLLPuSbKVFpkwDQcLldiHyCEvpE
	q0ueN7l9GSzOw7J58P21OmzZnMh6uFuQfGwNiE+j8nbS53FiXwvrw/YFr9VYCn48onuccPb/SdtmY
	jMw3wwLZzQOuPI/OEDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R8y-00000005rPD-2Tyn;
	Mon, 07 Sep 2026 04:39:44 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3R8w-00000005rNv-1hXg
	for linux-mtd@lists.infradead.org;
	Mon, 07 Sep 2026 04:39:43 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cc439aa0078so2506589a12.0
        for <linux-mtd@lists.infradead.org>; Sun, 06 Sep 2026 21:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788755981; x=1789360781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P0y4/I4pfeLNqTifvYLyA4YqwL2agDNSkV2NiZIcnoY=;
        b=WTmtOBJcd8vkZEg/lmB7+hbCPFh95gpFqUf4kr1ud6RHdVxeboGiCsmxdhtJAYJZga
         qoCnQn6hF1JqIYfEEKdRJohOw0OW9igq4hoUWXYv/TOiHGmCUfKJXUhxmuvKliEDAYI4
         JJuc818vw0JjzoW3qre6Oe+51MmY3luPNtlFOo3ecIAxSwDk93OTmJsHIMcxqsi6DnKL
         +SKL5blCuHiymqc3ZwWiwmjZoIwOH4/IrISXm+RmhqWhscnX3PBQPolvUx9KvZ8YH6py
         Sm4AT7uF3HW23RoYA07lQpec8WX8bCyo68tlKvhg/GI8hAQu1pRw8Kcn/SeJfd9JdQeZ
         t/5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755981; x=1789360781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P0y4/I4pfeLNqTifvYLyA4YqwL2agDNSkV2NiZIcnoY=;
        b=ORTs/Q6J2VD/OkWmu9EQQ6u8KYmR1JQomlhQadCVebgVoLMVQ5gZNcxninMJiyMYD1
         0cMLxeKtf34VxZjaIZlbnEssZnvDu9xtynMGTPw7HW0+6tW6QTOLKdyTv5WTPmvRaF1c
         xsqc7tZC3E6aHwj2Jc4ad09bWB3IWHS7J/hHeyfjj3KseQKSB/qiBZ2e9ZWmqhcbYkqX
         6CpWJB7BLhRQiqGmEGMTVcGD1d3S7oiTZaCEBBoZmTTzMKLyWbjKSp3iCdZ3Pf/00s7m
         r/QMSJgflq/1DpLJSg5SEbOAdIGL+gsfM8Kx9v1ywzhB2UneZyzHeySnSp1POL/9nPGz
         bbvA==
X-Forwarded-Encrypted: i=1; AKwUvBxN3GVy5rCOuQ6GLgi0N0baBwcY2JYeqRze+aILwBGzLrK7z2sYzqKTE/xpQXJaU3A86+E+/HsPy3M=@lists.infradead.org
X-Gm-Message-State: AFuF++mkEPVWgXqpSkcVyFeroyngA2GPZO681tMvVyzYcRiIspoeDr0C
	2jtBM6Mvw0K4rx1pH3S+EoAAjelpd7AjmgQSTjhXfPxQx3QQIHbrta3T
X-Gm-Gg: AYBFou3mXzhqG8+X83mMfbMZ2pkkzM9qvf93OqgxZoWyYPl5Bos1W/y7TVcSdfA5fUe
	hLf9Aw32mCxQvphQ+dIIWlV8uU9Yp4XBcOGDwA0WGJFvGkYutzlyD9hOCa41W/6Yf6JjfKS28ad
	f1VjuJt/mo4+Fs/iaZ2sa7kioDxuTz6gHeNkmxCp8Bxtsujzs+e+eFFYgwemdb6M1lKKzsKVyA1
	3nmac9y3T5v2xBi7B+SM4VSibnSocdJYSO1t2tuHxbPztfTZuuCaRVjrizukAKlpGlJLG+HL5KE
	NKHEanJdR37pFn+eDOfqHjd28c7ZWpgtsHiCrXq7GamKtLXvy8xatams8mWKPQXea9CwyhUOI73
	Nhx/nCAGVaFeM3qYcNQQkGSSEQG3Lw70Bflzqw74wkOCHWgrrBWv5pKLBpbqMBM4UagQ36GrGEa
	90+lqOD581BXGo55Fq0cnfy18x0arpnWpxpfoK3wm18KqK5AsOWf8uECnQpYpn734s5sAibcEBB
	tyYMHz1eqLcG3U=
X-Received: by 2002:a05:6300:6708:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3da3a00565emr29715382637.16.1788755981528;
        Sun, 06 Sep 2026 21:39:41 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b123731sm22649867eec.18.2026.09.06.21.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:39:41 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Richard Weinberger" <richard@nod.at>
Cc: "David Woodhouse" <dwmw2@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Subject: Re: AW: [PATCH] jffs2: fix typo "informations" in comments
Date: Mon,  7 Sep 2026 10:09:31 +0530
Message-ID: <20260907043933.33452-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <mtmxcr3o.ee150fe6-3518-428c-9ca6-a554584ee6c7@nod.at>
References: <mtmxcr3o.ee150fe6-3518-428c-9ca6-a554584ee6c7@nod.at>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_213942_465879_6577266B 
X-CRM114-Status: UNSURE (   8.24  )
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

Thanks for the ack, and the criticism is fair.

To answer it plainly rather than defend it: the typos were found by
checkpatch and codespell, which need no model at all.  What I used the
assistant for was the mechanical work around that - grouping several
hundred one-line changes per subsystem, working out who to send each one
to, and writing the changelogs.  That is not a good trade for the energy
it costs, and running the two scanners directly would have produced the
same patches.

The Assisted-by: tag is there because Documentation/process/coding-assistants.rst
asks for it, and I would rather over-disclose than hide it.  But your point
stands, and I am not going to keep feeding a model work that grep can do.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
