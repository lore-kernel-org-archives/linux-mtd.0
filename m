Received: from hauke-2-pt.tunnel.tserv6.fra1.ipv6.he.net
 ([2001:470:1f0a:465::2] helo=hauke-m.de)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ui0Wb-0004YZ-91
 for linux-mtd@lists.infradead.org; Thu, 30 May 2013 10:56:06 +0000
Message-ID: <51A73026.3030200@hauke-m.de>
Date: Thu, 30 May 2013 12:55:34 +0200
From: Hauke Mehrtens <hauke@hauke-m.de>
MIME-Version: 1.0
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH RESEND 2/2] mtd: bcm47: convert to module_platform_driver
 instead of init/exit
References: <51A6B7D8.8090600@huawei.com>
 <CAHp75Vc9mYmUM4pmeKLBzxNFsx-xiSez6oxC1F5+Hh-hPXto5A@mail.gmail.com>
In-Reply-To: <CAHp75Vc9mYmUM4pmeKLBzxNFsx-xiSez6oxC1F5+Hh-hPXto5A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Li Zefan <lizefan@huawei.com>, artem.bityutskiy@linux.intel.com,
 Libo Chen <clbchenlibo.chen@huawei.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Bill Pemberton <wfp5p@virginia.edu>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/30/2013 12:30 PM, Andy Shevchenko wrote:
> On Thu, May 30, 2013 at 5:22 AM, Libo Chen <clbchenlibo.chen@huawei.com> wrote:
>>
>> convert to module_platform_driver instead of init/exit
> 
> I give another thought about it. We have to be sure that the flash
> device will be online when it's really needed.
> module_init initcall is quite far in the boot process. Is it what we want?

This is no problem, the flash driver is needed when the root file system
is mounted. The arch code reads the SoC configuration values in its own
code in arch/mips/bcm47xx/nvram.c without using the mtd subsystem. These
values are needed very early in the boot process.

Hauke
