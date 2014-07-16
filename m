Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Ne5-0001Ml-NP
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 11:45:14 +0000
Message-ID: <53C6658F.3020605@huawei.com>
Date: Wed, 16 Jul 2014 19:44:15 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] UBIFS: Fix empty_log_bytes()  computing error
References: <53BF4851.4040105@huawei.com>
 <1405508618.1906.26.camel@sauron.fi.intel.com>
In-Reply-To: <1405508618.1906.26.camel@sauron.fi.intel.com>
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

On 2014/7/16 19:03, Artem Bityutskiy wrote:
> On Fri, 2014-07-11 at 10:13 +0800, hujianyang wrote:
>> Hi Artem,
>>
>> After several days testing, the error we fixed in commit 642f63ed10,
>> "UBIFS: fix fatal race condition" comes out again. This commit seems
>> not working for my problem and I have to research into it again.
> 
> Do you say that your original patch fixed the problem, and the re-worked
> "fix fatal race condition" patch does not fix it, so it is incorrect?
> 
> Or do you say that probably the original patch also did not fix the
> problem, so both do not really fix the issue?
> 
> Or do you say that "fix fatal race condition" fixes only part of the
> problem, and there is another problem, which needs fixing too?
> 
> Or you are not sure?
> 

First, I think the re-worked patch and my origin patch fix same
problem. Once I think the error 'not CS node' is caused by power
cut, so I research the code and find this race.

But, after several days test, this error came out again and I
think we don't catch the true cause. Then I find the error below.

I think previous fixes(commit 642f63ed10) are useful but not solve
my problem. Maybe you can change the commit log or just keep them
because they can really fix a problem like that.

> 
> Do you want me to create 2 patches based on this information and send
> them to you, our you submit them? They should have 'Cc:
> stable@vger.kernel.org'.
> 
> Thanks!
> 

Yes, I'm not sure how to fix it is better and I was busy these
days. You can fix this error in your way and cc the patch to me.

But I don't know if this error is the true cause of my problem. I
would like to report to you if I get something new.

Thanks~!

Hu
