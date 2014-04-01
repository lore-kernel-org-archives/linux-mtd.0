Received: from smtp.codeaurora.org ([198.145.11.231])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUrcf-0007py-79
 for linux-mtd@lists.infradead.org; Tue, 01 Apr 2014 05:52:35 +0000
Message-ID: <533A5407.4060900@codeaurora.org>
Date: Tue, 01 Apr 2014 08:52:07 +0300
From: Tanya Brokhman <tlinder@codeaurora.org>
MIME-Version: 1.0
To: dedekind1@gmail.com, Dolev Raviv <draviv@codeaurora.org>
Subject: Re: ubifs: assertion fails
References: <f08bbebef039d5bb28c2fcd3022165b0.squirrel@www.codeaurora.org>
 <1396260879.9016.70.camel@sauron.fi.intel.com>
In-Reply-To: <1396260879.9016.70.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem

On 3/31/2014 1:14 PM, Artem Bityutskiy wrote:
> On Mon, 2014-03-24 at 06:03 +0000, Dolev Raviv wrote:
>> Hi all,
>>
>> Im doing my first steps learning ubifs and Im trying to understand a
>> something that does not make much sense to me.
>>
>> In fs/ubifs/shrinker.c, at shrink_tnc(), there is an assert condition that
>> shows up every once I a while (after stressing).
>> ubifs_assert(atomic_long_read(&c->clean_zn_cnt) >= 0);
>
> When this happens, do you then see a storm of similar assertions from
> other parts of the code? I am trying to understand if this assertion is
> incorrect, or you really get the accounting screwed when shrinking
> happens.
>
> In the former case, this would probably be a single assertion, on the
> latter you'd probably see many similar warnings from other code. E.g.,
> when you unmount.
>

The log isn't flooded with the above mentioned error, but it does repeat 
several times.

>
>> Could the assertion condition be wrong?
>
> Could be, but could also show that there is an accounting error
> happening when shrinker starts.
>
> And I saw misterious errors when shrinker starts working at some point,
> but did not have time to dig this. So there is at least 1 bug in the
> shrinker path which I saw.

Is there any way we can help in debugging and fixing this? Also, we're 
running on a 3.10 based kernel and I saw a lot of patches that change 
the shrinker after 3.10 on linux-next. What kernel version did you see 
the shrinker errors on?

>
>> Can anyone share information on what are those times that the counter can
>> be negative?
>
> When the commit operation starts, it grabs the tnc_mutex, prepares the
> list of nodes to commit, and release tnc_mutex. Now the accounting is
> incorrect. When the commit finishes, it grabs the mutex again, does some
> stuff, and also fixes the accounting. Then drops the mutex.
>
> The idea was to make sure that commit does not block I/O. Meaning that
> you can still write files while commit is going on.
>

Thanks,
Tanya Brokhman
-- 
QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
