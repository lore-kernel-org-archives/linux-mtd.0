Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YL5pf-0003do-M8
 for linux-mtd@lists.infradead.org; Tue, 10 Feb 2015 08:06:08 +0000
Message-ID: <1423555541.2573.63.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: improve messages in ubi_eba_read_leb()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: hujianyang <hujianyang@huawei.com>
Date: Tue, 10 Feb 2015 10:05:41 +0200
In-Reply-To: <54D97D9E.3040606@huawei.com>
References: <54D97D9E.3040606@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-02-10 at 11:40 +0800, hujianyang wrote:
> If an error occur while reading from PEBs, for example, an ECC error,
> ubi_io_read() will print some error messages. But it's not enough for
> debugging. These messages don't show the mapping info for a read from
> UBIFS layer.
> 
> Although UBIFS will soon print its error messages after catching the
> return value from UBI layer,  multi-path reading will confuse the
> relationship between LEBs and PEBs showed by these messages, like:
> 
> [   38.442770] UBI error: ubi_io_read: error -74 (ECC error) while reading 26624 bytes from PEB 54:104448, read 26624 bytes
> [   38.852461] UBI error: ubi_io_read: error -74 (ECC error) while reading 77824 bytes from PEB 346:53248, read 77824 bytes
> [   38.864142] UBIFS error (pid 1444): ubifs_recover_leb: corruption -3
> [   38.870487] UBIFS error (pid 1444): ubifs_scanned_corruption: corruption at LEB 928:55280
> [   38.878625] UBIFS error (pid 1444): ubifs_scanned_corruption: first 8192 bytes from LEB 928:55280
> [   38.892117] UBIFS error (pid 1444): ubifs_recover_leb: LEB 928 scanning failed
> mount: mounting ubi1:bak on /mountpoint: failed: Structure needs cleaning
> 
> This patch improve the output of ubi_eba_read_leb() by printing the
> mapping of LEB and PEB if an ECC error occur. And also, print PEB
> and LEB number if a CRC error occur.
> 
> Signed-off-by: hujianyang <hujianyang@huawei.com>

Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
