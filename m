Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFF06E7718B
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jan 2025 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDQwSHKXVzbpOOKt+oa8wRJ/T8BuLlZRPzLJMlzmnV8=; b=F9YQXkgAmtuS3a
	eJR02f64PLsKITn/VaSaqwbBMiJNAmfUEEuwXQaixTPmXRegknCbPGCXDJMl3JLE+lq3sdV8Fu8nn
	S4ajp42WPKa3OJvkxWesaA5BSpnRKYnvUwqDkxoYTMhNKmYQ8KW+xZrHsDzpa28JN3S8kPmUcsULm
	tAtQS6Z19YH2nRz3HqwtbBsvXgdqdaBqMuQaQEk2rn86BEbdZRnwZ8US7srkWmNaCGO6wmWiKfOfg
	5lgr1r3Kats/PzL3wq1xjqP+UtaYsbhbOuRAGGKNgKIb9WCi39Z7DIlkxk6f/b32jVUa1taZFr5vB
	bkIUrtNv35lnor6dcYGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tT655-00000009Mpn-2n7j;
	Wed, 01 Jan 2025 21:16:43 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tT652-00000009MpJ-3UMP
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jan 2025 21:16:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-385e0e224cbso5502801f8f.2
        for <linux-mtd@lists.infradead.org>; Wed, 01 Jan 2025 13:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735766199; x=1736370999; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7Gumy85u/RRWfyQv4lGazJpNh7Vrewtak4aVfMceos=;
        b=MA5Jy5b8BSoStLHnh0Ih5hFMy1S4dfozlCgT3GSpdHmJ265m8h84ccuJOP5JgK4JVB
         xcFSujvFIWVr/vYlwg0hDMHc9Qk1K2e6zSYW9RlecFCaCxdNGA3k70VsXxJP5G3jK8dh
         0UfiyYiGUqtCcddiX0DndpCAjqtbmcwDj9MdZZh3zBoSA1JckG6ry4/J0XnNXfbh3cm5
         MDT8a6GMp5kdDmKYlnzjxogXObwCjWcw9CGwk/zLkGUj3tJMcobR91q86a70uG87uALx
         fCinQPGURQxG1FG1u42A/B1Kbe89QjWrGwv/ZyCtxhNxIPIF6a+A3LgkQsJShJil9LYa
         xfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735766199; x=1736370999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7Gumy85u/RRWfyQv4lGazJpNh7Vrewtak4aVfMceos=;
        b=EZaclt0sbrINs/FHLXHGzcDkGMT1nIiyrLIsGUrNQW0/U355P+ySd/swIk9L3ZeT9b
         392kj4LzVts5h6id8Xqh8r2jsd7i9xwD1tflveT0jpwroJ/HEHO5wkKhT1Z10Nk8K6IM
         HRP+5bJiHSpk+eac2G8JKqF8ZNfir+JMJTjaHsfNLmAop9F8IuZb8bBjDjyqcqo52IYf
         mlJDhu9ZlQ7unUVj2fp+ufNxgKiLNlErpNYHv+pLIcpFba2RPaPZVRAaxIg7/5QPbskM
         N1W+Lc1keW8x15aKbwj01jRTbiAh6zAmFvPDzA36NChQpPXU76sZ7AUaea2YumdSuxbF
         MnMw==
X-Forwarded-Encrypted: i=1; AJvYcCXXnyHBv1dzyDUYMe1kxp+k6WB+73JmS9oDIKfw5NQfLMqXo4McquaB3nJAibmXSDZLzF6Ns9X5Bq0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOB6O37AD2lDd3UcoEynzQuRbJpdpFCNgE4iF/W5ld1XTQBmNN
	jyiw97Mr59K5hog2wewvzzCesAsRy8fYolXPt12zOEi2kcBiHO6F
X-Gm-Gg: ASbGncvj4/X3p/REKenyU2KBSkKAkvb1tLPWsUh013p07iRD7UIficmZTpRDw8905Ag
	azf56tkOiEk6JQySOQ4FzANy7RaDFBWGz89d+Ioz5sx5NJIi5F6owm//y1dUx8/Oi+LCsU6TrXV
	09xbjo2vadfvgHwX4YAAxGFL1Uy/fwUlYfZpo456e2hALTyClzfCoPaLKkgGZf/CN+mwQk/vjjh
	H4jyvcrUg2Ge7VgNUrR9i0eVpUh+jY7WC93cmMRL6ajWXflQEfLnripSz951UdNDgDQvhVNdPQD
	U6y3snFWMNPmsL1WyxTU0JM=
X-Google-Smtp-Source: AGHT+IHpviB1MKWJdRoIJLE0uDNAiEn95vSl3N4Qv8YA819soN8pVymV+cXxFS7EpZKTCJgDGapCWQ==
X-Received: by 2002:a5d:64ad:0:b0:385:decf:52bc with SMTP id ffacd0b85a97d-38a2220088bmr34387189f8f.32.1735766198509;
        Wed, 01 Jan 2025 13:16:38 -0800 (PST)
Received: from dsl-u17-10 (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c89e2dfsm36764411f8f.74.2025.01.01.13.16.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Jan 2025 13:16:37 -0800 (PST)
Date: Wed, 1 Jan 2025 21:16:37 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Karthik Poosa <karthik.poosa@intel.com>, Reuven Abliyev
 <reuven.abliyev@intel.com>, Oren Weil <oren.jer.weil@intel.com>,
 linux-mtd@lists.infradead.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/11] mtd: intel-dg: align 64bit read and write
Message-ID: <20250101211637.709b65e1@dsl-u17-10>
In-Reply-To: <20250101164119.000d2bd4@dsl-u17-10>
References: <20250101153925.865703-1-alexander.usyskin@intel.com>
	<20250101153925.865703-7-alexander.usyskin@intel.com>
	<20250101164119.000d2bd4@dsl-u17-10>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250101_131640_913718_5D4A97BD 
X-CRM114-Status: GOOD (  18.82  )
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

On Wed, 1 Jan 2025 16:41:19 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Wed,  1 Jan 2025 17:39:20 +0200
> Alexander Usyskin <alexander.usyskin@intel.com> wrote:
> 
> > GSC NVM controller HW errors on quad access overlapping 1K border.
> > Align 64bit read and write to avoid readq/writeq over 1K border.
> > 
> > Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
> > Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
> > ---
> >  drivers/mtd/devices/mtd-intel-dg.c | 35 ++++++++++++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> > 
> > diff --git a/drivers/mtd/devices/mtd-intel-dg.c b/drivers/mtd/devices/mtd-intel-dg.c
> > index 76ef7198fff8..230bf444b7fe 100644
> > --- a/drivers/mtd/devices/mtd-intel-dg.c
> > +++ b/drivers/mtd/devices/mtd-intel-dg.c
> > @@ -238,6 +238,24 @@ static ssize_t idg_write(struct intel_dg_nvm *nvm, u8 region,
> >  		len_s -= to_shift;
> >  	}
> >  
> > +	if (!IS_ALIGNED(to, sizeof(u64)) &&
> > +	    ((to ^ (to + len_s)) & GENMASK(31, 10))) {  

That might as well be the easier to understand:
	if ((to & 7) && (to & 1023) + len_s > 1024)

Replacing (add, xor, and) with (and, add, cmp) is much the same
even without the decrement.

	David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
