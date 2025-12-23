Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238D6E6ADF9
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 05:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nB0hvuc09eCejO9Rgv5KthyqVFH1haxjKXOv0yWfO8k=; b=oO7bdWM/3iRkBd
	ywFSlekPgLrJPraS5IgCqqYMaN4tDXEPsLDtredlspIG0uMDIDLP0IbwjM4MjkBCCJMhw6xS5bh+m
	HeTts/ttI0JQP4fpZe/Y/dUXsfwRIvzXwYOvsSiKmRsvc1W/cdZPBY7GZ+ej4jkEDfESM8qky3/1Y
	LOZ0NXfq53LZESJ87SFcZTFfy0M+E7SeE2DpWLeBdpPbd9ZRcThJEf58CXjIenTWNmQur+hEeG6/+
	vt/1sRWziCthKD+K4tNlaqIooUx/AsGRX1v25ETlZv3zth6cZzIm8RlJ3ZkK59HuzSJ9WCELvTrJ7
	BvaGbr49bEChzb+cBz3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv71-0000000EYeJ-2oHI;
	Tue, 23 Dec 2025 05:39:11 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv6y-0000000EYdk-13bf
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 05:39:09 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a0834769f0so46360245ad.2
        for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 21:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766468347; x=1767073147; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V0Oa5NOGMRC1AJFdH7RGft89mUSkkZqf9Qovy9KVtFo=;
        b=Ly94tkT6sklSVFWVIJGa4A2clexl7qkIio+6BnJGb7VH4wBgGgaS/If3ie5Cdkupfl
         Xvt0acac5DlJltuyCZ4n+1VPVDybF4XQmNTO+j+/P1HdbHxjtLDS/DSg8PvPQtdk6wYr
         SIGzLIwzY62aSomu4hn+CnAaTySfFMBdhEkyDrmjeCdfHIkB+QetMTNDyjvwaAe0AAyv
         D6gh+cZvuJH+EbwhGKv1UGAFJx7Df7OGDxdHqEcptHnZ6KH4QR+0EWvTn9YiOcX6VADd
         sQVaOX+BKcW3z2UALLS8axUgH7bNrZ6UPnOW6C/K4PCsi+AZsc0q2WFGArnh9Liy3TVH
         zoFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766468347; x=1767073147;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V0Oa5NOGMRC1AJFdH7RGft89mUSkkZqf9Qovy9KVtFo=;
        b=owRYqJKfa6BBTfc2y5WdvCzyKKmJ8kqXOawLqKajpw3wAffkLmnwRQQ7vx12A61kpF
         TvtDsyphXo5jZhcTAaPEZbFdJFukspIQ/7wtK6Jcjj7ZXKmaAycu7opuhpLoSMTHF+E/
         Au661vbZlfuXZVgoi4QDeCWZkmwDrBgXg1oTwfB4WvZfTqo1QhlL/+QkRjMQrNNMkpQn
         fN8ZIBj0br2kXaVCvSyy0tfy7pBktbeHCXphqcshkfhR4CBgFHlXDgZrA7OQWmKVoISD
         gnFB46nE3O+22HdGQda4057mDllRCYyGlvmIfC7mmXy7hU0twzBIxLQT96dhiOYC4065
         23AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWijXnwVjkb4TgJOF0uNjh++iGzwP3Mx1vCs3DU99m9OR/wxuQ9LTiNLlkDzg5rz11DmZcUkDdNU3g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw27AiY19CRLGF4btkrig8gN/1O7z9Yp+5n5nj3i0K5ovj4cth2
	1JFuNQ+npo6oBpdmFhj11BaBEevyuQLPLbL3L59rS/goJx3Lx0ZScBQD
X-Gm-Gg: AY/fxX4idHVi4Ytt8munfEWYEOAuz2sdDnYd9Bopzdn+BcEkN5wsYspzqUdQPVaUdF/
	6OO0dabyYXyovFComheR0vIxYgh3D0b5xNVqMv1AZQZqCRVjTCwYZ/B1mFxTlIiGWJCGKSlxxnL
	1OPA1nw5M9L+eeuHeyKQWYyLwGHy0W4TpJo3xgJVMNRi849Iw8PS/afqy4OHPcOZ8lMqLjXdIXn
	Dnjo4uyakCrBjXYH6H2/jLvi7mcmlS6AJR6vu2LbwpWN+WTroBtlJ5lDoeNVtWtY8/b2qrq2WRq
	9XQbPaQ2iNcOk8t7VpdA2p1w5GgYqztJwIEbO63xg9wk80ya/HlZDPIJVUPU0aFIHC1ibwuaUVk
	otzQjbaM6R0qJmnLNn13WHFhrSKmu0WS5KJRLqa+OT5FZEhgS448STdkQbS4q7otUP3eTFiFQgk
	d2dohP9dPtt8Kao0wkEJVOYQ2vQLNekLrBpxYOwahumO4+O4ZjLgl0aiEOjOcB10+P
X-Google-Smtp-Source: AGHT+IFzlCLo+BvPmOwaQvXqt6LlTFpUSJebHNJribHXa7k68xn/ydFompByNLrYdKm0zAa3YWAnPw==
X-Received: by 2002:a05:7022:793:b0:11b:9386:8257 with SMTP id a92af1059eb24-12172302180mr11142291c88.44.1766468347292;
        Mon, 22 Dec 2025 21:39:07 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab? ([2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm40285157c88.8.2025.12.22.21.39.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 21:39:06 -0800 (PST)
Message-ID: <bc999618-1f1a-4ae7-a81c-57062d57614d@gmail.com>
Date: Mon, 22 Dec 2025 21:39:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] xfs: enable non-blocking timestamp updates
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
 <20251223003756.409543-12-hch@lst.de>
Content-Language: en-US
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251223003756.409543-12-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213908_332291_F81465B7 
X-CRM114-Status: UNSURE (   7.96  )
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
> The lazytime path using the generic helpers can never block in XFS
> because there is no ->dirty_inode method that could block.  Allow
> non-blocking timestamp updates for this case by replacing
> generic_update_time with the open coded version without the S_NOWAIT
> check.
>
> Fixes: 66fa3cedf16a ("fs: Add async write file modification handling.")
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Reviewed-by: Jeff Layton<jlayton@kernel.org>


Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
