Return-Path: <SRS0=z5Ut=XF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A571C4740A
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 14:27:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1234B20863
	for <linux-mtd@archiver.kernel.org>; Tue, 10 Sep 2019 14:27:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sybQTIxg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="CDI61Cau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1234B20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SOu3lR9RrpnVzz4XNi1fQsKxHY2+86Pj42tDIPaAuA8=; b=sybQTIxgdpv4q4
	cBch+2Jf/RXGzQYy+nASNvyQETObK4cQVsO6Tla5C+BRTzNACws2HMqXWZQtDhX0ssbEZ/Cb+4bKr
	gjLiLF1VaGIadXwsEU488rw3yFRWCWjqg/p9M/jvf+yWrumnu0GVPUHl45ulguixRWJY2xGQg4LYi
	rnFscqBEvUUphTY/1X2+Q8qMek0d1kzVuelPL3ugCTuy75tjshSuSTStEA/qZPhLxuuMAjPebFPpG
	hDuOy8VgFW8dNz6kXasuePogRhY0m6G2kRu/j5v9tqnJaTS6HznMwnOnS39OTINwWpaM78kqHocsg
	Vx/jOvEv3v7y6iAfG2YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7h7c-0004jp-PK; Tue, 10 Sep 2019 14:27:56 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7h7a-0004jR-9m
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2019 14:27:55 +0000
Received: by mail-io1-xd43.google.com with SMTP id k5so12663061iol.5
 for <linux-mtd@lists.infradead.org>; Tue, 10 Sep 2019 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iAJWigFQogCgXqw0GlIr6H4PJdXWKqg0KkSpMrQT/7M=;
 b=CDI61CautrcOJ596e6Ocyme/zhgxyGSPizFMEyCjc8zFk/4DmZGZuLcPRV8DX63sSy
 QfOWqPKSEDO+PN+kXadppYN6yN0ZYWSCnK8k21Pj1s30YvqJwymMQxEDYGbpEqkgCNkO
 0ff0l9JiWvTuQOzERjuVt4drIbh5FliYa9zHxcWtzXgwk7qOP1JZ5mDPzksaQjMRMDXN
 N0RuubgU/kLpA4t0q5+olIg6IQepEutG6lcPLoSy1ICNhoes3eld3+BXnFc48Jxs2DJC
 4RulZJ3sw3Ve7oUPlq5zQVUF0+r0FSs5Yo7FXP6yk+xR44XDLDLz/fPotT9tGv/Z1vg1
 ShbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iAJWigFQogCgXqw0GlIr6H4PJdXWKqg0KkSpMrQT/7M=;
 b=CCIexfQ9K2//WULZVwEfF7HRzcj3I/DP6MCtudUwLuXTSO/Q52iEp5lg1LmdQykLHO
 fau/300SPYtTx9rlufp7uZqRp8pH6kk8BQsz2eQbGnYZ18YUQGTfmeqnLfd92MS9PhaF
 XgM3iyE6ee6cYXGSaSWQs+DmEpRQ3ESAek+9cwfiUPSwBuUs1Rl+PDaBcbJkVfl6ZtZ/
 EJQFtt3SlvofALfOVA1th0tZpW+eZ1hUbJbJDd3CIXy3os9WkMn5RDHDY1LyDpK3YN+V
 JRjHuJKN+wpjei1aNkuNw05aau+cswLJsemQR+rJqvJOlad8SeXYbwhMPyI8557gSvl5
 Hgzg==
X-Gm-Message-State: APjAAAXs3oRWIlr++Cd+mFuoFV9LmbP+YOCWWC1tzbglZ1tyh71XydmF
 3dqR2LUp9nMmppdJOGjPexhvl0pAREWzX/GU2U0I5g==
X-Google-Smtp-Source: APXvYqwEMQEv8abs86qQwB4owkSshjlRdWMduOGeS/BxXi7DyYcvUMQBqShvZAQJ/9H8nlqE9ZM0BxWO8eLyqm2UHOo=
X-Received: by 2002:a05:6602:2256:: with SMTP id
 o22mr7092227ioo.104.1568125669479; 
 Tue, 10 Sep 2019 07:27:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190830154549.vss6h5tlrl6d5r5y@decadent.org.uk>
 <20190830154720.eekfjt6c4jzvlbfz@decadent.org.uk>
In-Reply-To: <20190830154720.eekfjt6c4jzvlbfz@decadent.org.uk>
From: Matthew Garrett <mjg59@google.com>
Date: Tue, 10 Sep 2019 10:27:37 -0400
Message-ID: <CACdnJuutzv+0nPKeizsiaix5YtYHU4RSoH-hPFfG1Z8sW_yy2w@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: phram,
 slram: Disable when the kernel is locked down
To: Ben Hutchings <ben@decadent.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190910_072754_368161_CE033E51 
X-CRM114-Status: GOOD (  10.63  )
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
Cc: David Howells <dhowells@redhat.com>, linux-mtd@lists.infradead.org,
 LSM List <linux-security-module@vger.kernel.org>,
 Joern Engel <joern@lazybastard.org>, James Morris <jmorris@namei.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Aug 30, 2019 at 11:47 AM Ben Hutchings <ben@decadent.org.uk> wrote:
>
> These drivers allow mapping arbitrary memory ranges as MTD devices.
> This should be disabled to preserve the kernel's integrity when it is
> locked down.
>
> * Add the HWPARAM flag to the module parameters
> * When slram is built-in, it uses __setup() to read kernel parameters,
>   so add an explicit check security_locked_down() check
>
> Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> Cc: Matthew Garrett <mjg59@google.com>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Joern Engel <joern@lazybastard.org>
> Cc: linux-mtd@lists.infradead.org

Reviewed-by: Matthew Garrett <mjg59@google.com>

James, should I pick patches like this up and send them to you, or
will you queue them directly after they're acked?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
