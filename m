Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TTazP-0006FK-ID
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2012 16:18:00 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so1018125pbc.36
 for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2012 09:17:57 -0700 (PDT)
Message-ID: <50914F32.7020605@gmail.com>
Date: Wed, 31 Oct 2012 09:17:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Robin van der Gracht <robin@protonic.nl>, dwmw2@infradead.org
Subject: Re: [PATCH] mtd: nand: Take celltype into account when parsing Samsung
 ext. nand ID's
References: <1351679539-30651-1-git-send-email-robin@protonic.nl>
In-Reply-To: <1351679539-30651-1-git-send-email-robin@protonic.nl>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: sjhill@realitydiluted.com, tglx@linutronix.de,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Robin,

On 10/31/2012 03:32 AM, Robin van der Gracht wrote:
> When using a Samsung nandflash with 2 level cells, the wrong page size,
> erase size and oobsize is calculated.
>
> I'm using a Samsung K9K8G08U0B nandflash (ID: 0xECD3519558). When booting the kernel i get:
> NAND device: Manufacturer ID: 0xec, Chip ID: 0xd3 (Samsung NAND 1GiB 3,3V 8-bit), page size: 4096, OOB size: 128
>
> This is wrong. My nand flash has a pagesize of 2048 and oobsize 64.
>
> This patch should work for all Samsung 6 byte ID chips, found on:
> http://www.linux-mtd.infradead.org/nand-data/nanddata.html
>
> Signed-off-by: Robin van der Gracht <robin@protonic.nl>

I believe this regression has already been fixed and accepted by David 
Woodhouse and is awaiting upstream submission - hopefully for the 3.7-rc 
cycle. This should be its ID, in linux-mtd.git (and linux-next):

commit bc86cf7af2ebda88056538e8edff852ee627f76a
mtd: nand: fix Samsung SLC NAND identification regression

http://lists.infradead.org/pipermail/linux-mtd/2012-October/044458.html

Please test this fix to see if it fixes your problem, if possible. BTW, 
I would prefer not to use your solution, as the new Samsung ID decode 
table actually applies to some 2-level (i.e., SLC) Samsung NAND, 
particularly K9FAG08U0M.

Brian
