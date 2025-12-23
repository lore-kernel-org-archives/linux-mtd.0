Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D11E6B25C
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Dec 2025 05:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXsCendr390kNuZniZbXyw6O37Nd4YhAcRM4rK01uk0=; b=eW+waYYZyuNW4b
	2hyIzlORcawaPIFAjEqU/V3ygSG6YkC8G+vGDd737aKAyNcutx+cod3PYaELZi6SexkaOp8HY/kmI
	eJZuiG9n6PZ46Eog+qY2Mcxs1HnC+qQCQLxtyVBqE3/RS17pp3yUnqOfes64C8aAKVVco4wCaM8Cu
	GPItOu8Rz6iHYdgDWkeyCn+1hr5cYtcH7l/c+auyd2HkNj208BCYsB5pm6JirMaBUAuct/5nSNaAF
	ZQ4jN2jbwYjUalbYF0V9nLP7xj8dS/s2duhLlGEZMTLBxEeNM95i1Rg9hIvwixRZvBiEy7IRcblhI
	AkKlgDennuET02yTwvGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv1E-0000000EXWj-1sfq;
	Tue, 23 Dec 2025 05:33:12 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXv1B-0000000EXWD-0juF
	for linux-mtd@lists.infradead.org;
	Tue, 23 Dec 2025 05:33:10 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-bc09b3d3afeso2635028a12.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 Dec 2025 21:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766467986; x=1767072786; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NqkuKEROb/OmRVYRZgeOKw/Kls8Un9PKgqEiKcwkGnk=;
        b=Dw3BOYGmMW0vG9yMgIsselK7A6X4gMcM4Lz7JvFzMUlxQsV1YAqwXxNxDuUd3IwHhH
         /mcUH0fe4UOAGVC7Y8Rgly/TdijJE2o7AyzcuBa3QrAll8dAzz2d/pxL4D6kkekeA5MB
         Nd/1dCX368+LcgwYi5zRojCTMpRMnBLY7SowX+TUzgunA6YE2Lhy7gtu6e5tCOCKz4Z3
         kKK1XfMSgVoPP/lutM3mrHkb7nhGVYjhBW4Ir/32rmMS6J1RvoAeW3pGxaChZj3ab2eA
         29j1j2SZ+tP5OvI72thUL2XFUfnJm/4QwupWv951ewp41ZZarGqcqISIySZZaG8wnLJF
         /C1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766467986; x=1767072786;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NqkuKEROb/OmRVYRZgeOKw/Kls8Un9PKgqEiKcwkGnk=;
        b=m5yIn0cEMHNCbzrcJHonLUP0LpdAshjjR3tgc11EhdPrOui+EbU5GYHHo3BSBSiR4i
         Ty2YwzfO5lwFA/pOmd2+2VRA0NZhcs68WYIicLyfGoVRSJJW1ngFc/0HHb39O6QWwnIe
         vMYKBvunTz9epKEJtgLVkyi+kGajNAhPtDzQQR/iM+ROlpsbPdyVEzNC9ccdC2PtIFfP
         8BmteAf458Y+VwYyNOvqhFv68S7nc+DPnEKxS8nQLmrWIcJrLWdNKHE2iVcRdsu6sKNA
         /rd4mSCIKQl3+H/lzaZL9/hdKtu8ITQqq6nPPK1fB4gFLvI4J98sJqSkrzHM4iJR0cPu
         oMuw==
X-Forwarded-Encrypted: i=1; AJvYcCWK+cswWvk9jGNvv5IIJ86bQwQcPSESq/rmoTYQvku47UFs1oyOBeK8IZK2AFUwF3WNYWLiSb/Z4dI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyiQqBtdyz/DPXSjgfu2Ul2nl8xsz4hflci05COB7670jaMUU9H
	wEp0nFpgAb9c5dV1Vo7zPm2woelyO7866AzZ+6BB2ib6oQZB4u7WYTzp
X-Gm-Gg: AY/fxX7Q5Z8zaQdgJskeASobClxQNttCGbM0p4TEEQSRIGYBYoi83exK2XjHrJA1qAZ
	tpvpmbX4OO4nyfQKNko8+FHXpCe3FKK8/wRI9bYGKcIMWnDK6eenu2F3qN+i6HQ25AyB15tDUni
	ORNENclRybw1Dn9fuzn1mLa3vWzs0fAZzCpOQJhgDkhTR9UqrKwtgqlNCICCdyB3cV1avejJ5HC
	0qz9tVLuIpyFwUC1pOh0Nbzmk4mrxijTOFkL3XyTtPTxtIfbgIxKGtBs4vLLbfT3hdcPeAr5bVN
	orqQ8/0A5Q3HYK56PljIjRG57Jw1XzQxC3gbZQPtMA3HB7ZxjzZSNlv+TxU7y1aMp8BkLTHx3It
	lzCtVNTDxno6nHjIbEhL6r81Hnnbkxf2N9uwr3VDKnvajhzGEl9OoyfZdcjbbyi0MOlAlOAGb1k
	0UL1CGrHPGOTMqjMbtJwUlWyFgV4j6SlBkQofXyPEV+qp/mUE0O/OEgvbypgRuQ5r7
X-Google-Smtp-Source: AGHT+IG5Qf4dCPxqVYyhhZiZ2cPZHWZcc5Jl8Dom3Sf+VbFYEbzUaslYB9RlXBdrrGXOm7O8E9bw2A==
X-Received: by 2002:a05:7301:1a12:b0:2a4:3593:ddd6 with SMTP id 5a478bee46e88-2b05ebb6038mr11158060eec.3.1766467986000;
        Mon, 22 Dec 2025 21:33:06 -0800 (PST)
Received: from ?IPV6:2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab? ([2600:8802:b00:9ce0:637f:5cdc:9df0:d9ab])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217243bbe3sm54002618c88.0.2025.12.22.21.33.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 21:33:05 -0800 (PST)
Message-ID: <12bb96b6-1e2e-4f53-b4ea-1fae2500aa21@gmail.com>
Date: Mon, 22 Dec 2025 21:33:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] fs: exit early in generic_update_time when there is
 no work
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
 <20251223003756.409543-4-hch@lst.de>
Content-Language: en-US
From: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251223003756.409543-4-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_213309_229950_42D1F8CD 
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
> Exit early if no attributes are to be updated, to avoid a spurious call
> to __mark_inode_dirty which can turn into a fairly expensive no-op due to
> the extra checks and locking.
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
