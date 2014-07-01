Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X1ykm-0006J2-74
 for linux-mtd@lists.infradead.org; Tue, 01 Jul 2014 14:09:50 +0000
Message-ID: <1404223553.6841.100.camel@sauron.fi.intel.com>
Subject: Re: Correct behaviour of ubiattach / ubiformat in the face of ECC
 errors?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
Date: Tue, 01 Jul 2014 17:05:53 +0300
In-Reply-To: <EACD232272DA4849B060F0828564D13B0AA3DB90FC@ntcex01.corp.netcomm.com.au>
References: <EACD232272DA4849B060F0828564D13B0AA3DB90FC@ntcex01.corp.netcomm.com.au>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-06-19 at 13:15 +1000, Iwo Mergler wrote:
> Hi all,
> 
> 
> I'm debugging a NAND driver and I'm unsure about what the correct behaviour
> of ubiformat / ubiattach ought to be in the face of uncorrectable ECC errors.
> 
> This is a 2.6.35 kernel, with UBI/UBIFS updated to the top of
> git://git.infradead.org/~dedekind/ubifs-v2.6.35.git and mtd-utils v1.5.1.
> 
> My question is, what is ubiattach / ubiformat supposed to do if a non-correctable 
> ECC error occurs in a block during the scan?

Generally, 'ubiformat' is about to destroy all the data, so should
ignore errors and just go on, generally speaking.

'ubiattach' asks the kernel to attach the media. And generally, it
should do something about ECC errors.

> My gut feeling says that ubiattach should fail if the PEB was in use, but ubiformat
> should mark the PEB as bad and continue.

> This is not the behaviour I'm observing. The broken PEB in the examples below
> contains a EC header, but no VID header - it's not in use.
> 
> To complicate matters, I'm also unsure about the correct return value from the
> NAND driver in this situation. Depending on which documentation I read, it should
> now return -1, -EIO or -EBADMSG.

-EBADMSG. I think we have this documented in several places.

> [   20.080000] HWECC(1) - MBE detected ([5ff00]-0000)
> [   20.080000] SWECC(1) - MBE detected ([5ff00]-0000/0)
> [   20.090000] [T88]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMSG], page=0x5ff00
> [   20.090000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 13796:0, read only 0 bytes, retry
> [   20.110000] HWECC(1) - MBE detected ([5ff00]-0000)
> [   20.110000] SWECC(1) - MBE detected ([5ff00]-0000/0)
> [   20.120000] [T88]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMSG], page=0x5ff00
> [   20.120000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 13796:0, read only 0 bytes, retry
> [   20.140000] HWECC(1) - MBE detected ([5ff00]-0000)
> [   20.140000] SWECC(1) - MBE detected ([5ff00]-0000/0)
> [   20.150000] [T88]bovine_nand_read_page_hwecc:671: Returned -74 [-EBADMSG], page=0x5ff00
> [   20.150000] UBI warning: ubi_io_read: error -74 (ECC error) while reading 64 bytes from PEB 13796:0, read only 0 bytes, retry

Notice "read only 0 bytes". I believe the MTD API assumes that even if
there is an ECC error, you should still return the data. You indicate
that they are corrupted using -EBADMSG, but you return them. Your driver
returns no data by saying that it read 0 bytes. Please, correct this.

-- 
Best Regards,
Artem Bityutskiy
