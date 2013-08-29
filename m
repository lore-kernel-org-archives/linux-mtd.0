Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEuQi-0000Vt-Ka
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 05:06:01 +0000
Received: by mail-pa0-f48.google.com with SMTP id kp13so409878pab.7
 for <linux-mtd@lists.infradead.org>; Wed, 28 Aug 2013 22:05:38 -0700 (PDT)
Message-ID: <521ED69F.5080203@gmail.com>
Date: Wed, 28 Aug 2013 22:05:35 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH v3 06/10] mtd: fix the wrong mtd->type for nand chip
References: <1377509808-29363-1-git-send-email-b32955@freescale.com>
 <1377509808-29363-7-git-send-email-b32955@freescale.com>
 <521D69B6.7070504@gmail.com> <521D9FCC.5010104@freescale.com>
 <521DA6B3.9080003@gmail.com> <20130829012403.GA4254@gmail.com>
In-Reply-To: <20130829012403.GA4254@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/28/2013 06:24 PM, Huang Shijie wrote:
> On Wed, Aug 28, 2013 at 12:28:51AM -0700, Brian Norris wrote:
>> On 08/27/2013 11:59 PM, Huang Shijie wrote:
>>
>> Yes, I saw that.
>>
>>> That's why we should expose the MTD_MLCNANDFLASH to the user-space
>>
>> All you've shown is the breakage, not the reason for exposing
>> MTD_MLCNANFLASH. There's a difference between MTD_MLCNANDFLASH being
> Do you mean this patch exposes the MTD_MLCNANDFLASH to user space?
> or the patch 8 exposes the MTD_MLCNANDFLASH to user space?

This patch (patch 6) changes the mtd->type for MLC NAND. And mtd->type 
is exposed to user-space via ioctl(MEMGETINFO), and (as of this patch), 
it is exposed as "unknown" in sysfs.

Patch 8 only changes the "unknown" to "mlc-nand"---an improvement, but 
patch 6 is still the first one that makes a visible change to the ABI.

Brian
