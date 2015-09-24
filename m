Received: from mail-wi0-f180.google.com ([209.85.212.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zf34u-0003it-22
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 09:44:36 +0000
Received: by wicfx3 with SMTP id fx3so104639045wic.0
 for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2015 02:44:14 -0700 (PDT)
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6aGFuZyk=?=
 <karlzhang@micron.com>
References: <20150917152240.757c9e90@bbrezillon>
 <1442503239.19983.18.camel@gmail.com> <20150917174642.0c983136@bbrezillon>
 <55FAEEB1.50401@nod.at> <55FBBA6E.9070203@dave-tech.it>
 <1442562845.19983.43.camel@gmail.com> <55FBDB8F.2040301@dave-tech.it>
 <D067BF0533BDBE4F821CF557AAAE78443B96AA67@NTXXIAMBX01.xacn.micron.com>
 <20150924094339.006ccbb7@bbrezillon>
Cc: Iwo Mergler <Iwo.Mergler@netcommwireless.com>,
 "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 "shuangshuo@gmail.com" <shuangshuo@gmail.com>,
 Andrea Scian <rnd4@dave-tech.it>, =?UTF-8?B?UWkgV2FuZyDnjovotbcgKHFpd2Fu?=
 =?UTF-8?Q?g=29?= <qiwang@micron.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Stefan Roese <sr@denx.de>
Message-ID: <5603C5EC.5000908@denx.de>
Date: Thu, 24 Sep 2015 11:44:12 +0200
MIME-Version: 1.0
In-Reply-To: <20150924094339.006ccbb7@bbrezillon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 24.09.2015 09:43, Boris Brezillon wrote:
>> 2. EC/VID header corruption
>> 	As Boris's excellent summary mentioned, "duplicate the EC header in the VID header", I also believe this is a good
>> 	solution to protect EC, and we are doing this and testing on MLC.
>> 	
>> 	For VID header, I think skip pages will waste too many capacity, and SLC mode conjugation with GC will make PE cycling higher.
>>
>> 	We are developing another solution to store VID info into other page's OOB area in its own block, because UBI does not
>> 	use OOB and ECC code always not use all OOB area.
>>
>
> Hm, using the OOB area to do that is not such a good idea IMO, and I see
> at least 2 reasons:
>
> 1/ You're supposing that you'll always have enough space to store the
> VID info (the header is currently taking 64 bytes, even if we could
> compress it by removing the padding), and this is not necessarily true
> (particularly with some NAND controllers which are allowing as much
> space as possible for ECC bytes).
>
> 2/ Most of the time ECC bytes are not protected (and even if some
> controllers are able to protect a few of them, we're not sure to have 64
> bytes of protected OOB bytes per page), which means you're writing
> something that can be corrupted by bitflips. I know that the header is
> protected by a CRC, but that won't help recovering the data, just let
> you know when the header is corruption.

And 3:
Only NAND provides an OOB area. Other flash devices like parallel
or SPI NOR don't. And we definitely want to continue supporting
platforms with such flash devices and UBI (and UBIFS).

Thanks,
Stefan
