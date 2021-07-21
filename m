Return-Path: <SRS0=aH78=MN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8104C636C9
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 17:11:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DA5161222
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 17:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DA5161222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TlWbUbejpAzHokbX8MljRWQAOe5ZyEemh9WGcZQ4W9U=; b=ugYmDrUJA5uaQs
	BvW20xwLv2x4DQjoNZ70mHlPD2NmkKOqmecD+GcobYOb3vDtditvZX+sLTLUAD8QzbD9Pdvkqz8oC
	YYY5+tBPLZqLFXNU6W0HmD05v8cKgK8saECgvyyu6Kx1gS54FLqgAvJGlbFyPPXxIi4ywuDPIKwiK
	trWTVKLN3ABxIK/KlnGTNIUb3bsypnYaNxzrDgHIqiosowZp1Wf3e7adfVAM4GDvvBCrAshl0fysY
	LHyPrBFRp5RrsqQMQ4bCCGqs3kzqH6UL/FEQig/WGRVtyMM2Nic9v+rEmTJHRYVSWd7PD5DREw4Mw
	5qtWbULdzhK5SvLt3gfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6Fju-00GhMe-9t; Wed, 21 Jul 2021 17:10:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Fjq-00GhMH-UU
 for linux-mtd@lists.infradead.org; Wed, 21 Jul 2021 17:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626887428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pHIrr2R+m6okqzTEImHOCFTKRL2HTOsLF72rQ2qjio0=;
 b=hpO/uPM9rOwoB0hSq6aXB+7enkOeDEO2BhCp60Tlsqd1h7YrdrkSUkm6qNTzdH7jCRHkS6
 N2zXsFFE+f83VfhfJOJMy/b5+5tAQWhp9pU79KZ0EnA9yEXH6+jgiSmWrbAiP5SRk79Occ
 0lwK3/a5UlHJQUdHKAu2FNKo/53pIQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-MEydbkNIO4KK5-uKnWDkiw-1; Wed, 21 Jul 2021 13:10:27 -0400
X-MC-Unique: MEydbkNIO4KK5-uKnWDkiw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63C72107ACF5;
 Wed, 21 Jul 2021 17:10:25 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B58B62672;
 Wed, 21 Jul 2021 17:10:17 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 16LHAGci011835; Wed, 21 Jul 2021 13:10:16 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 16LHAF51011830; Wed, 21 Jul 2021 13:10:15 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Wed, 21 Jul 2021 13:10:15 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Pintu Agarwal <pintu.ping@gmail.com>
cc: open list <linux-kernel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, dm-devel@redhat.com,
 Kernelnewbies <kernelnewbies@kernelnewbies.org>, agk@redhat.com,
 snitzer@redhat.com, shli@kernel.org,
 Sami Tolvanen <samitolvanen@google.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
In-Reply-To: <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
Message-ID: <alpine.LRH.2.02.2107211300520.10897@file01.intranet.prod.int.rdu2.redhat.com>
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
 <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_101031_098057_F16DAE07 
X-CRM114-Status: GOOD (  22.48  )
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



On Wed, 21 Jul 2021, Pintu Agarwal wrote:

> On Tue, 20 Jul 2021 at 17:12, Mikulas Patocka <mpatocka@redhat.com> wrote:
> >
> > Hi
> >
> > Try to set up dm-verity with block size 512 bytes.
> >
> > I don't know what block size does squashfs use, but if the filesystem
> > block size is smaller than dm-verity block size, it doesn't work.
> >
> Okay thank you so much for this clue,
> It seems we are using 65536 as the squashfs block size:

65536 is the compression block size - it is unrelated to I/O block size.

There's a config option SQUASHFS_4K_DEVBLK_SIZE. The documentation says 
that it uses by default 1K block size and if you enable this option, it 
uses 4K block size.

So, try to set it. Or try to reduce dm-verity block size down to 1K.

> ==> mksquashfs [...] - comp xz -Xdict-size 32K -noI -Xbcj arm -b 65536
> -processors 1
> 
> But for dm-verity we are giving block size of 4096
> ==> [    0.000000] Kernel command line:[..] verity="96160 12020
> d7b8a7d0c01b9aec888930841313a81603a50a2a7be44631c4c813197a50d681 0 "
> rootfstype=squashfs root=/dev/mtdblock34 ubi.mtd=30,0,30 [...]
> root=/dev/dm-0 dm="system none ro,0 96160 verity 1 /dev/mtdblock34
> /dev/mtdblock39 4096 4096 12020 8 sha256
> d7b8a7d0c01b9aec888930841313a81603a50a2a7be44631c4c813197a50d681
> aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7"
> 
> Now, we are checking by giving squashfs block size also as 4096
> 
> In case, if this does not work, what else could be the other option ?
> Can we try with initramfs approach ?

Yes - you can try initramfs.

Mikulas

> Thanks,
> Pintu
> 


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
