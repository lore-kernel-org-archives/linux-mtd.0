Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mseu8-0001WM-27
	for linux-mtd@lists.infradead.org; Tue, 29 Sep 2009 15:46:20 +0000
Subject: RE: UBIFS and hardware ECC of all FF pages of MLC NAND
From: Artem Bityutskiy <dedekind@infradead.org>
To: Darwin Rambo <drambo@broadcom.com>
In-Reply-To: <B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
References: <B125D8217ABC4B43826503DE00A2D44910D7E85DFD@SJEXCHCCR01.corp.ad.broadcom.com>
	<4ABB7224.8000804@nokia.com> <4ABB921B.8090500@parrot.com>
	<1253862309.3778.25.camel@localhost>
	<B125D8217ABC4B43826503DE00A2D44910D7F2EA60@SJEXCHCCR01.corp.ad.broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 29 Sep 2009 18:42:16 +0300
Message-Id: <1254238936.3778.109.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-09-29 at 06:26 -0700, Darwin Rambo wrote:
> Artem,
> 
> One thing you might add is a paranoid check for the OOB being set to 0xFF before 
> programming a page. If someone programs trailing pages in a block of 0xFF by mistake, 
> and puts a non-0xFF ECC in the OOB, then the UBIFS code would write to an already 
> written ECC, which I have found to corrupt other blocks ECCs on my part. It also gives 
> strange error messages and refuses to mount on reboot. The messages do not look like 
> they are related to the original ECC write problem so it is harder to debug.

Do you mean extending the 'ubi_dbg_check_all_ff()' check and make it
also read OOB to make sure there are only 0xFF bytes? Well, it might be
useful, but I would prefer to get a patch from someone, rather than
implementing this myself. :-)

> With this particular error, you can see messages like below:
> 
> UBIFS error (pid 245): ubifs_read_node: bad node type (255 but expected 2)
> UBIFS error (pid 245): ubifs_read_node: bad node at LEB 73:456392
> UBI error: ubi_io_read: error -74 while reading 64 bytes from PEB 3:0, read 64 bytes

Well, here I already see that the problem is on driver level because I
cannot read data. Also, if your driver prints an error message in case
of an uncorrectable ECC errors, this could help.

> UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling,
>  reserved 17, need 19
> UBI warning: ubi_eba_copy_leb: error -74 while reading data from PEB 3
> UBI error: wear_leveling_worker: error -74 while moving PEB 3 to PEB 2
> UBI warning: ubi_ro_mode: switch to read-only mode
> UBI error: do_work: work failed with error code -74
> UBI error: ubi_thread: ubi_bgt0d: work failed with error code -74
> UBI error: ubi_io_read: error -74 while reading 516096 bytes from PEB 3:8192, re
> ad 516096 bytes
> UBIFS error (pid 1): ubifs_scan: corrupt empty space at LEB 1:8192
> UBIFS error (pid 1): ubifs_scanned_corruption: corrupted data at LEB 1:8192
> UBIFS error (pid 1): ubifs_scan: LEB 1 scanning failed
> UBI error: ubi_io_read: error -74 while reading 516096 bytes from PEB 3:8192, read 516096 bytes
> UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master node

... snip ...

> A better error message would say something like:
> "UBI error: Data page incorrectly programmed to all 0xFFs with non-0xFF ECC."

Probably, but that would happen only if you have debugging checks
enabled, right?

> Another suggestion is rather than creating large files stuffed with 0xFF pads the 
> end of some of the blocks, to have a ubinize option which creates a download header 
> in front of each block with block length and valid data length. Then the 0xFF's 
> wouldn't have to be carried around and the user would be less likely to program 
> 0xFF's by mistake. They would typically only program the useful data that is in 
> the file instead, and since they erased the block to program, the trailing 0xFFs
> would be taken care of automatically. Of course, this would require custom flasher
> changes to accommodate. Thanks.

It is doable, but I can predict then other people will complain why the
hack they cannot use simple nandwrite when flashing UBI images. And for
many people who have HW which has no problems with writing 0xFFs - plane
nandwrite is usable.

But how much 0xFFs are there are? There should not be that many. We pad
special areas like the UBIFS log, the UBI volume table, the UBIFS lprops
area, the UBIFS master area with 0xFF, but that is it. Your _data_,
i.e., the FS contents is not "stuffed with 0xFFs", it is only those
special UBIFS areas.

So, does it really worth doing what you have suggested? Skipping 0xFFed
works just fine. Will the images be really much smaller?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
