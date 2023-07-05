Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E285EB64DA
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jul 2023 15:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2oGfPK/+ONRjf+fSB0mZDe7Nfa60ezvXome0ZxjdX0=; b=GcpKX3wLGXYjHN
	HVzTL+SRBIWOFojQ/290ir4dMLDAzT6avotGa4P3/OWKrWKlSl/hcNuIhIkt1O+ObFgBle2RUr8rm
	blnAng9gkroHTI1/g4EnwDC/6SNU+Kp7ieZZEfxbTNndrxIxCyjp0SHBHYgU0tRlEM+tXzUcoppBO
	XsnDiPa/8OGdHjaNKfvjSq0T/JoYb4I58AiMp/kguXQqTNSQPMYPJd/JtqeK2NAS8LF8FQvqXRQ6+
	gYdeL5HN+eO1/ZCesJlU8EwZUczaTnm9JMLMGH/9KKRON7COo3TfJWEM6GYgM5Erox+4X3yEvVybK
	amNTwvDcRe8NKN+pB5gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4Hx-00GIln-21;
	Wed, 05 Jul 2023 15:19:29 +0000
Received: from mail-il1-f178.google.com ([209.85.166.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH4Hu-00GIjx-1w;
	Wed, 05 Jul 2023 15:19:27 +0000
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-345fcf8951fso15439105ab.1;
        Wed, 05 Jul 2023 08:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688570364; x=1691162364;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhOVd+fM39By6Neo4SNlvIwXWgDBhgramNmEhS79nFc=;
        b=eM+zPN+QAu6ooo2JmyLGu4HKF/gHiQ+JiPTjiwUZDO+uy4iWfm7a1zEJ5fjFcr5DlJ
         icxHDUs/7ZvhF61VBD1QNPC1Gy6mRb4pCusXgR7OvnTR0lPo+QDxiT1p1ew0fVmQ5hGm
         tP0IA2IIRtVCbMIErVaMDDgO+5/Uvsaa3hN7U7nlg+yxZ8S35Y4oIy8E1H9JQ7deCsGB
         56bxgsAnvfgsMAtm0f90kZxkrkXdCOHX6pAo9KVMuQSLEFHT4UyC1TgxxlHI1b/Z8jGw
         bS0J1V0XV0i9daUbJnG/HFCUwoN+s0DBE5N4TujpOCU2DCNHd9w3EzK9PNVhuyidJWta
         qOsg==
X-Gm-Message-State: AC+VfDywvo54N5Lfs4sm2M/XEDZhlGPtWDMLHpMEe9Qn3wt+SNJS2lQy
	5P3yXICLKecRAGkB2TELhSU=
X-Google-Smtp-Source: ACHHUZ70uoI88DRVhGiNe4v8NMOn4CckRug5A25bO6UrnrhXn4O+oQb9CB+u9z1UucgpvIObIHjohw==
X-Received: by 2002:a05:6602:2113:b0:784:314f:8d68 with SMTP id x19-20020a056602211300b00784314f8d68mr18093430iox.1.1688570364015;
        Wed, 05 Jul 2023 08:19:24 -0700 (PDT)
Received: from ?IPV6:2620:15c:211:201:c1f1:7d21:6172:cbd2? ([2620:15c:211:201:c1f1:7d21:6172:cbd2])
        by smtp.gmail.com with ESMTPSA id l6-20020a656806000000b005579c73d209sm15456631pgt.1.2023.07.05.08.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 08:19:23 -0700 (PDT)
Message-ID: <1ea08f84-f900-92f2-e32b-2db242a74559@acm.org>
Date: Wed, 5 Jul 2023 08:19:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Content-Language: en-US
To: Matthew Wilcox <willy@infradead.org>
Cc: Jan Kara <jack@suse.cz>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Christoph Hellwig <hch@infradead.org>, Alasdair Kergon <agk@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Anna Schumaker <anna@kernel.org>,
 Chao Yu <chao@kernel.org>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, "Darrick J. Wong" <djwong@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
 dm-devel@redhat.com, drbd-dev@lists.linbit.com, Gao Xiang
 <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, jfs-discussion@lists.sourceforge.net,
 Joern Engel <joern@lazybastard.org>, Joseph Qi
 <joseph.qi@linux.alibaba.com>, Kent Overstreet <kent.overstreet@gmail.com>,
 linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-xfs@vger.kernel.org, "Md. Haris Iqbal" <haris.iqbal@ionos.com>,
 Mike Snitzer <snitzer@kernel.org>, Minchan Kim <minchan@kernel.org>,
 ocfs2-devel@oss.oracle.com, reiserfs-devel@vger.kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>, Song Liu <song@kernel.org>,
 Sven Schnelle <svens@linux.ibm.com>, target-devel@vger.kernel.org,
 Ted Tso <tytso@mit.edu>, Trond Myklebust <trond.myklebust@hammerspace.com>,
 xen-devel@lists.xenproject.org
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <bb91e76b-0bd8-a949-f8b9-868f919ebcb9@acm.org>
 <ZKRFSZQglwCba9/i@casper.infradead.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <ZKRFSZQglwCba9/i@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_081926_660072_AAC7A1FC 
X-CRM114-Status: GOOD (  14.53  )
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

On 7/4/23 09:14, Matthew Wilcox wrote:
> On Tue, Jul 04, 2023 at 07:06:26AM -0700, Bart Van Assche wrote:
>> On 7/4/23 05:21, Jan Kara wrote:
>>> +struct bdev_handle {
>>> +	struct block_device *bdev;
>>> +	void *holder;
>>> +};
>>
>> Please explain in the patch description why a holder pointer is introduced
>> in struct bdev_handle and how it relates to the bd_holder pointer in struct
>> block_device. Is one of the purposes of this patch series perhaps to add
>> support for multiple holders per block device?
> 
> That is all in patch 0/32.  Why repeat it?

This cover letter: https://lore.kernel.org/linux-block/20230629165206.383-1-jack@suse.cz/T/#t?

The word "holder" doesn't even occur in that cover letter so how could the
answer to my question be present in the cover letter?

Bart.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
