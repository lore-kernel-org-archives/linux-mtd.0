Received: from mail-lf0-x232.google.com ([2a00:1450:4010:c07::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agVvN-0005xJ-VP
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 11:17:06 +0000
Received: by mail-lf0-x232.google.com with SMTP id l83so40181975lfd.3
 for <linux-mtd@lists.infradead.org>; Thu, 17 Mar 2016 04:16:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56EA7148.7050008@nod.at>
References: <CABatt_y2rOZAvuamVoOxWSzkkGXNFFGvSQ5di4gb4EBFGYV7oQ@mail.gmail.com>
 <CAFLxGvwwQgKNT6=cL_hc05ZODtWyonA8MWyRWQJN_pXVf9SZOQ@mail.gmail.com>
 <CABatt_w_hXqUA45-MzU3_DRox0P9CwraTCY_TYPthdA3O0N-eQ@mail.gmail.com>
 <56EA7148.7050008@nod.at>
Date: Thu, 17 Mar 2016 11:16:43 +0000
Message-ID: <CABatt_xRMWwByY2nE8cpcjOL2jgt4yMhH9Gm4cWkxG_uhO7T5A@mail.gmail.com>
Subject: Re: UBIFS question
From: Martin Townsend <mtownsend1973@gmail.com>
To: Richard Weinberger <richard@nod.at>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Thu, Mar 17, 2016 at 8:56 AM, Richard Weinberger <richard@nod.at> wrote:
> Martin,
>
> Am 17.03.2016 um 09:33 schrieb Martin Townsend:
>> Hi Richard,
>>
>> Thanks for the reply.  rsync is the backup plan, I just wanted to rule
>> other options out first. The flash devices are going to subjected to a
>> fairly harsh environment and the idea of being able to fail over to a
>> backup docker container was appealing.
>>
>> Which leads me to a couple of questions:
>> 1) I need to simulate flash devices reading corrupted
>> pages/blocks/LEBs. Is there currently a way of doing this? if not
>> would it be possible to write something, say a kernel module to sit
>> above the NAND driver to do this.  I just want to see what effect
>> corruption has on a live system and how these errors manifest
>> themselves.
>
> check out nandsim and UBI's debugfs. We have a lot of knobs to
> simulate such stuff.
>
I will take a look at nandsim and UBI debugfs.

>> 2) One thing I'm going to have to do is write a background thread to
>> monitor the status of the filesystem and try and detect corruption
>> before the system becomes unstable, is there any way to find out the
>> validity of the LEBs, ie checking their checksums.
>
> So, what exactly is the error scenario you have in mind?
> If the SLC NAND behaves correctly UBIFS can deal with all kinds
> of errors.
> Of course UBI (and UBIFS) is not a magic bullet, if a NAND block
> turns bad all of a sudden there is nothing it can do for you.
> But this NAND would also not be with in the spec...
>
> It is not clear do me what this background thread should achieve.

We expect the flash devices to start failing quicker than normally
expected due to the environment in which they will be operating in, so
sudden NAND blocks turning bad will eventually happen and what we
would like to do is try and capture this as soon as possible.
The boards are not accessible as they will be located in very remote
locations so detecting these failures before the system locks up would
be an advantage so we can report home with the information and fail
over to the other filesystem (providing that hasn't also been
corrupted).

Many Thanks,
Martin.

>
> Thanks,
> //richard
