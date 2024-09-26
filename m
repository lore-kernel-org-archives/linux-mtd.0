Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C73CDE036
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 20:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTLlzokKS7G5PSGiu9yvqrOAAqA8KRXuGdBW6N5vAEw=; b=NI2X1/SOvlhFVj
	/wSRoe81KlEg8LTSz+Yy9/AG2SpUJ5OP6AzZTgEL7JvNo5QE1JUjzgzr65tdwJbTK3w8jkqH9y/6z
	EsmhJUfKNcz9oVhdPhRs7VQJqGzZQ91DySz/TMuDH3AZ+M5Pexyx6OFHOP+9yBHpithWmpxVaxbND
	zFwMCdJGPhEDulWm1d2Bbu7xx6/4PWtxb814PmV+AgxhSGZYS3cwvkJR1dVgcgJ2nSJzBRYMuecSM
	TUOcOtcz4bK6t+Ak2T+MYL8kqij8/WWklCXpfjQtoLscpequVN508/yv9lkQH6OEiQ09lZPmFwKrC
	ztY62gPKzXugtS72EZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stvHB-00000009K86-00bU;
	Thu, 26 Sep 2024 20:39:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stvH8-00000009K7m-20lr
	for linux-mtd@lists.infradead.org;
	Thu, 26 Sep 2024 20:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727383185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qa6byjsIi2CmhfyTO2H7/rmGLZe1X1K8bfsH7vI5szo=;
	b=g4CaO2X5LJElyEeNC0oeONioAPndKDw1oyg34bD2nj9RxPykF3sLTZmCAuyCWo1iE7XvBx
	XZdcd9NVncy24xVIy2TswtMA2SUD7mgUYeFfH/8nFdeBzNz+ZEo/vNzdcjvhMG6EGYuyg8
	e6nBKOqNNO6M6Kixxvz1cmgwCesbIrk=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-oQkGiAszNOKhTA2uCvZgaA-1; Thu, 26 Sep 2024 16:39:44 -0400
X-MC-Unique: oQkGiAszNOKhTA2uCvZgaA-1
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3a0cd6a028bso15830095ab.0
        for <linux-mtd@lists.infradead.org>; Thu, 26 Sep 2024 13:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727383183; x=1727987983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qa6byjsIi2CmhfyTO2H7/rmGLZe1X1K8bfsH7vI5szo=;
        b=fSdz9udcn7uOUJELa/7yZnyAo18/IuaY8sau0e7/4YLxGz6aPv1wN0p1dz4oLw4jkq
         Z0CKkAdDSkkW3X4ilckmX+OjlO2ek+jZxwrfv35cNMOb2opINSidlKVSXYUbvHlAR+6y
         NnSztKSBU/XXl5u6uuDG7GMUAl3wOGDuzeGDUrSAlRjuC4PMsitoQXHasJF+YAQhOz9s
         kjvRmY5nXlqM9o0G3ILZ+PnMOGi2T6Cp3FNURSWqshghqIzoKetutqdySj1EDC0DoMIC
         jVI6RuRoQdR7lnMs1hZqe7U+BN85E6WKjJL8zY9DkU7ZJpgr7e02XzeBZRI3C0rYP5wv
         qfbA==
X-Gm-Message-State: AOJu0YwUxQoxYYwgoGudzm+aufUiEcSIihR08y2jd6FWcwghhYI6Mzu8
	P7I7pikTi5t6l0AsgnP9EBP0uA2t4XQXpxpYXxcNsl/GIasVMxiZvpSIKfLpG+OLzeW6169Mo4E
	K5E8/FzU1WmbOqLMd8F5dAFnEUh15smjppVtDVMa9HB8LuffaV02/hkScYf7XffnoZvKpqjFUjt
	cstWJNHNNE9gsMi9Rm+ZX4//ff51aNTEAQnAnV40Rq3krIWw==
X-Received: by 2002:a05:6e02:1e08:b0:3a0:bc6f:c45a with SMTP id e9e14a558f8ab-3a3452c0316mr8080055ab.24.1727383183598;
        Thu, 26 Sep 2024 13:39:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV/6wU0yxV6/L4IHZR6QbIN9AyrrWVzZP8EN9kSRsq9fJmvyBrwsMoA+ub3Ju99u9TUotcpQ==
X-Received: by 2002:a05:6e02:1e08:b0:3a0:bc6f:c45a with SMTP id e9e14a558f8ab-3a3452c0316mr8079875ab.24.1727383183194;
        Thu, 26 Sep 2024 13:39:43 -0700 (PDT)
Received: from [10.0.0.71] (67-4-202-127.mpls.qwest.net. [67.4.202.127])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3a344d928ecsm1235385ab.47.2024.09.26.13.39.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Sep 2024 13:39:42 -0700 (PDT)
Message-ID: <66f3dec2-a014-47a2-a021-a994ec41e319@redhat.com>
Date: Thu, 26 Sep 2024 15:39:41 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ubifs: Convert ubifs to use the new mount API
To: linux-mtd@lists.infradead.org
Cc: brauner@kernel.org, David Howells <dhowells@redhat.com>,
 Richard Weinberger <richard@nod.at>, Zhihao Cheng <chengzhihao1@huawei.com>
References: <20240926203604.23622-1-sandeen@redhat.com>
From: Eric Sandeen <sandeen@redhat.com>
In-Reply-To: <20240926203604.23622-1-sandeen@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_133946_625423_3FB07F6E 
X-CRM114-Status: GOOD (  13.12  )
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

On 9/26/24 3:36 PM, Eric Sandeen wrote:
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
> [sandeen: forward-port old patch]
> Signed-off-by: Eric Sandeen <sandeen@redhat.com>
> cc: Richard Weinberger <richard@nod.at>
> cc: Zhihao Cheng <chengzhihao1@huawei.com>
> cc: linux-mtd@lists.infradead.org

Just a note, I simply picked up David's old patch from his git branch at

https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/patch/?id=efee75ecdcb8f37afdedbe79a77ee571325b57d5

and forward-ported it. It's build tested only, so review and testing
would be most appreciated.

Aside from some minor changes to the internal mount API that
required adjustment, there was also a new compression type and a couple
additional ubifs_info members that needed initialization in
ubifs_init_fs_context.

Thanks!
-Eric


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
