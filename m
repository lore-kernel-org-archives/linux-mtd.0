Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z7wNE-0005lC-Oi
 for linux-mtd@lists.infradead.org; Thu, 25 Jun 2015 01:54:41 +0000
Message-ID: <558B5F1F.4050005@huawei.com>
Date: Thu, 25 Jun 2015 09:53:35 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH V2 0/2] mtd: nandsim: fix error handling
References: <1435193209-54305-1-git-send-email-shengyong1@huawei.com>
 <20150625012401.GS4917@ld-irv-0074>
In-Reply-To: <20150625012401.GS4917@ld-irv-0074>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, richard@nod.at
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 6/25/2015 9:24 AM, Brian Norris wrote:
> On Thu, Jun 25, 2015 at 12:46:47AM +0000, Sheng Yong wrote:
>> V2:
>> Resend the patches against l2-mtd/master.
> 
>   CC      drivers/mtd/nand/nandsim.o
> drivers/mtd/nand/nandsim.c: In function ‘init_nandsim’:
> drivers/mtd/nand/nandsim.c:765:4: error: label ‘error’ used but not defined
>     goto error;
>     ^
> 
> The point wasn't to rebase blindly. I got this far already. But you should be
> testing (at a minimum, compile testing) your changes!

Sorry, my bad. I'll keep this in mind. And I'll resend the patch later.

thanks,
Sheng
> 
> Brian
> 
> 
