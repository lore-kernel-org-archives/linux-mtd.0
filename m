Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBnkC-0008I6-Gp
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 16:25:48 +0000
Message-ID: <1406564713.23376.39.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubifs: refactor ubifs_file_mmap()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Zhang Zhen <zhenzhang.zhang@huawei.com>
Date: Mon, 28 Jul 2014 19:25:13 +0300
In-Reply-To: <53CE049B.7050801@huawei.com>
References: <1406010548-13996-1-git-send-email-zhenzhang.zhang@huawei.com>
 <53CE049B.7050801@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
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

On Tue, 2014-07-22 at 14:28 +0800, Zhang Zhen wrote:
> generic_file_mmap() set vma->vm_ops = &generic_file_vm_ops,
> then ubifs_file_mmap set vma->vm_ops = &ubifs_file_vm_ops.
> So it is redundant.
> And there is no kind of file does not supply page reading function
> in ubifs. The readpage() check up for mmap file in generic_file_mmap()
> is not needed.
> 
> So remove the call of generic_file_mmap().
> 
> Change v1 -> v2:
> - deleted the mapping variable
> Signed-off-by: Zhang Zhen <zhenzhang.zhang@huawei.com>

Hi, I am not sure about this patch. 'generic_file_mmap()' covers !
CONFIG_MMU case too, for example.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
