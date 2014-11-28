Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuIFF-0008Mw-Ul
 for linux-mtd@lists.infradead.org; Fri, 28 Nov 2014 09:53:48 +0000
Message-ID: <5478460C.10000@nod.at>
Date: Fri, 28 Nov 2014 10:53:16 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 3/6] UBI: Fastmap: Ensure that all fastmap work is done
 upon WL shutdown
References: <1416835236-25185-1-git-send-email-richard@nod.at>			
 <1416835236-25185-4-git-send-email-richard@nod.at>		
 <1417102739.5858.112.camel@sauron.fi.intel.com> <54774C71.50807@nod.at>	
 <1417105793.5858.117.camel@sauron.fi.intel.com> <547752D1.6040000@nod.at>
 <1417106877.5858.133.camel@sauron.fi.intel.com>
In-Reply-To: <1417106877.5858.133.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 27.11.2014 um 17:47 schrieb Artem Bityutskiy:
> On Thu, 2014-11-27 at 17:35 +0100, Richard Weinberger wrote:
>> Am 27.11.2014 um 17:29 schrieb Artem Bityutskiy:
>>> On Thu, 2014-11-27 at 17:08 +0100, Richard Weinberger wrote:
>>>>> Obviously, there is some misunderstanding. This looks like lack of
>>>>> separation and misuse of layering. I am missing explanations why I am
>>>>> wrong...
>>>>
>>>> So you want me to use the UBI WL background thread for the scheduled fastmap work?
>>>
>>> No. It is more like either use it or do not use it.
>>
>> Sorry, I don't understand.
>> What do you want to do to?
> 
> Just keep the code structured. I am just asking questions and trying to
> to analyze your patches. If at some point I would like you to do
> something specific, I clearly state this. In this case I was complaining
> about fastmap specifics in an unrelated file, so basically the wish is
> to have it go away. How exactly - not specified, up to you :-) Or, this
> means just telling me why it is this way, justify.
> 
> When I was working with this code, I did give people specific
> suggestions, line-by-line. Now I am more doing more of a sanity check,
> looking after the bigger picture.
> 
> I understand that this is not a picture of an ideal maintainer, and I am
> not anymore an ideal maintainer for this stuff (I think I used to,
> though), simply because of lack of time. Doing the best effort job now.

This is perfectly fine. I'm trying hard to keep your job as easy as possible.

>>>> I didn't do it that way because you said more than once that fastmap is fastmap and
>>>> WL is WL. Therefore I've separated it.
>>>
>>> And "separated" meaning adding this code to wl.c?
>>>
>>> +#ifdef CONFIG_MTD_UBI_FASTMAP
>>> +       flush_work(&ubi->fm_work);
>>> +#endif
>>>
>>> Could it be separated some more then?
>>>
>>
>> Of course, commit "UBI: Move fastmap specific functions out of wl.c" does.
> 
> I did not see it in this series. So you could tell this earlier, not
> after 2 e-mail exchanges. Do not assume I remember the details of our
> previous discussion. Assume I forgot everything :-)

You did not see it in that series because you asked me to split it.
The massive clean stuff comes after the fixes.

This is the branch where I keep the whole series.
https://git.kernel.org/cgit/linux/kernel/git/rw/misc.git/log/?h=fastmap_upgrade2

Right now you've seen 6 out of 40 patches.

Maybe I'll change a few commits before submitting them.
I have some new ideas for more cleanups. :)

>> But this commit is *bugfix* commit.
> 
> I thought adding an close function to fastmap.c is a simple task.

As I said, later in the series I clean up a lot.

Thanks,
//richard
