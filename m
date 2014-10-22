Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xgmm4-0000Nu-Si
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 03:39:50 +0000
Message-ID: <544726CD.90902@huawei.com>
Date: Wed, 22 Oct 2014 11:38:53 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: UBIFS assert failed in ubifs_set_page_dirty at 1421
References: <BE257DAADD2C0D439647A271332966573949EFEC@SZXEMA511-MBS.china.huawei.com>
 <1413805935.7906.225.camel@sauron.fi.intel.com>
In-Reply-To: <1413805935.7906.225.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Caizhiyong <caizhiyong@hisilicon.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "adrian.hunter@intel.com" <adrian.hunter@intel.com>,
 Jijiagang <jijiagang@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/10/20 19:52, Artem Bityutskiy wrote:
> On Thu, 2014-10-09 at 06:48 +0000, Jijiagang wrote:
>> Hi Artem and Adrian,
>>
>> We encountered a “UBIFS assert failed in ubifs_set_page_dirty at 1421
>> (pid 543)” problem when running MONKEY test in android platform.
> 
> Hi, yes, this looks like a bug,
> 
> could you please re-send this e-mail in plain test format, because the
> MTD mailing list traps HTML e-mails.
> 
> Thanks!
> 

Hi Artem,

My colleagues find me and complain about this problem in September. The
previous bug I fixed, commit 691a7c6f, didn't fix the problem they
tolerate now. It has a different dump stack.

I don't have enough board or enough understanding to recreate this failure.

Do you think it is related?

line 1160, func try_to_unmap_one() in mm/rmap.c

""
        /* Move the dirty bit to the physical page now the pte is gone. */
        if (pte_dirty(pteval))
                set_page_dirty(page);
""

Is this pte_dirty() cause this error?

The recent patch you send, [PATCH] UBIFS: fix budget leak in error path,
seems not to fix this problem. They've tested this patch and find the
problem still exist.

Do you have any suggestions about this? I was busy these days so maybe
I could start to deal with this problem in November.

I should say, I don't know if it is a real problem caused by kernel. Maybe
this problem is caused by other changes outside kernel.

Any help is welcomed~!

Hu
