Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA85BCEFCE2
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 17:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSTzfRq9V9qX7eRqAjVh9wBA7889Y3+YHnZ7jnMDzI0=; b=v83bR9JFiWyHPf
	61sLMMiq5EAaHEQMFOjrJLrX47+bl0doEgvosCUa52o3k5Hzsg5/QBa7nIqpK5BdZDA8FGPJCdCI3
	SUnhSeBqOamAQyEX1ecEaEmqRHTn0rkfkUQON0hYVy3uvw7+u1lcRbTspi91XeZsQ8ZSjc+0gcC8D
	54OgHWvxZtNRFlcT1J9SuJpGbfqkd9CyB7v5EjXdb/atKKRaQDGpi8l/fCkTuu2rXhCNSuehdx9Zc
	lCk1CZdBQfhd/XiwMKXF8fQ1CmdpF72to0IP0h/6ZntcjZSrdGe/4nUKPNDB7IX+q+ZU53DzL3gAa
	3P2rPQ0zxyfcPbICMQ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBH3-0000000DdaX-0pNY;
	Tue, 06 Jan 2026 17:55:17 +0000
Received: from mail.parknet.co.jp ([210.171.160.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdBH1-0000000DdZs-0MLr
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jan 2026 17:55:16 +0000
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id C17DB209655A;
	Wed,  7 Jan 2026 02:55:08 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1767722109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLoEpn8SbUq3M2bDjtG0l+ipy2NNHSDPPhecVpaZDKI=;
	b=DMDcHKE8vaT2nF69Dzn4q+ho0MObOvhdMIutxH4dRXqQs6X87wOOdePiyxIeGejkYbMQW1
	agTnNi+nGCJqANPlGmcyL4Y83s7mCcIe2QfhTiADX2/XrHwMssPp2gWrF/WkEcks48ltAl
	Nd746sbKtao8pfysbRLLut8tmEcN9HEo2Kot7rslLBqgtCaUIT4DaEjqXk4tynEH7tL4Vq
	7eJH9x/Zbr9gBFZ3Cm7BKNg1bMki91oudMaw+DblGX7Qn2GFrNEdkZ8Og0gQNTa8q0yW57
	CPQJzMRQqVls91Pawc8VvRVlwgfL3kYre0P2qPk5KBJWys+tnBTEPovCNZqtnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1767722109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XLoEpn8SbUq3M2bDjtG0l+ipy2NNHSDPPhecVpaZDKI=;
	b=dngp0wuDXWPBjKoTj+/Ya8vAvMGFu8eZAaXjdaBi/UhOklp9rQ98ohqhfi3hRRmWaQyEzW
	Wl3vPwJbxIX/wfAA==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id 606Ht7F5232027
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 7 Jan 2026 02:55:08 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id 606Ht7Mw551463
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 7 Jan 2026 02:55:07 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 606Ht6aI551461;
	Wed, 7 Jan 2026 02:55:06 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>,
        David Sterba <dsterba@suse.com>, Jan Kara
 <jack@suse.cz>,
        Mike Marshall <hubcap@omnibond.com>,
        Martin Brandenburg
 <martin@omnibond.com>,
        Carlos Maiolino <cem@kernel.org>, Stefan Roesch
 <shr@fb.com>,
        Jeff Layton <jlayton@kernel.org>,
        Trond Myklebust
 <trondmy@kernel.org>,
        Anna Schumaker <anna@kernel.org>, linux-kernel@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        gfs2@lists.linux.dev, io-uring@vger.kernel.org,
        devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
        linux-nfs@vger.kernel.org
Subject: Re: [PATCH 04/11] fat: cleanup the flags for fat_truncate_time
In-Reply-To: <87cy3nrpdu.fsf@mail.parknet.co.jp>
References: <20260106075008.1610195-1-hch@lst.de>
	<20260106075008.1610195-5-hch@lst.de>
	<87cy3nrpdu.fsf@mail.parknet.co.jp>
Date: Wed, 07 Jan 2026 02:55:06 +0900
Message-ID: <878qeask1x.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_095515_347937_D5B88FBC 
X-CRM114-Status: GOOD (  11.92  )
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

OGAWA Hirofumi <hirofumi@mail.parknet.co.jp> writes:

> Christoph Hellwig <hch@lst.de> writes:
>
>> Fat only has a single on-disk timestamp covering ctime and mtime.  Add
>> fat-specific flags that indicate which timestamp fat_truncate_time should
>> update to make this more clear.  This allows removing no-op
>> fat_truncate_time calls with the S_CTIME flag and prepares for removing
>> the S_* flags.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> This breaks fat_update_time() by calling fat_truncate_time() with old
> S_* flags (later patch looks like fixing though). Please add the commit
> comment about it, or fix it in this patch.
>
> Thanks.

Ah, I was overlooking that new value is using same value with S_*.
So

Acked-by: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
