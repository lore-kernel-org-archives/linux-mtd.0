Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD208C2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 19:48:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AFE42137B
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 19:48:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q2uuYANR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jOV4zvc5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AFE42137B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bUqhygaKTX37lwidFb96ic+JeLohuNY8wMaJH7x67ns=; b=q2uuYANRLQzDV1rWfJyaI4TxS
	+/6SfnGuEtktQLb/uT0JMziu4n8twAIq/57f2ZDCp0CRAYJORz44iVzl2zRArXpQp98usJbZXOeQl
	o35ZSVGftDGAF/ih4rJSZyehCzljMWGSPxNwxQZ26VCxhvrXMJ8GYfFOJ/8jYC0/tnX2GMyEIiSDA
	F9DGtHedIAWTpkzCmNy0Ga/6I8KD+cEOsxljA+TAScWwQMwnaaJgpYVIF07/o/NCrhKhUNwGMqZEi
	cxwf0tUWJHBxkszio+UgmYIZTvnOt2GIZy3D9NuMRWdzzlBIirMxbB8e0dJv2zcZ8A7nnP/Y9h9eB
	XXwec20lA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kheHT-0000hQ-Ut; Tue, 24 Nov 2020 19:47:15 +0000
Received: from mail-qk1-x742.google.com ([2607:f8b0:4864:20::742])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kheHQ-0000gZ-Tu
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 19:47:14 +0000
Received: by mail-qk1-x742.google.com with SMTP id n132so61665qke.1
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 11:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=V2TOjLdoUaYrySYqHg0oeA6ickZUCz64YonJi1MX7zw=;
 b=jOV4zvc5ykqwIR5EZxEdhoTt8gbdvwT6+6X/TSUVT/z8HYM0C2tjvbbgLMctpzeJXh
 RGgnK/f6uWChM4BxAbOX4p18Fwq1/chEXov7aPAYOwuKTjdA655sPluEae6103/B37UZ
 mtHW9DvASGebX6RreWH7qhpVzv5BxklJgKQSxfx5joha57iIHUUTiDQJHNfLS9atfGSt
 ExNgjoQWPu/xgn5sRgfmq3jVVaBwbHob8XGT+JoMXjhTpfpEBrU2/+S555WpdkNVIh4j
 Jpy0MqgRWGJT79DbBEN/JVT9ea84He6RSeOcPWGIlVmK+xMy8dzyAD0z3NQbnkk9QV/T
 mQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=V2TOjLdoUaYrySYqHg0oeA6ickZUCz64YonJi1MX7zw=;
 b=JsY0cffxwiZAzmEurT4oD1Sb0aTMiz4Uw1WHtpPiX10XpW/ZsotDQWt42uE3Ee7ocp
 xCsDAQ2pK+oGiOfNR5JghlONS/PF9iKS5NGzDcfrUuO5vGTL//eXiy5E+4jRjuf3QVDV
 TBw/e9fDA3H7vgpOPhkDX2p/PEXbdx/E7QD8TXG0TKXnASTeogqv1qya6q9HHN29SUaC
 h8TNy8u2Bq4Dz9ZyPj004WdnaIMLwZTfkIe+N2NWZPozgNyzRPxpjOw9jE6pSd4SmCum
 lwihCZ758JEAXim7/OaOASdvDUf/Mj/kthTDkzq2qSE+mCMajKInst23U9RJnS/hSHUg
 T7WA==
X-Gm-Message-State: AOAM533JANzN/CYmr3fEhF16bv9tush6j6BXoNLJqFK5p7c0Qmx06TxY
 v4K9MIs93KyBzUtnzAKGMhNWZir1e26zvA==
X-Google-Smtp-Source: ABdhPJzCbEzsnsSHZbAP8aBMoagyKuXkYbNxYHgU470rrYkN9D5aTPe0QJyzDBb8iwv2DZpxdq68Ww==
X-Received: by 2002:a37:6cd:: with SMTP id 196mr3775536qkg.96.1606247231211;
 Tue, 24 Nov 2020 11:47:11 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id 137sm123792qkj.109.2020.11.24.11.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 11:47:10 -0800 (PST)
Date: Tue, 24 Nov 2020 14:46:47 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 24/45] blk-cgroup: stop abusing get_gendisk
Message-ID: <X71jJywIZTSxLoqQ@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-25-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-25-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_144713_018839_42421923 
X-CRM114-Status: GOOD (  12.64  )
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

On Tue, Nov 24, 2020 at 02:27:30PM +0100, Christoph Hellwig wrote:
> Properly open the device instead of relying on deep internals by
> using get_gendisk.  Note that this uses FMODE_NDELAY without either
> FMODE_READ or FMODE_WRITE, which is a special open mode to allow
> for opening without media access, thus avoiding unexpexted interactions
> especially on removable media.

I'm not sure FMODE_NDELAY does that. e.g. sd_open() does media change check
and full revalidation including disk spin up regadless of NDELAY and it's
odd and can lead to nasty surprises to require cgroup configuration updates
to wait for SCSI EH.

Thanks.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
