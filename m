Return-Path: <SRS0=0QAq=P3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7786C433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 14:31:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EA46610F7
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Nov 2021 14:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5EA46610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=+i3bGjc0G5J395OGq+ebf9TzO/wSxDUHOGZD19Q11Rc=; b=h+4
	OEOv16beBVb7DANiU10f4tlCuRe/tn89OaFVfZSNl/94eUnkUFuqo774ugKKMmLqrawHgkb/8D/g6
	YgMufCQopSQpRUNueQwuNfn7nGPG/usdjZj0ireuMlBhpCDGw+O+HZQatLVjVuUZsdG7jjqS3PiuO
	0yvQwicxtvN1FoDs0HAJE3wI8KlLHSCoLgFrtp2ZIR35WXzs+y1KO9IdhQlPgRUU04aQ5PwQiMy8M
	bqssNzn1GeRum1ZasoAiN8WyJtU1wPMNKCPADBDuzDZBJ1ptKX1ihWPOW9Cl8LtRy3+TmqolVR5Q6
	hdxoS3eyIEADSJ2oS+7lRtKCvs+Ki/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk5g0-00GgFv-Ay; Mon, 08 Nov 2021 14:31:12 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk5fx-00GgFD-OU
 for linux-mtd@lists.infradead.org; Mon, 08 Nov 2021 14:31:11 +0000
Received: by mail-ed1-x52f.google.com with SMTP id ee33so63530180edb.8
 for <linux-mtd@lists.infradead.org>; Mon, 08 Nov 2021 06:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=w24kyLgv/+tRpo8I42SDBKmopyeaJ4ePm0P/HuK8v0E=;
 b=l53/lifRs1L0mG2kiETTRBZoz7tuhX3GfAlMA83P6/EM9J/SfWiCyNxfD0vjjMjRql
 nnMiiXKVxw9GzR5vOB5day8YfYg2RUJ7Bz6oNgahsA01Y3FoBKgdFvG+mEhFJEbTwnUD
 4zixvM+wmiM9SSJ4zEqFtwRoyCqTD12Ul5q7ZV3Rf2GcxBMKe7t57/gqG5jZViiNa9FZ
 XrW/j0WrpqNw/6jTHj9yeN5JG4pELl6o4tVANMEVPlg+1Y+inYSinG0UuhtubJ85nlMW
 /7Oh5ZEWltTX/VBTo0qVamuiuee7e1Sq2P1S0sCRJQ7x28GX2MQMc9TlGuVrwI6X13xO
 YXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=w24kyLgv/+tRpo8I42SDBKmopyeaJ4ePm0P/HuK8v0E=;
 b=TvLIESq0QTY8paCox7capF+d4LDZYHjHl9yJTcO7KmFUgAUYBBMzO6IGb29pKHfVxN
 okht4kfN138sQiBGEFZvacmwI8CT84Qe14uRh7tCFRLGVA31il7nwBuDy6T/lvr2l3AU
 lTlX7T7gG5pynkgtoWAMAmE4IeLTXYz4EMmrnVqac8wyGTEPmpZQ1KQyfeJxXLePvpBf
 WUIew5bVi8uP1oJDAu7isc0VcAN/FZ1CZJgIwWmZdYhJ19qaN0UHnmmGH/l+WkRSkr/V
 gbh4KQ0JxGdq9HrbZESMZ9T+JgvMNrCJna4Kvr1GBDG0HuY1iOXavpC100C90aQ7JOpv
 yrLQ==
X-Gm-Message-State: AOAM530CECDwbjOfmlZ/Eg+r/lMrJMPldMcv6TmGPrUasvPW65g8adJN
 obeuU+hJmQZsmUm1o3kT9qsaP7zJYWu6uoU5o3o=
X-Google-Smtp-Source: ABdhPJy+CUCy4DtJsFc1sFIUJC3eXz9pThsGdgn6pHpEYmaxe6UL4ZDtO5HI5J/PFwCYYvEgRPLHHE+FhZK20HJ79Gw=
X-Received: by 2002:a17:906:2ad2:: with SMTP id
 m18mr384079eje.64.1636381865427; 
 Mon, 08 Nov 2021 06:31:05 -0800 (PST)
MIME-Version: 1.0
From: Pintu Agarwal <pintu.ping@gmail.com>
Date: Mon, 8 Nov 2021 20:00:54 +0530
Message-ID: <CAOuPNLinoW5Cx=xbUcT-DB4RiQkAPpe=9hsc-Rkch0LxD0mh+Q@mail.gmail.com>
Subject: Kernel-4.14: With ubuntu-18.04 building rootfs images and booting
 gives SQUASHFS error: xz decompression failed, data probably corrupt
To: open list <linux-kernel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>, 
 linux-fsdevel <linux-fsdevel@vger.kernel.org>, dm-devel@redhat.com, 
 Phillip Lougher <phillip@squashfs.org.uk>,
 Mikulas Patocka <mpatocka@redhat.com>, 
 Richard Weinberger <richard@nod.at>, Florian Fainelli <f.fainelli@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_063109_827683_7F384B88 
X-CRM114-Status: GOOD (  10.37  )
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

Hi,
Here are few details.
* Linux Kernel: 4.14
* Processor: Qualcomm Arm32 Cortex-A7
* Storage: NAND 512MB
* Platform: Simple busybox
* Filesystem: UBIFS, Squashfs
* Build system: Linux Ubuntu 18.04 with Yocto build system
* Consists of nand raw partitions, squashfs ubi volumes.

What we are trying to do:
We are trying to boot dm-verity enabled rootfs on our system.
The images for rootfs were generated on Ubuntu 18.04 machine using
Yocto build system.

Issue:
Earlier, when we were using Ubuntu 16.04 to generate our images, the
system was booting fine even with dm-verity enabled.
Recently we switched to Ubuntu 18.04 build machine, and now with the
same changes we are seeing the below squashfs error, just after the
mount.
Note: with 18.04 also our rootfs is mounting successfully and
dm-verity is also working fine.
We only get these squashfs errors flooded in the boot logs:
{{{
....
[    5.153479] device-mapper: init: dm-0 is ready
[    5.334282] VFS: Mounted root (squashfs filesystem) readonly on device 253:0.
....
[    8.954120] SQUASHFS error: xz decompression failed, data probably corrupt
[    8.954153] SQUASHFS error: squashfs_read_data failed to read block 0x1106
[    8.970316] SQUASHFS error: Unable to read data cache entry [1106]
[    8.970349] SQUASHFS error: Unable to read page, block 1106, size 776c
[    8.980298] SQUASHFS error: Unable to read data cache entry [1106]
[    8.981911] SQUASHFS error: Unable to read page, block 1106, size 776c
[    8.988280] SQUASHFS error: Unable to read data cache entry [1106]
....
}}}

Note: For dm-verity wwe are trying to append the verity-metadata as
part of our rootfs image like this:
...
218 +    with open(verity_md_img, "rb") as input_file:
219 +        with open(sparse_img, "ab") as out_file:
220 +            for line in input_file:
221 +                out_file.write(line)
....

These changes work fine when we build it with Ubuntu 16.04.
So, we are wondering what could be the issue with Ubuntu 18.04 build ?

If there is any history about it please let us know.


Regards,
Pintu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
