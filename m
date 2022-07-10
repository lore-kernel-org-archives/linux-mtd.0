Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7734BC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 10 Jul 2022 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XMi16gdZwJaYT/qq6hFIdxHIAA8zm/hwWxFZY996Ir0=; b=ne7Rm4NkieTmO8gN3k5BFdPKir
	yRQm0s8lbdEFDNaVTNkMgImEFZmA5KA+5JH0SxxzjcSeD3IyIQO+twz+RTOOCjJIHN3hRYRDfoZTW
	1Dz5lMk4RXv1/f3qzxULoSV5JLFphu2gFsopM1M0p37LcGEt5/0i3uBcsMzqdPOxc6KaSIvhH4+/y
	52Q8x7IUeJzr0SUsdUaIhDwuIqCGs54taPkbEO5o1ybIUHH4s0LdqZtlqo63hdL9XI2UShZRFxHrb
	93+4z0GmjiyL/bETImfORrQnJyzTL3WZOGvoGsvR5/y24joTgu0QpCjP1FXaE2iVbc7yQwG9ryjGw
	El8Y6dQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAYkY-00CEZQ-Ed; Sun, 10 Jul 2022 15:21:34 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAYkU-00CEX1-Vx
	for linux-mtd@lists.infradead.org; Sun, 10 Jul 2022 15:21:32 +0000
Received: by mail-ej1-x62e.google.com with SMTP id h23so4999636ejj.12
        for <linux-mtd@lists.infradead.org>; Sun, 10 Jul 2022 08:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=JJy4tZxNBJ9IrsLJSm623GkXaTzCXAlzAOqeWvtXUI0=;
        b=W3k09HXepXTR1EQ0t9OoCFp1JkBuG7HtJx2lC9tZTwtIoUyCSOJW+PF9zMTZke9oQ+
         WKkn8iJNsX5mJj9UAoxz+B7uy6EHovyBzGN6XyCVciL4oUIgCmcG1BqPzbt6FwIPE4zY
         LuL/BknIQJAsN0dmsJWFNhGa8ueEjm1SXJq3pC+fHhBm15v9hAI4mtWrL0X9n11E2yCb
         XwopyYTgXj+Ky9oMY+4+b7OHbEgHPMaLYPmal72U0wQei8c6kqUG/UNutlxEZ5/1lZTR
         i5XjFpu7rLQyp0lMqypTufD/5R/G0UXsdHeTvMXVkN7paQfCmGREv/efs02Q/vtmYIM9
         zI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JJy4tZxNBJ9IrsLJSm623GkXaTzCXAlzAOqeWvtXUI0=;
        b=JKxl3Wi4FrGFXEmCCCOzAVsOH9ak3UhN1CxH/vUec4e+5xQ1/1g76ilUGhY+OymeB5
         JRLb6n15/rryuQxUQKzT8oyFOWvp+pkqbI4v+4jjgrui/mZjhDCvBSHKD3zC2IWOog+N
         Xa87HbeXHxHcFb50ON1XNPj88QbJnzDhJ4hpaq3mOafdQN0/FA2QeVr2q11eM8Y1KNME
         /WfhHWW2EX4sQ2opUwg7VVXQdFkRKaeuiN33C9KOP/zqfwV5JG79K2u6vP9LQ4iqQfEh
         Hxd3rXJGEs9Lh1Svsy6RW8F08wEaLs0d2J3iD5nDWFTtAiRtM7DOauDy+LJ5O4qccspg
         JbVQ==
X-Gm-Message-State: AJIora/h6+VG7aK8AHnkPboxBbNo+gkiSV7lEdFKCvFtTG/3A2lWtM9x
	0gGOVsPpmVrOltW3/3DYyjHWqBBbH5/2IG98
X-Google-Smtp-Source: AGRyM1vKHfHfa3HymmSQnbEdBlINlr+M5Mikxqa1zge+RmQ84CdTOJrigSl5L+URFks6256LFvUM3Q==
X-Received: by 2002:a17:907:7b95:b0:6f4:ff03:981a with SMTP id ne21-20020a1709077b9500b006f4ff03981amr14041556ejc.653.1657466485734;
        Sun, 10 Jul 2022 08:21:25 -0700 (PDT)
Received: from ?IPV6:2a0c:9a40:8070:0:aa3d:9b4d:b50e:e3db? ([2a0c:9a40:8070:0:aa3d:9b4d:b50e:e3db])
        by smtp.gmail.com with ESMTPSA id x17-20020aa7d6d1000000b0043a71775903sm2860879edr.39.2022.07.10.08.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Jul 2022 08:21:25 -0700 (PDT)
Message-ID: <09179d86-d304-7ef2-bd80-3aa7a97a87a7@sigma-star.at>
Date: Sun, 10 Jul 2022 17:21:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: mtd:<myname> mount syntax unique to jffs2 ?
Content-Language: en-US
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <e4e609da8c962c5c1b5d53137e9d112affb582cd.camel@infinera.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
In-Reply-To: <e4e609da8c962c5c1b5d53137e9d112affb582cd.camel@infinera.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_082131_358657_37BC1681 
X-CRM114-Status: UNSURE (   9.41  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Joakim,

On 7/7/22 16:56, Joakim Tjernlund wrote:
> Why does "mtd:myrootfs" work to mount jffs2 rootfs but not squashfs?
> What does squashfs need to support the same ?
> 

squashfs can only mount block devices and does not support
raw mtd partitions or ubi volumes directly.

There is an "mtdblock" driver, which provides a read-only
block device on top of an mtd partition. Squashfs can then
be mounted from that.

However, what you probably want is the "ubiblock" driver,
which emulates a read-only block device on top of an ubi
volume.

Using ubi underneath takes care of bit-flip handling and
wear leveling, which is still an issue with nand flash,
even when used in a read-only fashion.

Greetings,

David

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
