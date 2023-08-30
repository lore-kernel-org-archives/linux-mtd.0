Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 346A1C6FA8F
	for <linux-mtd@archiver.kernel.org>; Wed, 30 Aug 2023 06:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C17CSiq7ZyvUGxE22YPogzYFTDGvENNZvb5qYTXpt3M=; b=T4I5ejV7JkAVkH
	3pE+P5J98Mxy+mOyF9U4W6KoF//nsii3+33LqKIwSKKXTkV/t2jhU9+llLJkc5p90+Xy/VJWZI4yv
	zJiajrrzRkBaBVEwFXJy3ZYK3p3Bii8JDtHBmb5C8GOgFjB0KIwO4OhT0NCeL5hdk/gwnVU+ByUil
	YBQvlPK250D+YSLLI1FYyBgLA4Lt52xYBmUCpgWN3rDEXZYXikLpb3Y6i+uYbX4vrfsT/0peaIR+E
	9Yy4vPOZWTRpcR4UdPUEHkse8VP/znHYICextjsIa4IzxgfoTr+hvvArm/IGYF0BT3Dbj1Nm1ysQb
	2fDFokl92ruzhJfGNN1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbER6-00Ctmn-0x;
	Wed, 30 Aug 2023 06:12:16 +0000
Received: from out-246.mta0.migadu.com ([91.218.175.246])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbER2-00Ctld-3D
	for linux-mtd@lists.infradead.org;
	Wed, 30 Aug 2023 06:12:14 +0000
Message-ID: <642de4e6-801d-fcad-a7ce-bfc6dec3b6e5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1693375918;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JMzOvVHk770qYz+7D4bRM3eiaC0WBb12Z/fuZleaQ2g=;
	b=n8qZNKHDJ8ZkQN8s6YCFhUc5vlrIehXvAzssrfT4lOFAEgM70y7j9ccF+kTN544/il9mhv
	/Qwyv0zoAHdwAPeCdmanHqcxV7A/7XcL4G5u9c/o5+tWUqR2xZIKUSlHotdEAwwwHhjWvg
	KLK2CGyPGmGk32bcLUct3rbhOUMJhk8=
Date: Wed, 30 Aug 2023 14:11:31 +0800
MIME-Version: 1.0
Subject: Re: [PATCH 07/11] vfs: add nowait parameter for file_accessed()
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: io-uring@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Pavel Begunkov <asml.silence@gmail.com>,
 Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Stefan Roesch <shr@fb.com>,
 Clay Harris <bugs@claycon.org>, Dave Chinner <david@fromorbit.com>,
 "Darrick J . Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-cachefs@redhat.com, ecryptfs@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-unionfs@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-btrfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, linux-nilfs@vger.kernel.org, devel@lists.orangefs.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-mtd@lists.infradead.org, Wanpeng Li <wanpengli@tencent.com>
References: <20230827132835.1373581-1-hao.xu@linux.dev>
 <20230827132835.1373581-8-hao.xu@linux.dev>
 <ZOvA5DJDZN0FRymp@casper.infradead.org>
 <c728bf3f-d9db-4865-8473-058b26c11c06@linux.dev>
 <ZO3cI+DkotHQo3md@casper.infradead.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Hao Xu <hao.xu@linux.dev>
In-Reply-To: <ZO3cI+DkotHQo3md@casper.infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_231213_180902_DC5A617E 
X-CRM114-Status: GOOD (  15.65  )
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

On 8/29/23 19:53, Matthew Wilcox wrote:
> On Tue, Aug 29, 2023 at 03:46:13PM +0800, Hao Xu wrote:
>> On 8/28/23 05:32, Matthew Wilcox wrote:
>>> On Sun, Aug 27, 2023 at 09:28:31PM +0800, Hao Xu wrote:
>>>> From: Hao Xu <howeyxu@tencent.com>
>>>>
>>>> Add a boolean parameter for file_accessed() to support nowait semantics.
>>>> Currently it is true only with io_uring as its initial caller.
>>>
>>> So why do we need to do this as part of this series?  Apparently it
>>> hasn't caused any problems for filemap_read().
>>>
>>
>> We need this parameter to indicate if nowait semantics should be enforced in
>> touch_atime(), There are locks and maybe IOs in it.
> 
> That's not my point.  We currently call file_accessed() and
> touch_atime() for nowait reads and nowait writes.  You haven't done
> anything to fix those.
> 
> I suspect you can trim this patchset down significantly by avoiding
> fixing the file_accessed() problem.  And then come back with a later
> patchset that fixes it for all nowait i/o.  Or do a separate prep series

I'm ok to do that.

> first that fixes it for the existing nowait users, and then a second
> series to do all the directory stuff.
> 
> I'd do the first thing.  Just ignore the problem.  Directory atime
> updates cause I/O so rarely that you can afford to ignore it.  Almost
> everyone uses relatime or nodiratime.

Hi Matthew,
The previous discussion shows this does cause issues in real
producations: 
https://lore.kernel.org/io-uring/2785f009-2ebb-028d-8250-d5f3a30510f0@gmail.com/#:~:text=fwiw%2C%20we%27ve%20just%20recently%20had%20similar%20problems%20with%20io_uring%20read/write





______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
