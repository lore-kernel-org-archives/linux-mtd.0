Received: from py-out-1112.google.com ([64.233.166.183])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7jUl-0001JV-Fi
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 21:56:35 -0400
Received: by py-out-1112.google.com with SMTP id x31so769273pye
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jul 2006 18:56:24 -0700 (PDT)
Message-ID: <1b712b840607311856s3096a6ebu9bdef35601c25685@mail.gmail.com>
Date: Mon, 31 Jul 2006 20:56:24 -0500
From: "Brijesh Singh" <brijesh.ksingh@gmail.com>
To: "Josh Boyer" <jwboyer@gmail.com>
Subject: Re: mtdparts kernel cmdline
In-Reply-To: <625fc13d0607311721l7fd6a0bcmfa00667edbe6885a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1b712b840607311534n2e67b5fcqde683b3469ccd65f@mail.gmail.com>
	<625fc13d0607311721l7fd6a0bcmfa00667edbe6885a@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Josh,

Thanks for your comment.

Yes i understand in first case physmap driver creates the requested
two partitions. But when i tried to ran "eraseall -j /dev/mtd1" to
create jffs2 filesystem. The utility erases the entire flash rather
than starting from 0x40000 offset.
Hence i suspected that its not picking up the correct starting offset.

To debug further i ran "mtd_debug" utility to verify the ambiguity
between partitions created by cmdline and physmap driver.

1) mtd_debug info /dev/mtd0 without kernelcmd
# mtd_debug info /dev/mtd0
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 33554432 (32M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 1

region[0].offset = 0x00000000
region[0].erasesize = 65536 (64K)
region[0].numblocks = 512
region[0].regionindex = 0

2) mtd_debug with kernel cmd

root~# mtd_debug info /dev/mtd0
       mtd.type = MTD_NORFLASH
      mtd.flags = MTD_ERASEABLE
       mtd.size = 262144 (256K)
        mtd.erasesize = 65536 (64K)
        mtd.oobblock = 0
        mtd.oobsize = 0
        mtd.ecctype = MTD_ECC_NONE
        regions = 0

# mtd_debug info /dev/mtd1
mtd.type = MTD_NORFLASH
mtd.flags = MTD_CAP_NORFLASH
mtd.size = 3145728 (3M)
mtd.erasesize = 65536 (64K)
mtd.oobblock = 0
mtd.oobsize = 0
mtd.ecctype = MTD_ECC_NONE
regions = 0


So the question is why kernel does not find "regions" field when
executed with cmdline argument ?

Thanks,
Brijesh

On 7/31/06, Josh Boyer <jwboyer@gmail.com> wrote:
> On 7/31/06, Brijesh Singh <brijesh.ksingh@gmail.com> wrote:
>
> > Can you give me a pointer on  why the "regions/offset/numblocks"
> > fields are blank when I use kernel cmdline parameter.
>
> You're using physmap to map the overall chip.  The default behavior of
> that mapping driver is to create partitions if they exist then return,
> which it does in your first case.  If no partitions are found, it will
> create a single MTD for the entire chip.  That is what you are seeing
> in the case where you do not specify any partitions on the command
> line.
>
> josh
>


-- 
Confusion is always the most honest response.
