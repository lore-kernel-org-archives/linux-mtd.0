Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwmI9-0007cx-WC
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 07:27:35 +0000
Message-ID: <56443DA1.6040908@cn.fujitsu.com>
Date: Thu, 12 Nov 2015 15:20:01 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: <david@sigma-star.at>, <dedekind1@gmail.com>, <richard@nod.at>,
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH V3 01/27] mtd-utils: Restructure the mtd-utils source.
References: <1444882208-4455-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1446261121-9978-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20151111223007.GC71848@google.com> <20151111224035.GD71848@google.com>
In-Reply-To: <20151111224035.GD71848@google.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/12/2015 06:40 AM, Brian Norris wrote:
> On Wed, Nov 11, 2015 at 02:30:07PM -0800, Brian Norris wrote:
[...]

 >>>		- add mtdpart in gitignore
>>>   .gitignore                                         | 54 +++++++++----------
>>
>> This patch doesn't apply, due to .gitignore. I don't know what repo
>> you're patching of, but it's not the tip of mtd-utils.git...
>
> Anyway, I fixed the conflicts and pushed this patch to mtd-utils.git.
> Please let me know if you see any problems.

Oh, my bad. Thanx for the fixing.

  I will rebase my rest patches. :)

Yang
>
> I'm probably not the one to review/apply the rest of this series, so
> I'll leave that to Richard and others.
>
> Brian
> .
>
