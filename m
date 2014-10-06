Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbEx5-0000EW-Ia
 for linux-mtd@lists.infradead.org; Mon, 06 Oct 2014 20:32:16 +0000
Received: by mail-wi0-f176.google.com with SMTP id hi2so5839122wib.15
 for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2014 13:31:51 -0700 (PDT)
Received: from [192.168.0.2] ([95.237.235.75])
 by mx.google.com with ESMTPSA id k10sm18394482wjb.28.2014.10.06.13.31.50
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Mon, 06 Oct 2014 13:31:51 -0700 (PDT)
Message-ID: <5432FC35.7090207@gmail.com>
Date: Mon, 06 Oct 2014 22:31:49 +0200
From: Angelo Dureghello <angelo70@gmail.com>
MIME-Version: 1.0
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: UBI ECC errors on kernel 3.16.2
References: <542D18B6.3020906@gmail.com> <542D8AD5.5030704@gmail.com>
 <61e344ea352a9e20fef952b44b18ea74@pek-sem.com> <54325A9D.5060604@gmail.com>
 <5432F7CE.3010002@pek-sem.com>
In-Reply-To: <5432F7CE.3010002@pek-sem.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear pekon,

On 06/10/2014 22:13, pekon wrote:
> I'm not sure how mtd-utils use the arguments but following combination 
> worked for me to mount a UBI image without sub-pages.
> (1) mkfs.ubifs  -m (min-io-size=2048)   [-s (subpage-size=2048)]
> (2) ubinize     -m (min-io-size=2048)
> (3) ubiformat   -O 2048  (indicates that offset of volume-ID header 
> from start of block)
>
Sure, this is the combination i use too, that doesn't work with 
sub-pages write.
Sems kernel anyway consider sub-page (512) as available.
>
>> 2) So how does it works this subpages-write support if the nand flash
>> does not
>> supports subpages write ?
>>
> You can disable sub-page write by adding following in your driver probe.
> +    chip->options |= NAND_NO_SUBPAGE_WRITE
>
Thanks, would be more elegant your patch.
Anyway, i was expecting that mtd probe, on nand detection, to 
akcnowledge that
the nand donesn't have subpages, so to set automatically no subpages.

https://bugzilla.kernel.org/show_bug.cgi?id=85481


Thanks again for the help,

Regards
Angelo
