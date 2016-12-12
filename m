Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGV9H-0003bj-8E
 for linux-mtd@lists.infradead.org; Mon, 12 Dec 2016 18:16:28 +0000
Received: by mail-pf0-x241.google.com with SMTP id y68so4721673pfb.1
 for <linux-mtd@lists.infradead.org>; Mon, 12 Dec 2016 10:16:07 -0800 (PST)
Subject: Re: [V2] mtd: devices: docg3:- Handle return value of devm_ioremap.
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1481511604-6116-1-git-send-email-arvind.yadav.cs@gmail.com>
 <20161212094218.2d29b34a@bbrezillon>
 <80fc935a-39aa-eaca-e75c-02078c3dab05@gmail.com>
 <20161212180444.22a1f4ff@bbrezillon>
Cc: robert.jarzmik@free.fr, dwmw2@infradead.org, computersforpeace@gmail.com,
 marek.vasut@gmail.com, richard@nod.at, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: arvind Yadav <arvind.yadav.cs@gmail.com>
Message-ID: <b09baca0-29b6-2cf1-1dfd-5381ee734284@gmail.com>
Date: Mon, 12 Dec 2016 23:45:55 +0530
MIME-Version: 1.0
In-Reply-To: <20161212180444.22a1f4ff@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

Yes, It's possible that two driver can use same iomem region.
For example you can check
commit id - : 33cf75656923ff11d67a937a4f8e9344f58cea77

Here, It's not required.

Thanks
-Arvind

On Monday 12 December 2016 10:34 PM, Boris Brezillon wrote:
> Hi Arvind,
>
> On Mon, 12 Dec 2016 21:33:05 +0530
> arvind Yadav <arvind.yadav.cs@gmail.com> wrote:
>
>> There is problem, if you will use devm_ioremap_resource instead of
>> devm_ioremap,
>> than devm_ioremap_resource will call request_mem_region().
>> request_mem_region() allows to tell the kernel that this driver is going
>> to use
>> this range of I/O addresses, which will prevent other drivers to make an
>> overlapping call to request_mem_region If other driver want to use same
>> address
>> space to access then it will not allow. Means we can not share same
>> address space
>> between two driver.
> The question is, is it required here? In general, allowing 2 different
> drivers from touching the same iomem region is a bad idea, so, if
> there's a reason to allow that here, I'd like to know more about it.
>
> Thanks,
>
> Boris
