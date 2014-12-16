Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0oK9-00021W-UD
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 09:21:46 +0000
Message-ID: <548FF98E.5000503@nod.at>
Date: Tue, 16 Dec 2014 10:21:18 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: hujianyang <hujianyang@huawei.com>, Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: add ubi_err() to report the failure of leb read
References: <548FE51D.60707@huawei.com> <548FE72D.5040803@huawei.com>
In-Reply-To: <548FE72D.5040803@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 16.12.2014 um 09:02 schrieb hujianyang:
> Hi,
> 
> I met a problem that I was failed to mount a UBIFS partition.
> 
> [   38.442770] UBI error: ubi_io_read: error -74 (ECC error) while reading 26624 bytes from PEB 54:104448, read 26624 bytes
> [   38.852461] UBI error: ubi_io_read: error -74 (ECC error) while reading 77824 bytes from PEB 346:53248, read 77824 bytes
> [   38.864142] UBIFS error (pid 1444): ubifs_recover_leb: corruption -3
> [   38.870487] UBIFS error (pid 1444): ubifs_scanned_corruption: corruption at LEB 928:55280
> [   38.878625] UBIFS error (pid 1444): ubifs_scanned_corruption: first 8192 bytes from LEB 928:55280
> [   38.892117] UBIFS error (pid 1444): ubifs_recover_leb: LEB 928 scanning failed
> mount: mounting ubi1:bak on /HFFS2: failed: Structure needs cleaning
> 
> I think it is caused by an ECC error of nand flash. Do we have some methods
> to mount this partition? Data losing is acceptable.

I don't think that UBIFS has such a mount option.
You can dump the raw data and inspect the corrupted data.
Maybe you can fix it by hand.

Thanks,
//richard
