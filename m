Return-Path: <SRS0=zn6r=KD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A08C433B4
	for <linux-mtd@archiver.kernel.org>; Sat,  8 May 2021 04:21:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 479E361151
	for <linux-mtd@archiver.kernel.org>; Sat,  8 May 2021 04:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 479E361151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yPC84EYnwbRYDOHU4oaJ5fliEb+cMzzPmzvRMN6e9EQ=; b=iUCUB1EstXgVTm
	QPaljmfe8WckpyBwLMnJdNWKxHuEvY+jDJWXiL0LXRRiWCxhuFwDTwTLetXOCycYE4c9NpErvhdJb
	LxUjHvjs3A7DJuRc1fSzMh5N3R4DHg7i9pS5J26NF36nEIO9ZhaAvQLWAFqc3RGDFikSvNCexVyjJ
	3QTv16T/RgxslWaBVp9KVzXebbXmroRYcWsfTGMT/TrYuzpMjNGBfRc84vnX6rLiqH20Pcihkndvl
	LHuu26jx/FQj1CdbJxkvDhceQeqrjjxOydLGOCWyxdDcr/p64hJEjfJSGuW9vCpWQMpMlQ6SEAOQZ
	myHyq1UrPcHZ1lGIF+/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfERu-008kp4-Ph; Sat, 08 May 2021 04:20:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfERq-008koW-Mc
 for linux-mtd@desiato.infradead.org; Sat, 08 May 2021 04:20:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:Subject:Message-ID:
 Date:From:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=XhCz49kVZoyLGR6HxZRsWHIsj+3xyx4yyjS73DaB2dw=; b=IeSUvXDAHXvaAe2FLF6UDrRPuy
 YdAkiGGaIsWDEUzIcmQuYjj3lRB+OFZbKuNiujr6Sjt1wzwPVELwUVJR99164+R8/4a93KWbPbKZd
 pMLYxdGsC5IGQQKbd+TPSrNAMrbEpZ19LAJVn2lR+CZ9eERCBsB8w6q5jXQO8xVkyzxcauLx3+/2T
 aiIcAzBujWiEAnUDz5jGK9T2HjaAKwl2Zg8YGYWHLr9hfxHE/+IQgk8mEhIW1K4FQe9wNB+mwkUCr
 0Y4CfHr5VjjlqQA714VL45uqMR3j6fVDddoMsCMeGXk+3l7LoW41vpXUcs8AHdoFcG/TRRbWSUFeI
 /wqBEw0w==;
Received: from mail-vk1-xa2a.google.com ([2607:f8b0:4864:20::a2a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfERo-007MH5-1B
 for linux-mtd@lists.infradead.org; Sat, 08 May 2021 04:20:13 +0000
Received: by mail-vk1-xa2a.google.com with SMTP id 31so1164475vkl.12
 for <linux-mtd@lists.infradead.org>; Fri, 07 May 2021 21:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=XhCz49kVZoyLGR6HxZRsWHIsj+3xyx4yyjS73DaB2dw=;
 b=cRZdIzWjzcdQ6eU7NOIZ65P4b1uAaniLorXhA5hzNHivRrIUqriWRxlh59MTQhWaWr
 vQiboU/eAVJUD+Bu1ODpblkIqiz1SZxCHyP2VEbXJn7cC6CDPdDwZxivucvO0FfX1AFZ
 dDWsz02lR9UpMvnrZqdY07wppZkYhN4OTMme26T7dhWloSOO4bsrkPtKrJNb8sBgoRoS
 UVL7SqORYD3fRn6+kYSwxhfDKKi5zJ8ND3UaCsKM41Kv7B4mwSTObPd84ewftM2fVoA8
 HqWGtZlVwJ8z4Y/o+vqM34Vy45bMf4yKJD9FUH3jMYFelJxT8rKXgKbCEK09OUMkipJj
 XF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=XhCz49kVZoyLGR6HxZRsWHIsj+3xyx4yyjS73DaB2dw=;
 b=cpA3wv8G31mlNBlR+6E/shXjDh3a6Fsk0ItNuODK7Nu9HHjEYgFVGjkVB3uQrGOm/J
 951VlTotPKg9DHYUNaX43E0ju4ooDHzmKimxy0IydcU/Rof9NhleAWlctAqSqb/8xRdt
 75aKXuqmvYiY7pJAWlHJdcPrL5cm8NXA9n82AeBUm51JMoo4m5rpnd0Te9IW9h/vNVJd
 Cl3xK/NVzgKVKd6SngkcsXa5MLrZPF3IVdw0wJD6YVxwG3zXenEGCy1n27r9fFad2yIc
 /eduauNTfpDF3hsX2Mam9mJ61k2bN8+isBQ4nBUyAcCrhVXhWmK5c6bZ6ymvB8fI4g13
 sQxQ==
X-Gm-Message-State: AOAM531Gu/vJnleXRzc2GH2iJEf/s/VqLiZ/CnaCxgHhjSK3gPJW5PMW
 fMmvAxBPO1zaTRAoev+/STumvJYKZ7+u9f/I5PbHohAUL18=
X-Google-Smtp-Source: ABdhPJxAosTd6AdIwmPXabvchWgA9kE8AViuMfqESMahcABbePZGO3ok0ef71FrkqWp9M3Ybu0NnI63hOuqkXsfbWkM=
X-Received: by 2002:a1f:160c:: with SMTP id 12mr10724546vkw.25.1620447609585; 
 Fri, 07 May 2021 21:20:09 -0700 (PDT)
MIME-Version: 1.0
From: kasi viswanathan <kviswanathan.83@gmail.com>
Date: Sat, 8 May 2021 09:49:58 +0530
Message-ID: <CAMmihzqVhm49oGCYbkFmCFaYAX57xU5yVZm6hn3OCmuk1jBSSg@mail.gmail.com>
Subject: NAND flash Write protection
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_212012_116427_A33B797A 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
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

Hi all,

In one of our current boards we are using Micron NAND flash of Size 512MB.
Sometimes the first page (4k) gets corrupted and the board gets bricked.

We have stored the bootloader at this location.

As a preventive measure we have added read-only and lock flags in the dtb entry.

My query is, Is it possible to lock a particular block of NAND flash
memory in linux ?
I understood after googling that a specific H/W pin support is needed
to achieve this "Power-Up  Read  Enable,  Lock/Unlock  Enable(PRL)"

If so can you pls let me know the pointers which i can check to work on this.

Thanks in advance,

Thanks,
Kasiviswanathan.V

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
