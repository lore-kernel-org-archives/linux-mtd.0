Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7Y1q-0003hP-W8
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 23:54:59 +0000
Message-ID: <5589F08D.2040507@cn.fujitsu.com>
Date: Wed, 24 Jun 2015 07:49:33 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>				
 <1433831809.28854.17.camel@sauron.fi.intel.com>	 <55769D97.3010602@nod.at>			
 <5577AC03.9060909@cn.fujitsu.com>			
 <1433928078.14092.1.camel@sauron.fi.intel.com>			
 <55780D1C.6080907@cn.fujitsu.com>		
 <1433931934.14092.11.camel@sauron.fi.intel.com>		
 <557812A4.8020409@cn.fujitsu.com>	
 <1433934324.14092.15.camel@sauron.fi.intel.com>	
 <55892D18.3020203@cn.fujitsu.com>
 <1435056240.7659.69.camel@sauron.fi.intel.com>
In-Reply-To: <1435056240.7659.69.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 06/23/2015 06:44 PM, Artem Bityutskiy wrote:
> On Tue, 2015-06-23 at 17:55 +0800, Dongsheng Yang wrote:
>> In short, I think force_atime to ubifs is the choice from my opinion.
>
> So will we end up with this:
>
> -o - no atime support
> -o atime - no atime support
> -o noatime - same, no atime support
> -o force_atime - full atime support
> -o relatime - relative atime support
> -o lazyatime - lazy atime support
>
> IOW, atime/noatime mount options have no effect on UBIFS. To have full
> atime support - people have to use "force_atime". And then the rest of
> the standard options are supported.
>
> So if you are the user, would not you find this confusing and
> inconsistent? I would.
>
>
> How about this alternative: we preserve current behavior, but we
> introduce a compile-time configuration option which enables atime
> support _and_ changes the default behavior to match the behavior of the
> mainstream file-systems.
>
> Or to put it differently.
>
> 1. We introduce the UBIFS_ATIME_SUPPORT configuration option. This
> option will be off by default.
>
> 3. If UBIFS_ATIME_SUPPORT is off, users get the current (legacy)
> behavior. Atime is not supported. The atime/noatime/relatime/lazyatime
> mount options are ignored.
>
> 4. If UBIFS_ATIME_SUPPORT is on, UBIFS supports atime by default. I.e.:
>
> -o - full atime support
> -o atime - full atime support
> -o noatime - no atime support
>
> We may also print a fat big warning from the mount function about the
> fact that atime support is enabled. Just in case a legacy user enabled
> this option.
>
> How does this sound to you?

Great!! good idea to me.

And we can also do the other changes to match mainstream
file-systems, if necessary, in similar way in future.

Yang
>
> Artem.
>
> .
>
