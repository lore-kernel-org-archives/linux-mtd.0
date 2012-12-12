Received: from mail.pce.us.com ([69.40.160.195])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TipcU-0007Vf-7a
 for linux-mtd@lists.infradead.org; Wed, 12 Dec 2012 16:57:18 +0000
Message-ID: <50C8B76A.9020103@itwatchdogs.com>
Date: Wed, 12 Dec 2012 10:57:14 -0600
From: Zach Sadecki <zsadecki@itwatchdogs.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Always report ECC stats and return max_bitflips
References: <50BD01F8.3040003@itwatchdogs.com>
 <1355147097.2657.33.camel@sauron.fi.intel.com>
 <50C5FD4A.6090405@itwatchdogs.com>
 <1355325438.3400.4.camel@sauron.fi.intel.com>
In-Reply-To: <1355325438.3400.4.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/12/2012 09:17 AM, Artem Bityutskiy wrote:
> patching file drivers/mtd/nand/gpmi-nand/gpmi-nand.c
> Hunk #1 FAILED at 921.
> Hunk #2 FAILED at 946.
> Hunk #3 FAILED at 996.
> 3 out of 3 hunks FAILED -- saving rejects to file drivers/mtd/nand/gpmi-nand/gpmi-nand.c.rej
>
Odd.  I used git format-patch on a freshly cloned l2-mtd repo...  I 
don't know what could be wrong.  I did a fresh pull, and another git 
format-patch and it generated the exact same patch file.  Any ideas?
