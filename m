Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1agT0i-0006gO-Hx
 for linux-mtd@lists.infradead.org; Thu, 17 Mar 2016 08:10:26 +0000
Subject: Re: [PATCH] UBIFS: Implement ->migratepage()
To: kbuild test robot <lkp@intel.com>
References: <201603171228.iwNVzwZx%fengguang.wu@intel.com>
Cc: kbuild-all@01.org, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, boris.brezillon@free-electrons.com,
 maxime.ripard@free-electrons.com, david@sigma-star.at, david@fromorbit.com,
 dedekind1@gmail.com, alex@nextthing.co, akpm@linux-foundation.org,
 sasha.levin@oracle.com, iamjoonsoo.kim@lge.com, rvaswani@codeaurora.org,
 tony.luck@intel.com, shailendra.capricorn@gmail.com,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56EA6653.6050504@nod.at>
Date: Thu, 17 Mar 2016 09:09:55 +0100
MIME-Version: 1.0
In-Reply-To: <201603171228.iwNVzwZx%fengguang.wu@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 17.03.2016 um 05:39 schrieb kbuild test robot:
> Hi Kirill,
> 
> [auto build test ERROR on v4.5-rc7]
> [also build test ERROR on next-20160316]
> [if your patch is applied to the wrong git tree, please drop us a note to help improving the system]
> 
> url:    https://github.com/0day-ci/linux/commits/Richard-Weinberger/UBIFS-Implement-migratepage/20160317-065742
> config: x86_64-allmodconfig (attached as .config)
> reproduce:
>         # save the attached .config to linux build tree
>         make ARCH=x86_64 
> 
> All errors (new ones prefixed by >>):
> 
>>> ERROR: "migrate_page_move_mapping" [fs/ubifs/ubifs.ko] undefined!
>>> ERROR: "migrate_page_copy" [fs/ubifs/ubifs.ko] undefined!

Meh. Just noticted that these functions are not exported and therefore not
usable in modules.
So, this patch is not really the solution although it makes the problem go away.

Thanks,
//richard
