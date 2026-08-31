Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0CDC61DFD
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Aug 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mv/gVOwtR+m327pseOveIHZFSJlT7rn0U8PauGMfpgg=; b=YEMnS7tX73B+TZ
	vVTlSmeg3hpHJ7v8QWYp70UkBiUBv21yJErVyAbCT9oQBptAw25LHXfFPWEsom6padvm/vizvYeCm
	A3tK1ZHsC6mMJHTjvJPui18xiRcBIGlUOQGTn+dcGlhzL/mdfchfLbSiBygT/466WD5ohgeL3hUZj
	uD2bAkSucaY3VjJG7pTgzFLdT2NhuljBtpnBqx/dtPG79JkZfhE553OrcqqhJehMlvibwdJlAJrXo
	1K07Q4FzRMjoDIlwNVO0aZLJw1vUT4fWGsq3lJH24kYIp6EbC0bpZb4wxCqRSREWvKCnB8dULIP6s
	BMFNCMb6aWARGIX2Uaog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10My-00000009Dt5-1T2A;
	Mon, 31 Aug 2026 11:40:08 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x10Mv-00000009Dr6-1hLs
	for linux-mtd@lists.infradead.org;
	Mon, 31 Aug 2026 11:40:07 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-482e61a34e5so1101100f8f.3
        for <linux-mtd@lists.infradead.org>; Mon, 31 Aug 2026 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788176403; x=1788781203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hr0YOyO9CYqwLt+yylogqPVMOibx6p4QI/tJf7xOxK4=;
        b=SLtkWSAu7p8TGLlstmZos7HaxtBTQ08yQlnXBXErMRGJ5m9ptW/ySwvrsgOnrc0moK
         g0PiCTraa3rwkT9/OIr3dZmU3Ns+cNCL+f1ZS+NwqGjnglD5T4441H6u/fn5rHm+uTip
         Uues8kQ0uoSlBrIQz+bvNLLxA3uGHNDN0ifIeEyfr6jwb5PeDpMF7x83jPBvwlzpYsqs
         SImQW13ZhAR2eX3wd1Q8GajMZnhNhgiPopx48m0hsSYsq8PybKSDJopysflUu88TMy6j
         FjhQ4aetvphTxfLrEov6/mpDFh8/7EvaXzMbbBNxIjhjLIJ3uo5CVigEOc2hFKbXynxF
         a8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788176403; x=1788781203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hr0YOyO9CYqwLt+yylogqPVMOibx6p4QI/tJf7xOxK4=;
        b=YR2cAuRdNvTr00DPUH3pEvZc8qL8DVQ3R8QUwwhAvFAtPVaGC0CTPEauhsbiYbyfi9
         xfXNBnsdtNDDAaTpGIqFvcXdhbNNWVmHWP1TBw9BECO9QoM9n1+mqYKKlPa08Iz/Jllv
         RvzKbNs3lqsrljnZkX9WgIwBO4lBblYueSgEFzMAbPjs65TiI1PmZ5geG4+y0CKDbl3y
         pXnjHT+lwdTGhCod0Mf+WXmHhZZKKOnf/Vssa48UmFY52be7IwD3wt6XqV0h9DoA2H8O
         EbQmuHKZgu2dNoZt1QwhDOdSvbTkYjWX3JINmiyCuGeyD6X/yW7m7zbOW0ojjN/KmAAs
         G1ww==
X-Forwarded-Encrypted: i=1; AKwUvBxrT3ppGTTHCQ8i1v8uqNgnL7hSU7uqk5P/Q6T0iVDE2ZUFSt71R+/NKdDcmUdonClggMWGXK+PSa8=@lists.infradead.org
X-Gm-Message-State: AFuF++kv4VoZNLqGE8jBIYSpK1WD1qwaVfXqDtBhwt1yW2GH5dpVPic0
	8A52fH7vGnyDUrOgOsHXgrtZe9s9TMRhilGtSZHNPEOO/t9lFPKdORUX
X-Gm-Gg: AYBFou04rnuNcJqu7eO4MzpGxrbVHc73zw+/gp/09ZlEJXFdoVbI6U2TY6HIT9AI0qk
	s2E0nnmcKdHW3VyJQ1+Rm6xCLw872zVVi1gmfMt4Y1KwMbiQqbeySUADPR2QVS9O0d30vRWUdom
	M3D4fPwOlZQ9twuYw/0RSMV4YETB3p3iYLdGLjrHms+dgbRESZlfaxQry873L0QvIX1muQkhhy0
	oiWLAYsGA2RVi6Ac3vvEW7hNSpH0mDsvGNm2Owlzd7bkoJObEj+Sf/t5//yAhbkpGSFy6Mm3fHE
	g58LXwnorliVkBpGAauI7KayqUdKzuuCuciVMysuRe9+joJKim0rcldUiAooDS+v/dxl0NDcrJ1
	0sJ4jvWHiQcSjGkoAsbLTEynyJJ7fFLYHyc8atvPaSPgLGaWefZvbiLjxbA+2ncoAUzrRL1DQS4
	Vgtx42N1lwakmPvlQa7QyUNLB+0XOiJKweAkmM1iEDhAggGtiqxIcp9yjpt7iFVLSD8PM=
X-Received: by 2002:a05:6000:2582:b0:482:c676:8d04 with SMTP id ffacd0b85a97d-482f79f583fmr36991070f8f.18.1788176403240;
        Mon, 31 Aug 2026 04:40:03 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48436646548sm11201044f8f.37.2026.08.31.04.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 04:40:02 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Mehmet Fide <mehmet.fide@gmail.com>,
	Stefan Agner <stefan@agner.ch>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Boris Brezillon <bbrezillon@kernel.org>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] mtd: rawnand: vf610_nfc: fix reads on chips with more than 64 bytes of OOB
Date: Mon, 31 Aug 2026 13:39:59 +0200
Message-ID: <20260831114000.1844796-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <87v78qbtqz.fsf@bootlin.com>
References: <20260828085337.3916199-2-mehmet.fide@gmail.com> <87v78qbtqz.fsf@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_044006_044910_8A1737C5 
X-CRM114-Status: GOOD (  16.74  )
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

thanks for the review.

> Since it is a total rewrite of the former approach, this is probably a
> good candidate for a Suggested-by.

Of course, I will add your Suggested-by in v3.

> > +/* The controller transfers 64 spare bytes; larger OOBs keep using
> > the first 64 */
>
> Is it a real controller constraint? Or is this a compatibility fix only?
> If this is a real constraint, you can keep the comment, otherwise I
> would drop it.

Compatibility only, so I will drop it. The SRAM row buffer takes up to
248 spare bytes and the ECC engine computes parity for whatever length
is transferred - that is exactly how the bug bites, the parity moves
with the transfer size. The 64 is the on-flash format that U-Boot's
copy of this driver and the kernels before a7ab085d7c16 wrote, and the
explanation belongs at the ooblayout, which brings us to your last
point.

> No explicit inline please.

Dropped.

> Please modify this comment to express why we use our own layout here.

Will do. Something along the lines of: the core's large page layout,
computed over the first 64 spare bytes instead of the whole OOB, so the
ECC bytes stay at the offsets the established on-flash format uses,
while mtd->oobsize keeps reporting the chip's real spare size.

Thanks,
Mehmet

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
