Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agW4D-0002cX-9Z
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 11:26:14 +0000
Subject: Re: UBIFS question
To: Martin Townsend <mtownsend1973@gmail.com>
References: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
 <CAFLxGvwwQgKNT6=cL_hc05ZODtWyonA8MWyRWQJN_pXVf9SZOQ@mail.gmail.com>
 <CABatt_w_hXqUA45-MzU3_DRox0P9CwraTCY_TYPthdA3O0N-eQ@mail.gmail.com>
 <56EA7148.7050008@nod.at>
 <CABatt_xRMWwByY2nE8cpcjOL2jgt4yMhH9Gm4cWkxG_uhO7T5A@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56EA943C.4000505@nod.at>
Date: Thu, 17 Mar 2016 12:25:48 +0100
MIME-Version: 1.0
In-Reply-To: <CABatt_xRMWwByY2nE8cpcjOL2jgt4yMhH9Gm4cWkxG_uhO7T5A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Martin,

Am 17.03.2016 um 12:16 schrieb Martin Townsend:
>>> 2) One thing I'm going to have to do is write a background thread to
>>> monitor the status of the filesystem and try and detect corruption
>>> before the system becomes unstable, is there any way to find out the
>>> validity of the LEBs, ie checking their checksums.
>>
>> So, what exactly is the error scenario you have in mind?
>> If the SLC NAND behaves correctly UBIFS can deal with all kinds
>> of errors.
>> Of course UBI (and UBIFS) is not a magic bullet, if a NAND block
>> turns bad all of a sudden there is nothing it can do for you.
>> But this NAND would also not be with in the spec...
>>
>> It is not clear do me what this background thread should achieve.
> 
> We expect the flash devices to start failing quicker than normally
> expected due to the environment in which they will be operating in, so
> sudden NAND blocks turning bad will eventually happen and what we
> would like to do is try and capture this as soon as possible.
> The boards are not accessible as they will be located in very remote
> locations so detecting these failures before the system locks up would
> be an advantage so we can report home with the information and fail
> over to the other filesystem (providing that hasn't also been
> corrupted).

Dealing with sudden bad NAND blocks is almost impossible.
Unless you have a copy of each block.
NAND is not expected to gain bad blocks without an indication like
correctable bitflips.

Thanks,
//richard
