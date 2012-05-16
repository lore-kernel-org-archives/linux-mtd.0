Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUcl1-0005l8-9Z
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 11:51:07 +0000
Message-ID: <4FB394A6.5080402@nod.at>
Date: Wed, 16 May 2012 13:51:02 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: Fastmap - please, review and test
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <20120515224645.3af023c3@halley>
 <1337151273.24809.2.camel@sauron.fi.intel.com>
In-Reply-To: <1337151273.24809.2.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-kernel@vger.kernel.org, Heinz.Egger@linutronix.de,
 linux-mtd@lists.infradead.org, Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 tglx@linutronix.de, tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16.05.2012 08:54, Artem Bityutskiy wrote:
> On Tue, 2012-05-15 at 22:46 +0300, Shmulik Ladkani wrote:
>> On Tue, 15 May 2012 19:11:04 +0200 Richard Weinberger<richard@nod.at>  wrote:
>>> TODO:
>>>          - Artem is fully happy with the current on-flash layout,
>>>            maybe I can merge the erase counters into the EBA table
>>>          - Get a full review :)
>>
>> I'd be glad to take a deep look of the code.
>>
>> Hopefully I'll get into it in the following days.
>
> Thanks Shmulik - I appreciate any help as much as Richard. I am busy and
> my job now has nothing to do with MTD/UBI/UBIFS, and I have limited time
> for review.
>
> There were many people who wanted faster UBI, and I'd ask them to
> participate now - review, test, etc.
>

Before you shoot me, an hour ago I found an issue with static volumes 
that are not LEB aligned.
Looks like I'm calculating the volume length wrong.
I'll send as soon as possible a fix!

Thanks,
//richard
