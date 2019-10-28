Return-Path: <SRS0=3akN=YV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 028D0CA9EC0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 16:04:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3717208C0
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Oct 2019 16:04:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OgjLlL7r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OcUBcGzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3717208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfsSPnuZBtmz20MpC71wuVmLAj7cN3aOGl4lVVby6Hg=; b=OgjLlL7r4ayo1s
	gVEk8y5xcXMMP5SiHT2fE2Md08DssmGEyulpOlDVclU93gGi987UlSKUYyNRluWpLwEQQYnf5dvUv
	z+22chvZoHibUTcdCczzWwI1oIgh1AlR0WWy9zvHsYlV2QWYbUoEmX4yR1g6Uav0f58gf/FylI8uM
	nrq+C1KZIY28vDDcR3jbzzd2hiMTIwoZFVL//ySHrOoUKbl1Q27HM7+iMHc03g60dMP0KE1vdUj85
	NVoKK6cBYCUUgXHNw7udeohtFsgvmlMP6VAW3SNow5S42TKl2te2Q814vbye6D3EyAE2TzXIyozwL
	6m5COZI2rregPRfnZw8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP7Vn-0003aL-MV; Mon, 28 Oct 2019 16:04:55 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP7Vk-0003Zq-Rj
 for linux-mtd@lists.infradead.org; Mon, 28 Oct 2019 16:04:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id 11so10105381wmk.0
 for <linux-mtd@lists.infradead.org>; Mon, 28 Oct 2019 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IkBVrb1IsvDbl6PPy48IAM4qGo5jE84qlHtYg57hft4=;
 b=OcUBcGzZZRdk26Y0LUjiRYcCy1ruiucWl0hyhh8UAg9wejk4P0MQ+0zSczoYHF4Tc5
 Lkqp6C2IQX2IJk3rZMqeshw+OpBHN2DtC0keTuLopVgHhMnWRe2awouydCuPwUyVlGYF
 PTuraDa9JlxZruGbf4lk6DuZ6plWxWBPZkGsl4Vj8OOfHdRN0+Ja6u0euyJm7zlIkG+u
 AVhRUQWW39fnrkni/Pz+hzWM2IlxfnjBgFlXhCvpEQj34nJhWBI7iOE4gmiZNDfsWgMk
 cucSVJFVjKE6NyszQLm/h0ZsdAioT4+oIAsCpWvn4dXzpId2gX9LB7tOVZuDojtZYb2K
 GhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IkBVrb1IsvDbl6PPy48IAM4qGo5jE84qlHtYg57hft4=;
 b=TvRPNTmatQN/EWBhafX7yMiVI7fL5h7wUFAnVqbPm6EmlmheOydlHYhKTdhe6Kj4Gt
 vp/jCW5vmiybepklOcpvrSyPo47WWTdpYZ9Lf3EBMHV4z6d2ZsxGfihkO/5s5NRJII7W
 /C3rOlmR1cabTsk15Zz94OaG6VGWHhmEmo7SJenHE8ZjxuWaqrM/8xWg7ndCYkaYoD+h
 Wj0jw2auf1vlYYMAAY/g3OWjHfhXidHxoChLoIDfoAPXYYEOP7Xiy37zVDf3HfW1fG00
 tvDhIfv7SzPaEd+HfIL87w65M99LrKsJAWl+lYH6WOGb+NvgQj9T/69cxBhOYjNjW5FE
 Iygg==
X-Gm-Message-State: APjAAAWcWlXNhDjXbE+QAUQsgUGec0t0nz2OiYsIoxT72yP+WJs2L3sc
 0qVTTMPFuojj2GFS+CIqXtXvsemKRdQzWjNQSu0=
X-Google-Smtp-Source: APXvYqwm4puFpspRD35Cj42VjLzFNojJrjvhrXDXE6ZNhQL/wS4RcOrgHey23T0KQB+q2lqmUoEfcJ4f5exPJusjX7I=
X-Received: by 2002:a1c:8086:: with SMTP id b128mr47316wmd.104.1572278690782; 
 Mon, 28 Oct 2019 09:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191028160208.1110-1-miquel.raynal@bootlin.com>
In-Reply-To: <20191028160208.1110-1-miquel.raynal@bootlin.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 28 Oct 2019 17:04:39 +0100
Message-ID: <CAFLxGvw21S=_pyYaANUeXC--H9YSq0H2qUXPkdznHg0H3vxbTQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: ubi/ubifs: Update the Git repository
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191028_090452_897740_4165927B 
X-CRM114-Status: GOOD (  10.03  )
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, Oct 28, 2019 at 5:02 PM Miquel Raynal <miquel.raynal@bootlin.com> wrote:
>
> UBI/UBIFS development now happens on Richard Weinberger's kernel.org
> 'ubifs' repository.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> -

Acked-by: Richard Weinberger <richard@nod.at>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
