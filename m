Return-Path: <SRS0=IJcR=NO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B84C4338F
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 14:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B11AD613AC
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Aug 2021 14:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B11AD613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ruIisSSrYNL/uM0gmNagYEkeCaVulO7M5YfgmZ0vaY=; b=Dn3VyXo5jnbo14
	hYwc5LhRJ+kcsbohI2GPqZH6f7B3gHtgSHKivkVBNeP1FIKFSHAX5vfALb9tcaxYVcuIlmaiVAfFC
	5HY6N37QqiCTQPfdlZ2paNI9ZgRpUomKNNv7nncLE1P9ZYr/fO6bg5A5hbyrRMn5Wx1Gb419nHB/6
	N2l0RQIWEAIzxH5kMZh6W4Z0t/22EBZdlC+PH7FkRVDXGtcgyBrNJdjJXRSUwbM4D6oaLYCKz8vAF
	4kBh4hg7/tdUx7njUXud6CUV0EtIqUWUTr5wYBOLzjdv+ikG0F06Q/H74M3GpiiH3ZXtPDxQ9cf44
	moipmE5BEWuP/a/xSe4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIAkf-00HCuh-IR; Mon, 23 Aug 2021 14:16:37 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIAkY-00HCrZ-Ky
 for linux-mtd@lists.infradead.org; Mon, 23 Aug 2021 14:16:36 +0000
Received: by mail-qk1-x731.google.com with SMTP id 22so19317821qkg.2
 for <linux-mtd@lists.infradead.org>; Mon, 23 Aug 2021 07:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mVV/F1yIspN9pwe7wVu7K1lHM6uOf9PUbo3fvoPR78k=;
 b=BHe5Uy77OInHLOm4iEIYrErWvk0WVVL/wJnxS2zd9iIxsSnJJ4Ryim0bf0wwqEKv9V
 OusQI7ap/FQQX7GN4DV6TZtIIXJZUp1wGpr0zjIXt477qquA98U8AzCoDmmdqHyPSSQO
 D7rXWJDl5RSZc3OnCgag96jN0Nrmf3npWdcRo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mVV/F1yIspN9pwe7wVu7K1lHM6uOf9PUbo3fvoPR78k=;
 b=udczRCHjLg6BHqfcjPtwglxY1Q8+hZ9VkbfVnd3bGJGrKX1NKcQfN+Qxl1AMj4G+tr
 eIqA6oA3ak3eUG1fVfrgR7RZvpuJg3cX6YdeP7D2QaWGwwOSup6RmrcixgJEf/Q0Xvd1
 T9IT4XaQWGC/5fd+RUMzdOyAeEto9n613PLsDgrT40Lf2/PPJ47LFD8J95p3clKhNmtg
 TQV6POwH+TOmEdZo/flyN4Iyzo+Ffx9KwJU3apqsW1IYHfaYUIpJZKfOLxYAuRk3M2Nk
 TY1Cpt3UjBmzNlXq+UG6TMteVYF76J0PuzDcFIXdGrbfk4xF04H+HEdEqZiAa3SZYFc7
 kLIQ==
X-Gm-Message-State: AOAM530mxe4jMryk23THs3+YDNDAG+7SCPyT62KKZMf8P8nbZtnAOjTd
 fArbcyaRuP8zWqglw9yYnTTHXRVbvtrSNiJS8qABOw==
X-Google-Smtp-Source: ABdhPJyWKRlQQofpj3Dewg6Zpl/82XJA0PNZcT2HQgaPxd1fZmUXKhh9E8s+3qwvLOL/tozROPLQ+SSik6PiTlAkHuE=
X-Received: by 2002:a05:620a:1210:: with SMTP id
 u16mr21437885qkj.390.1629728188209; 
 Mon, 23 Aug 2021 07:16:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210811084924.52293-1-daniel@0x0f.com>
 <20210816101143.2a64d7b9@xps13>
In-Reply-To: <20210816101143.2a64d7b9@xps13>
From: Daniel Palmer <daniel@0x0f.com>
Date: Mon, 23 Aug 2021 23:19:02 +0900
Message-ID: <CAFr9PXnna+b3ChVUftT7YbU1kYR=5JDcik3bMNqzKK-LW=GQzw@mail.gmail.com>
Subject: Re: [PATCH v3] mtd: spinand: add support for Foresee FS35ND0*G parts
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, richard@nod.at, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210823_071630_814603_59A8134E 
X-CRM114-Status: GOOD (  19.47  )
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

Hi Miquel,

> > +     /*
> > +      * The datasheet says *successful* with 4 bits flipped.
> > +      * nandbiterrs always complains that the read reported
> > +      * successful but the data is incorrect.
> > +      */
> > +     case FS35ND01G_S1Y2_STATUS_ECC_4_BITFLIPS:
> > +             return 4;
>
> This is a real issue. Can you use the nandflipbits tool from the
> mtd-utils package (you should take a recent version of the package) and
> try to observe what happens when you insert a 4th bitflip in a section?
>
> I generally believe the tool more than the datasheet :)

Maybe I'm using it incorrectly but I can't get a 4 bit flipped
situation to happen.

I erased the paged so it's all 0xFF:

# flash_erase /dev/mtd0 0x8000000 1
Erasing 128 Kibyte @ 8000000 -- 100 % complete
# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0
ECC failed: 0
ECC corrected: 6234
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|

Then used nandflipbits to flip a bunch of bits in the first byte and
then a few other bytes:

# nanddump --bb=dumpbad -s 0x8000000 -l 1 -c -p /dev/mtd0
ECC failed: 0
ECC corrected: 6246
Number of bad blocks: 0
Number of bbt blocks: 0
Block size 131072, page size 2048, OOB size 64
Dumping data starting at 0x08000000 and ending at 0x08000001...
ECC: 3 corrected bitflip(s) at offset 0x08000000
0x08000000: f0 ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000010: eb ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000020: ef ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000030: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000040: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000050: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|
0x08000060: ef ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff  |................|

Anyhow,
I think we should probably return -EBADMSG if the 4 bit flips status
appears as nandbiterrs always complains that the data is wrong.

Cheers,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
