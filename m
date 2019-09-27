Return-Path: <SRS0=jI2T=XW=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20F40C4360C
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 08:38:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75492075D
	for <linux-mtd@archiver.kernel.org>; Fri, 27 Sep 2019 08:38:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lXO/POjR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="OmyzyLGm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E75492075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l2pgInr4d8iljEEbzyWlkGYq6at6e96R6TvxLs9QTEY=; b=lXO/POjRgzc7/ZAiIqhv/qejP
	KVEVthh5QbBj+PJ8nq7SS847whGN7uDIPJFXF4wmB9dZoD/TlLI3nVbpKGHQKRK0KOPOaY7EHtIPd
	EOHWEIt8Yp6F7nd4fCoTixFr1BSxCepI7hPjY2TYbNWiaCFjRKZD/n+PQ2WAsSOcpwkBtsaMOtuet
	PxxRtf++IkGLwY+0QhFhFfJbw0RqTIGeGF+T9XCEg/5K6gjwtcIHdbTCYzBPrml3sssWnpBDJJRKP
	29QtrWLNgnLF38wCrgZsGgdl4Bz5xJjV1s4DRhuv42cW85HVRxe2E45hV3vw26a8/tX2FaEPehoGH
	dOGKpJzMQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iDllr-0003rv-6e; Fri, 27 Sep 2019 08:38:35 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iDlll-0003qu-63
 for linux-mtd@lists.infradead.org; Fri, 27 Sep 2019 08:38:30 +0000
Received: by mail-lf1-x142.google.com with SMTP id c195so1274604lfg.9
 for <linux-mtd@lists.infradead.org>; Fri, 27 Sep 2019 01:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZQ7PgEigiWP+iFi5g31iLI6DCZWNjaRYQUZv3+A6Guc=;
 b=OmyzyLGm6jVWYGe/Qf6g9c4ayvHcL/EXwYFQnPiIgUYPxw1p6ORPH2dVrloLdEbaWt
 DY8IMy+9/XVnFyFJkbDRBf3YgALGQMjpYCJlZMFQlZjkDdGsZdrZVDqkc1gcEDHSzmRl
 ubjOf7Ca3IRE1p7gdQSW+qIXrPY7rVqR4jP1JdWQcUusVmboN5JuAb4C7d2Gce9STMAF
 MYk01I9ombw2tK+/WdzCkQ7yMx8PB/wt462+mj8Vc6fckuOG4/VN1uUPuDCJCfNtrqcF
 zSMa0nLjCugw+tvqYupigEAXkPl+YCu2P9Z1EqFviZc2TlcBZOmep/wtlkSAnrgdql5i
 mz9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZQ7PgEigiWP+iFi5g31iLI6DCZWNjaRYQUZv3+A6Guc=;
 b=i9iY9zO9OMtppY1i5p3eBNowYxJAoFFhv2U5C9G1QO5rg6shUMj7PQ3oD+G62Z7hj9
 ogZckyz2+9+dx1mRhBtk1g2GBAmy54w79WO9en+xUBWmM4pHmybeeGIb3TsPenuPB8tR
 i8v3kj2vyGDR2/btCxOVtweZPKNTNb2HPj1ijDI9MxCkm4ZWJxv7XdNqOcK2lVvY2lJ4
 sWjpHEkEr2zjh9feuUcqaTZ8JA1hY4lMd/3CXjclZniMGKzY+TIAPKAmIr+5wa1R357d
 O6MQLnoyKn7po0OyyCb4dVjB6tW1S9uBGlCdgZ0jEmpldQRQ/tIqo9Ar8Ir3jj8RnQIJ
 XlzA==
X-Gm-Message-State: APjAAAVOHxT/K6Ng4O98UY47gE8cYoZE6eiqYGtsd2wvcsVu8t3SrJwu
 okhTVnsT8Bv1rGSXcsh9lp907w==
X-Google-Smtp-Source: APXvYqzX+M6AZLBfanv8/BbFtBIKYq/m6FvDp7LWSo1Mcnqu6rZMr8QR+qBICHyIGw5XzQkaEpjGdQ==
X-Received: by 2002:a19:98e:: with SMTP id 136mr1933572lfj.156.1569573505672; 
 Fri, 27 Sep 2019 01:38:25 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:8df:57d9:c46b:3c97:5028:3a4f?
 ([2a00:1fa0:8df:57d9:c46b:3c97:5028:3a4f])
 by smtp.gmail.com with ESMTPSA id t27sm345992lfl.48.2019.09.27.01.38.24
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 27 Sep 2019 01:38:24 -0700 (PDT)
Subject: Re: [PATCH] jffs2: Fix mounting under new mount API
To: David Howells <dhowells@redhat.com>, dwmw2@infradead.org, richard@nod.at
References: <156950767876.30879.17024491763471689960.stgit@warthog.procyon.org.uk>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <f34aaf61-955a-7867-ef93-f22d3d8732c3@cogentembedded.com>
Date: Fri, 27 Sep 2019 11:38:10 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <156950767876.30879.17024491763471689960.stgit@warthog.procyon.org.uk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190927_013829_369312_B2B37576 
X-CRM114-Status: GOOD (  13.95  )
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
Cc: linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 viro@zeniv.linux.org.uk, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 26.09.2019 17:21, David Howells wrote:

> The mounting of jffs2 is broken due to the changes from the new mount API
> because it specifies a "source" operation, but then doesn't actually
> process it.  But because it specified it, it doesn't return -ENOPARAM and

    What specified what? Too many "it"'s to figure that out. :-)

> the caller doesn't process it either and the source gets lost.
> 
> Fix this by simply removing the source parameter from jffs2 and letting the
> VFS deal with it in the default manner.
> 
> To test it, enable CONFIG_MTD_MTDRAM and allow the default size and erase
> block size parameters, then try and mount the /dev/mtdblock<N> file that
> that creates as jffs2.  No need to initialise it.

    One "that" should be enough. :-)

> Fixes: ec10a24f10c8 ("vfs: Convert jffs2 to use the new mount API")
> Reported-by: Al Viro <viro@zeniv.linux.org.uk>
> Signed-off-by: David Howells <dhowells@redhat.com>
> cc: David Woodhouse <dwmw2@infradead.org>
> cc: Richard Weinberger <richard@nod.at>
> cc: linux-mtd@lists.infradead.org
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
