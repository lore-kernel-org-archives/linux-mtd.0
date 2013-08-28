Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEaBn-0001x6-Rm
 for linux-mtd@lists.infradead.org; Wed, 28 Aug 2013 07:29:18 +0000
Received: by mail-pa0-f51.google.com with SMTP id lf1so5918356pab.10
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2013 00:28:53 -0700 (PDT)
Message-ID: <521DA6B3.9080003@gmail.com>
Date: Wed, 28 Aug 2013 00:28:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com> <521D9FCC.5010104@freescale.com>
In-Reply-To: <521D9FCC.5010104@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/27/2013 11:59 PM, Huang Shijie wrote:
> 于 2013年08月28日 11:08, Brian Norris 写道:
>> Since we may see a v4 anyway, I'll make a comment here that I've been
>> mulling over.
>>
>> On 08/26/2013 02:36 AM, Huang Shijie wrote:
>>> Current code sets the mtd->type with MTD_NANDFLASH for both
>>> SLC and MLC. So the jffs2 may supports the MLC nand, but in actually,
>>> the jffs2 should not support the MLC.
>>>
>>> This patch uses the nand_is_slc() to check the nand cell type,
>>> and set the mtd->type with the right nand type.
>>>
>>> After this patch, the jffs2 only can support the SLC nand.
>>>
>>> Signed-off-by: Huang Shijie <b32955@freescale.com>
>>
>> This patch doesn't note here that it is breaking the ABI: it is the
>> first (AFAIK; I don't think onenand ever actually had MLC, right?)
>> patch to cause an MTD to show up as MTD_MLCNANDFLASH (and "unknown" in
>> sysfs -- but you change this later to "mlc-nand"). This should be made
>> more clear, if we're going to do this. And you should document and
>> explain it *before* this patch.
> okay.
>>
>> But more importantly, you don't really answer this question I have:
>> why we want to expose this MTD_MLCNANDFLASH type to user-space? It
>> seems you need this for internal drivers' usage and for JFFS2 (both
>> valid reasons). But exporting it to user-space just makes us work to
>> change mtd-utils (and any other scripts that might rely on these
>> types). Note that not everybody upgrades mtd-utils along with their
>> kernel.
>>
> After we change the code with this patch, the SLC still expose the
> 'nand' to the user space, it's ok;
> but the MLC will expose "unknown" as you said above. Some mtd-utils,
> such as mtd_debug will not work well any more.

Right. That's part of the ABI breakage.

> If we do expose the MTD_MLCNANDFLASH to use space, the mtd-utils may can
> not work with MLC nand, some code only checks the
> MTD_NANDFLASH. Please see the :
> http://lists.infradead.org/pipermail/linux-mtd/2013-August/048213.html

Yes, I saw that.

> That's why we should expose the MTD_MLCNANDFLASH to the user-space

All you've shown is the breakage, not the reason for exposing 
MTD_MLCNANFLASH. There's a difference between MTD_MLCNANDFLASH being in 
the mtd-abi.h header and actually using it in a driver (and documenting 
it, and giving it a new sysfs string).

There is an alternative: that we don't pass MTD_MLCNANDFLASH through to 
user-space (we intercept it and change it to MTD_NANDFLASH in 
ioctl(MEMGETINFO)), and it just appears as "nand" in the sysfs 'type' 
entry. I'm not saying we should do that--I think it's useful to know SLC 
vs. MLC in user-space--but I am saying that we need a proper 
justification. So far I'm the only one who has explained why user-space 
needs this...

>> One argument in favor of your change: so a user can programmatically
>> determine whether to use JFFS2 or UBIFS on a particular NAND. (But
>> then again, SLC are getting more and more MLC-like properties that
>> make them unsuitable for JFFS2...)
>>
>> So, I would recommend a few rearrangements of part of this series:
>> (1) fixup the sysfs show() function and ABI documentation (in the same
>> patch) to cover "mlc-nand". *** must clearly explain the rationale for
>> userspace change (currently missing) ***
>> (2) do any changes to JFFS2 based on the MLC type
>> (3) allow nand_base.c to export MTD_MLCNANDFLASH
> I will arrange the next version in this order.

Brian
