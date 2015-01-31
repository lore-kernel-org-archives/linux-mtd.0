Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YHVOp-0005D7-DV
 for linux-mtd@lists.infradead.org; Sat, 31 Jan 2015 10:35:36 +0000
Message-ID: <54CCAFB4.3060705@huawei.com>
Date: Sat, 31 Jan 2015 18:34:28 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH resend] UBIFS: return -EINVAL if first log leb is empty
References: <54CC4F77.1000801@huawei.com>
 <1422697906.8637.295.camel@sauron.fi.intel.com>
In-Reply-To: <1422697906.8637.295.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/1/31 17:51, Artem Bityutskiy wrote:
> Hi Hujianyang,
> 
> On Sat, 2015-01-31 at 11:43 +0800, hujianyang wrote:
>> CS node is recognized as a sign in UBIFS log replay mechanism.
>> Log relaying during mount should find the CS node in first log
>> leb at beginning and then replay the following uncommitted
>> buds.
> 
> Lets use the "log head" term instead of "the first log LEB", just to be
> consistent.
>

OK.

>> +		if (unlikely(c->cs_sqnum == 0)) {
> 
> Please, do not use unlikely(), it may only be used on hot-paths, which
> the replay code is certainly not.
> 
> IIUC, this if translates to "is this the head of the log?". If I am
> right, then the better place for doing this check is the caller function
> - 'ubifs_replay_journal()'. In that function you just do
> 
> if (lnum == c->lhead_lnum)
> 
> which is way easier to understand than "if (c->cs_sqnum == 0)", I think.
> 

That's true~!

>> +			/* This is the first log LEB, should not be empty */
> 
> I'd expand this comment a bit to:
> 
> The head of the log must always start with the "commit start" node on a
> properly formatted UBIFS. But we found no nodes at all, which means that
> something went wrong and we cannot proceed mounting the file-system.
> 

Thanks~!

> I think the next developer who looks at the will appreciate these kinds
> of commentaries.
> 
>> +			ubifs_err("first log leb LEB %d:%d is empty, no CS node exist",
>> +				  lnum, offs);
> 
> Lets use consistent terminology. We call it the "log head".
> 
> I'd phrase it like this:
> 
> no UBIFS nodes found at the log head LEB %d:%d, possibly the FS is
> corrupted.
> 

Artem, Thanks for your reviewing. Could I add a Reviewed-by after resending
a v2 patch?

Sorry to say I'm too tired today and still have other stuff needs to be
done before my leave. I'd like to recheck your comments and resend this
patch next Monday.

Thank you very much~!
Hu
