From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Nancy'" <nancydreaming@gmail.com>,
	<linux-mtd@lists.infradead.org>
References: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
Subject: RE: Does UBI support MLC nand flash?
Date: Wed, 2 Jan 2008 13:45:01 +0900
Message-ID: <002601c84cfa$7886bc10$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-reply-to: <bae050c10801011742s762cd289ta9aae5881e294598@mail.gmail.com>
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

I think it can support MLC NAND in the code.
The big differences between the SLC and MLC are NOP (or subpage) and POR handling.

Generally SLC has NOP 4 (old chips have 8) whereas MLC has NOP 1.
In NAND code, it handles with NAND_NO_SUBPAGE_WRITE and NAND_CI_CELLTYPE_MSK.
Umm, who uses the NAND_NO_SUBPAGE_WRITE in code?
Anyway it maybe checks it with the CELLTYPE from 3rd ID data.

And sequential write is also only permitted at large page SLC NAND. It means it's working well on MLC NAND in current UBI code. If
not, it also doesn't work at SLC NAND.

Thank you,
Kyungmin Park

-----Original Message-----
From: linux-mtd-bounces@lists.infradead.org [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of Nancy
Sent: Wednesday, January 02, 2008 10:42 AM
To: linux-mtd@lists.infradead.org
Subject: Does UBI support MLC nand flash?

Sir / Madam,

             Does UBI support MLC nand flash?

             According to the MLC nand spec, It is only allowed write
once per erased
block, moreover, it isn't allowed ramdom write during a block, means
the page number must be increase during the write PED operation.


--
Best Regards,
Nancy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
