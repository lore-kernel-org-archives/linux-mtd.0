Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F91CF53D81
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2026 18:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WC0FaPfsIR2tHRZqbEyWCBiHBxjxM+ZQLZt9cayLqyM=; b=qmUY65N9fUtCad
	FrjUmCMi0e1oD6NijOWj5+lxYqMzW1chLmfKioyNKZPlTpy/4eyxNxnkVs9tidDUdaJnfTqi7Uf86
	rb/qYXfIghpPmIOmd91goAGMYaL2GEG9ZlJSd+r1HSambtSc9gnY+WO+1oNkBZ6lrenxPIDo8M7mo
	M9xP4TrkaAWMNJyOLM6ZjRbF/v9liWJ3UmKgb47rMRCIr6x4Es88zlBH1kUhUzyJkDbLfsH+Npxca
	H4yr7WfKx8uZbnT6puv3IX+LPaTl6NI/Om/9bWwv3YmbvVQg+IG8v2hPtoSq7nYxadssOHv/iLnK6
	eWr3ZL6eeR/VlUoVmJWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CIa-00000004ehk-0tLL;
	Mon, 16 Mar 2026 18:04:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2CIY-00000004ehP-0gbQ
	for linux-mtd@lists.infradead.org;
	Mon, 16 Mar 2026 18:04:15 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-359f35dfef6so2546138a91.2
        for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2026 11:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773684253; x=1774289053; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dyM/EcdmVPp1vKv4B5C+6NX+2arzvVyB57q7i6wvM7w=;
        b=b1lFioKTpJPhKycHGR2DHQ/c8gQPZT8CK4YvXwliV+icOyATgPc7mvqOWckwXWCJ/0
         0l63AEz7a0e1zsaLIdUSbzEpDrJpRN/vtayLNqmj1LKStIt9ElWFX/CDTD0bWbEAbSMU
         4kK4IZsv825jopyG6oeiu/rJ5E2Drq1NoA4dup5xPoyVuhA9G1JqtW9VeigSMuutQITs
         5Hj9vjD+deacxCs/2ai1tHyrEPHMIVrcYxns6KeCzr8XekEc/LWgscpWbVev+CHnMnSc
         WF6qdcPQhJXFyPMeFSfr9AE+fd8RbrF/TyTiyijbCN5080J/no5kzqNhypfRev7eAxqw
         lzUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773684253; x=1774289053;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dyM/EcdmVPp1vKv4B5C+6NX+2arzvVyB57q7i6wvM7w=;
        b=mRYLtteaji25M1OA5GQd9tUBtPyLBD/Yq8mFvWeb/dkxrhUiBxN2JVLtnryxdbzMn7
         5JlnW4nEGj9xTjYcIP6JyX25xQCsNOOpyAckFzSaGeNfiO2Yd2UUFRnPqAfZwpTNezoe
         v09Ra81ydp+y/xSd521BqS4NO4UPuD8C2va68yeppXcOyvx8tpEIZ9sQigLjo1wv47wu
         V+lgjnZu75fBEJilyOLRwXSU1jYpZnIJUm2SfKzZwpb3ifXLzW9aD9pQvSNlEQZFU3lb
         PBxSdL7aGd2S+BrVrWnoYuw90I0mtZy7CC19fdVuOa2YVSFA3S4wW2VIQ/VQE8j2s3zg
         urEA==
X-Forwarded-Encrypted: i=1; AJvYcCWpAEixFwmOhq0ZXXrTySH8d9NBdwyTNO8tmf/YKO4UD2GBTFr0gR2pEQ1m9qxFPjK+2VFC3Xf1v+I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyqTi0gIcc3PHZC6RTseaEM0F0AmaafsIaFcS+QBiUd0TABwJpA
	0QOip5QTMaw6SWYIKih9qQqRUExnu5YLnTgbXtP1Nbx0BmAVHTiyMGHv
X-Gm-Gg: ATEYQzz+uNUpzxJ13cwaQSgGJzEtf7/a68tUU/0dYUNBC952iRt1m+I5lYAScoWZigV
	ldrV3vIFRaUgQBn6RRJNPPorZtQjNcMlMvqA2B2+NMVpchBtgetF7f2irNpOGb32L6PSbCONIF8
	kHjOpRwwxbwgnaQF1gFtb1pndxTTWdzriaBKNtSLvP/0yh7cjr3KJCcSKfgss/7fP83LlSw1XVZ
	9YTB4Fo/314xJS1qrHUnCDJ51hLIPB3cn1M1NyDm4vhWNMs0Wa9hVYHaS2KpwXAsSmoUStPptlD
	/u7nCF3Lcjg1VzlN7948JtMOtchsukbJOuIidFvhvmEjsNxNSuiCaUgZAskJSci1JDU0/b5eWuE
	oldgvN0Wk5Eeq+mpEe2XpaynKu+431xdhD0ZN06mGIoQoHNeEn/mT/AWJTi7R5nlRhVmiN4/R+U
	8FJewolFzBfqemqI9/k+uXn2ExfUMAsb9ULEYljFLtXSmzlg==
X-Received: by 2002:a17:90b:394f:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-35a220aae41mr10992627a91.33.1773684253090;
        Mon, 16 Mar 2026 11:04:13 -0700 (PDT)
Received: from google.com ([2402:7500:a44:85b:ee44:f835:d779:2bcf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35b8e1cb560sm3574802a91.1.2026.03.16.11.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 11:04:12 -0700 (PDT)
Date: Tue, 17 Mar 2026 02:04:07 +0800
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	chengzhihao1 <chengzhihao1@huawei.com>, jserv@ccns.ncku.edu.tw,
	eleanor15x@gmail.com, marscheng@google.com,
	linux-mtd <linux-mtd@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] lib/list_sort: introduce list_sort_nonatomic() and
 remove dummy cmp() calls
Message-ID: <abhGF65wCbI7CsTm@google.com>
References: <20260315193900.218737-1-visitorckw@gmail.com>
 <1295583760.42468.1773645957126.JavaMail.zimbra@nod.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1295583760.42468.1773645957126.JavaMail.zimbra@nod.at>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_110414_204589_2735BC34 
X-CRM114-Status: GOOD (  15.26  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Richard,

On Mon, Mar 16, 2026 at 08:25:57AM +0100, Richard Weinberger wrote:
> ----- Urspr=FCngliche Mail -----
> > Von: "Kuan-Wei Chiu" <visitorckw@gmail.com>
> > Historically, list_sort() implemented a hack in merge_final():
> >    if (unlikely(!++count))
> >        cmp(priv, b, b);
> > =

> > This was designed specifically so that callers could periodically
> > invoke cond_resched() within their comparison functions when merging
> > highly unbalanced lists.
> > =

> > However, an audit of the kernel tree reveals that only fs/ubifs/ relies
> > on this mechanism. For the vast majority of list_sort() users (such as
> > block layer IO schedulers and file systems), this results in completely
> > wasted function calls. In the worst-case scenario (merging an already
> > sorted list where 'a' is exhausted quickly), this results in
> > approximately (N/2)/256 unnecessary cmp() calls.
> =

> Why isn't this a problem for other users of list_sort()?
> Are the lists they sort guaranteed to be short?
> =

> Or did nobody test hard enough on slow machines without preempt? ;-)

TBH, I don't really have a clear answer to that.

I tried to dig into the history. It turns out this mechanism was
introduced 16 years ago in commit 835cc0c8477f ("lib: more scalable
list_sort()"). The commit message explicitly mentioned both XFS and
UBIFS as the intended users for this long-list workaround. However,
looking at the tree back then, XFS never actually put a cond_resched()
in their cmp() function. It seems UBIFS has been the sole user of this
trick ever since. Given that it has been this way for 16 years, it
seems other subsystems haven't really encountered any practical issues
with it.

For UBIFS, this patch doesn't alter the frequency, timing, or behavior
of the cond_resched() calls at all, so I am confident that this won't
introduce any regressions.

Regards,
Kuan-Wei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
