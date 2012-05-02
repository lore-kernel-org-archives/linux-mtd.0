Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SPc8P-0007Hz-14
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 16:10:40 +0000
Message-ID: <4FA15C73.2020606@parrot.com>
Date: Wed, 2 May 2012 18:10:27 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
In-Reply-To: <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thilo Fromm a écrit :
> Hello, Richard,
> 
> [ MTD read might return bad blocks ]
>>>> One way is to use a file system intended for flashes, but mount it
>>>> read-only. I.e. use a jffs2 filesystem, mounted readonly.
>>>
>>> Yupp, or I coud hack up SquashFS to be bad blocks aware. However, it
>>> feels kind of wrong to me to leave bad block handling to the file
>>> system layer. Because I would have to provide bad block awareness to
>>> every read-only FS I am planning to use. Over and over again.
>>
>> I principally agree, however, jffs2 is doing just that, managing bad blocks.
>> Whether that is a good idea or not is debatable of course. Technically it
>> mixes up file system and device properties. Also, you might not plan to
>> change read-only FS's very often so the effort might be quite minimal in
>> practice.
> 
> It still feels like the wrong place to do this. Every FS would just
> skip this block, and be done with it.

There also bit-flip handling that ubi manage, but other fs don't handle.
And with newer nand, bit-flip happen sooner.

> 
> Apart from the fact that my NAND SW stack will then be two layers
> higher than it actually needs to be (and the added complexity this
> brings to boot loader and kernel) -  as far as I know UBI does not
> provide the functionality we require: being able to store a read-only
> file system image, and mount it at boot time. At least we don't get
> this without another boot step (initrd, see above).
> 
gluebi + mtdblock_ro doesn't work ?



Matthieu
