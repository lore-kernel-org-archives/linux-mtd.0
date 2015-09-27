Received: from mail1-a.eqx.gridhost.co.uk ([95.142.156.16])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zg7Tj-0007hH-SO
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2015 08:38:41 +0000
Received: from [209.85.212.173] (helo=mail-wi0-f173.google.com)
 by mail1.eqx.gridhost.co.uk with esmtpsa (UNKNOWN:AES128-GCM-SHA256:128)
 (Exim 4.72) (envelope-from <cybergibbons@cybergibbons.com>)
 id 1Zg7T1-0003ma-26
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2015 09:37:55 +0100
Received: by wiclk2 with SMTP id lk2so65379988wic.1
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2015 01:37:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <56075420.5080303@cn.fujitsu.com>
References: <CAK__sc6BFSMu6+NjTkT9xsqdjA+H=Df9nw=ajTmfuRmn4Hz3+A@mail.gmail.com>
 <CAFLxGvwtq9WF3SL_ZaAYHMsvi4g3B29XwRddKvPyu2YDz2P-hA@mail.gmail.com>
 <56075420.5080303@cn.fujitsu.com>
Date: Sun, 27 Sep 2015 09:37:54 +0100
Message-ID: <CAK__sc7xduxq62DVw6fQeNZtXeYbzDmmjw3ms2b8ZgF96j6bhQ@mail.gmail.com>
Subject: Re: UBIFS recovery/forensics tools
From: Andrew Tierney <cybergibbons@cybergibbons.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I suspect a fsck utility will work quite well for a number of these.

I guess the real issue is that as soon as any piece of data deviates
from the norm, current tools fall over rather than attempting to
recover. ubi_reader has verbose output that allows some degree of
tweaking, but it can still be awkward.

The current issue I am working on is that I have one image with two
volumes contained within. The first volume can be recovered fine, but
the second starts walking the index, reads a common header, an ino,
and then stops. I can observe significant data in the remainder of the
file. There is no other location on the system for a root directory,
so I suspect that the index is being misread. I don't yet know enough
about UBIFS to describe the issue better.



On 27 September 2015 at 03:27, Dongsheng Yang
<yangds.fnst@cn.fujitsu.com> wrote:
> On 09/25/2015 06:26 PM, Richard Weinberger wrote:
>>
>> On Fri, Sep 25, 2015 at 11:29 AM, Andrew Tierney
>> <cybergibbons@cybergibbons.com> wrote:
>>>
>>> Hello all,
>>>
>>> I am a reverse engineer, and I am finding that UBIFS is becoming
>>> increasingly common on embedded devices. A common task is recovering
>>> file systems from locked down or damaged devices, and I'm finding this
>>> very challenging with UBIFS!
>>>
>>> I have seen talk on here of userspace tools to recover damaged UBIFS
>>> systems. Did anything every come of this? I am currently using "ubi
>>> reader" ( https://github.com/jrspruitt/ubi_reader ) with some success.
>>
>>
>> We're currently working on such tools.
>> Stay tuned.
>
>
> Yes, there is already a RFC for ubifs_dump tool,
> http://lists.infradead.org/pipermail/linux-mtd/2015-August/061201.html
>
> fsck.ubifs is in developing. Andrew, do you want something like that?
>
> Yang
>>
>>
>
