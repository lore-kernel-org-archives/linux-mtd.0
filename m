Return-Path: <SRS0=LKht=3Z=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=1.8 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A83B1C35247
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 23:40:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E8B20730
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Feb 2020 23:40:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VcARDUV3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Eucncfy0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78E8B20730
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cKBvB8nWWJpGAvYa/aIHU1McRjR8vSZ1X5KghloX5n0=; b=VcARDUV3JOeIYk
	hNYqN8mjXaNx7K0KuFkGgUidYJsUPmQr/7vXbUSVq2BdPYcRTZpA6/skTYdq+nWjG9XUYS4jIXqjt
	KqqCfuv5tYyCdgqvUYQkrAv8LeNqEb+Tx6Gs+PbOGY18v3o150tbagRXCQTSSRH9dUGuUMuQF0ndS
	gaT1N6Iu34peE3ktvpDaVmNlzDZczLvnOVHNObAgc35qglDUxvdryvoyBbDaFdJpR92mx9x/e6jhx
	whLvQBDKWDAujchGPg9bNy/60QMaeQVzKL1y+IF5nSdDebo0z2JtHxQb7OHhLrrbPcwlIzY/rS3Lq
	kFUsJgvbdzc9RYD1X/1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izUHV-0006ra-UO; Wed, 05 Feb 2020 23:40:29 +0000
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izUHS-0006qT-Kq
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2020 23:40:27 +0000
Received: by mail-lf1-x141.google.com with SMTP id m30so2759556lfp.8
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2020 15:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eImnorc+E72Ebn4XEF1SUg6cxpdpF8frzXw7k6RoRcE=;
 b=Eucncfy0bfw2XSNvy3spLaCcbAJQXGXLfKwBFip2IDIQLXmUo0Oshd2FbgLS3FZnZK
 9niWI9xMAjS7AulP2kZjWHny2XgDM4S//hdCeWXKGIFCEUzBUo9M1OOddK2Eg26bMsyB
 DveOA8IJDdhnBk9uzpiAv8bDzUzDwCELfF16cn3TKe90OqY8nddNTeRzv5gtlrc0uFPh
 ptbM+AfLEnnLiVD9BHUxlxFOKknvZ/WKsce5pwcjNl6ABhJJ2svy6h+x4B1RvPJIsTC1
 B661E2LWjz74WjBpodNkt6YPeBFT46XbVetSnJ+7xHdI0sIyKm27coJnchHIyhuRidtM
 TUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eImnorc+E72Ebn4XEF1SUg6cxpdpF8frzXw7k6RoRcE=;
 b=N/siT/RNX2bD0V7jYjDZhc863/wkwuCFTTsK/y9qEeQg8DWE9E2x8hq1VcJ+PXFi5M
 gdTQOApuJSWWhCpS2p5m1HwKDuOKP7a8iJE77ZUCUWqTxbUvdRMcLrDpwzL7zJVbo9MK
 nJ3qkSSYX3BmkLxY13bBdUB1woarmPD+6cxeo6T8AL5XYAbkwizPHIvnAPeBoXi2vSsU
 tWJpx5VQfPGQ/Ir2HARyWj3uJuc0UHhkVSWCxiDpyEP0ZnhVsnuRjSAjcGtrxnL33rkd
 cvMg51tCjgbjkqEd4RkImSn2vFKcWRECvCVae64Kifv7MiCjqNZ5spbllE1cCTdonlor
 O67A==
X-Gm-Message-State: APjAAAUDmrAOB9bXZ8EiuXIPaEvqwoHK/ovHEqvoKZ0vNcYlSvw8U+9Y
 Td240EqoMn7xWBT4DK5/f27jwwXvx92SD/8DOt9OOw==
X-Google-Smtp-Source: APXvYqzzEBWngyKstrRaijt7X7I5bXY9Val+Hxs5gu/BwpxZpiBbhMGiFic8G5pM6rS0i/mpmGgwfAohfvUcJsRyKVQ=
X-Received: by 2002:ac2:5979:: with SMTP id h25mr122207lfp.203.1580946023798; 
 Wed, 05 Feb 2020 15:40:23 -0800 (PST)
MIME-Version: 1.0
References: <20200128230328.183524-1-drosen@google.com>
 <20200128230328.183524-2-drosen@google.com>
 <85sgjsxx2g.fsf@collabora.com>
 <CA+PiJmS3kbK8220QaccP5jJ7dSf4xv3UrStQvLskAtCN+=vG_A@mail.gmail.com>
 <85h8051x6a.fsf@collabora.com>
In-Reply-To: <85h8051x6a.fsf@collabora.com>
From: Daniel Rosenberg <drosen@google.com>
Date: Wed, 5 Feb 2020 15:40:11 -0800
Message-ID: <CA+PiJmQgFNLYoRu7fSWgz_He8Z8ceq1G2yUDcy0OCn1iD2rkzA@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] unicode: Add standard casefolded d_ops
To: Gabriel Krisman Bertazi <krisman@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200205_154026_711489_C46023BD 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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
Cc: Theodore Ts'o <tytso@mit.edu>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chao Yu <chao@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-fscrypt@vger.kernel.org,
 linux-mtd@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Feb 4, 2020 at 8:21 PM Gabriel Krisman Bertazi
<krisman@collabora.com> wrote:
>
> Daniel Rosenberg <drosen@google.com> writes:
>
> Hi,
>
> It was designed to be an internal thing, but I'm ok with exposing it.
>
> --
> Gabriel Krisman Bertazi

We could also avoid exposing it by creating an iterator function that
accepts a context struct with some actor function pointer, similar to
iterate_dir. I'm currently reworking around that and moving the fs
specific functions to libfs. I can move the generic op_set code there
as well.

-Daniel Rosenberg

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
