Received: from mail-ew0-f223.google.com ([209.85.219.223])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMkgJ-0006lF-V0
	for linux-mtd@lists.infradead.org; Mon, 21 Dec 2009 16:00:27 +0000
Received: by ewy23 with SMTP id 23so4508462ewy.4
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Dec 2009 08:00:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4B18F4B7.9050709@nokia.com>
References: <dbdb2ea60912030930ncd06dcfjbb149545728fa5d6@mail.gmail.com>
	<4B18F4B7.9050709@nokia.com>
Date: Mon, 21 Dec 2009 11:00:21 -0500
Message-ID: <dbdb2ea60912210800p79f9da15p4a369c8fb7a69c6@mail.gmail.com>
Subject: Re: how to properly calculate max-leb-cnt and vol_size for ubifs
From: twebb <taliaferro62@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>
>> I'm using ubifs for the first time and am confused about how to
>> calculate two parameters:
>>
>> "max-leb-cnt" for mkfs.ubifs
>> "vol_size" for ubinize cfg file
>>
>> How should "max-leb-cnt" be calculated? =A0In the examples, how is "-c
>> 2047" determined? =A0Should the max-leb-cnt calculation somehow include
>> the overhead calculated per the ubifs documentation page? =A0Should the
>> reserved PEBs (1% default for NAND flash) be somehow taken into
>> account?
>>
>> How should "vol_size" be calculated? =A0Is it simply max-leb-cnt *
>> LEB_size? =A0Should overhead somehow be included in this calculation
>> also?
>
> Have you read:
>
> http://linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt
>
> http://linux-mtd.infradead.org/faq/ubi.html#L_ubi_mkimg
>
> http://linux-mtd.infradead.org/doc/ubi.html#L_autoresize
>
>

I have, and I'm still pretty confused.  I just posted some additional
questions I'm hoping perhaps you or someone else may be able to help
with.

Thanks,
twebb
