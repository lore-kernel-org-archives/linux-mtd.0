Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444DDEB64DD
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Jun 2023 13:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uY5wr1kzmAEi/PaV+tnfbZlvjhu5D7bxhixs21vHkM0=; b=4BpdIKYKpRBoyL
	z3UMCXiv3FIB1RluvpgPa9ZsZuDb5Qr+rqUzDCF6+hxxhHtsgqFCx6H6sOJl3ZF/U916fc2PusKj9
	Bi+UkTuTFVgz6c1fNI5CEDbuMVP7nRbviYV+T5Kb+P92bZcOZV63EN39+joV/3Cpt/QjGE/af3+g6
	b7FPf9N8ypYBjI6p3s0dfmY8kkb8nSofI5xVMm7JviqOCJ8TRRMf2SI8XuMZQRzfFB4snotQSSYoo
	qztCFSt7cq2tsEUsFvVzzfugF0kYfLvehMqKVtpjR2cBoPXr7WC3Bb49MHUoNGyJAUjW86TNlxRi8
	Hprs4HCd2iFJsiRdMnRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCKls-000rOk-20;
	Thu, 22 Jun 2023 13:54:48 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCKlp-000rO0-37
	for linux-mtd@lists.infradead.org;
	Thu, 22 Jun 2023 13:54:47 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-668709767b1so3524453b3a.2
        for <linux-mtd@lists.infradead.org>; Thu, 22 Jun 2023 06:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687442085; x=1690034085;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U9uei6ikJRas22Hwp4mZTaUlT0qL8iBQnmHCBvfcXwE=;
        b=Kw978Z23e+L9swbJ/qPhWDxzJV/G86Wx25DJn0cTKvNiYACrmzp7BPZctuPoub+e7A
         SzHfOnzp5yXISP7WfuVH7apwXlXoU8dBq93wopAFKfrK5PVe5ABShZf4FdHPVkf0G/5o
         oUto5fvdibM432uwNFHFOLEQuBPwhbRg5i/mBJQ/KO5gRMtcXB8nuNoNjx66SQoEjU5a
         qbvyJUojUiTFgAn3KuQ72WAr12vm3uPfSN57MMrQLtBsvX0b2Ao5XzzTJhV9gCwAqTaZ
         TdI7VmpmMdYjeY+FaqUxH/p8idBD432Qz3d9XcrxyTFIPn14OQGqUpU4mfg8+YmvwVt6
         M6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687442085; x=1690034085;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U9uei6ikJRas22Hwp4mZTaUlT0qL8iBQnmHCBvfcXwE=;
        b=PWN23/+yS60nG0D+etQ78qLDFyun/Cbnc7Tw1Usen5NlRccoGeW8uEmu5phRtPCi9V
         BR3XLbDsW96rhbZiQv8qyH82z+OwnQsmDOG4Wce0ZS9iKm/sZBhIz4HD4JCwyz9/j2hg
         54Y1Mi7OBv3mvZNWdhpYjG2+3dLiy8+DEM9uM8MgCCcB0dRM/5n7lX4Xf6daFp7olATa
         YdUIBUnaMu6+zXMnoxpa0AfMJpClvWxHhl/lSNxNElCrH3PnlNREy4FMa6XOuSnCMYRV
         YPl258X7I7M6qVhQC9TQd7RoWbIFze7zkWv6rIecahhVF07IgRPS6n0c2BIy3OpcIH63
         LKVw==
X-Gm-Message-State: AC+VfDzHdC9Y1qAXVf3XWRgmpDiVWIi2moV0XYiWAUkvo1su4ZdjiV1P
	pMgZbeZWL165r6U9K/f2VJU=
X-Google-Smtp-Source: ACHHUZ4VL42ePsHWyAuI2cunIMNJN+2l9+MrvWkXvb25dMA29+z9x10vrON9kyt3JVkzTTwIqmP7Hw==
X-Received: by 2002:a05:6a00:b83:b0:668:6eed:7c1b with SMTP id g3-20020a056a000b8300b006686eed7c1bmr15157991pfj.14.1687442084782;
        Thu, 22 Jun 2023 06:54:44 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n4-20020a635904000000b00553b9e0510esm4778946pgb.60.2023.06.22.06.54.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jun 2023 06:54:43 -0700 (PDT)
Message-ID: <8e6c8365-5c2b-2bad-bf3c-df2d65cc8afa@roeck-us.net>
Date: Thu, 22 Jun 2023 06:54:41 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Mike Snitzer <snitzer@kernel.org>,
 Joern Engel <joern@lazybastard.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-15-hch@lst.de>
 <8c1992bc-110a-4dad-8643-766c14bf6fd4@roeck-us.net>
 <20230622035149.GA4667@lst.de>
 <2205ef1e-9bb6-fb1e-9ca3-367c1afe12ac@roeck-us.net>
 <20230622060001.GA8351@lst.de>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 14/24] init: clear root_wait on all invalid root= strings
In-Reply-To: <20230622060001.GA8351@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_065446_002395_DB58C8C8 
X-CRM114-Status: GOOD (  21.29  )
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

On 6/21/23 23:00, Christoph Hellwig wrote:
> Hi Guenter,
> 
> can you try this patch?
> 
> diff --git a/block/early-lookup.c b/block/early-lookup.c
> index a5be3c68ed079c..66e4514d671179 100644
> --- a/block/early-lookup.c
> +++ b/block/early-lookup.c
> @@ -174,7 +174,7 @@ static int __init devt_from_devname(const char *name, dev_t *devt)
>   	while (p > s && isdigit(p[-1]))
>   		p--;
>   	if (p == s || !*p || *p == '0')
> -		return -EINVAL;
> +		return -ENODEV;
>   
>   	/* try disk name without <part number> */
>   	part = simple_strtoul(p, NULL, 10);

Not completely. Tests with root=/dev/sda still fail.

"name" passed to devt_from_devname() is "sda".

        for (p = s; *p; p++) {
                 if (*p == '/')
                         *p = '!';
         }

advances 'p' to the end of the string.

         while (p > s && isdigit(p[-1]))
		p--;

moves it back to point to the first digit (if there is one).

         if (p == s || !*p || *p == '0')
		return -EINVAL;

then fails because *p is 0. In other words, the function only accepts
drive names with digits at the end (and the first digit must not be '0').

I don't recall how I hit the other condition earlier. I have various
"/dev/mmcblkX" in my tests, where X can be any number including 0.
Maybe those fail randomly as well.

Overall I am not sure though what an "invalid" devicename is supposed
to be in this context. I have "sda", "sr0", "vda", "mtdblkX",
"nvme0n1", "mmcblkX", and "hda". Why would any of those not be eligible
for "rootwait" ?

In practice, everything not ending with a digit, or ending with
'0', fails the first test. Everything ending with a digit > 0
fails the second test. But "humptydump3p4" passes all those tests.

Guenter

---
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

#define EINVAL1	1
#define EINVAL2	2
#define EINVAL3	3
#define ENODEV	4

static int devt_from_devname(const char *name)
{
         int part;
         char s[32];
         char *p;

         if (strlen(name) > 31)
                 return EINVAL1;

         strcpy(s, name);
         for (p = s; *p; p++) {
                 if (*p == '/')
                         *p = '!';
         }

         /*
          * Try non-existent, but valid partition, which may only exist after
          * opening the device, like partitioned md devices.
          */
         while (p > s && isdigit(p[-1]))
                 p--;
         if (p == s || !*p || *p == '0') {
                 return EINVAL2;
         }

         /* try disk name without <part number> */
         part = strtoul(p, NULL, 10);
         *p = '\0';

         /* try disk name without p<part number> */
         if (p < s + 2 || !isdigit(p[-2]) || p[-1] != 'p') {
                 return EINVAL3;
         }
         return ENODEV;
}

char *devnames[] = {
     "sda",
     "sda1",
     "mmcblk0",
     "mmcblk1",
     "mtdblk0",
     "mtdblk1",
     "vda",
     "hda",
     "nvme0n1",
     "sr0",
     "sr1",
     "humptydump3p4",
     NULL
};

int main(int argc, char **argv)
{
	char *str;
	int i;

	for (i = 0, str = devnames[0]; str; str = devnames[++i]) {
	    printf("%s: %d\n", str, devt_from_devname(str));
	}
}


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
