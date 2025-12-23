Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26677E6B25F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 05:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OQjRbSZ1Qb+/WrFL0ojw6tQbHMlNBkPx01hbp3wWb+U=; b=WU5rdyF4CpE4Gw
	y4fEBdib6F0C++ErPpXZDrrHMCmWEnxLgiTn1LLkz6e3+/jvGqdUPJ/hrGCHypOBqDuNnCsBsWZ8p
	gUIlEFjDd/baT7M+f8CeHtDj/30nz26tnChfHe0M9UY4BK/F6nyJPHnHTEYHL5qDTXPa+mAlJev7r
	XmwALsxhZrewUF3uAjyoNESjT2TjRbNYot1lhSBNprzLxfzsAFABV1ExS3eGjLI1Z/duElZVM18By
	14kRLUn/1Gg9Pb+1j4t98NaRLgfzE3+N+Mdo2+dE7YCX7RtkGON2jkIV755H6b3b9V1ZeUj0vziyH
	fHBxM2mJBUv/DKKQF6dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv4M-0000000EXmT-3Sjc;
	Tue, 23 Dec 2025 05:36:26 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv4K-0000000EXlv-4472
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 05:36:26 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-34e90f7b49cso3303805a91.3
        for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 21:36:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766468184; x=1767072984; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VlgqwkzGyrE3K5mQqCM6bG2Y747dQIeSyi7etFJLJbQ=;
        b=nh5vwYGhWNHRyRFZn+/HU3iQLNwDslYPOMbEAIMokynRLJvlsxawGfXAsnlHrgf0rq
         1tMFmks/PghNZV9vP94/xGc0G2ltAZdR4SKnlq1iaX60y8xSFHMM/M02lP97gfufjuQl
         wJW1ciJwf6DCJgU1YIfdD1y4HozPbukm4z9iZmd7uC9Aj7wtbVoosKtEPmh/o4EwW+3A
         nikragfFH27nuUncgCSnnECqpBO0FgPYIJZfm9EP3J3EmtEjCUMhk2sVymplFAuXE2+8
         tAhhVo/zrXeAle+Wmcx+n6RHjcbmAkKSjEnaOg/B8TNCB7i0WBSzzFcKM9HFa6ZE2Xe/
         HAGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766468184; x=1767072984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VlgqwkzGyrE3K5mQqCM6bG2Y747dQIeSyi7etFJLJbQ=;
        b=LtTDsL8jsfSGROkbKNvGMur36GdCCDnUydEbL8Mwe2C0KC7YimzUauF7d/1Buv7S3b
         rOYov2n33PjusIU3TtJBlDycMqERSD/eX8waSgeCNWWGTx62cW2h3QsB9Otw/8ptFI+I
         HpAxaVhwMwwJ3lc5JevJfLiqCtRx+DqeDN90vdTYeZ+Je9H5rvmp3Fzv+RG0yskstVKe
         ZjhP53WqIz2QTCzQHAP8OFYv6dmVLKGIOUk1N4NlSVjv9as+wnWjQ7xmDvyVtNVJ6cOC
         2mHpCyK7D92BqaKBO5Ma2srMnW7Y2x3+YUFUHGA2qhcpG2r6OTibRDtNIp7OGOQtYP2g
         oy0g==
X-Forwarded-Encrypted: i=1; AJvYcCVZjPl3kVSsB6BeCpguOqb/6p9AMl9UUp8gDliDxF20ZtrspKXN7EwnWOwBFfODfCI0rZqTpWTFsSk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxafExTUXPPGcf0N9hTZf3jFdTgEmzwBTBqUmPxY4HlL+C9tfSv
	+DS3z3jVD6FyOeNlU1ywn3Mgexr0sy9hwfakQgd/oXwmci6x+oh2cWCC
X-Gm-Gg: AY/fxX7jfSknCKMEXnV2QmiEQpwNV1INE3F/jcJ1at8sPFfPztmyCJoXuJhxsXvv874
	bgmvPmU24v8nDxrNBKI4x40MOp16Tqw3xaFI6SSoUsocF8R7HllxeKY81IoBWGZAg2Lc/H+ahk7
	R/Pw2jYm43+uqT5bDWj1//cJmw4hhHwwEKDzCCCtmXxIKotM6LdEwFbWAn+M4I09QCRY1pJNYmh
	rn65QT+o8FhakJq0qZTF5kSVVJh9mvDrvliueH/5P0S7V5DrKl6Xv/s5PghqkdXeaQWGS3DChL7
	UdzftX6ElyzkkQ2UGffGhs2dD/IqXIxpeNl5HrK5sTwQ3mx0zJWjJNGOCJhCLSVd6U6DBGzrDb6
	cQstQGJUeIONy7PMoG29miYaMXH/lwVU6O74jqcC72yvBznFu0A9XkIWUwP5jQJWIIDfqfHlQnV
	IXlCbxmsXp9wzBtsLrdcIYo2er05UWl0OUS9kr7Ul8hauI2QziiXCMBUz+x2WBGRfy
X-Google-Smtp-Source: AGHT+IFX/6+bwcWXg/4km6FqYdkuwnUGcop1hJcfw4hTgcVNu0v2yNrPtPf/mgK+hd5hIFUJyC/N+g==
X-Received: by 2002:a05:7022:3705:b0:119:e56b:91e9 with SMTP id a92af1059eb24-121722dff1cmr11158229c88.26.1766468183950;
        Mon, 22 Dec 2025 21:36:23 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab? ([2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm54039368c88.0.2025.12.22.21.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 21:36:23 -0800 (PST)
Message-ID: <4e5f6df4-b446-4ec0-a0d9-231756ee934c@gmail.com>
Date: Mon, 22 Dec 2025 21:36:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] fs: factor out a sync_lazytime helper
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
 <20251223003756.409543-7-hch@lst.de>
Content-Language: en-US
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251223003756.409543-7-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213625_051053_2D301083 
X-CRM114-Status: UNSURE (   6.75  )
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
> Centralize how we synchronize a lazytime update into the actual on-disk
> timestamp into a single helper.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Reviewed-by: Jan Kara<jack@suse.cz>
> Reviewed-by: Jeff Layton<jlayton@kernel.org>

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
