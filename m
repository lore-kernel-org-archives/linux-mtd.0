Received: from mail1-a.eqx.gridhost.co.uk ([95.142.156.16])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zg8bs-000559-LJ
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2015 09:51:09 +0000
Received: from [209.85.212.181] (helo=mail-wi0-f181.google.com)
 by mail1.eqx.gridhost.co.uk with esmtpsa (UNKNOWN:AES128-GCM-SHA256:128)
 (Exim 4.72) (envelope-from <cybergibbons@cybergibbons.com>)
 id 1Zg8bB-0005Hs-9i
 for linux-mtd@lists.infradead.org; Sun, 27 Sep 2015 10:50:25 +0100
Received: by wiclk2 with SMTP id lk2so66456430wic.1
 for <linux-mtd@lists.infradead.org>; Sun, 27 Sep 2015 02:50:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5607AD39.60305@nod.at>
References: <CAK__sc6BFSMu6+NjTkT9xsqdjA+H=Df9nw=ajTmfuRmn4Hz3+A@mail.gmail.com>
 <CAFLxGvwtq9WF3SL_ZaAYHMsvi4g3B29XwRddKvPyu2YDz2P-hA@mail.gmail.com>
 <56075420.5080303@cn.fujitsu.com>
 <CAK__sc7xduxq62DVw6fQeNZtXeYbzDmmjw3ms2b8ZgF96j6bhQ@mail.gmail.com>
 <5607AD39.60305@nod.at>
Date: Sun, 27 Sep 2015 10:50:25 +0100
Message-ID: <CAK__sc5srnm6_Pe9e_f+YTtGdgGv65Sw2Nh3N2tiBdcTo1SOWw@mail.gmail.com>
Subject: Re: UBIFS recovery/forensics tools
From: Andrew Tierney <cybergibbons@cybergibbons.com>
To: Richard Weinberger <richard@nod.at>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
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

Richard,

Yes - let me just see how big it is compressed and get it uploaded
somewhere appropriate.


Andrew

On 27 September 2015 at 09:47, Richard Weinberger <richard@nod.at> wrote:
> Am 27.09.2015 um 10:37 schrieb Andrew Tierney:
>> I suspect a fsck utility will work quite well for a number of these.
>>
>> I guess the real issue is that as soon as any piece of data deviates
>> from the norm, current tools fall over rather than attempting to
>> recover. ubi_reader has verbose output that allows some degree of
>> tweaking, but it can still be awkward.
>>
>> The current issue I am working on is that I have one image with two
>> volumes contained within. The first volume can be recovered fine, but
>> the second starts walking the index, reads a common header, an ino,
>> and then stops. I can observe significant data in the remainder of the
>> file. There is no other location on the system for a root directory,
>> so I suspect that the index is being misread. I don't yet know enough
>> about UBIFS to describe the issue better.
>
> Can you share the image?
>
> I hope I have something sane to release soon.
> ...being still busy with rebasing my preliminary tool to Yang's tree
> and found some issues.
>
> Thanks,
> //richard
