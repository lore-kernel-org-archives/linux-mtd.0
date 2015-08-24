Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTfnI-0000Hx-I5
 for linux-mtd@lists.infradead.org; Mon, 24 Aug 2015 00:39:25 +0000
Message-ID: <55DA663C.6080707@cn.fujitsu.com>
Date: Mon, 24 Aug 2015 08:33:00 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>, Ricard Wanderlof
 <ricard.wanderlof@axis.com>
CC: Linux mtd <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 vs. UBIFS compression
References: <alpine.DEB.2.02.1508211046210.10202@lnxricardw1.se.axis.com>
 <CAFLxGvw6dOG1Opwp8i9pW6o65HbYF-vu6iFpQmYOH_EMJqB2aA@mail.gmail.com>
In-Reply-To: <CAFLxGvw6dOG1Opwp8i9pW6o65HbYF-vu6iFpQmYOH_EMJqB2aA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/24/2015 02:03 AM, Richard Weinberger wrote:
> On Fri, Aug 21, 2015 at 11:00 AM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
>>
>> I came across something odd that I wasn't really expecting the other day.
>>
>> On a JFFS2 file system, we have a file that is 12.25 MB in size. When
>> written to an 8 MB partition, df reports that it occupies 5.9 MB. Writing
>> a second copy of the file fails because the file system is full. Fair
>> enough.
>>
>> On a similar UBIFS system (however in this case with a volume size of 32
>> MB), the same file is reported by df to have occupied 7.9 MB. Writing
>> multiple copies of the same file confirms that we can fit slightly more
>> than 4 copies of the same file on the file system (32 MB / 7.9 MB yields
>> 4.05), so 7.9 MB seems about right.
>>
>> Now I fully understand that getting df to report valid figures for
>> compressed file systems is guesswork at best, but don't JFFS2 and UBIFS
>> utilize the same compression algorithms? Consequently, the space used by
>> especially large files (where the overhead is small) should be essentially
>> the same for both file systems? If anything, one would expect that UBIFS,
>> being newer, would better at compression than JFFS2.
>>
>> So what are we seeing here, is UBIFS more conservative in reporting disk
>> usage, or is JFFS2 really better than UBIFS at file compression?
>
> Both support zlib and lzo. Did you setup UBIFS and JFFS2 with the same
> compression method?

Yes, and ubifs is using lzo by default while JFFS2 is using zlib by
default. lzo is faster than zlib in compression and decompression.
But zlib provides a better ratio than lzo. So as Richard suggested,
it's better to make sure you are using the same compressor in your
testing. Thanx for your interesting.

BTW, there is an option named as --favor-percent in mkfs.ubifs. Maybe
that could help to do a balance between these compressors for you.

Yang
> Also keep in meed to run "sync" before using "df" on UBIFS.
> Otherwise it will not write down to flash and report the uncompressed size.
>
> HTH
>
