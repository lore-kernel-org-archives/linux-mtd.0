Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8IM8-00022O-US
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2015 01:23:01 +0000
Message-ID: <558CA82B.7050306@cn.fujitsu.com>
Date: Fri, 26 Jun 2015 09:17:31 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
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
 <20150624003335.GG22807@dastard> <558BD010.6020207@cn.fujitsu.com>	
 <1435226918.9627.14.camel@sauron.fi.intel.com>	
 <558BD3B0.8080209@cn.fujitsu.com>
 <1435231689.9627.17.camel@sauron.fi.intel.com>
In-Reply-To: <1435231689.9627.17.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-fsdevel@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 Dave Chinner <david@fromorbit.com>, adrian.hunter@intel.com,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/25/2015 07:28 PM, Artem Bityutskiy wrote:
> On Thu, 2015-06-25 at 18:10 +0800, Dongsheng Yang wrote:
>>   > -o - default behavior (no atime)
>>   > -o relatime - relative atime support
>>
>> We would find both of them are MS_RELATIME set. But we
>> want to do different thing in these cases. So I introduced
>> the force_atime. Then:
>
> Oh, do you know where exactly the default MS_RELATIME gets set?

Ha, yes, it was set in do_mount() in vfs. I mentioned this in a mail
days ago, but let me try to explain it more clearly here.

Sorry for the looong mail :(.

* The main idea here is to find a flexible way to make ubifs to support 
atime:
* 1, To make atime supporting optional to user at first.
* 2, To keep the compatibility currently.

(a), the generic options in vfs:
=================generic=======================
-o - default behavior (relatime currently)
-o atime - atime support
-o noatime - no atime support
-o relatime - relative atime support
-o strictatime - strict atime support
-o lazyatime - lazy atime support

(b), My first idea about it is making ubifs support atime but
keep the default to noatime.
=================idea 1 in ubifs===============
-o - default behavior (*no atime*) <-----keep the default to *noatime*
-o atime - atime support
-o noatime - no atime support
-o relatime - relative atime support
-o strictatime - strict atime support
-o lazyatime - lazy atime support

But there are two problems to do it.
    (1), we can not distinguish them:
    -o - default behavior (*no atime*)
    -o relatime - relative atime support
    To solve it, I planed to introduce file_system_type::parse_options()
then, file system can be in charge of the standard options. I am not
sure is that acceptable to vfs guys, but it's possible way to solve it.

    (2), we can not distinguish them:
    -o - default behavior (*no atime*)
    -o atime - atime support
    This one is much difficult to solve. Because I found even in vfs,
we can not know the difference. They are made to same in userspace by
util-linux. Yes, we can solve it by introduce a MS_ATIME, but that's
meaningless to others and we have to change code in user and kernel.
So, it's unacceptable even to myself.

(c), So, I dropped the *idea 1*. And find out an idea 2.
=======================idea 2 in ubifs=======================
-o - no atime
-o atime - no atime
-o noatime - no atime
-o relatime - no atime
-o strictatime - no atime
-o lazyatime - no atime

-o force_atime - default behavior (relatime currently)
-o force_atime,atime - atime support
-o force_atime,noatime - no atime support
-o force_atime,relatime - relative atime support
-o force_atime,strictatime - strict atime support
-o force_atime,lazyatime - lazy atime support

    That means, we keep a *full compatibility* backward, and provide
a force_atime option to make ubifs to work same with *generic*
by *-o force_atime,...*. It's optional to user.
    force_atime works like a switch for atime supporting.

(d), But when I heard an idea about UBIFS_ATIME_SUPPORT from you.
I get an idea 3.
======================idea 3 in ubifs=========================
UBIFS_ATIME_SUPPORT is n, same with what ubifs did:
-o - no atime
-o atime - no atime
-o noatime - no atime
-o relatime - no atime
-o strictatime - no atime
-o lazyatime - no atime

UBIFS_ATIME_SUPPORT is y, same with what generic is doing:
-o - default behavior (relatime currently)
-o atime - atime support
-o noatime - no atime support
-o relatime - relative atime support
-o strictatime - strict atime support
-o lazyatime - lazy atime support

    I think this one is better than others, So I planed to
do the *idea 3*.

Thanx
Yang

>
> .
>
