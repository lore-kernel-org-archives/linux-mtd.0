Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8Nuc-0006nn-7e
 for linux-mtd@lists.infradead.org; Fri, 26 Jun 2015 07:18:58 +0000
Message-ID: <558CFB96.2000006@cn.fujitsu.com>
Date: Fri, 26 Jun 2015 15:13:26 +0800
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
 <558CA82B.7050306@cn.fujitsu.com>
 <1435302083.9627.36.camel@sauron.fi.intel.com>
In-Reply-To: <1435302083.9627.36.camel@sauron.fi.intel.com>
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

On 06/26/2015 03:01 PM, Artem Bityutskiy wrote:
> On Fri, 2015-06-26 at 09:17 +0800, Dongsheng Yang wrote:
...

> This means that if a file-system (e.g., UBIFS or JFFS2) never supported
> atime, it is harder to add atime support without breaking the old
> behavior.
>
> What if we push the two "set NOATIME flag" lines of code down to
> individual file-systems, instead of having it at the VFS level?

    TO be sure I understand it correctly, do you mean pushing the flags
parsing work to individual file-systems? Then we can set the default
behavior in file-system itself.

    Yes, I explained one idea about it in my last mail to introduce a
file_system_type::parse_options(). Then we can implement a callback
in ubifs to do what we want.

    But there is another problem I called as problem 2 in my last mail.
That we can not distinguish:
    -o - default behavior (*no atime*)
    -o atime - atime support
Even in vfs, we can not distinguish them. They are made to same in
userspace by utils-linux. There is an idea to solve it, introducing
a MS_ATIME. But that's too costly I think.

Yang
>
> ... snip ...
>
>> (d), But when I heard an idea about UBIFS_ATIME_SUPPORT from you.
>> I get an idea 3.
>> ======================idea 3 in ubifs=========================
>> UBIFS_ATIME_SUPPORT is n, same with what ubifs did:
>> -o - no atime
>> -o atime - no atime
>> -o noatime - no atime
>> -o relatime - no atime
>> -o strictatime - no atime
>> -o lazyatime - no atime
>>
>> UBIFS_ATIME_SUPPORT is y, same with what generic is doing:
>> -o - default behavior (relatime currently)
>> -o atime - atime support
>> -o noatime - no atime support
>> -o relatime - relative atime support
>> -o strictatime - strict atime support
>> -o lazyatime - lazy atime support
>
> Yes, this is an option, I am just trying to explore other possibilities.
>
> .
>
