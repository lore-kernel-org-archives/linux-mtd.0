Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YT03G-0004Jn-V5
 for linux-mtd@lists.infradead.org; Wed, 04 Mar 2015 03:32:52 +0000
Message-ID: <54F67CA0.3010902@huawei.com>
Date: Wed, 4 Mar 2015 11:31:44 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Steve deRosier <derosier@gmail.com>
Subject: Re: "corrupt empty space" error on boot?!?
References: <CALupW3CugdN+cwMZzePAhZSHbGhd9gfjk==DH=7Ezu54Y1BXUA@mail.gmail.com>
 <1425367912.26652.47.camel@sauron.fi.intel.com>
 <CALupW3ByNuS6HgU3LQR-W4jt7xKhG7j_6OrvQ=tyWdHKV20f6Q@mail.gmail.com>
In-Reply-To: <CALupW3ByNuS6HgU3LQR-W4jt7xKhG7j_6OrvQ=tyWdHKV20f6Q@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Steve,

On 2015/3/3 23:25, Steve deRosier wrote:
> Thanks Artem.
> 
> On Mon, Mar 2, 2015 at 11:31 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> Yes, you are right, if there is a corruption, UBIFS can:
>>
>> 1. Try to understand if this is a corruption in empty space or not.
>> 2. If yes, recover the LEB.
>>
>> But this is not implemented. People keep hitting this issue, but no one
>> contributed fixes yet.
>>
>>> A unit not mounting the rootfs because of a bit-flip in _empty_space_
>>> is unacceptable to us, so I've got to figure out a way to deal with
>>> this rare event.
>>
>> Well, improving UBIFS would be one of the possible solutions.
>>
> 
> OK, two questions then:
> 
> 1. Is there anything I can do from userspace, or uboot, to recover
> this filesystem?  We've got mirrored filesystems, so we actually can
> detect the failure and mount the other one and fix the first from
> there.  Or maybe I can mount it ro and switch to the other filesystem
> and reboot?

That's what I want to do next. We'd discussed the recovery of UBIFS
some days ago, please see:

http://lists.infradead.org/pipermail/linux-mtd/2015-February/057710.html

Artem gave lots of suggestions in this thread.

The first stuff I want to do is separating the recovery and the mount
path. That is, once we mount a partition, UBIFS will try to clean up
the corrupted data during mount path, but once an error can't be fixed,
mounting thread breakout with changes during failed mount. I think this
append changes to a corrupted image may confuse the recovery of it. So
my plan is just marking the corrupted data during mount and cleanup them
once the mount scan finish.

The next step is try R/O mount if a non-recoverable error occur.

> 
> 2. I'd like to be able to replicate the problem so I can fix it, but
> simply poking a random bit to a random empty PEB won't do the trick.
> I've actually tried this before when doing other investigations and

Yes, I see your log, it's hard to inject. The corrupt must in the scanned
LEB during mount and must in empty space after valid data.

See function 'ubifs_scan' in fs/ubifs/scan.c.

> nothing bad happened, likely because the empty page I hit was never
> looked at by UBIFS.  I know there's got to be a way to map LEB to PEB,
> how do I do that/where is the table?  Specifically, how to map "LEB
> 4:3918" to a physical block and page on the flash device?
> 

You can try my ubidump to solve this problem.

http://lists.infradead.org/pipermail/linux-mtd/2014-December/056828.html

First, read super leb(LEB 0) and master leb(LEB 1, LEB2) to find the logic
position of each field, and use leb_change ioctl to change it.

> I'll give fixing it and contributing the patch a try. I'm up against a
> project deadline with a board-bring-up right now (they wanted it done
> 2 weeks ago and I'm having to report on it each day now), so I
> probably won't have time on it till next week.
>

I'm busy with personal stuff these days. But I'd like to build a coding
environment at home in this month so I could continue work at night, western
daytime.

I'm glad to see your patch~!

Thanks,
Hu

> - Steve
