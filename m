Received: from an-out-0708.google.com ([209.85.132.241])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HmdGa-00036d-Pc
	for linux-mtd@lists.infradead.org; Fri, 11 May 2007 18:07:13 -0400
Received: by an-out-0708.google.com with SMTP id d17so269241and
	for <linux-mtd@lists.infradead.org>;
	Fri, 11 May 2007 15:07:09 -0700 (PDT)
Message-ID: <97c001730705111507q4a79c876j9f3a4e5f64df0a90@mail.gmail.com>
Date: Fri, 11 May 2007 17:07:09 -0500
From: Meher <mail2meher@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: BBT structure for NAND flash:updated
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,
  I havent received any reply so I am assuming either the information
I provided did not make sense or I asked a asking that does not belong
in thsi mailing list :( but I am providing some more info here so that
some one can atleast point em to the right list for this:

 I am still looking at what is the format of the bad block table that
is created by the MTD NAND layer when the nand_scan_bbt is called. If
I select something like 2 bits per block then will the table be
something like
------------------------------------------------------------------------------------------------------------
|   block num  |  block type  ||   block num  |  block type  |
| 16-bits         |   2 bits        || 16-bits         |   2 bits        |
|---------------------------------------------------------------------------------------------------------

where first 2 bytes represent block num and 2 bits of next 1/2 bytes
will be block type(good, bad, factory bad)?? I am not able to
visualize this structure from the nand_scan_bbt code.. If I can know
how this structure looks like then I can search for this and load it
so that my bootloader is in sync with the bad blocks developed during
updating process..


On 5/10/07, Meher <mail2meher@gmail.com> wrote:
> HI,
>      We have an ARM-9 based board with NAND flash. The ROM boot
> laoder will load the kernel loader from NAND and the kernel loader
> will load the kernel and pass the file system information to the
> kernel. To have a good bad block management scheme for the boot loader
> I am planning to use the BBT table generated using MTD API.
>   I would like to understand what will be the structure of the BBT
> table created using MTD layer? When I set the parameters to created
> user defined BBT table say at the end of the flash will the NAND
> driver in linux kernel actually create the BBT at the last two blocks
> of the physcial NAND block? Can I have my ROM bootlaoder read this BBT
> so that it can identify any non-factory bad blocks that arised due to
> upgrading of kernel loader.
>
>
>
> --
> Regards,
> Meher
>


-- 
Regards,
Meher
