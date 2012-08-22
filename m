Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T49Gh-0007OA-8u
 for linux-mtd@lists.infradead.org; Wed, 22 Aug 2012 11:38:43 +0000
Received: by lagu2 with SMTP id u2so456551lag.36
 for <linux-mtd@lists.infradead.org>; Wed, 22 Aug 2012 04:38:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345635197.2848.152.camel@sauron.fi.intel.com>
References: <1345627680-8166-1-git-send-email-richard.genoud@gmail.com>
 <1345627680-8166-6-git-send-email-richard.genoud@gmail.com>
 <1345632176.2848.144.camel@sauron.fi.intel.com>
 <CACQ1gAieJw9uAovWs0Cr-D71_GKAjSHyEQBjDF8krXJ2x4Yc7g@mail.gmail.com>
 <1345635015.2848.150.camel@sauron.fi.intel.com>
 <1345635197.2848.152.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 22 Aug 2012 13:38:16 +0200
Message-ID: <CACQ1gAithQd0RMk16atkaaSWZs1CoLnXDe801BP6SvAdVCSKwg@mail.gmail.com>
Subject: Re: [PATCH MTD-UTILS 5/5] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/22 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2012-08-22 at 14:30 +0300, Artem Bityutskiy wrote:
>> 1. Add a 'get device property' ioctl, similar to the 'set volume
>> property' ioctl we have. And use this ioctl to query the current bad
>> PEBs limit.
>>
>> 2. Just call the 'attach' ioctl with an insane max_beb_per1024 value
>> (say, -1) first. If it succeeded, than the driver does not support
>> max_beb_per1024 at all, and you may exit with a warning that you have
>> attached it, but the max_beb_per1024 was ignored because the kernel is
>> old.
>>
>> If it fails with -EINVAL, this means the kernel checked the value and
>> the feature is supported, so you can call it for the second time with
>> the right max_beb_per1024.
>>
>> The first approach is more complex but probably cleaner. The second is
>> easier to implement.
>
> I guess I prefer the second option, though. What do you think?
Well, for this one, we can go with the 2nd option, and if one day
there's another parameter, then we could implement the 'get device
property ioctl' for max_beb_per1024 and the new parameter.
How's that sound ?
