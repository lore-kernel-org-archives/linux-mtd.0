Return-Path: <SRS0=jTzi=VC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC868C4649B
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 15:49:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DFC82184C
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Jul 2019 15:49:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZpAiPD1R";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vu74cRaq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="lv30PSIq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DFC82184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1TGahnlXu0EPtXxCft7HHzAfp+KGd9EsZnVd46qR+40=; b=ZpAiPD1R4jLs+uAFMOBxcx/xs
	7LmYldOFPC/vysz+3r+NAJT0oXWdKFNpTKR66iFfUuY7sHAUQkFc9FeibIZxU1fX9GQD0SPvT0ckU
	a3Gr16aFqmD+QleXPH31u5avzjlmUvSNf4k+hRfc43itNf3YRcQBicXxkN+tuDvo0TejZ/8TQ35TJ
	tzDCNRPvJ4Hx4xE0YvcsU+4nUCYiCBamzesofsEkHdecvI/xq5QUhGuy7cqwYns1T8xDigcdFkb9/
	5WqDKSwFX0aPGHH1AI78XFIiyFVhIfV4JFK+ToLJ0GovbJ9jzquj0bqdg3h+gxszMXCvZibwzB0FN
	xOBrxlA2w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hjQSZ-0003b4-En; Fri, 05 Jul 2019 15:49:15 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjQNr-00061p-8O
 for linux-mtd@bombadil.infradead.org; Fri, 05 Jul 2019 15:44:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9FLSzJ96T/u9vNlRMaRjTA0JNSLf0kIkghtMhBwyp9U=; b=Vu74cRaqgcRFxyrRkwkcl7ja+9
 HtBzdmZImEfFJApY/+Es0Ivfsc/CKBh3h0hhwtTpZnJMWBLf66j7X6Er9cH7S9SIw+R1snz2uF3H/
 WBSs9ji0r68KMSKu172sHXXklPgF9YHlotg1gSkWHxXzTaka+MPSzkMsdU05xujlt9zkP6W+bky7u
 aGmATNJYO1UxsKpE1tamVVvPLBmRvVMgymfxehGNq0p9wv21v7mfGdev40Bu2siLBPSEqjb5Hj/DF
 dC0lBVJdFe/lxIFdtH/ZLOezrNp0xOfUM38c9VoCBNymqUKWahTQEyVhhJKh+5zHcZUd3sVZ0LBYz
 Djx4glcw==;
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hjJYc-0000T8-O3
 for linux-mtd@lists.infradead.org; Fri, 05 Jul 2019 08:27:04 +0000
Received: by mail-lf1-x141.google.com with SMTP id r15so5753636lfm.11
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jul 2019 01:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9FLSzJ96T/u9vNlRMaRjTA0JNSLf0kIkghtMhBwyp9U=;
 b=lv30PSIq9pW5vgIcjCH4iIU4BZBPHLBgKjqfgeFMmewbZ2luPi2ZZ19NeiI30AvKsF
 tI0xsp6C49tdZhDUj2L284wYugBfJsBUboRnL48ny5bmEVYxpc4v2I7UoXydXnzWep5Z
 rctEB73EmbXa+4nsEDuOETE7Tmr/cRNUZ/22BQ1rIQw76EHFBQu/jFS8IdgQHqTXSD6R
 9UV1/cxwJ9uRyni/jSVXqsLrs0ntF7hgVj8Q26cDf/I/eIKOX4g2xk8hwNJMFNS9DU5T
 TcH0IoT/YuXxrZSHn8xXRK8Oj3vUJta32gJsHlN41ylY6hvgF14UrlzQJydlDE3KEZQN
 9iwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9FLSzJ96T/u9vNlRMaRjTA0JNSLf0kIkghtMhBwyp9U=;
 b=Dv5NzCJjXA5KjoPApedc3r3QSnlY8O9iR0nYE+9LbKAlA5cbh3JguOouJJ/0Tw7WvZ
 d+6cHNlG3sImLBX+RwbxIbD1FocyrwPNOcGd8uUE+rbJre2WVHYfTBLsl9OAnWu/y5Q8
 ph4sQeVD6TX5z/86KNqF+qedotjAxlH3L81JCC8yWM1LPjik+kE1McnH4wh8vXgB9IBe
 R6SxnuXb6RJnCGgngU3SvB5CqQ7VMm66jNmYBCD2Eb5hDm0Q0wwOqITsd94C82chnB0+
 MOFJpMvOV4TrYcbvZ7B5Qb1r7Bv6Jm3zoOr+QXWt1rE/xMBrlOmRmdVEOfkOLom9um9Q
 Og/g==
X-Gm-Message-State: APjAAAXjZAkEtQ95yNGg0KpRWRkFI2IpZ6ROtg1g8sSYBFf6bUSRaYG6
 Rtr2G0cywB6xYJqTIOSrhOplfQ==
X-Google-Smtp-Source: APXvYqxQhgzeDSHDGmuSiLnwG+1ig4OZXNqprv4IyRpQeKXZebY0s3QjP/9/qJmA0GStJqJYfa/89A==
X-Received: by 2002:ac2:4243:: with SMTP id m3mr1382863lfl.9.1562315093495;
 Fri, 05 Jul 2019 01:24:53 -0700 (PDT)
Received: from ?IPv6:2a00:1fa0:4432:513d:ecce:ffd3:f4fa:ae62?
 ([2a00:1fa0:4432:513d:ecce:ffd3:f4fa:ae62])
 by smtp.gmail.com with ESMTPSA id m28sm1624828ljb.68.2019.07.05.01.24.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Jul 2019 01:24:52 -0700 (PDT)
Subject: Re: [PATCH][next] ubifs: remove redundant assignment to pointer fname
To: Colin King <colin.king@canonical.com>, Richard Weinberger
 <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
References: <20190704222803.4328-1-colin.king@canonical.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
Date: Fri, 5 Jul 2019 11:24:39 +0300
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190704222803.4328-1-colin.king@canonical.com>
Content-Language: en-US
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 05.07.2019 1:28, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer fname rc is being assigned with a value that is never

    rc?

> read because the function returns after the assignment. The assignment
> is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   fs/ubifs/debug.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
> index 92fe5c5ed78a..95da71e13fc8 100644
> --- a/fs/ubifs/debug.c
> +++ b/fs/ubifs/debug.c
> @@ -2817,7 +2817,6 @@ void dbg_debugfs_init_fs(struct ubifs_info *c)
>   		     c->vi.ubi_num, c->vi.vol_id);
>   	if (n == UBIFS_DFS_DIR_LEN) {
>   		/* The array size is too small */
> -		fname = UBIFS_DFS_DIR_NAME;
>   		return;
>   	}
>   

MBR, Sergei


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
