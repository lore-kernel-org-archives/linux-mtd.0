Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z83xn-0001pF-CV
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 10:00:56 +0000
Message-ID: <558BD010.6020207@cn.fujitsu.com>
Date: Thu, 25 Jun 2015 17:55:28 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Dave Chinner <david@fromorbit.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
References: <1433831809.28854.17.camel@sauron.fi.intel.com>
 <55769D97.3010602@nod.at> <5577AC03.9060909@cn.fujitsu.com>
 <1433928078.14092.1.camel@sauron.fi.intel.com>
 <55780D1C.6080907@cn.fujitsu.com>
 <1433931934.14092.11.camel@sauron.fi.intel.com>
 <557812A4.8020409@cn.fujitsu.com>
 <1433934324.14092.15.camel@sauron.fi.intel.com>
 <55892D18.3020203@cn.fujitsu.com>
 <1435056240.7659.69.camel@sauron.fi.intel.com>
 <20150624003335.GG22807@dastard>
In-Reply-To: <20150624003335.GG22807@dastard>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/24/2015 08:33 AM, Dave Chinner wrote:
> On Tue, Jun 23, 2015 at 01:44:00PM +0300, Artem Bityutskiy wrote:
>> On Tue, 2015-06-23 at 17:55 +0800, Dongsheng Yang wrote:
>>> In short, I think force_atime to ubifs is the choice from my opinion.
>>
>> So will we end up with this:
>>
>> -o - no atime support
>> -o atime - no atime support
>> -o noatime - same, no atime support
>> -o force_atime - full atime support
>> -o relatime - relative atime support
>> -o lazyatime - lazy atime support
>
>> IOW, atime/noatime mount options have no effect on UBIFS. To have full
>> atime support - people have to use "force_atime". And then the rest of
>> the standard options are supported.
>
> That's the exact semantics of the standard -o strictatime option.
> See the mount(8) man page:
>
>         strictatime
> 	      Allows  to  explicitly requesting full atime updates.
> 	      This makes it possible for kernel to defaults to
> 	      relatime or noatime but still allow userspace to
> 	      override it. For more details about the default system
> 	      mount options see /proc/mounts.
>
> It's passed down to the kernel via the MS_STRICTATIME flag. All
> you need to do is make ubifs aware of this flag...

Hi Dave, thanx for your suggestiong, but sorry, it's a little confusing
to me :(.

 From the sentence of manpage, I assume this history:
(1). Long time ago, atime is updated at *any* access. It was
working as strictatime mode, although at that time there was
a strictatime option for mount.

(2). Later, we introduced a relatime for more relaxy atime
updating. But the default mode was still full atime updating.

(3). Later than later, 2.6.30, we want to make the default mode to
relatime. But we want to provide a option to user to use
the full atime updating. Then we introduced the strictatime
option to mount. So the manpage of:
  "This makes it possible for kernel to defaults to relatime or noatime
but still allow userspace to override it."
    means, we are going to change the default behaviour to relatime
but we provide a option named as strictatime to user to explicitly
request full atime updating.

So, strictatime is in the same level with relatime, lazytime. They
all are strategies for atime updating. But that's not what we want here.

If I understand your suggestion correctly here, you are going to make
ubifs to reuse the option of strictatime to work as what I proposed
force_atime.

Oops, I think found the problem, maybe it's about the expression from Atem:

-o - no atime support
-o atime - no atime support
-o noatime - same, no atime support
-o force_atime - full atime support    <------- criminal
-o relatime - relative atime support
-o lazyatime - lazy atime support

I guess you think the "full atime support" means "full atime updating
strategy" what strictatime option stands for.

But please read the later words from Atem:
"people have to use "force_atime". And then the rest of
the standard options are supported."

Let me show this list again:
-o - no atime support
-o atime - no atime support
-o noatime - same, no atime support
-o force_atime - default behavior (relatime currently)
-o force_atime,relatime - relative atime support
-o force_atime,strictatime - strict atime support
-o force_atime,lazyatime - lazy atime support

Actually, force_atime is not equal with strictatime for full atime
updating. It's a switch in higher level. If we enable force_atime,
ubifs will support the all strategies user requested, default to
relatime currently.

But now, I agree with the idea from Atem to make it configurable in
compiling time, introducing UBIFS_ATIME_SUPPORT.

I wish I found the reason of misunderstanding and expressed myself
clearly.

Thanx
Yang
>
> Cheers,
>
> Dave.
>
