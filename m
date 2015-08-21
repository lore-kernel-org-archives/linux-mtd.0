Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSgVc-0008VG-L5
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 07:13:06 +0000
Subject: Re: [PATCH v2 14/35] ubifs: extend budget for blocks
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, viro@ZenIV.linux.org.uk,
 jack@suse.cz, dedekind1@gmail.com, richard.weinberger@gmail.com
References: <1438235311-23788-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1438235311-23788-15-git-send-email-yangds.fnst@cn.fujitsu.com>
 <55BFD56B.3070904@nod.at> <55D6BE42.6090507@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D6CF65.3020103@nod.at>
Date: Fri, 21 Aug 2015 09:12:37 +0200
MIME-Version: 1.0
In-Reply-To: <55D6BE42.6090507@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.08.2015 um 07:59 schrieb Dongsheng Yang:
> On 08/04/2015 04:56 AM, Richard Weinberger wrote:
>> Am 30.07.2015 um 07:48 schrieb Dongsheng Yang:
>>> Currently, budget subsystem in ubifs are working on budgeting
> 
> [...]
>>>   #endif
>>> +    unsigned int new_block_num;
>>> +    unsigned int dirtied_block_num;
>>
>> Why are these not under UBIFS_DEBUG?
>> I like the overflow checks.
> 
> Sorry for the late reply.
> 
> I did not find the overflow checks in my reading.
> Could you help to explain what kind of the check
> is it? and why we define in different way with
> UBIFS_DEBUG defined or not.

AFAICT the idea is that you see it from the value
from a crash dump.
i.e. if new_page is > 2 an overflow happened.

I don't know that Artem's original plan was.
But we could also automate this checks.

> And, Where did we define the UBIFS_DEBUG? I did not
> get the design of this macro. :(

You have define the macro yourself.

Thanks,
//richard
