Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238AEE6B25F
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 05:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g2YFEQhaBBI1G/6VQVt5V9pmodhYbJXwC7TXwWsct8k=; b=uRe/21RQReGPwI
	1NzHCsQ6iFEpDmUcApYr+UUgdL2JCfkDU+CEmJ8ga7IjVLJmMP9i3HYiil9zxTaJN+Uw2O9M1wux8
	SPVnIBGK4fLnVGP61RwINALVgOFUl8KxTz/iZcXt42oTzPcXLDuuW6O9RvX4fSzbmltyejBtFk+x8
	0zl+Wh2KOI3yFymQP6wclx1Mdp5L5qD/lBLiMdXlb6B0eDgkfMbwh4SVjEhJjrVsFYXtwRrwaIXHN
	8fLooQ1CBwttXCmXBTPbJIHHKBMYhz0NdMLKh5jZzQ1z4sy3js07YME5bBttH/uZQ9gRZzOlGOS8J
	z7Pz/qDLQWFujex0ht2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv5O-0000000EY6r-3EtG;
	Tue, 23 Dec 2025 05:37:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv5C-0000000EY0D-2s2E
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 05:37:19 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0d5c365ceso59329125ad.3
        for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 21:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766468238; x=1767073038; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A82QF1EkZtulULncIKG5BayS1YlCBJFC1tpTXCRjsWA=;
        b=R19I6IaV2tUXJduxi9aiXFxSF/U+2WecHBnwUXPHBw5KQKp+Ye2O8nF1xyDbe6zekH
         4eiA2B62cF/q8VELyW556dCAslLapOAJi5QLbMVylXimu1iqJONMAKOvBZ/dOgkmuCJO
         FE7QtsdYFJlOKCaf9Eax+knkDC8ENwP5D8pD1T9+99Ai2fDwALHnExhuARi1EMV309dM
         pxbcn8t6CXjQi66c0C1ec5gNmJObPOJDLFhwHx/cS45/HAMsAg5bMsv5qFEMsKtMu06+
         JdubGr4elQZ+pikJ7jh2HTdlpxExOIODvSWERdzMb2cgAHWJC5xpuUyM0VM2lNo/0HGB
         2pBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766468238; x=1767073038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A82QF1EkZtulULncIKG5BayS1YlCBJFC1tpTXCRjsWA=;
        b=YBduSdnAY197v+w0y7jQyn9VH/FbUB6thXDe0W3DP2mP7NQzLZeF0x1jsaTgXXk9eU
         7sccoM3CPkvNr0sb+OuqXmfA3jvscTB77bpXyBn6agCaQg5bwuHrkzLAnc40YYHjNufi
         X7aVw8Vok5y36ShV124LK2Ig5Pe9UkoKSnX5lonKXHaMvWkbKwNoxxxfIjLfkU3kcRAX
         Ac98Ubbb8pmxiOg1VIv8jbGQ+7HMxQAEs0DLw/bWpZ/gsvMkkNaWD7L7yxwgNNKPn0u7
         sibFNRuUHjtFYNRq4kbDOHWRAga4KTruq0pqCxEG0SiQKyUw6UPvWdi8hz5vT+v295Da
         iYQg==
X-Forwarded-Encrypted: i=1; AJvYcCUj66zzfty8W1Zbbom6lAMLpcMcwziLT86lq3d581nP00/r/uz4PI2DY6Xn9I/kGNlmmmddU7gZjxo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzP771B2PTOtd8x/qvo19NDy/h7W237EHuN4U9BXEKCy9yvUJUW
	39axu6U9OKbQfv5Z6i/2GHQgLybL9G2KugnZ1qmI6YiDfw4DL3FHg9lFjHLfRA==
X-Gm-Gg: AY/fxX5ptJsEVGh6fw8GY7B6SHI6F7KTopj06Mf4Uqu8dPoi0IBQjtJpt9kBEu84cZ+
	IxEB+d2/nAEau8JQZBNR44Hv0h21BKs/eYWEXLYkQ1JvEG0Z5DviQQ8gHPyJLBPHtvynhqP0Jeo
	iMydoNSAnH8B9X6oJziS0nNCMTt4vCxZseFsxCAC3d+4gC5vcCXX01ZywQ9VMw9na1i9xAdEC1d
	h0cdKqHXpjPWyofrW6xslChquaXb7iPYnMcPC1MBnESGelmQUFoUDPmeiyDkPUv7XzQ7BN3yBgV
	sr/X2IQZWdha/gHaYewOdyKDdRYI6tcjkDvl8ig3cdhP+uykY+BdIs/rdcMJuBKBvXv56oUNhu6
	DA2Q13/X0Xd9U89dLZX5Bw2KpbUtlRhaogEXJdLKoAobGuitPGO63qzVqniTzO89vwtFpeAQX7Q
	Ic+u4QPjue874U6eMbHvOo3+uE6h+m5JezGDp1yJwpLJ915Wj84f/viYpXptDrrcfzbXmWS8Jr+
	GQ=
X-Google-Smtp-Source: AGHT+IFuAa1bEi9iXQ/fVsFOwY92P7NTqag0Itb/bLEcgCW/+Bj05+w6CIPRTwzaf559s5BnxudUFg==
X-Received: by 2002:a05:7022:1e01:b0:11a:5ee1:fd8a with SMTP id a92af1059eb24-121722ab372mr13830811c88.13.1766468237569;
        Mon, 22 Dec 2025 21:37:17 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab? ([2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfd95sm52514131c88.1.2025.12.22.21.37.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 21:37:17 -0800 (PST)
Message-ID: <5789c903-d3f6-4c41-b342-8d29387688e5@gmail.com>
Date: Mon, 22 Dec 2025 21:37:16 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] fs: add a ->sync_lazytime method
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
 <20251223003756.409543-8-hch@lst.de>
Content-Language: en-US
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251223003756.409543-8-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213718_816766_7DD8BC1E 
X-CRM114-Status: UNSURE (   7.44  )
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
> Allow the file system to explicitly implement lazytime syncing instead
> of pigging back on generic inode dirtying.  This allows to simplify
> the XFS implementation and prepares for non-blocking lazytime timestamp
> updates.
>
> Signed-off-by: Christoph Hellwig<hch@lst.de>
> Reviewed-by: Jeff Layton<jlayton@kernel.org>


Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
