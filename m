Return-Path: <SRS0=4OT8=KA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44620C433B4
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 17:08:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 970D7610FB
	for <linux-mtd@archiver.kernel.org>; Wed,  5 May 2021 17:08:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 970D7610FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/m9v1UiwMw2aoS/ZkCji9TvtV4syATAvTWSUnf51GXU=; b=LlfW2Qiqrl1BDF25XboZ4XevY
	OP4ggN412K/vPkKrkU0QKvyNMJHWoz9K+Ydugj9YpwMNScHed0acjQBnPDoumW9MVncY0FPhXqRwZ
	neYrkyBscwFYpeahk0x7rJjandDavV8Bm4fDbXOYGg9xdbz5v3NgKGnSmOy4cFjOKZVktBb10D18t
	bnPNOTh7pHVNWkjYiLn3REFmcc3bCecAFwuj/BBeTC/im/GLx+S1Dtknyod3BWbhqeRAGmg4L9O6z
	v46qC2XSF8XlsMmEhFe1eDOD3mOMs2dsT76WOlt6w0pGYGw9pObNnRMrzCkk5t3EkaM6xK0Orp1jR
	JD9LsOOVg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leKzO-001rP1-4O; Wed, 05 May 2021 17:07:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKyV-001rBe-As
 for linux-mtd@desiato.infradead.org; Wed, 05 May 2021 17:06:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Dl+yh9sNc333jWtGTEG9CP/9INzN45EOyF45W29H9hA=; b=a7/RkItRtbhxW6v6FCZyOmKB9J
 /I+SLTC1PT7sZIf1g1pGusO74p9Ur27IubfVWBvposx7a5jlaHw/4VEXi31MFAIGoL+vWt+/cGtPq
 86nOjoL3Sr48iwJAN7F6tmjMIX4FVzNWrnXUxTFHaOFT5kD2X0KtF3DM5b9tVNNlZV1Osa5a5oktt
 ZGpW2wFu0Rx1n06MFTQZ8CXnwqEP159TUnhHnCvuwpn5BUyLVH8N6i2bm/pB4M3nd2fgW+BPiBgwv
 WCjyRJnDgUOD5qKqByJio+qT2hRZsMzS+Jk9yQFjMkmwRV6jNZ/O3rwvIm3zZQB4KEF8prvIFQrqS
 n+cXosVg==;
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leKyQ-0052Ca-Tt
 for linux-mtd@lists.infradead.org; Wed, 05 May 2021 17:06:14 +0000
Received: by mail-lf1-x135.google.com with SMTP id c3so3598661lfs.7
 for <linux-mtd@lists.infradead.org>; Wed, 05 May 2021 10:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dl+yh9sNc333jWtGTEG9CP/9INzN45EOyF45W29H9hA=;
 b=nE1crn01I75fjDxQJVdLWrTj8uvI+4+oTsth9abLfIWitd0x7009n0JLYfl2p1gVof
 xzmfFsbLT3o7E4MPx05r7yyCkmPlzOuk0y5+5wQqHG1zfaVZ1T/c/SMfoPDqFxuBli/0
 1AHEraIB+tARHnLlLSVmaleZ7gNNA1KcMXyKn+scK73jfejdqOf50y4V2y4UWROovtVT
 mir01NOeg1UGhP/MZ0fIIWq5uKqclcKQGHm+Y9mApfRV5pDv8op4YZeT74fBmy9etjyg
 Zu0JnMeniam3V7wrc8qxZpbSuivk5KeBUDAvqEr9dCYGB8kr4PtnvxLRnYrwKEWOXvem
 lbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dl+yh9sNc333jWtGTEG9CP/9INzN45EOyF45W29H9hA=;
 b=nJWzlAS/9gOJD69Kmw5RgS/2MQ9rOX7Wl+mA3WGa0Ry575Y8d3fZygOk7CiFg+SNPX
 CPgcPWDNzbIg0idDQHPNkE6YJvUzoqigj+t1hv/xjpIa29L0sSUrYFDNT7GyTlFCeDv+
 wgAABPHpAzHskzhqS/RG0WHI8ibJHb2ycqqFCSij2GNV6XtnCXx38XR3K5K4nFwSLfGW
 GY8ZRtuLDIkUKMhCCYEyG7kdWrkOs+yqpTggL9neJSowwRqMQSyfVhBXUnFYF02iLJAX
 d5MxrzFAOIyy1IW5urwHIE1fF/sZYtrZvLoPmVZlO++kndErxNeiAq7iCELrlN8Sslim
 gUwA==
X-Gm-Message-State: AOAM531tfOGmXxOOjbbDMYmg4S9qvHVId8YkWDKSM/vj5j9dlfrF4GDA
 AtqMlgUCKFuZw4564OHoi1METsIyIKhwZqC2Yrs=
X-Google-Smtp-Source: ABdhPJwZSukiI/7ZoOQqRkcvIOsBPwqYwAGUbUqe/xdz3Kse7Rq5rp9Ys0gSEk7Xv5BXr5RhWcOgpiOsl4NsTYmNI4o=
X-Received: by 2002:a19:257:: with SMTP id 84mr20479166lfc.575.1620234367870; 
 Wed, 05 May 2021 10:06:07 -0700 (PDT)
MIME-Version: 1.0
References: <6a526dbf75f6445f3711df0a201a48f8ac3149cd.1620185393.git.sajgloumeau@gmail.com>
 <b636dedea2c2ed230bb3d53f45a523eb0f5dfbc0.1620233954.git.sajgloumeau@gmail.com>
In-Reply-To: <b636dedea2c2ed230bb3d53f45a523eb0f5dfbc0.1620233954.git.sajgloumeau@gmail.com>
From: Sean Gloumeau <sajgloumeau@gmail.com>
Date: Wed, 5 May 2021 13:05:56 -0400
Message-ID: <CAFU37zWkS5HjkOVZYOhJt84=4i2GhLrUUO7T2+zvyNmEngCstw@mail.gmail.com>
Subject: Re: [PATCH v2] Add entries for words with stem "eleminat"
To: Jiri Kosina <trivial@kernel.org>
Cc: kbingham@kernel.org, David Woodhouse <dwmw2@infradead.org>, 
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
 Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 GR-Linux-NIC-Dev@marvell.com, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sean Gloumeau <sajgloumeau@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_100611_033080_875ABF51 
X-CRM114-Status: GOOD (  14.63  )
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

Whoops, please ignore the last email. It should have sent with a new subject.

On Wed, May 5, 2021 at 1:04 PM Sean Gloumeau <sajgloumeau@gmail.com> wrote:
>
> Entries are added to spelling.txt in order to prevent spelling mistakes
> involving words with stem "eliminat" from occurring again.
>
> Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
> ---
>  scripts/spelling.txt | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/spelling.txt b/scripts/spelling.txt
> index 7b6a01291598..4400f71a100c 100644
> --- a/scripts/spelling.txt
> +++ b/scripts/spelling.txt
> @@ -547,6 +547,9 @@ efficently||efficiently
>  ehther||ether
>  eigth||eight
>  elementry||elementary
> +eleminate||eliminate
> +eleminating||eliminating
> +elemination||elimination
>  eletronic||electronic
>  embeded||embedded
>  enabledi||enabled
> --
> 2.31.1
>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
