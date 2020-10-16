Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96CBCC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 12:12:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C042E2083B
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 12:12:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gXRBRKvy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iaCSWVCj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C042E2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aEHKGQSZBartjMKjbhukbVXfvJC/8hWEApgy1fylhg0=; b=gXRBRKvymMTBPm76ocaNGTSRh
	nUVQ3vYQf7RIvYHuX4nTtcEnuECB8/RxE6+vCuRplf7dp9RTGTod+Xk+z0whG3KB6bXDJ3kPy6u1E
	QbBgard1Hh0NBwVjTWJmubxjbT9hOjDpAFAGAyOZ8g/rdLFLHeFhj4J+uMueZmq0Wmfm/ylORKS6j
	eywMONWXHiMpuv075SURMmL+7UGg81JnhUvCK8mbMDKNH0bbHG8+FpGuCqWFoCz7t/Zle9j3gAXoe
	IwzgzeOAeGkcXN2CoR4M66oRQ75EHrhaqVS3G4K0XAsqx84FoG8l0YyV3I878m/h2jT7wGY9lYE4W
	o+S87jqCQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTOa1-00005B-Jl; Fri, 16 Oct 2020 12:11:29 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTOZx-0008WH-Fz
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 12:11:26 +0000
Received: by mail-lj1-x242.google.com with SMTP id x16so2163949ljh.2
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 05:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J9juZrt3n73fM1mvJ0CQMsn3lZROhB/7kCF1eLDNwnk=;
 b=iaCSWVCjBDOg4LzYprdLqmWF+K3c9sNIgblqe53AbGlM2/G5kcl3JRuvfuLrsUSZ6v
 ERUFTwzrlHbE5Upcvv8VHlePHqEK4F88sYUjRM0GkP3u8xyeifcOxFuDxIWludDxubGp
 ePQjgXh9eZezX7wsrG+P62S4xwAyC1fqiBCgg9Nqz5zpxQf7QnAO7hTm/AU4rXmOw2uS
 wodETfxJIWLW14OlmG3QLAwvjufPoKMIZCNLhKexWwm9vHJs6xKvZ4D9lZuRwjZ4MQyt
 SKqgHKAvsI9EIpvqFgVWBpMRpnADlwX7kJmOzYoPiJtOh12K+gS15fOIKNCV2sIXLpla
 rRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J9juZrt3n73fM1mvJ0CQMsn3lZROhB/7kCF1eLDNwnk=;
 b=PZ9X0YetbRAAFe0N7wqsel24KbKwbpAXrcLWPVLpB27G+mT8c0beJ/OYgNlE07Pkhm
 E+zBY8Ahw0UxmIhl1JJ96Ffvub9lzCizaOHWOmLcS5D09fYE+XjwLR3JjKhKTJf9ys8x
 jjhkE/4hH1RUCZy2RCRYGjGIFKrbrFGZGuLvFe27L9FkPYDDjpugvNl8IFtpadLcp2mx
 P0AGrzbKyV5qdROJ3q4bzqrMQ0eM+XkQMd4b0qT0nXaO4Q5l1tyl7kiMTLjaAy/BMXz5
 QeGbBq43LFhyLKpV6l6iTYherTNZ0+GgUYtBpclCMwhgqSXQw5NycwNH8Zjq3oQsZdGx
 +Dig==
X-Gm-Message-State: AOAM531Y8Z37DUVZWNW9ywEjIcCQsDmsYkar071Tkk9VxDPFnSl9GWRq
 B1zj4t8NiUqziTsM/iRBs2F3fqBFRw1XkRkXrO0DcbP7aQk=
X-Google-Smtp-Source: ABdhPJxjtlI4vhmJb1xMTdxjkUbcjNhszyd+ywxNxcM/ErbmkYQr7isrx+N1nBsGD3WLWO4y2ohZljPYWOg7k6LyWP4=
X-Received: by 2002:a05:651c:54f:: with SMTP id
 q15mr1483973ljp.403.1602850283903; 
 Fri, 16 Oct 2020 05:11:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <CAOMZO5BoLnbY=Y54SFYF+J2kbGyioHTZg=h_kw_JNXr_28ZOuA@mail.gmail.com>
 <CAOMZO5DR6rgqJwTGU7-9gFMPXqmFgq4cfpNQhFi-EE1cBSad3A@mail.gmail.com>
 <20201016140535.23cb3619@xps13>
In-Reply-To: <20201016140535.23cb3619@xps13>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Oct 2020 09:11:12 -0300
Message-ID: <CAOMZO5CuRUtRk0WsxzzHR+qmHxVahg+jF_3iducaY8QNpOXZJw@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_081125_533122_CD59CFD3 
X-CRM114-Status: GOOD (  10.93  )
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
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel,

On Fri, Oct 16, 2020 at 9:05 AM Miquel Raynal <miquel.raynal@bootlin.com> wrote:

> > Does this patch help?
> > https://pastebin.com/raw/xwHKXFmu
>
> Definitely, yes!
>
> I guess I will have to fix all the drivers doing part of the ECC
> initialization in their probe function with the same logic. Hopefully
> there are not so many...

Ok, let me send a formal patch for the ifc driver then.

I will also audit the other drivers.

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
