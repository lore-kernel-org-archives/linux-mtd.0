Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXPpH-0000ie-Hs
 for linux-mtd@lists.infradead.org; Thu, 13 Dec 2018 12:10:48 +0000
Received: by mail-pg1-x52e.google.com with SMTP id s198so992245pgs.2
 for <linux-mtd@lists.infradead.org>; Thu, 13 Dec 2018 04:10:37 -0800 (PST)
Subject: Re: Fwd: ubifs: fix page_count in ->ubifs_migrate_page()
To: Richard Weinberger <richard@nod.at>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>, stable@vger.kernel.org,
 linux-mtd@lists.infradead.org
References: <1544624037-3436-1-git-send-email-openzhangj@gmail.com>
 <257284e1-ae0c-1652-2edf-64cf8e35187c@gmail.com>
 <3016163.RH3ZIBrMym@blindfold>
From: zhangjun <openzhangj@gmail.com>
Message-ID: <c4f70535-63ba-4c4b-9e79-3ec48a406f52@gmail.com>
Date: Thu, 13 Dec 2018 20:10:19 +0800
MIME-Version: 1.0
In-Reply-To: <3016163.RH3ZIBrMym@blindfold>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018/12/13 下午4:30, Richard Weinberger wrote:
> Am Donnerstag, 13. Dezember 2018, 03:59:50 CET schrieb zhangjun:
>> hello
>>       I test several kernel version from your commit
>> 4ac1c17b2044a1b4b2fbed74451947e905fc2992,
>> there is a bug when migrateing,the following fix i test ok and require
>> your confirmation.
> Please keep the CC list intact and give us at least some time to review
> your patch.
> Also explain what kind of problem you're facing.
> In other words, is this a theoretical fix or not?
>
> Thanks,
> //richard

This's my first time to patch upstream,thank you very much for your 
suggestion.
My problem is my driver to call alloc_cma(),it fail.
But i find that memory and cma maxchunk is enougth.
So i building environmentto find what the reason is,test and verify my 
guess.
i think it not just a theoretical fix but i actually tested it.

thanks,
//zhangjun
