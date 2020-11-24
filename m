Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57654C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:40:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA17E206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:40:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T505ui3+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAaQvjyW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA17E206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nYkUjESq8V1UOGX73EkWW/X4HCsBZ7rHGjKJPraf+pg=; b=T505ui3+GwXY6wLWpIJeyEVKx
	ubMvcn71TRmDCwRuBJSzOj1yP5D6YHJu/901m3owj2TyAsbDKYUskIOschEWkEuV8X5xR9/42mZHf
	o8OHBeJnsAf4U2AhhGItnE9Z6S0OD7kWQtt8kL/hnKn86g/FDHP15BYNa0orGfLFLXpzdbPrncZN7
	Uskv8OVW+8oxKRcM9n2RbJ+8zvBJj7rQ9WwcRlyTFO9EtyUdmVTlygunmDFjKV+teKU98IoZL36sz
	wL6AWL5gFfTeX+jKMW3H6AzVXCi0iD4+x8O0VGPBHUNiJn3+QsAfKkN8CU+38grbgGfrR93idJY1y
	ZQoRPVxwQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcHx-0003p0-Db; Tue, 24 Nov 2020 17:39:37 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcHu-0003ms-FN
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:39:35 +0000
Received: by mail-qk1-x744.google.com with SMTP id y197so21489818qkb.7
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=gccbgbDD7s/mdcXht2fL6iBUT8Prx6ozPAIi1oy24XY=;
 b=iAaQvjyW2JnxhLhsfg8rCUwKx68+n4VYv+x/cr19/l2gHjZ5rqQ2eHUQa56Yyrf+V0
 0EBO+8uJl3e7TpL8GOVdi3mPtP96tXMXp7if6adHqmGOPUC9KUkBCbpdOTkT7hALT+Ah
 7EHhHu8GvT+6D/0VCKlT2valDN6Ru1DvIbYtbLzR9+yA8jAAqgTW92ZCQEl3Pxl49Unt
 n/9PGjVy4f9zVoTzBvz1OlBcvmK214hyEQI6i4iF3fx4WQFt+rk4+OOUR5M42Vw6rBoM
 uLOJwtqDc9FyseTQMx+P4zZsyxqAY70M/tC6pBQFw6EbxPD3Q0UbNVnIzJCU6WGu3JSB
 P/Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=gccbgbDD7s/mdcXht2fL6iBUT8Prx6ozPAIi1oy24XY=;
 b=b9pV8m66HRpKd5yBGEFW8nMHrMhIkJKOPg/M6T0wzK5wL8Q3UEf1+ciyTFowIG3xuL
 dUQQCxBs+7K06gM9EvFUU0ic3I0jzNS2hIArHIw1VaMAxvhE1NyOllA9ez/stxDMvPcO
 YHWDMd9hbHSp2BsZ9eFeZNW8tyP0eVw6gHCukE1hfmXOQ74XqST22B7XF2Id2uSXL9mB
 /y0Ap6A3sxrGkxF95nwNu1CnZAOQh+6GV1+/86f2nKDXHxa/LKhiC1CRfgKI8JVayUdQ
 6uE1DE8K36ZJ9CL6XXyNiz7Ou9wh9YIx7YW0BhBB8Mc4kGGrUzzxvFS5SPWD7X3V+8tq
 zUxg==
X-Gm-Message-State: AOAM531IZMcs8B8ZlVxUk4TesdK41UtRXMPHK2TUWKU50ugcmpxrvJWE
 LQ08XvxHM4aQRjQctMqwo1c=
X-Google-Smtp-Source: ABdhPJxIyQph6LZGahQWIRSjw01El8frTqGQNdMpj1StAekmqcFeaj8JjyjEpK9CN9Iflo08fhI4fA==
X-Received: by 2002:a05:620a:a1d:: with SMTP id
 i29mr5820661qka.466.1606239572817; 
 Tue, 24 Nov 2020 09:39:32 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id e10sm13416860qkn.126.2020.11.24.09.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:39:32 -0800 (PST)
Date: Tue, 24 Nov 2020 12:39:10 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 19/45] init: cleanup match_dev_by_uuid and
 match_dev_by_label
Message-ID: <X71FPpCgw9t3JfIr@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-20-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-20-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_123934_615541_53EBAFC4 
X-CRM114-Status: GOOD (  12.82  )
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

On Tue, Nov 24, 2020 at 02:27:25PM +0100, Christoph Hellwig wrote:
> Avoid a totally pointless goto label, and use the same style of
> comparism for both helpers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
