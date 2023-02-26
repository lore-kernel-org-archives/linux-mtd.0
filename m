Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DF6C64ED6
	for <linux-mtd@archiver.kernel.org>; Sun, 26 Feb 2023 14:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBV1VcVYcfmUP0HA5pOExCjTjaz8688YwoIYJCzjMg4=; b=yFhbQ2zYqqHBVw
	srSt1sf+cBAVkjOmbMyR8D7oNcONt1cvuWns7mnOg2m7UxalaGqU8roaG5Xazih66jk21Ri7LU2/L
	eRHbX8Sp1HPbUjAlp6VnO0IeHA91sXj5i9P7Nl3P4yGSC9tL7Oy6HR9IMjaoOPvHlZi1i6Q0D7Xl2
	MjYxsLwrtPQAdr/zF4Kfem9PSrJOgR2HKAXcadzVgJqnjC1gdJJs/kB75zdNfy2Jpl/lsMYQpPNGY
	1LM5oVxKIElhF4ttRyF7/+KMc0ZGmr9jVTT3wzzXrm9CdHFkdEVOS/C0DoU9Ve3aGrAKLN3HRP3t0
	/bKXepiUp+I1LG/24eew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWHnV-007NRC-QV; Sun, 26 Feb 2023 14:14:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWHnS-007NQY-98
	for linux-mtd@lists.infradead.org; Sun, 26 Feb 2023 14:14:39 +0000
Received: by mail-pl1-x631.google.com with SMTP id bh1so4132816plb.11
        for <linux-mtd@lists.infradead.org>; Sun, 26 Feb 2023 06:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oAQg12p/07ljiI4mBI5ZR7TWyWKasJobRzn1kv4e9h8=;
        b=BJkdZ1fqbDvcR8wt5DR64B/i9aiX4o4PeNbOldidF9WnLVP6y8LTFCdLrPcSDzMS7I
         Nz+q/EbV0neqif7/M4nAoyDTidVnheTui52g0bYCQt2X85vr6NDKKFgG/vpvedo2t2xd
         kd79sPaIONkq94qrS5aAET9E+gWAoTQyDO/I64EnXtW8C40gGZ03bed9XVJ5c1xkDJ57
         hIM7lf5jsFpDPZDoPmZ8ijCZq3QTmdXLpotaeCuU0d1QYTxFL8Q6w8HVZlEAAeoLeTft
         mHeojp+TRbyzgwBsVG5Ow/Nj6PyB9gUO4LJIaStEt0oY+I6geFqtCbt8ZVuZl9unXEGL
         Pw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oAQg12p/07ljiI4mBI5ZR7TWyWKasJobRzn1kv4e9h8=;
        b=BfJIMtJLXjklbjoj11U9mnWftDFLyhLT50Rjf41lnEZ74e/4vuWuynyA66L4VmJWOW
         P7ZX8MasvwsbJprzwn0HXhq1VAPn+hejzQ23gn72ONdJZ6RqUtrW8V9y8/QnAaLSD9DV
         mwce0pgY5ZsYskZ+36IUUyV4JrTHwco/tl7izLUZZXLbwlQR3NZrVKkKME7gjgFvGFrv
         hWcIGzEHS0rS+2TLWFCxQuqG3gwfGRjpD3Pw/LCJii4LnsP40Xtd9vSsbLIuUnBCxJlM
         HF2MBvdV38tAt7SZYnmOl74KlEFo7wAzjhYxRtTI4VnEObJQRV0H57YVE57dgKcoPXRO
         8XrA==
X-Gm-Message-State: AO0yUKXp0SCkmptTNpj9/FKgRwT/LL+lt9XEHgd5aQQxn4f8iPd6mxRS
	y534VU32iNbICZy/gx4LnFa1fi38vCQ=
X-Google-Smtp-Source: AK7set+3tINTYEvd0acZfGwn7reu55jXetSRZrY4aQ/GR8IzpcikOCpdje8kNkdiu89FpcWs/7eMMw==
X-Received: by 2002:a17:902:da89:b0:19a:f02c:a06d with SMTP id j9-20020a170902da8900b0019af02ca06dmr26558010plx.29.1677420875038;
        Sun, 26 Feb 2023 06:14:35 -0800 (PST)
Received: from udknight.localhost ([117.30.83.133])
        by smtp.gmail.com with ESMTPSA id jj13-20020a170903048d00b001967692d6f5sm2698552plb.227.2023.02.26.06.14.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Feb 2023 06:14:34 -0800 (PST)
Received: from udknight.localhost (localhost [127.0.0.1])
	by udknight.localhost (8.14.9/8.14.4) with ESMTP id 31QEEJOh032202;
	Sun, 26 Feb 2023 22:14:19 +0800
Received: (from root@localhost)
	by udknight.localhost (8.14.9/8.14.9/Submit) id 31QEE6mg032201;
	Sun, 26 Feb 2023 22:14:06 +0800
Date: Sun, 26 Feb 2023 22:14:06 +0800
From: Wang YanQing <udknight@gmail.com>
To: miquel.raynal@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: ubi: eba.c: fix return value overwrite issue in
 try_write_vid_and_data()
Message-ID: <20230226141406.GA32048@udknight>
Mail-Followup-To: Wang YanQing <udknight@gmail.com>,
	miquel.raynal@bootlin.com, bbrezillon@kernel.org, richard@nod.at,
	vigneshr@ti.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
References: <20230217165442.GA28288@udknight>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230217165442.GA28288@udknight>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_061438_362830_62DDFED1 
X-CRM114-Status: GOOD (  12.55  )
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

On Sat, Feb 18, 2023 at 12:58:08AM +0800, Wang YanQing wrote:
> The commit 2d78aee426d8 ("UBI: simplify LEB write and atomic LEB change code")
> adds helper function, try_write_vid_and_data(), to simplify the code, but this
> helper function has bug, it will return 0 (success) when ubi_io_write_vid_hdr()
> or the ubi_io_write_data() return error number (-EIO, etc), because the return
> value of ubi_wl_put_peb() will overwrite the original return value.
> 
> This issue will cause unexpected data loss issue, because the caller of this
> function and UBIFS willn't know the data is lost.
> 
> Fixes: 2d78aee426d8 ("UBI: simplify LEB write and atomic LEB change code")
> 
> Signed-off-by: Wang YanQing <udknight@gmail.com>

Hi! Miquel Raynal

What is the status about this patch?

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
