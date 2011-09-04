Received: from mail-iy0-f177.google.com ([209.85.210.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R09o6-0007Wg-6t
	for linux-mtd@lists.infradead.org; Sun, 04 Sep 2011 10:20:06 +0000
Received: by iacb35 with SMTP id b35so6215752iac.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 04 Sep 2011 03:20:03 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 4 Sep 2011 15:50:03 +0530
Message-ID: <CAMjNe_fdRw=5-MjOii8aGfEvejPo-dR6Rpf1=JQf_gMJ3U9jfQ@mail.gmail.com>
Subject: logfs: max 4K writepage size
From: srimugunthan dhandapani <srimugunthan.dhandapani@gmail.com>
To: =?ISO-8859-1?Q?J=F6rn_Engel?= <joern@logfs.org>,
	linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>
>> While i still have your attention, i would like to point out at max
>> writepage size restriction in logfs. Currently logfs has a max
>> writepage size as 4K. Currently, large page nand flashes and MLC nand
>> come in  8K page sizes. As the usecase for logfs is large nand
>> flashes(mostly with parallel and DMA write capabilities),  it may be
>> essential to remove the 4K write page size restriction.
>> I was only able to change the logfs-tools for >4K writepage size. If
>> you send a patch, that makes logfs useable for writepagesize >4K, i
>> can try on real hardware, instead of nandsim and give you the results
>> :-)
>
> That sure sounds useful.  I'll have a look...
>
> J=F6rn

If you plan to do this, when can we expect your patches in the kernel?
Can you suggest what changes have to be done to have >4K writepage size.
>From what i looked, it doesnt seem straight forward. I think the 4K
writepage size restriction is because
the flash device is memory mapped for caching purposes.
Initially, I wouldnt want to have the caching feature. Is there some
code in the ancient logfs tree
(http://git.kernel.org/?p=3Dlinux/kernel/git/joern/ancient_logfs.git;a=3Dsu=
mmary)
without the device mapping, that i can make use of?

Thanks,
mugunthan
