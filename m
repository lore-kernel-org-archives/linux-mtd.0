Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YmryO-0005gB-Qp
 for linux-mtd@lists.infradead.org; Mon, 27 Apr 2015 22:57:57 +0000
Message-ID: <553EBEDD.9050204@nod.at>
Date: Tue, 28 Apr 2015 00:57:33 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
 <20150427223630.GA11721@bshelton-desktop> <553EBB4A.1040905@nod.at>
 <20150427225307.GC32500@ld-irv-0074>
In-Reply-To: <20150427225307.GC32500@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Ben Shelton <ben.shelton@ni.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 punnaiah.choudary.kalluri@xilinx.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.04.2015 um 00:53 schrieb Brian Norris:
> On Tue, Apr 28, 2015 at 12:42:18AM +0200, Richard Weinberger wrote:
>> Am 28.04.2015 um 00:36 schrieb Ben Shelton:
>>>>> When I build this without CONFIG_MTD_NAND_ECC_ON_DIE enabled, I get the
>>>>> following warning here:
>>>>>
>>>>> In file included from drivers/mtd/nand/nand_base.c:46:0:
>>>>> include/linux/mtd/nand_ondie.h: In function 'nand_read_subpage_on_die':
>>>>> include/linux/mtd/nand_ondie.h:28:1: warning: no return statement in function returning non-void [-Wreturn-type]
>>>>> include/linux/mtd/nand_ondie.h: In function 'nand_read_page_on_die':
>>>>> include/linux/mtd/nand_ondie.h:34:1: warning: no return statement in function returning non-void [-Wreturn-type]
>>>>>
>>>>> Perhaps return an error code here, even though you'll never get past the BUG()?
>>>>
>>>> What gcc is this?
>>>> gcc 4.8 here does not warn, I thought it is smart enough that this function does never
>>>> return. Can it be that your .config has CONFIG_BUG=n?
>>>> Anyway, this functions clearly needs a return statement. :)
>>>
>>> gcc 4.7.2, and you are correct that I had CONFIG_BUG off.  :)
>>
>> Yeah, just noticed that BUG() with CONFIG_BUG=n does not have
>> a nonreturn attribute. So, gcc cannot know...
> 
> But it's an obvious infinite loop... all of my toolchains (4.2, 4.5,
> 4.6, 4.8) are able to compile this without complaining (gcc -Wall):
> 
> int test() { do { } while (1); }

Not here. gcc 4.8 warns on that.
As soon I add __attribute__ ((noreturn)) it does not longer complain.

Thanks,
//richard
