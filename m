Received: from mail.windriver.com ([147.11.1.11])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OEvGy-0004yw-Me
	for linux-mtd@lists.infradead.org; Thu, 20 May 2010 02:14:09 +0000
Message-ID: <4BF49D66.5050206@windriver.com>
Date: Thu, 20 May 2010 10:24:38 +0800
From: "stanley.miao" <stanley.miao@windriver.com>
MIME-Version: 1.0
To: Raghu MSRPSR <raghu.msrpsr@gmail.com>
Subject: Re: Running jffs2 filesystem on mtd nand flash driver
References: <AANLkTikZvz3qFYQuh4BKf0LuN2F6gtWuEbQgisl0fZ1F@mail.gmail.com>
In-Reply-To: <AANLkTikZvz3qFYQuh4BKf0LuN2F6gtWuEbQgisl0fZ1F@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

http://patchwork.ozlabs.org/patch/44340/
http://patchwork.ozlabs.org/patch/44344/

 > flash_eraseall -j /dev/mtdx
 > mount -t jffs2 /dev/mtdblockx /flash

Hi, Artem,

Are you the maintainer of mtd-utils ? A lot of people suffered from the 
same issues.
Can you merge these patches into mtd-utils ?

Thanks.
Stanley.

Raghu MSRPSR wrote:
> Hi,
>
> Could some one /review post a exact sequence of steps to get jffs2 up
> and running on a NAND MTD driver for kernel 2.6.27+
>
> 1. load nand (mtd) driver
>  2. flash_eraseall -q /dev/mtdx
>   3. mount -t jffs2 /dev/mtdblockx /flash
>
> is this correct sequence?
>
> Any info shared is appreciated.
>
> Thanks,
> Raghu
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>   
