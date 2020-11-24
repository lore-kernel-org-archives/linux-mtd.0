Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940BDC56202
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 21:21:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0D6920857
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 21:21:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zTvrG92g";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNSLo8Jo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0D6920857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W5o/6ygwQOvDzhBhw+wpLA9Oiuz4ScxRcL/izrg4Jfo=; b=zTvrG92glOvZwRzFL+IVBlGO9
	MycsONixodwn4wMc2u/FZdCMFqcsZaCFReX9X+/HH8L3hvPVH3eqqBz2pE5H83+bWAYTjxm/YRgqh
	tvhxR34HrrQuDieFmaXLDFj1Voa86/R9B3R1xybTBqNr4NdWqvgj/Y2rciSLxYTCvIuNr+rWBbcRM
	GmsTbHx8GDCeuyd++4GBwGiv9GcUZMc4FAOTj7vzZkIFatQafcyGYLo9PD4snRJM2iYLsfU7uz77B
	5Y6RnzPjtSDjSEjJRadrRaBXpai65Ps8fdK6p1MLSSVvEmB5bTATztqOy7beqVAM05dx1wb6XWUvo
	eVqnB7zcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khfjy-00014v-T1; Tue, 24 Nov 2020 21:20:47 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khfjv-00012b-1H
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 21:20:44 +0000
Received: by mail-qk1-x742.google.com with SMTP id b144so442895qkc.13
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 13:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ev/F4l5kU0JVd8J9T+Hn7/Emi68DyGqwAl9VsbylUp0=;
 b=ZNSLo8JoXJqjP5o+nIXl1wDfRlZM34G4UajJItZyFsuYjmXMkUKdp9TKdu4qQVAcH5
 1UtlzvL9QAOsVwNuRmLXs7qTazgrsdlD0c9Fg5jpMS46JIBuEyExozrq6Rpy6KkznpEk
 LK8bE886olCSw1TOZhi4r5Dvu6oUxUSyqj8CgYwDqSKsVWJ+RHfjDuv3hkDpzS8EceZD
 HTuSBVL4noo6GQEfe1lNegiK98NcOs7S2p1t2MSFBRzQhrkn/44t1OAHb6UpUFPD3EHa
 FTBQsVjSYGJSYiOLAEycBszTag6Jbur7U/Yzxl9519cveNmQk/zw99cBH024rHQM0vOy
 HpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=ev/F4l5kU0JVd8J9T+Hn7/Emi68DyGqwAl9VsbylUp0=;
 b=cdT83tkn0hTx9WyjYg7PdsUN/i1GhSbqILqYWaa+qVZuRxKQI0Pbk7sDY1qsMNuPZw
 rfRpar9S612rm3/nf6WVzET/S8U6Ra+yaRHNLFJtcH2/XPy0wdz4DGV6UcxnP5ZLtzVe
 L8pm1aqMuA23A+DRNcInADfVy5yFEd4R8J4Uq3Rc3Bd/PQwVUvWsOubUq6zURBpIi2/G
 imvKbuH0qFFJHGEjbFo4P7IdIGFu48sVi1uOZHU8LwLV2ztX0Ugo1Yn8rNXIYc+UgU5p
 oT34cszPQCZKLNK/Q6i0xd3VfRwDq9MsIMQ7yqklHURzpjta9BumU/5hFnbYv+LoBZlR
 fZpA==
X-Gm-Message-State: AOAM531a27+wfgC2lbg3PFfpQOFG+HJNc1DAizBmyJVXXrk6n/b1cyDC
 1qyFg3ZW/8okN2un0BkL+7Y=
X-Google-Smtp-Source: ABdhPJxVPExCrpl6SBnHr8hh5lACFOCmcWgKuDYnGDx1xBxinXihB0MFiLxOfh+ARQAqrCZ49K/lyA==
X-Received: by 2002:a37:7481:: with SMTP id p123mr176688qkc.424.1606252841332; 
 Tue, 24 Nov 2020 13:20:41 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id b33sm298244qta.62.2020.11.24.13.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:20:40 -0800 (PST)
Date: Tue, 24 Nov 2020 16:20:18 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 28/45] block: simplify part_to_disk
Message-ID: <X715EkY5mafgeJWZ@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-29-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-29-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_162043_185563_621AD75E 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:27:34PM +0100, Christoph Hellwig wrote:
> Now that struct hd_struct has a block_device pointer use that to
> find the disk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
