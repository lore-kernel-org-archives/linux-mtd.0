Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FC3CF6D46
	for <linux-mtd@archiver.kernel.org>; Wed,  2 Oct 2024 17:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6hz1rC3ViYirH+0QivzXeUMZPPbawZFQUtAhg81tJE=; b=mKYvM60DMzhaBC
	wvlDLh22wIpEws+/+PuUHSZoDveKtigBZkNlCjkT2WIfms9tSQlsz57aCNPwBqC04n4AM8l8UmS8C
	sY+k8lqw7XvZrBZB4P6hcj7emcODMm6DJhQcy1C8Y8J7vc5ALy75Av9ZHSRlxXIcNsyHQRA1Wrgmf
	EfShQJ7zQLDKI5dYZTjzMFLysTCNVdTKLrbtY4mnwHu4yX/c4e9cJJl0tL3K4A8sCLKRJzcHBqUzU
	n05dJWEtTB6IkCu6Xva9RfTuXxY+hLoenl7sbkeSbXtgLQUPLMyHGO/Mr86vaQfsxmaU+JG7VcIBB
	IPkv3nzGQDgQep0abiPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sw2mQ-000000070zG-3vG5;
	Wed, 02 Oct 2024 17:04:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sw2mN-000000070yP-3BwZ
	for linux-mtd@lists.infradead.org;
	Wed, 02 Oct 2024 17:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727888686;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3KktDQtghgBV4jcdLkChccDQFvJhc4askoSImHBfTE=;
	b=KZwp7elSgbzUCmeo3v5o6BL6bcjXLj0rywTp+u/WObWsVcYtaW27I0tZdC1r3LcCJB/FgU
	W5sMCh+ombmXcSNwWWqdS3IEC5XbvfxvXVub1gHa0k2QloxFJa51tg5U2YVcxmn07RhpBo
	gLyy8V1i5fUdSnypqThghVCmk3HNuJU=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-glPHEcBINoS-1tZ102YyyQ-1; Wed, 02 Oct 2024 13:04:44 -0400
X-MC-Unique: glPHEcBINoS-1tZ102YyyQ-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-2870ed29f50so106638fac.2
        for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2024 10:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727888684; x=1728493484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3KktDQtghgBV4jcdLkChccDQFvJhc4askoSImHBfTE=;
        b=aC1UKEulxvsxtiHA4c+lcSe8Ab+8lUvrBjl/9DaI3rX1yhqVON6wu+vcQPhXjqznWT
         wLfyFmP1ceq1jix2Uypql3nFrusiZyGc6n7ZuL4d0Qh4wniZCpSaEkWVjAiEhu1oHAHk
         2KauAjKszfjg4akdEffSfyfBUPwTw+S5rGxDnFlT6/Ub8KkcIn88RXL92S5C1y8P+KRs
         XRsujxNqbXNRGcMlPB1whhJ0Qy7oVwOxLt6CChBuizYr8NZPCnJdnSr5DerF+Q3bH+3I
         i2MKy4I0gKh2BwMO/lpbLl4VZnHD/zKnKBu9rxC58BE2+8pLYgYhu3rUM4xV3MRjZLHk
         KKqw==
X-Gm-Message-State: AOJu0YzkEVH8+0xp0yyvetLv8P2JDDIdfvJq7tfC8NTQKx+yjwGsGVmH
	0Cnd37lz2WThJHdyEXJdUFbaP0/Lr87WQOgiyjN6IcDjOwiSIicucXG+BmUyLMJCCH88ZwSFRaT
	z7rXU0ewTzVL/pQR3lWCV4Zb4SJ1e5Fu5323HcST55dnGAgADjt8IbZ2g7cRSh8W5fM3AYFWDxS
	FfHlLazBwKG1Pe1uoYbcgxPyLN58FZzB4RQiI3vox3nZVnR9g5
X-Received: by 2002:a05:6871:3288:b0:27b:5a02:f940 with SMTP id 586e51a60fabf-28788c46cb5mr2462199fac.23.1727888683758;
        Wed, 02 Oct 2024 10:04:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQIz2vDQ5O8x1JSNCkbHy1GrcssBH5rsohAShxa6ZmlXvJQwovgZfxlr2EpKwNShJ0lGoZGQ==
X-Received: by 2002:a05:6871:3288:b0:27b:5a02:f940 with SMTP id 586e51a60fabf-28788c46cb5mr2462143fac.23.1727888683214;
        Wed, 02 Oct 2024 10:04:43 -0700 (PDT)
Received: from [10.0.0.71] (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4d9ec44bb94sm1535192173.80.2024.10.02.10.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 10:04:42 -0700 (PDT)
Message-ID: <ba5c7aec-df94-43ae-ac85-12026afbcac0@redhat.com>
Date: Wed, 2 Oct 2024 12:04:42 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] ubifs: Convert ubifs to use the new mount API
To: linux-mtd@lists.infradead.org
Cc: brauner@kernel.org, David Howells <dhowells@redhat.com>,
 Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>
References: <20241002165834.868046-1-sandeen@redhat.com>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <20241002165834.868046-1-sandeen@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_100447_906893_9E4B179A 
X-CRM114-Status: GOOD (  15.11  )
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

On 10/2/24 11:58 AM, Eric Sandeen wrote:
> From: David Howells <dhowells@redhat.com>
> 
> Convert the ubifs filesystem to the new internal mount API as the old
> one will be obsoleted and removed.  This allows greater flexibility in
> communication of mount parameters between userspace, the VFS and the
> filesystem.
> 
> See Documentation/filesystems/mount_api.txt for more information.
> 
> Signed-off-by: David Howells <dhowells@redhat.com>
> Co-developed-by: Eric Sandeen <sandeen@redhat.com>
> [sandeen: forward-port old patch, use dedicated context struct]]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> cc: Richard Weinberger <richard@nod.at>
> cc: Zhihao Cheng <chengzhihao1@huawei.com>
> cc: linux-mtd@lists.infradead.org
> ---

Again, this is a forward port of dhowells' patch but with some significant
modifications, as requested.

The primary change is that init_fs_context no longer allocates the
entire ubifs_info; instead, it now uses a mount-option specific context
structure that hangs off fc->fs_private and transfers parsed options from
there into the ubifs_info structure members after parsing.

Other minor changes include fixes to argument descriptions in comments,
and whitespace tidyup.

I tested this as best I could using mtdram, though I did not exercise
valid auth_key and/or auth_hash_name mount options, or test beyond
validating that random combinations of mount options yielded the same
success/failure results, and the same /proc/mounts results, as before
the patch.

Thanks,
-Eric


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
