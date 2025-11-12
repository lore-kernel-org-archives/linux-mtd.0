Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64562CCFA1E
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Nov 2025 09:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J4HlL2uV5B07RvE6EYAKrSXaBmOmZwbvDYa6pInS5D4=; b=oyTjMZEVLTOscn
	AhYvtwi1HGZmMEgicCfhmXVpSzPsDhupysYnYtPELy3Eo9tiow975k+Ut94a5OwHl0j9cE+YMVxPU
	1TxU4aQrXTD7zEfyDOBdU6S4NJYu9KBFP0xUO56OV1gjT9htMfnxXVJWqaWkJcHDmi93gwvdLEhtk
	ZU9geCrhyJjWhi5ugGdef6J909hVZ032hvouW3vAx3O45588tlF2B0ztp46YtYtpmS/P152VpSZdQ
	wbQagoU/4Df35qT/GO3qAnxpclwpFhhkXO2ZD9ytJWdBZTeinMsMy8+MMkhayDZxuokBz+vVb7Rmg
	vVC4n3qQT4SytpSM9xCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7Nt-00000008UaD-2rNW;
	Wed, 12 Nov 2025 09:43:25 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ7Nq-00000008UZU-2uWr
	for linux-mtd@lists.infradead.org;
	Wed, 12 Nov 2025 09:43:23 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4777771ed1aso4147605e9.2
        for <linux-mtd@lists.infradead.org>; Wed, 12 Nov 2025 01:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762940601; x=1763545401; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2sZZR13em2kFK9vuHhMagBqaNxcu6HaXgiKpBFvnH0=;
        b=OYkei69Pw63SALfd5sKIj4wOqHCOj8L6kFYy229v3/iYS1DQrfdw/NNN7wVs8L2wrT
         7NULVGZQy6DbDuAdNGxXo0t+Kv5gfDB6biyFQNNUVP4O1tipxE7VEuH95JA3DMTitL/3
         4GFAT7rWjgEapQLocA3zab7qpNCqOowLf5x1WUa/x1duW4Kjyc7FugizbdvCx3qe0LAM
         DWxiecGcXgQM/W9IG242ShKjwYAPwC/k7rCka0tsT4SfbCFKgbzkWOVlOhSJsQBBbWDL
         4kuNC+u4jyOKgiqhbraE1hSgKfgzZA/xo0k0Ce55OccXtsYQHHWRnYSZIRqOxLnWriUr
         A49w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762940601; x=1763545401;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y2sZZR13em2kFK9vuHhMagBqaNxcu6HaXgiKpBFvnH0=;
        b=VsUhgIQueY9w1GOpzTJR8GeJpGDutO+2nfVSpj3oVLxMyZJwWHjllKWE+2FeH9hNiX
         XMwtdGY9khsDSMbQ+VyOJO7b+nBvyao4FIg+xQXrL3IpE7xhHO61egOVa3tvP/UR+6Nl
         mwfJKLShvPe5JowHgBOzpWmZdyBxpSP3tcw/yfr1xXmKK1lSUCgFYdseutBdStgPiJE8
         eZTyZjiIulMMlApgEbg7wC5qd1cytFsIMiHXWs97noX5joPPy4VnBDClVed5oAQrYS3V
         f+DgqgvWTEBxV7TiPBQoVeZ4BD29uDBqkdhJeDqdZPy9ON+qinPqQFviJ9OqzgbhEOQQ
         0xAw==
X-Forwarded-Encrypted: i=1; AJvYcCVFrlMGLbxjsd7cyUmv2DAAeoDK5+2kMjS+q1gAJphxMZRjq0I5GwrndfYDrik/HFBvNoUShw38DGM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwODk9nnbDj1JgAZ92mvIuKaJMNtnR9xIOn80J13wZ4xYwDoCrl
	n3/Tb8KBnEUR49oy/JwRty5jXYZgqgF/cW35UKDY9esZycmUkB+V44Em
X-Gm-Gg: ASbGncvtv0YCCEgW5yrs7lHvlaGRDzvxf76BwLb/5tOdI4TVYi7W5b+J9M4opsEDWWU
	ZT0qSYuCCGuzMlMtwzaddHdOLvtp9VYQB58qa/iHSbpPHABBf1Z9iKyDj0lOW99nPUOJUhAUtT0
	FnAbISk8WNihBZKl3Gpt4nSr2dCzYPfb8hrtYZfq3kKFPKVCoKzhWBpvfr6g/csau/0LLh9c45p
	Zu0YQPvk0ZOCQlJJi6nYOXJAFny1IioCKEQkrNIRW0fU/yNy14FvABs0ROhx0UMZ8YYQto0U6zN
	LJ7CvDQLR95MB6OBTTzZiC9VeuaaxR+siwpB6TuR5yQm6tNoSkWnUZKtfc+Y5DZWkr6rqEHigiU
	Up3qJsYgzXCc2z40gJDZ73q+KpoQwYwgUS2bum18TnAz2ca1+XTWzM6VnD/LisROxbLKdPVHaA2
	douARt76kGdJWUp23MefFBs65XtE9j
X-Google-Smtp-Source: AGHT+IFWRLil5c9QrjCfrciKn0pCpnUeeuzlRecgpwrZi29ini7Fw+ZEevTQknhxTgQmz8r53cyk/w==
X-Received: by 2002:a05:600c:3550:b0:471:9da:524c with SMTP id 5b1f17b1804b1-477870468eemr22102045e9.12.1762940600679;
        Wed, 12 Nov 2025 01:43:20 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e8e743sm24556415e9.15.2025.11.12.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 01:43:20 -0800 (PST)
Message-ID: <691456b8.050a0220.3c21b3.5c4c@mx.google.com>
X-Google-Original-Message-ID: <aRRWtShR36d_16eS@Ansuel-XPS.>
Date: Wed, 12 Nov 2025 10:43:17 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] mtd: mtdpart: ignore error -ENOENT from parsers on
 subpartitions
References: <20251109115247.15448-1-ansuelsmth@gmail.com>
 <87y0ob7fyy.fsf@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y0ob7fyy.fsf@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_014322_747162_89118BAB 
X-CRM114-Status: GOOD (  23.02  )
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

On Wed, Nov 12, 2025 at 10:33:25AM +0100, Miquel Raynal wrote:
> Hi Christian,
> 
> On 09/11/2025 at 12:52:44 +01, Christian Marangi <ansuelsmth@gmail.com> wrote:
> 
> > Commit 5c2f7727d437 ("mtd: mtdpart: check for subpartitions parsing
> > result") introduced some kind of regression with parser on subpartitions
> > where if a parser emits an error then the entire parsing process from the
> > upper parser fails and partitions are deleted.
> >
> > Not checking for error in subpartitions was originally intended as
> > special parser can emit error also in the case of the partition not
> > correctly init (for example a wiped partition) or special case where the
> > partition should be skipped due to some ENV variables externally
> > provided (from bootloader for example)
> >
> > One example case is the TRX partition where, in the context of a wiped
> > partition, returns a -ENOENT as the trx_magic is not found in the
> > expected TRX header (as the partition is wiped)
> 
> I didn't had in mind this was a valid case. I am a bit puzzled because
> it opens the breach to other special cases, but at the same time I have
> no strong arguments to refuse this situation so let's go for it.
> 

Thanks a lot for accepting this. I checked all the parser both upstream
and downstream and I found this ""undocumented"" pattern of returning
-ENOENT. [1] [2] [3]

For sure it's a regression, we had various device on OpenWrt that broke
from migrating from 6.6 to 6.12. I agree there is the risk you are
pointing out but I feel this is a good compromise to restore original
functionality of the upstream parsers.

(the other error condition are -ENOMEM or sometimes -EINVAL for parser
header present but very wrong)

[1] https://elixir.bootlin.com/linux/v6.17.7/source/drivers/mtd/parsers/tplink_safeloader.c#L93
[2] https://elixir.bootlin.com/linux/v6.17.7/source/drivers/mtd/parsers/scpart.c#L170
[3] https://elixir.bootlin.com/linux/v6.17.7/source/drivers/mtd/parsers/ofpart_bcm4908.c#L47

-- 
	Ansuel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
