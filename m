Return-Path: <SRS0=oK52=XY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39F08C4360C
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2019 13:39:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B29C20863
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Sep 2019 13:39:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kzhTiNfp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=telliq.com header.i=@telliq.com header.b="yOixzmIS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B29C20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=telliq.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7Fna1NyqbsKVIpGZMuB29VkVxw6YzWc/uWuY2Qxj/M8=; b=kzhTiNfpEZdWVh6TNTiWnAhHB
	C6rX3izV9i21tj9wp8qAXhOpZ1DIMRLpAH3MdFCKXHwXWxjtzH0TnIPTyyJ2udEx9RbNIg8cVduNY
	IFShldAjj/Bdug57rgxSfkF4MsrHc+GoS9u4KWz4rZpnc4b4v+QCY+z2R6LgQA+ApXi0fgNBJTPh+
	Rx8Irj6cT8L9hehd4zrGR9ntW0oGisIqZzNNuwyqIN3ePCUOquA9hSRu3WSJ6lu548SQeag9MQe1n
	09qUpt71WyDHZwEafc3usTfO3qgrj5zMAiojqRs/Y9MEntanLFR9q8UTBQfu+cP+5lfqx64AoQ51g
	bJSB+bxGQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEZPu-000760-Hi; Sun, 29 Sep 2019 13:39:14 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEZPr-00075f-C3
 for linux-mtd@lists.infradead.org; Sun, 29 Sep 2019 13:39:13 +0000
Received: by mail-lj1-x242.google.com with SMTP id y23so6719634lje.9
 for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2019 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telliq.com; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=U8UJML/sffip+VH96gq9qAmHyF4YWT6eKzk3GrhnOGY=;
 b=yOixzmISNVSxdz2Mso6dNDlOG6H0yeXHsODfGsqomKDbX99iTVsfqGN93PAJZuF7pT
 QNRjLanouu4v82RpVfDiTiOWoClJSxUDpPrl353YFMmas51M719GBHb0/9zxyfrGgRnn
 3Fi3F0ZbJlMHyCCrZlyXk4J5ybAHYA4Z6QUZnxY46FAXj0K6CeMUih77BKlz6AZ0MhoU
 SRZTjfIcqPzF+5lq5uVbcKyuAjIHTVVoHIyrEaZSB495JG6r5eXeyIe59ZHRKz2MyWt4
 ollpxSKIQ90gzmESPWFhenTIjeG6GC4VkLQ0cPACcQ5crtBzqCANGTlROHHh5u6pGH6z
 XatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=U8UJML/sffip+VH96gq9qAmHyF4YWT6eKzk3GrhnOGY=;
 b=WRJxXw1QGYZ9cddxcwelXQ4JOPGIcTiSuN6QgL7Y6hTTHJqOle75qgMe2sKyY/iIcb
 V16p77JT2Blb4YrslJl3j5oi6P/jzObn1FylI2MOtKDxm/ful7CusBI8xHzJkfS2kj4g
 qkwbRrx0wsYtV1yfyfITPLpKVLMQnIk1lQnt0ajdZG4p18Qs1J8qcVCP21fjgcYH/hZm
 LlfwIQcgJpxJdPE5eMmnfM7KvigBOAch+D7lF/77IruTVTQWwH39c5VaQnTOxv45Y9NS
 +FP7Y10EnVLMmPCp8oaPWKSkU+pJiN2ymrrDGoA8TsZnUw6lQw8amORqA7lhWrn4WPFP
 aQlg==
X-Gm-Message-State: APjAAAUOl1nCQUoUERN8DjRj2sW9RXVDlzvyLcYLolkZrPX/tZxQEudh
 +wLlnn/FRP7pL33Hk2l/C18Zzw==
X-Google-Smtp-Source: APXvYqzXqyClKV+30R8z873rEjLc4Beyh8vmLsOOTAxrD/X3bYHGZ9C6iQzc5VyoF28co1edkmgw4w==
X-Received: by 2002:a2e:9d4a:: with SMTP id y10mr8772088ljj.181.1569764345778; 
 Sun, 29 Sep 2019 06:39:05 -0700 (PDT)
Received: from [192.168.53.116] (h77-53-209-86.cust.a3fiber.se. [77.53.209.86])
 by smtp.gmail.com with ESMTPSA id b20sm2281614ljo.106.2019.09.29.06.39.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Sep 2019 06:39:05 -0700 (PDT)
Subject: Re: [PATCH 1/1] ubi: Allow ubiblock devices nodes to be created by
 volume name instead of volume ID.
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Emil Lenngren <emil.lenngren@gmail.com>
References: <CAF_dkJA2DFr3Vgk5ie=V5YitZr8HaiXWuQ+SKsHzzmLBFnhyeg@mail.gmail.com>
 <23922253.ayd0uQntjt@blindfold>
 <CAO1O6se0aPh2FScDStqrK50PPipBbsgEnEPbMHvOdXt2cbxtvA@mail.gmail.com>
 <CAFLxGvxoR2kWoEz38QfO2sZDh4=4KXHBm9OrzXAQJWAR8Shmew@mail.gmail.com>
 <CAO1O6sdEw2xjmKQFEA6YXE5vLAtd90ew4t_zynRUvK_ZztDp0w@mail.gmail.com>
 <CAFLxGvxT3qDJT+7T4DQOq2j45OPV1AuvErEaYfpLP6SH7LX0OQ@mail.gmail.com>
From: Jan Kardell <jan.kardell@telliq.com>
Message-ID: <4f21d331-0ce9-b41e-e297-1f61fd3dcea8@telliq.com>
Date: Sun, 29 Sep 2019 15:39:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 SeaMonkey/2.49.4
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxT3qDJT+7T4DQOq2j45OPV1AuvErEaYfpLP6SH7LX0OQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190929_063911_483837_41710FB1 
X-CRM114-Status: GOOD (  15.93  )
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
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>, Patrick Doyle <wpdster@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Richard Weinberger skrev:
> On Wed, Aug 28, 2019 at 3:39 PM Emil Lenngren <emil.lenngren@gmail.com> wrote:
>> Will this really work when passing the rootfs to the kernel command
>> line like "root=/dev/ubiblock0_rootfs"? If the udev rules that set up
>> the symbolic link /dev/ubiblock0_rootfs are stored in a file on the
>> rootfs itself, I guess that symlink can't be made available before the
>> rootfs is mounted...
> No, this will not work directly from the kernel command line.
> For any kind non-trivial root you need an initramfs,
> that's the whole point of initramfs. :-)
>

I have this on my cmdline:

root=ubi0:rootfs rw ubi.mtd=rootfs,2048 rootfstype=ubifs

Maybe a bit confusing that both the MTD partition and the UBI volume are 
named rootfs:-) The board uses a very old 3.14 kernel from OpenWrt, I 
believe the MTD parts is vanilla. Doesn't this work on a more recent kernel?

//Jan

-- 

"I have always wished for my computer to be as easy to use as my telephone; my wish has come true because I can no longer figure out how to use my telephone."
- Bjarne Stroustrup


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
