Return-Path: <SRS0=Xhow=5B=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5174C0044D
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 22:21:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B522820674
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Mar 2020 22:21:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dTeFuj5J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CP4WB0JM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B522820674
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pKkrLE7byS10AmlfztZVwKxoDgHo1sqY+35J2wyUj3U=; b=dTeFuj5Je8D5YO
	MQqj9pfnuXG11XT7Npgs7YUyjc6qjXwFZvSD4u2guPteIWi+lD4P6Rphk4VCwJJSLxp7d5NfzMmHi
	DII4TnqDaeKF44KjDU2hVSrDn97+XFddoqjcPBfkgDqIwvH36Ktn3wQ4KNg+9ScpPMjQd88I+V/xg
	yDKEkvs7rWK6+eWd48hoyNeh2R0qQYh8f7n3hz63RM2QaYW+CJdAgzQxxm/rCaoVUcVHGNclcuW52
	sbaqlVK1Of0mvXetmN0Izk0Zs+qwQLoSjNuUsaswSuI1v90RyZJn0UuIRoozDJRNGuiTpqRlKVlfl
	lMnwQmvcPqQa3DOl+9PA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDy6w-0002Jj-Oy; Mon, 16 Mar 2020 22:21:26 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDy6t-0002Ik-J9
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2020 22:21:25 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so2631712wru.2
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2020 15:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ui3uyro6Iaao1bcB7QlcQnx3plWvG3jBNXh9r/DZOdQ=;
 b=CP4WB0JMMpHRUccaUDxfW/CIBXXt70n53pLhM8xuv5c7r0CrytsLrP0mhJnHem4S3l
 XKddBWMg0B5SiAm3TSXpuCIN/PwiF1ETFhpnT8W5DfsCupXfnWojMSdgTZsx8GyyABnY
 xKqQYVD0J+88yudf5WvDpLNgxj/dz5BYB/doxHXULOKhzxtmAnP8UzJ1JYGHcap5JSet
 iYbQcRbhdDIM3FjTlfXh2nRrb0V9hCwa7tjrAcv3bnchqzDZ/n8QwthKHaqlRYL4PNUn
 SzjWXP5ZpvJfgCQbjxUqQLoeVDNwNdmwJdmb9Cc1IF2GlyYrTOKYvrGc0jKGdEri8QB0
 pm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ui3uyro6Iaao1bcB7QlcQnx3plWvG3jBNXh9r/DZOdQ=;
 b=A3npyKvzr5DkRONg78km8FNK4e54t6kzhs7WVkh/pEOINlhiLxbQO3V/0JrL/ibMQh
 UKlhmQNq/hMHjNyjF191e01Qf1J3IOiyNjxLlD0BGQ//xOjXKPEClEisKZrJOkTKsHw+
 uL2dWlYClyz+IKCOcFPrnJ7djScYNZuswubmhRXRBjnznR+o9SQFiMEnvIAV8xAJfpwN
 CyiiFdplADX253oo7GVcRTYOVUDVzIGdcaMGsjthCqxJQFhfnMCkNVqXbhElJZXXGCGh
 GubMvRGdiYrcnr8Q6BZNpwC3S4/HJzu96ZszlWv+b6b4ynWeZxwV403bpyuNdNsGCS+U
 QfLg==
X-Gm-Message-State: ANhLgQ18F5t1jLO2yvsKQ149h4k5wgwJ3X3Zg0uOk8EjnAfjZh9m0gCe
 BWROkA7KN4sk+/6sf3mS/J5nrE/DjUgI7uj3cjPrCf11
X-Google-Smtp-Source: ADFU+vuV/7vmMnN3vjgn74bjG3VHA44atwqLE+PllgzMT8UsAo20qhDlJwjc1jlNGfl0KSchfvJErnwBxfbRwt1DGGo=
X-Received: by 2002:adf:df8f:: with SMTP id z15mr1550255wrl.184.1584397281561; 
 Mon, 16 Mar 2020 15:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200305092205.127758-1-houtao1@huawei.com>
 <20200305092205.127758-3-houtao1@huawei.com>
In-Reply-To: <20200305092205.127758-3-houtao1@huawei.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 16 Mar 2020 23:21:10 +0100
Message-ID: <CAFLxGvzWYp7=6F7PY0-dxxSCPrN4L2H6tzE913N9rKsaChnoWg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ubifs: read node from wbuf when it fully sits in
 wbuf
To: Hou Tao <houtao1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_152123_643198_8A6EBE24 
X-CRM114-Status: GOOD (  12.28  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 Adrian Hunter <ext-adrian.hunter@nokia.com>, Carson.Li1@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hou Tao,

On Thu, Mar 5, 2020 at 10:15 AM Hou Tao <houtao1@huawei.com> wrote:
>
> Carson Li Reports the following error:
>
>  UBIFS error: ubifs_read_node_wbuf: expected node type 0
>  Not a node, first 24 bytes:
>  Kernel panic - not syncing
>  CPU: 1 PID: 943 Comm: http-thread 4.4.83 #1
>    panic+0x70/0x1e4
>    ubifs_dump_node+0x6c/0x9a0
>    ubifs_read_node_wbuf+0x350/0x384
>    ubifs_tnc_read_node+0x54/0x214
>    ubifs_tnc_locate+0x118/0x1b4
>    ubifs_iget+0xb8/0x68c
>    ubifs_lookup+0x1b4/0x258
>    lookup_real+0x30/0x4c
>    __lookup_hash+0x34/0x3c
>    walk_component+0xec/0x2a0
>    path_lookupat+0x80/0xfc
>    filename_lookup+0x5c/0xfc
>    vfs_fstatat+0x4c/0x9c
>    SyS_stat64+0x14/0x30
>    ret_fast_syscall+0x0/0x34
>
> It seems the LEB used as DATA journal head is GC'ed, and ubifs_tnc_locate()
> read an invalid node. But now the property of journal head LEB has
> LPROPS_TAKEN flag set and GC will skip these LEBs.
>
> The actual situation of the problem is the LEB is GCed, freed and then
> reused as journal head, and finally ubifs_tnc_locate() reads
> an invalid node. And it can be reproduced by the following steps:
> * create 128 empty files
> * overwrite 8 files in backgroup repeatedly to trigger GC
> * drop inode cache and stat these 128 empty files repeatedly
>
> We can simply fix the problem by removing the optimization of reading
> wbuf when possible. But because taking spin lock and memcpying from
> wbuf is much less time-consuming than reading from MTD device, so we fix
> the logic of wbuf reading instead.

I'm digging now into that issue. Did you also experiment with reading while
tnc_mutex is locked? So, no race at all (having safely = 1 by default).
Just to make sure we don't fix an no longer needed optimization.

The code is already anything but trivial and adding more code makes me
nervous.

-- 
Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
