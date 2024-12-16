Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75720E7717F
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Dec 2024 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3O4xPezqV7KJhb2zWrXpNygu2TMoSbZlZVr0O96+JrI=; b=NNkn16AAufPiRg
	ditvSbVGGJyEATVooppUlyM0pJq38RUrVC2IhFcgdXGMrhycrhoLUtwfa1pS8+W88pzUKpAyp41ff
	XPFAp9U5AZykf1WCJrlpQNL1gFC+W3GhLT4pKPNckoOB8zbvJ6SlLcUBBw9K5zMCz+zw9vKv+kqH3
	MaRyKZ7ne9zWjq0K7xkj1YfKms8zpg1SClSINiaWb7liJDxxBmkqNfsFwaqmCWv6DeKujESCHMlZd
	xcaHDVsaTLT2M3fulMvKVIma6uT6/OLejcYqcJeML8LfvmFRfih9mpjr4ZhXzmHogVKbE84k+UqsS
	rfxiPPPwgdl4EJrMk9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8He-00000009h9L-1xs1;
	Mon, 16 Dec 2024 10:25:02 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8Ha-00000009h7V-3kan
	for linux-mtd@lists.infradead.org;
	Mon, 16 Dec 2024 10:25:00 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E46BF1484449;
	Mon, 16 Dec 2024 11:24:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1734344694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ERnAo7jWL2jCFTeRXfrPunWu9HSVNIYXjljPOFX+vRw=;
	b=JfJ2pMCSUCy8H0EGwyAIr7oGd0t25H+2XqvKtRIK2lHmgNrCSt1UJ1YK14t3EbZjqDapjg
	kj8zpjl/Jm6hhLsbylGUkD6Yi4WW5PPs/o2qAaNO8KwBLcsENqcJJr/WS1fEzonMSXlECg
	KF+enZThhBqW6VLj2ypqYJyZBKkm7dK7rDnmJ3s/tcRuH7PwmrlK1st1eWHx89r8r3Bof2
	JqwgRrbviC/okgfq3hFAvScaDvCXt5uekNQyNLmfjJEzncDs+XMLygQEHiQO5W11kph/Mj
	85Urp+XyK7zcuVP3PgFJnewDkFjUH3GKqDMtYwx7uKLYw1xMCwTsx9kuypMy2Q==
Date: Mon, 16 Dec 2024 11:24:45 +0100
From: Alexander Dahl <ada@thorsis.com>
To: Anton Moryakov <ant.v.moryakov@gmail.com>
Cc: chengzhihao1@huawei.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Fix integer overflow in libiniparser.c
Message-ID: <20241216-ricotta-unveiled-adfb0cb9164a@thorsis.com>
Mail-Followup-To: Anton Moryakov <ant.v.moryakov@gmail.com>,
	chengzhihao1@huawei.com, linux-mtd@lists.infradead.org
References: <20241213133156.103435-1-ant.v.moryakov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241213133156.103435-1-ant.v.moryakov@gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_022459_385988_0C36293D 
X-CRM114-Status: GOOD (  16.38  )
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

Hei hei,

Am Fri, Dec 13, 2024 at 04:31:56PM +0300 schrieb Anton Moryakov:
> Report of the static analyzer:
> Possible integer underflow: left operand is tainted.
> An integer underflow may occur due to arithmetic operation (subtraction) between values
> { [-2147483648, 2147483647] } and '1', where the first value comes from the expression '(int)strlen(line)'
> 
> Corrections explained:
> Modified logic toskip empty lines immediately, reducing unnecessary processing.- Ensured safety by validating len >= 0 before accessing line[len] to avoid out-of-bounds access.
> 
> Triggers found by static analyzer Svace.
> 
> Signed-off-by: Anton Moryakov <ant.v.moryakov@gmail.com>
> 
> ---
>  lib/libiniparser.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/libiniparser.c b/lib/libiniparser.c
> index a6ddcc7..2facbde 100644
> --- a/lib/libiniparser.c
> +++ b/lib/libiniparser.c
> @@ -524,7 +524,7 @@ dictionary * iniparser_load(const char * ininame)
>          lineno++ ;
>          len = (int)strlen(line)-1;
>          /* Safety check against buffer overflows */
> -        if (line[len]!='\n') {
> +        if (len < 0 || line[len]!='\n') {

This has been fixed years ago in upstream iniparser, while mtd-utils
still uses an ancient copy of that library.  Maybe someone should step
up and modernize that before doing fixes here.  The current
development of libiniparser takes place here (since May 2024):

https://gitlab.com/iniparser/iniparser

Greets
Alex

>              fprintf(stderr,
>                      "iniparser: input line too long in %s (%d)\n",
>                      ininame,
> -- 
> 2.30.2
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
