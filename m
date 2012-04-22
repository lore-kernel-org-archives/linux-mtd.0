Received: from mail-pz0-f43.google.com ([209.85.210.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLxDO-00074r-CF
 for linux-mtd@lists.infradead.org; Sun, 22 Apr 2012 13:52:35 +0000
Received: by dadn15 with SMTP id n15so17593767dad.16
 for <linux-mtd@lists.infradead.org>; Sun, 22 Apr 2012 06:52:32 -0700 (PDT)
Message-ID: <4F940D08.3080101@gmail.com>
Date: Sun, 22 Apr 2012 21:52:08 +0800
From: Mark <xiaoming1981.zhang@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBIFS mount failure upon power off
References: <4F85764C.7070408@gmail.com> <1335100532.28267.9.camel@brekeke>
In-Reply-To: <1335100532.28267.9.camel@brekeke>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 04/22/2012 09:15 PM, Artem Bityutskiy wrote:
> Hi,
>
> On Wed, 2012-04-11 at 20:17 +0800, Mark wrote:
>>  brcmnand_read_page: 3: brcmnand_posted_read_cache failed at
>>  offset=3c81c00, ret=-77
>>  UBI error: ubi_io_read: error -77 while reading 126976 bytes from PEB
>>  21:4096, read 2048 bytes
>>  UBIFS error (pid 484): ubifs_start_scan: cannot read 126976 bytes from
>>  LEB 18:0, error -5
>>  mount: mounting ubi13_0 on /usr/local/appdata failed: Input/output
>>  error
>>
> Please fix your NAND driver and why it returns strange error code
> -EBADFD (-77). Uncorrectable ECC errors should be reported as -EBADMSG
> instead. Bit-flips as -EUCLEAN.
>

Thank you very much, I still have some questions:

1. I'm using mips platform so I think "-77" is "-EBADMSG":
       ./arch/mips/include/asm/errno.h:51:#define      EBADMSG 
77      /* Not a data message */

2. I found these comments in ubi_io_read():
	        /* 
 

                  * The driver should never return -EBADMSG if it failed 
to read 

                  * all the requested data. But some buggy drivers might 
do 

                  * this, so we change it to -EIO. 
 

                  */

    but seems my nand driver do_read_ops() function returns immediately
    on an ecc error. Why the driver must continue reading the left data?

3. I fixed this problem, in most situations the ubifs can recover 
successfully,
    but I still get this error (though difficult to reproduce):

        UBI error: ubi_io_read: error -77 while reading 126976 bytes 
from PEB 2:4096, read 126976 bytes
        UBIFS error (pid 481): insert_node: duplicate sqnum in replay
        mount: mounting ubi13_0 on /usr/local/hmt/appdata failed: 
Invalid argument

    What could be the reason?

4. The problem mentioned in #2 and #3 never happens with yaffs2.

Thank you very much.

-- 
Have fun,
Mark Zhang
