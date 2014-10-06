Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XbF0m-0003aX-FE
 for linux-mtd@lists.infradead.org; Mon, 06 Oct 2014 20:36:04 +0000
Received: by mail-wg0-f51.google.com with SMTP id b13so7591666wgh.10
 for <linux-mtd@lists.infradead.org>; Mon, 06 Oct 2014 13:35:42 -0700 (PDT)
Message-ID: <5432FD1C.7080608@gmail.com>
Date: Mon, 06 Oct 2014 22:35:40 +0200
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
Cc: pekon <pekon@pek-sem.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear Pekon,


> (1) mkfs.ubifs  -m (min-io-size=2048)   [-s (subpage-size=2048)]
> (2) ubinize     -m (min-io-size=2048)
> (3) ubiformat   -O 2048  (indicates that offset of volume-ID header 
> from start of block)
>
Yes, this is the configuration i alwaus used. But with this last kernel 
was not working.
>> 2) So how does it works this subpages-write support if the nand flash
>> does not
>> supports subpages write ?
>>
> You can disable sub-page write by adding following in your driver probe.
> +    chip->options |= NAND_NO_SUBPAGE_WRITE
>
Thansk, this is much more elegant.
Anyway, mtd probe should be able to detect that my flash (mt28f1g08abb) 
does not support
sub-pages.

I opened a bug.

https://bugzilla.kernel.org/show_bug.cgi?id=85481

Many thanks
Angelo
