From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Nancy'" <nancydreaming@gmail.com>
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
	<002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
	<bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
Subject: RE: Does UBI support MLC nand flash?
Date: Wed, 2 Jan 2008 16:23:31 +0900
Message-ID: <003c01c84d10$9cb210b0$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <bae050c10801012213p2c7d630r6efcf5c1f77b78df@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Refer to previous mail [1,2] related with terminology.

We have to check the flash type & flags such as MTD_OOB_WRITEABLE in mtd-utils too. Or use the mtd_ops to write main and oob
simultaneously if the detected chip is MLC.

Thank you,
Kyungmin Park

1. http://lists.infradead.org/pipermail/linux-mtd/2007-December/020041.html
2. http://git.infradead.org/?p=users/kmpark/onenand-mtd-2.6.git;a=commitdiff;h=4dbecbd80d346f9f6cd5284fb423f5c62bdbc750


-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Nancy
Sent: Wednesday, January 02, 2008 3:13 PM
To: kmpark@infradead.org
Cc: linux-mtd@lists.infradead.org
Subject: Re: Does UBI support MLC nand flash?

Sir,
     I don't know what is NOP, POP stand for? can you explain that?

     I notice mtd-utils "nandwrite.c" does write each page's oob area
twice, write oob(filesystem area) once, and then call "pwrite" to
write pagedata including oob (ecc part). I don't think that will work
right on MLC nand.


--
Best Regards,
Nancy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
