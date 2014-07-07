Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X43yb-00060E-PH
 for linux-mtd@lists.infradead.org; Mon, 07 Jul 2014 08:08:42 +0000
Message-ID: <53BA554E.1030804@huawei.com>
Date: Mon, 7 Jul 2014 16:07:42 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 4/4] UBIFS: Remove useless statements
References: <5397C0E7.9070602@huawei.com> <5397C22C.70305@huawei.com>
 <1404218279.6841.43.camel@sauron.fi.intel.com>
In-Reply-To: <1404218279.6841.43.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/7/1 20:37, Artem Bityutskiy wrote:
> On Wed, 2014-06-11 at 10:42 +0800, hujianyang wrote:
>> diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
>> index 0e045e7..f68e088 100644
>> --- a/fs/ubifs/journal.c
>> +++ b/fs/ubifs/journal.c
>> @@ -389,6 +389,9 @@ out:
>>  		ubifs_dump_budg(c, &c->bi);
>>  		ubifs_dump_lprops(c);
>>  		cmt_retries = dbg_check_lprops(c);
>> +		if (cmt_retries)
>> +			ubifs_err("fail to check lprops, error %d",
>> +				  cmt_retries);
>>  		up_write(&c->commit_sem);
> 
> The general approach we took in UBIFS is that the function prints about
> its own problems itself. We tend to avoid not make calling function
> print an error message for the called function.
> 
> Please, add an error message to 'dbg_check_lprops()' instead.

I think error messages in 'dbg_check_lprops' is good enough.

> 
> I've dropped this change. The other ones look OK, so I applied them.
> 
> Thanks!
> 

I add the return value check because a value-never-read warn. We set
this cmt_retries and never read it. But it is really no nead check it
as you said.

I think this is better.

- 		cmt_retries = dbg_check_lprops(c);
+		dbg_check_lprops(c);

There is not need to change this by a separate patch. Just leave it
behind.
