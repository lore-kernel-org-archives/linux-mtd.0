Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7OUZ-0003te-AT
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 12:39:27 +0000
Message-ID: <1405514327.5423.23.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBIFS: Fix empty_log_bytes()  computing error
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Wed, 16 Jul 2014 15:38:47 +0300
In-Reply-To: <53C6658F.3020605@huawei.com>
References: <53BF4851.4040105@huawei.com>
 <1405508618.1906.26.camel@sauron.fi.intel.com>
 <53C6658F.3020605@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Wed, 2014-07-16 at 19:44 +0800, hujianyang wrote:
> First, I think the re-worked patch and my origin patch fix same
> problem. Once I think the error 'not CS node' is caused by power
> cut, so I research the code and find this race.
> 
> But, after several days test, this error came out again and I
> think we don't catch the true cause. Then I find the error below.
> 
> I think previous fixes(commit 642f63ed10) are useful but not solve
> my problem. Maybe you can change the commit log or just keep them
> because they can really fix a problem like that.

OK, I'll keep the patches, but will amend the commit message a bit and
tell there that they are fixing a theoretical issue. And I'll remove Cc:
stable so far.

> Yes, I'm not sure how to fix it is better and I was busy these
> days. You can fix this error in your way and cc the patch to me.
> 
> But I don't know if this error is the true cause of my problem. I
> would like to report to you if I get something new.

I've created 2 patches based on your e-mail. I did not test them at all.
The assertion - I move it to 'ubifs_next_log_lnum()'. May be this is
incorrect, but looks like a good place for me on the first glance.

I guess you will continue testing, right? Please, use these patches and
let me know if they are wrong, if they help or not, etc. I'll send the 2
patches shortly.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
