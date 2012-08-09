Received: from mail-ob0-f177.google.com ([209.85.214.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SzTdL-0003cw-BT
 for linux-mtd@lists.infradead.org; Thu, 09 Aug 2012 14:22:43 +0000
Received: by obbta17 with SMTP id ta17so707766obb.36
 for <linux-mtd@lists.infradead.org>; Thu, 09 Aug 2012 07:22:39 -0700 (PDT)
Message-ID: <5023C82B.3000007@gmail.com>
Date: Thu, 09 Aug 2012 10:24:43 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [YAFFS] bad block management policy
References: <CAFV5biDrgbhJ=_FyPd8YrNsnOUpSrCu-vhsq2GfNsbZ9M2F6Rg@mail.gmail.com>
In-Reply-To: <CAFV5biDrgbhJ=_FyPd8YrNsnOUpSrCu-vhsq2GfNsbZ9M2F6Rg@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/09/2012 06:45 AM, peterlingoal wrote:
> Hi,
>
> I am using YAFFS2 filesystem and some NANDs have hundreds and
> thousands (out of 4K) blocks identified bad. After checking I found
> YAFFS2 is marking a block bad if three fixable ECC errors happens
> within a block. My question is:
>
> 1. I am using two Micron NAND chips, one requires minimum 1bit ECC
> while the other requires 4. Bit flipping (although all fixable) seems
> happen quite often in both types, is this expected behavior?
> 2. Micron error management doc requests to mark a block bad only when
> program or erase operations fails, but not mentioning reading. So is
> it safe to remove this ECC error counter? Will it lead to un-fixable
> error?
the "strike count" is used to predict when a block has been programmed
enough times that it is close to failure (where programmed data read
back contains uncorrectable bit errors).

This worked fine for the larger-geometry SLC devices that didn't show
correctable ECC errors until a block was very near its end of life. 
However newer small-geometry SLC/MLC devices require stronger ECC to
keep the same UBER (uncorrectable bit error rate) as previous generation
devices.  Unfortunately this means that more correctable errors will be
seen, long before the block is near its end of life.

You could modify YAFFS to ignore -EUCLEAN returns from MTD which will
prevent YAFFS from marking blocks bad prematurely, but then there is no
way to predict when a block is about to wear out and return
uncorrectable errors (-EBADMSG).


-- 
Peter Barada
peter.barada@gmail.com
