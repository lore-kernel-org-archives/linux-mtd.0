Return-Path: <SRS0=aH78=MN=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1EDEC12002
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 15:24:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CAB161019
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jul 2021 15:24:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CAB161019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rvzcWvtNzZZ3quph2VVg3oSwl69qWlMVeXzmH2W3Z3s=; b=KuZ+zXWQ4rHxhC
	krX3XqW1rOszvIu1yutirLANOBueOEeD/G9UAH5KyJUo5gH7RVJ/m0pbQPY54WBwyS9lZmJOUA8uR
	kDJmZuxlwj9mnYwG5KZasdHM39gvUa4ACjTK7alKnhujo9nROnPI47e23FNcHZUm41jhjOzvcFhgk
	L8+tu3S1p7x5zedh0kT5TYqdUdnmEENYObbJlFmlh8swHqyIj+dkbKftyVGSTpRyo5rQTzKmHT1O8
	0pFfDe6l8Im30JsUybHWy9eSYxotYTVbljitOKfeRnQQGySWn/YtqIuovauYjz/ROtZUEpFh79hK3
	B21kEvh9Yl6X3tx5A8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6E4s-00GHeI-ML; Wed, 21 Jul 2021 15:24:06 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6DiP-00G9JS-Gl
 for linux-mtd@lists.infradead.org; Wed, 21 Jul 2021 15:00:55 +0000
Received: by mail-ed1-x531.google.com with SMTP id k27so2766168edk.9
 for <linux-mtd@lists.infradead.org>; Wed, 21 Jul 2021 08:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3QH0L1galc4dXmyAjj6SONbiSv0qVq6f5DQ4NUtGEno=;
 b=ksK3cQEkcbM2A1jLvr4UuKTvyNMRVEzp0tvWg8di9oPfOkQHQy6xwZLfWylwgHXeky
 zT5+pr/Vo1E5ZvqpCBJ76fS1+G1yypiU54zm2N54vDXPS4tmEzVUY1Xhl8/gOc3dOq/Z
 DOmdcOMb6d85MqtiR8FoXDdcafAr+rlf+lWJ5C0q+TGyAfHgwVZa6hDATsFxBTdOX4qj
 xZC16RQwxKt+eCQdTc47xPXWJD+ObiE8Z0zUEoI7M2Q3WT5Rt/dZTDxr75xcq1E1ey8i
 kcqOU0q8BmVtpv3lBZR396OEXoDJtCUMwPIpQX4BxHiNydCqSlzCcjiSURY1NtDsvfxI
 ZZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3QH0L1galc4dXmyAjj6SONbiSv0qVq6f5DQ4NUtGEno=;
 b=Z/XX2qDslpxgrCd0AlxWk0oBVaGd1meSymGoZ45paVYimZxXG9mfMXLucgzx8QlQgz
 WPAkeVrgEuTffT2h6dFrxZ7FJOZg3366A2tnOUhCyIUzf1CdLC+6NR0ZpAqc0yA+X96F
 VUEBPw62jZhbu58nsfzieLwfG+90PLJ36xRM5k1OoZdCMRruxZvqC6Y9oYEfNdYoyVEX
 QL9GBB9JmyCQk8YEY2GY595FavE0MKU50a7xHA3GyAHEHlKNzpb5liVTazVnsLG042ij
 IzotqazgjCub8fdrAwEyxC3AuLdADdy3VG3bhlynhasEme8G1zuL0ZIk3VoZ86iwsvgQ
 0rTA==
X-Gm-Message-State: AOAM533DvqvaZYuPxqF7oB1F8BUFg3Sv50Vg4pDvKr5bmmo1F31RFXJJ
 xiwnjIvN4KVVgKrk4Xt3aJxnn6iWUQInlV0aWVs=
X-Google-Smtp-Source: ABdhPJwsdM7NhMOEPZ+TG7bCz9J7fuNtMI27TGWdC6n7lbhoBMHBK0YuVNjfgWVfOXR7v0uUr3SK5Qg0rxNOhwip2XI=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr47901608edv.230.1626879650292; 
 Wed, 21 Jul 2021 08:00:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAOuPNLhqSpaTm3u4kFsnuZ0PLDKuX8wsxuF=vUJ1TEG0EP+L1g@mail.gmail.com>
 <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
In-Reply-To: <alpine.LRH.2.02.2107200737510.19984@file01.intranet.prod.int.rdu2.redhat.com>
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Wed, 21 Jul 2021 20:30:38 +0530
Message-ID: <CAOuPNLhh_LkLQ8mSA4eoUDLCLzHo5zHXsiQZXUB_-T_F1_v6-g@mail.gmail.com>
Subject: Re: Kernel 4.14: Using dm-verity with squashfs rootfs - mounting issue
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: open list <linux-kernel@vger.kernel.org>,
 Phillip Lougher <phillip@squashfs.org.uk>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 dm-devel@redhat.com, Kernelnewbies <kernelnewbies@kernelnewbies.org>,
 agk@redhat.com, 
 snitzer@redhat.com, shli@kernel.org, Sami Tolvanen <samitolvanen@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210721_080053_664653_55E050E1 
X-CRM114-Status: GOOD (  12.31  )
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

On Tue, 20 Jul 2021 at 17:12, Mikulas Patocka <mpatocka@redhat.com> wrote:
>
> Hi
>
> Try to set up dm-verity with block size 512 bytes.
>
> I don't know what block size does squashfs use, but if the filesystem
> block size is smaller than dm-verity block size, it doesn't work.
>
Okay thank you so much for this clue,
It seems we are using 65536 as the squashfs block size:
==> mksquashfs [...] - comp xz -Xdict-size 32K -noI -Xbcj arm -b 65536
-processors 1

But for dm-verity we are giving block size of 4096
==> [    0.000000] Kernel command line:[..] verity="96160 12020
d7b8a7d0c01b9aec888930841313a81603a50a2a7be44631c4c813197a50d681 0 "
rootfstype=squashfs root=/dev/mtdblock34 ubi.mtd=30,0,30 [...]
root=/dev/dm-0 dm="system none ro,0 96160 verity 1 /dev/mtdblock34
/dev/mtdblock39 4096 4096 12020 8 sha256
d7b8a7d0c01b9aec888930841313a81603a50a2a7be44631c4c813197a50d681
aee087a5be3b982978c923f566a94613496b417f2af592639bc80d141e34dfe7"

Now, we are checking by giving squashfs block size also as 4096

In case, if this does not work, what else could be the other option ?
Can we try with initramfs approach ?

Thanks,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
