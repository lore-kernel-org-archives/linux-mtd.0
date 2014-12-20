Received: from mail-wg0-x232.google.com ([2a00:1450:400c:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y2Axd-0001hm-Fv
 for linux-mtd@lists.infradead.org; Sat, 20 Dec 2014 03:44:10 +0000
Received: by mail-wg0-f50.google.com with SMTP id a1so2796558wgh.37
 for <linux-mtd@lists.infradead.org>; Fri, 19 Dec 2014 19:43:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvx=a89_B-rAjwLT6esMzYgJ5E=t24wP3Yo_8w=9x52HVQ@mail.gmail.com>
References: <CAOx4H9CgOoxu82M9cpmFcRdfn=n7mQOwOVzVqvhdUiyzddEPSw@mail.gmail.com>
 <CAFLxGvx=a89_B-rAjwLT6esMzYgJ5E=t24wP3Yo_8w=9x52HVQ@mail.gmail.com>
Date: Sat, 20 Dec 2014 11:43:47 +0800
Message-ID: <CAOx4H9Ds5_ZSwwKRGcEzJc_k+CTeGyeeWRWAyo5mHV5rVEnSCA@mail.gmail.com>
Subject: Re: Get error -74 (ECC error) during ubiattach
From: t kevin <kevint324@gmail.com>
To: Richard Weinberger <richard.weinberger@gmail.com>,
 linux-mtd@lists.infradead.org
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

Please see inline comments.

2014-12-19 21:49 GMT+08:00 Richard Weinberger <richard.weinberger@gmail.com>:
> On Fri, Dec 19, 2014 at 1:24 PM, t kevin <kevint324@gmail.com> wrote:
>> Hi all,
>>
>> I get below error message everytime when my box boots up.
>> It appears there is a ECC error. But such errors should be taken care
>> by UBI/UBIFS itself, right?
>
> No. If the MTD reports an uncorrectable ECC error UBI can do nothing.
>

So for uncorrectable ECC error ( e.g., bad block) the only way out is
to do a fresh ubiformat?
For device like harddisk you get bad blocks all the time, if it is not
in the critical sector things can be fixed as much as possible by fsck
so I was looking for something like fsck.ubifs.

>> Is it because the background thread "ubi_bgt2d" has not started yet so
>> no one could do the data scrubbing during ubiattach stage?
>
> UBI does scrubbing if it faces bit-flips (correctable ECC errors).
>
>> Is it possible to do something like a fsck.ubifs to fix this issue?
>
> No. PEB 404 is bad.
> Is it always the same block?

Yes, it is always the same block. What got me confused is below
message telling bad PEBs is still 0.
UBI: number of good PEBs:        1920
UBI: number of bad PEBs:         0
UBI: number of corrupted PEBs:   0


>
> I tend to remove the dump_stack() in this error path. It is a bit overkill.
>
> --
> Thanks,
> //richard

Thanks a lot
Kevin
