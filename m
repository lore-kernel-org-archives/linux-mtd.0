Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E941AC433EF
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyCGGFtsG9XG0j7v3caGH6xnpyorFg+TTvCKCoOr0eM=; b=L4cEmio+Ba3Lbt
	tlQiOKMSrnx+J0B8S18d6ayHGvb6U5EFMMqbBFORZp3ddrXkhkAG0EBIDEZKuEJjadlv/wdrKbWgf
	nhN9iPBjTLqbj9Z4ZQmIYXvsc51xnuHA6GcuvzpuYen2/DZs0mnrq+pqQEvUQQFR5FrTYQPcaQM2t
	hQNNJDiQPt2Xx5Ql4EBFRSpPcATjV+Abw3Cj6RTP6uBAd1KfDDPOkSGMYqVxrrKwFEiepPU5oaCEP
	0kotKRMI3iu5ExymRapYFIQUzGC389ht0dakRvXC8E5ELc4DDDtpMRJW9eB6tsTfcQc92F7feVpVJ
	nkfalbDKTgJjvXkNXHWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvQp-00D956-A6; Wed, 08 Jun 2022 13:09:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyvQm-00D92K-81
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 13:09:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654693741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=USUlEZ1UMdOAkVgNJKy6bNhyk03F1F+22jSwcfgVGi0=;
	b=DkYaA29vcK8XLlcs1DgCDExTKigfWFZSaq2MA5diUD3C2gOiosEHVXJaog4fUqdC4YmBhL
	6a9VaqbSUXrYWLFjT5pDSMn9dSuhIqUbiVTioTNYKBYva2EFFZoJ/6hjpxMQhnS2+mENA+
	HTnn4fRbwXCEwCWfQrYeiNeA7+6Iz/k=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-tJlCLJ-dOnSvQG5ycgYgJg-1; Wed, 08 Jun 2022 09:06:21 -0400
X-MC-Unique: tJlCLJ-dOnSvQG5ycgYgJg-1
Received: by mail-qt1-f200.google.com with SMTP id 9-20020ac85749000000b00304ee787b02so6150912qtx.11
        for <linux-mtd@lists.infradead.org>; Wed, 08 Jun 2022 06:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=USUlEZ1UMdOAkVgNJKy6bNhyk03F1F+22jSwcfgVGi0=;
        b=zN20Aquhxni5lDbDYQeQuvW+S/meKU7buaL4p/k8ZR/StAyxtkszKRPOFRISYnfCIN
         ExQvLa9k8VGvk6GtRddarLXLapGpWinCPQ1ikwm6Dfle8GKnQv/RBZLVvFptnRmNQ29e
         x7XSBjj61W/8OCW3qqsqzTo15xWOMH8Se1nDz4xFNVPFONQnSCmPkmGYxYBPoUGZDytJ
         3y0vYuigk7Udix6zpgj0pNU328IqdYUaVhegr3B+Dy9n8h4gGLPzg2w9XAJl5zzU6qLG
         3sBT6XNE+X0M4h9B295ziewY+7ngFKDSpR1Cm3ePfGoutf3oevKyu41NAU2WPL5vhmtu
         /Fjw==
X-Gm-Message-State: AOAM53030cmO63ClNhR0mdojijnzFgBolzAwaoZ1DycZjt2jrNQm5gom
	17W4ng2sL/FmtNybu+TSV2LA5CuOln9k+fIAR1Pmxk44URnHyslyTf8hDjGBsRY9h3Z1xxHZY+N
	DvQa19c3iqzFIj6JY7l2ZYJBO2w==
X-Received: by 2002:a05:622a:1013:b0:305:3c:232e with SMTP id d19-20020a05622a101300b00305003c232emr2957099qte.180.1654693580934;
        Wed, 08 Jun 2022 06:06:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmMXLqnBI6Og+4P0GHsdMp3mdyP17UTS82rMH1Kp6fTALPnxZvoiZs7I0UncTVXHO0B2TwhQ==
X-Received: by 2002:a05:622a:1013:b0:305:3c:232e with SMTP id d19-20020a05622a101300b00305003c232emr2957043qte.180.1654693580507;
        Wed, 08 Jun 2022 06:06:20 -0700 (PDT)
Received: from optiplex-fbsd (c-73-182-255-193.hsd1.nh.comcast.net. [73.182.255.193])
        by smtp.gmail.com with ESMTPSA id v10-20020a05620a440a00b0069fc13ce217sm4216712qkp.72.2022.06.08.06.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 06:06:20 -0700 (PDT)
Date: Wed, 8 Jun 2022 09:06:17 -0400
From: Rafael Aquini <aquini@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-aio@kvack.org, linux-btrfs@vger.kernel.org,
	linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	cluster-devel@redhat.com, linux-mm@kvack.org,
	linux-xfs@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-ntfs-dev@lists.sourceforge.net, ocfs2-devel@oss.oracle.com,
	linux-mtd@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	Minchan Kim <minchan@kernel.org>
Subject: Re: [PATCH 15/20] balloon: Convert to migrate_folio
Message-ID: <YqCeyZO77Oi1wvxt@optiplex-fbsd>
References: <20220606204050.2625949-1-willy@infradead.org>
 <20220606204050.2625949-16-willy@infradead.org>
 <e4d017a4-556d-bb5f-9830-a8843591bc8d@redhat.com>
 <Yp9fj/Si2qyb61Y3@casper.infradead.org>
 <Yp+lU55H4igaV3pB@casper.infradead.org>
 <36cc5e2b-b768-ce1c-fa30-72a932587289@redhat.com>
MIME-Version: 1.0
In-Reply-To: <36cc5e2b-b768-ce1c-fa30-72a932587289@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=aquini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_060904_411305_03DAB65A 
X-CRM114-Status: GOOD (  21.20  )
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

On Wed, Jun 08, 2022 at 11:59:31AM +0200, David Hildenbrand wrote:
> On 07.06.22 21:21, Matthew Wilcox wrote:
> > On Tue, Jun 07, 2022 at 03:24:15PM +0100, Matthew Wilcox wrote:
> >> On Tue, Jun 07, 2022 at 09:36:21AM +0200, David Hildenbrand wrote:
> >>> On 06.06.22 22:40, Matthew Wilcox (Oracle) wrote:
> >>>>  const struct address_space_operations balloon_aops = {
> >>>> -	.migratepage = balloon_page_migrate,
> >>>> +	.migrate_folio = balloon_migrate_folio,
> >>>>  	.isolate_page = balloon_page_isolate,
> >>>>  	.putback_page = balloon_page_putback,
> >>>>  };
> >>>
> >>> I assume you're working on conversion of the other callbacks as well,
> >>> because otherwise, this ends up looking a bit inconsistent and confusing :)
> >>
> >> My intention was to finish converting aops for the next merge window.
> >>
> >> However, it seems to me that we goofed back in 2016 by merging
> >> commit bda807d44454.  isolate_page() and putback_page() should
> >> never have been part of address_space_operations.
> >>
> >> I'm about to embark on creating a new migrate_operations struct
> >> for drivers to use that contains only isolate/putback/migrate.
> >> No filesystem uses isolate/putback, so those can just be deleted.
> >> Both migrate_operations & address_space_operations will contain a
> >> migrate callback.
> 
> That makes sense to me. I wonder if there was a design
> decision/discussion behind that. CCing Rafael.
>

None that I recollect. If memory still serves me, I think the idea behind
bda807d44454 and friends was to provide a generic way to allow page
mobility for drivers without adding complexity to the page isolation / putback
paths, and since the migration callback was already part of the aops struct
those new callbacks just followed suit.


-- Rafael


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
