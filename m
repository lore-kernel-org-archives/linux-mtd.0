Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38608E6ADF9
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 05:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WxLqVQTjsIAvttOPN1WekUYJ7AY0vO34oqlKABdcfY0=; b=0GbSm61WrJ+yzg
	e30wu06Q0CB61Jrft+Om/+4vCl0Jfld6eVJ9o4Wk3KszxpW+/z1KhyN/DBpNh/H8E04Klaa/dWHwL
	ktHAqq/Gt00KCsllcDBlUAGU4yvOtlu2YYubYwaDYANK2KcY+ZsdOCv1PHmBt8D4jbWh/5DHhqbBa
	mDx4pYUcljne5Jb8FcnwHizafzEPx+D4SAujMsFCl235wK+CViCPtVwTQB7f4johl1XNw0JjPkI2j
	+LQnuwXafGlDlw4+6C1Ydk03AEluMVwb0zHLFYoM8vEyyVJCUi+TnSk11GWAFBpBQaCJYVdE82fG/
	sl3Z2SZRmpclgs6uNI3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv6R-0000000EYaL-19fF;
	Tue, 23 Dec 2025 05:38:35 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv6O-0000000EYZV-1WRO
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 05:38:33 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7b80fed1505so4861570b3a.3
        for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 21:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766468311; x=1767073111; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eUzqzQcRAv7TL9i3u7rXqYthkznBqBfs67/HNYTk8I=;
        b=T0siOqYGZF4ZX0gEuzpd8DV8UIN2gk8bYdH10HfhOJkfXZn85sUk1Fp6Es0ERXC2mD
         9Ax6pfQajdOeHz0WHl9K/zp8GBZAF0KL5st4uw47RLMh9YCSKOwe05HFiYZx32t2dGGb
         ojcFOfOD0ryVcGAf5M7S8FWmMwzVXNuordFQ3uU+Xblx6Q23RCqHd6uEP7/oOad+CHHG
         Sgma4jP5tuPcshYkcRSPbaYh2JVKIPa6H29wIaOtWB1CjU5JFqoxasRPKM8jGxSAda/C
         PPoJj4HVnQLtqcBgiXWkRHhsQwvlg/HqZd90dmSmQyJZ2I0QspAu1Rwf1iHfPRTcdk9u
         PtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766468311; x=1767073111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eUzqzQcRAv7TL9i3u7rXqYthkznBqBfs67/HNYTk8I=;
        b=Lk0lMD7GCIeNoAMjACpn9SJ1D+OdiaDGuRA5ODE6Bl1vtmvhGAj6zkuiw0Ga30W3a3
         mHQGzNuYci7WSh4X6taG0eezwRfpwO0wJZ4L1QJki3bQWLLYEh9AdLRN641VSx14cSd8
         YBeGi04mmZfcbaBJLW9Y/jhwy08sYK6/gxkfKJo1uGaZ9YQbwaqoIt+lCV/xfOxcpMWF
         g+ZOWLMtU0m2zF5qhridMRLTqlwLKW/BaiCgEolniIImugw4WIDGDKXRZmx87aHkHhDG
         1hVflGbtNdLTs/3Eg8U6xyXl0vGGg3RbKarwmWKuh364yH7g2l7fd/y555G3GaKUjxVH
         Ej5A==
X-Forwarded-Encrypted: i=1; AJvYcCWzn6pX36YUioFXaBpBG2V/fdZXn3fBF5o0ECP0U9iYmqpqdGlR5g847plZIfYVdQsT07RHt8WUnfM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVWFQ8jiDFkdoC1mUzsD81QC3bqNHYmsWlxDXrBEk9ujKsR/n6
	DKrjMkIhceKgZuAP1k7F+kB7QMTPMS0FfPwZGi4gKOZlBxCWyslJKugi
X-Gm-Gg: AY/fxX7YoTshVQ4adunzHMMsOa4S4lxjUlJdgR5T+UIRcMellTsRJTgwixMYGoq1wj6
	2MPTEo70z50fSB/NDtwIQEniZxQrzA8guRGt5kupajITJOijkWTIPItXn1/ujZxO9s6z5pnyyWa
	H7ReNHHv3HAmy5pU6dEs/c2BMy2XkEibp4FbDx1CD4Rfgzm+8Qls+9rUG5zgmj0781RrZChawUn
	8yba0hAhs0GM+WP2SD7165tT0WPQd2cTOYR0BuuhF0Isn76VMfOaTkN7j4ZXKXyjJuKl7wnNKqb
	PgCdwGlYqgOEff6S35S20BwKLQkoljjKCERrZVM/GSECD6IGn6T1F3p0TZIw/R0SBFmSGbtMIX2
	z3Z4l1BobreQaKIS3NCQtkXMqG/kJxGi0/0cPneW+Y/rAwZCmjTEvoXqkk4mr18h+GHWzW7XZKy
	tyg2q4lxXnmpS9cYT8BETuz9dfni0oEYXhXZiNY7X06fDzIuZubaN6UIK7SIZLSCu6Zhr+eT0Dj
	8M=
X-Google-Smtp-Source: AGHT+IFwAZOrVWcdz0GU+cDO+t7ewKrgjzgkHtOiGD0/poJQvRMMxSdMeBecD46MhF4AsSDjM1RyIA==
X-Received: by 2002:a05:7022:799:b0:119:e56b:957e with SMTP id a92af1059eb24-121722ac244mr18354800c88.3.1766468311123;
        Mon, 22 Dec 2025 21:38:31 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab? ([2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254d369sm56187439c88.16.2025.12.22.21.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 21:38:30 -0800 (PST)
Message-ID: <37febb65-038e-47a7-9a5b-3b4c2773994f@gmail.com>
Date: Mon, 22 Dec 2025 21:38:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] fs: add support for non-blocking timestamp updates
To: Christoph Hellwig <hch@lst.de>, Christian Brauner <brauner@kernel.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>, Carlos Maiolino <cem@kernel.org>,
 Stefan Roesch <shr@fb.com>, Jeff Layton <jlayton@kernel.org>,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, gfs2@lists.linux.dev,
 io-uring@vger.kernel.org, devel@lists.orangefs.org,
 linux-unionfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org
References: <20251223003756.409543-1-hch@lst.de>
 <20251223003756.409543-9-hch@lst.de>
Content-Language: en-US
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251223003756.409543-9-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213832_412091_91D82466 
X-CRM114-Status: UNSURE (   8.52  )
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

On 12/22/25 16:37, Christoph Hellwig wrote:
> Currently file_update_time_flags unconditionally returns -EAGAIN if any
> timestamp needs to be updated and IOCB_NOWAIT is passed.  This makes
> non-blocking direct writes impossible on file systems with granular
> enough timestamps.
>
> Add a S_NOWAIT to ask for timestamps to not block, and return -EAGAIN in
> all methods for now.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Reviewed-by: Jeff Layton<jlayton@kernel.org>

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
