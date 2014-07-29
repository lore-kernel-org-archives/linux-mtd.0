Received: from szxga01-in.huawei.com ([119.145.14.64])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XByS7-0001rv-QX
 for linux-mtd@lists.infradead.org; Tue, 29 Jul 2014 03:51:54 +0000
Message-ID: <53D71A0F.9070008@huawei.com>
Date: Tue, 29 Jul 2014 11:50:39 +0800
From: Zhang Zhen <zhenzhang.zhang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH v2] ubifs: refactor ubifs_file_mmap()
References: <1406010548-13996-1-git-send-email-zhenzhang.zhang@huawei.com>
 <53CE049B.7050801@huawei.com> <1406564713.23376.39.camel@sauron.fi.intel.com>
In-Reply-To: <1406564713.23376.39.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: wangnan0@huawei.com, MTD Maling List <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/7/29 0:25, Artem Bityutskiy wrote:
> On Tue, 2014-07-22 at 14:28 +0800, Zhang Zhen wrote:
>> generic_file_mmap() set vma->vm_ops = &generic_file_vm_ops,
>> then ubifs_file_mmap set vma->vm_ops = &ubifs_file_vm_ops.
>> So it is redundant.
>> And there is no kind of file does not supply page reading function
>> in ubifs. The readpage() check up for mmap file in generic_file_mmap()
>> is not needed.
>>
>> So remove the call of generic_file_mmap().
>>
>> Change v1 -> v2:
>> - deleted the mapping variable
>> Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>
> 
> Hi, I am not sure about this patch. 'generic_file_mmap()' covers !
> CONFIG_MMU case too, for example.
> 
Yes, I missed that. We can add #ifdef CONFIG_MMU in ubifs_file_mmap().
Considering the patch itself is not important changes, we can give up
this patch, remain the same.

What do you think?

Thanks for your comments!
> Thanks!
> 
