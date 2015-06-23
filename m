Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7L0r-0001ND-JN
 for linux-mtd@lists.infradead.org; Tue, 23 Jun 2015 10:01:06 +0000
Message-ID: <55892D18.3020203@cn.fujitsu.com>
Date: Tue, 23 Jun 2015 17:55:36 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH RESEND] ubifs: Introduce a mount option of force_atime.
References: <1433758060-18614-1-git-send-email-yangds.fnst@cn.fujitsu.com>			
 <1433831809.28854.17.camel@sauron.fi.intel.com> <55769D97.3010602@nod.at>			
 <5577AC03.9060909@cn.fujitsu.com>		
 <1433928078.14092.1.camel@sauron.fi.intel.com>		
 <55780D1C.6080907@cn.fujitsu.com>	
 <1433931934.14092.11.camel@sauron.fi.intel.com>	
 <557812A4.8020409@cn.fujitsu.com>
 <1433934324.14092.15.camel@sauron.fi.intel.com>
In-Reply-To: <1433934324.14092.15.camel@sauron.fi.intel.com>
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

On 06/10/2015 07:05 PM, Artem Bityutskiy wrote:
> On Wed, 2015-06-10 at 18:34 +0800, Dongsheng Yang wrote:
>> On 06/10/2015 06:25 PM, Artem Bityutskiy wrote:
>>> On Wed, 2015-06-10 at 18:10 +0800, Dongsheng Yang wrote:
>>>> On 06/10/2015 05:21 PM, Artem Bityutskiy wrote:
>>>>> On Wed, 2015-06-10 at 11:16 +0800, Dongsheng Yang wrote:
>>>>>> Therefore, I introduced a new option named as force_atime in ubifs.
>>>>>> That's a ubifs-dependent opiton and it works as a main switch, in
>>>>>> a higher level compared with atime and noatime. If force_atime, we
>>>>>> support the atime-related flags. Otherwise, we don't care about all of
>>>>>> them in flags and don't support atime anyway.
>>>>>
>>>>> How bad is it to just default to relatime like other file-systems do,
>>>>> comparing to what we have now?
>>>>
>>>> Ha, yes, that's a problem. I read it from wiki that the author think
>>>> it's bad for ubifs. But I did not do a measure about it.
>>>
>>> Since I am one of the authors, I think we were mostly looking at the
>>> full atime support, and did not really look at relatime.
>>>
>>>> In theory, yes, lots of writing would damage the flash. So I think
>>>> just make it optional to user is a flexible way to do it. Even we
>>>> want to make the default to relatime, I think it's better to keep
>>>> the compatibility for a period and provide a force_atime to user.
>>>>
>>>> When lots of users said "okey, we are mostly choosing force_atime in our
>>>> use cases.". I believe that's a safe way to make ubifs supporting
>>>> atime by default.
>>>
>>> Let me make a step back. So what I hear is that the problem is that you
>>> cannot find the original mount options. For example, when you see the
>>> MNT_RELATIME flag, you do not know whether it was specified by the user
>>> or it was VFS adding this flag. Is this correct?
>>>
>>> If it is correct, then I think we need to look at a VFS-level solution.
>>> If the above is the only problem, then I'd say that introducing a custom
>>> "force_atime" is a work-around for VFS limitations.
>>
>> That's correct. Yes, I really want to solve it in vfs at first. But
>> later, just submited this patch as a Problem-solved for us. Because I
>> thought the force_atime would disappear when we decide to support
>> atime by default in future.
>>
>> Besides a change in VFS would cause more discussion, after a trade-off,
>> I submitted this patch for ubifs. :)
>>
>> But yes, there is really, at leat, a TODO entry for VFS in this
>> scenario I think. If you think we need to do it rather than a
>> work-around as what this patch did. I will think a better way
>> in VFS for that. :)
>
> Yes, I think a custom mount option should be the last resort solution,
> for the case when other options failed.
>
> One way would be to push this assignment down to individual
> file-systems. Another way would be to have the original flags preserved
> and passed to the file-system.
>
> May be you can find a better way.

Hi Artem, sorry for the late.

After the last discussion, I have been focus on some other work. But
when I came back to this topic today, I found I was wrong. Even in vfs,
unfortunately, we can not distinguish the use case 1 and 2:

1. mount -t ubifs ... - (flags & MS_NOATIME) == 0
2. mount -t ubifs -o atime - (flags & MS_NOATIME) == 0
3. mount -t ubifs -o noatime - (flags & MS_NOATIME) == 1

There is no MS_ATIME defined in vfs to be used for -o atime specified.
We can only find out the case 3 by the flags in kernel space.
That means, the information what we want for this topic only exists in
util-linux in user-space. util-linux make the Default equal to -o atime.

Then there are two ways to do it:
a), introduce a MS_ATIME and file_system_type::parse_options to vfs.
	It's a little costly. MS_ATIME would be used to make kernel
	to be aware of the atime option. parse_options() could be used
	to make file system to be in charge of parsing the standard
	options and set the default value.

	parse_options() is a common requirement, but the 	
	MS_ATIME looks much arguable.
	
b), introduce a force_atime to ubifs as what my patch is doing here.
	1), If we really need to know atime option in vfs, I propose to
	    experiment it in ubifs at first. If the force_atime works
	    well and looks useful to some other file system. Then we can
	    consider to introduce MS_ATIME to vfs. So, force_atime could
	    be treat as an experiment for MS_ATIME.
	2), As we talked before, I think force_atime is a flexible way
	    to change the default value to relatime or future lazytime.
	    Then I believe it's better to make the radialization
	    limited in ubifs.

c), change the default behaviour of ubifs to support atime immediately.
	That's rough and risky but most easy way to do it.

In short, I think force_atime to ubifs is the choice from my opinion.

What do you think about it?

Thanx
Yang
>
> .
>
