Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cWfdm-0004Ao-Tn
 for linux-mtd@lists.infradead.org; Thu, 26 Jan 2017 08:42:48 +0000
Subject: Re: UBIFS errors are randomly seen after reboots
To: chaitanya vinnakota <chaitanya.sai.v@gmail.com>,
 linux-mtd@lists.infradead.org
References: <CAMBC=j5fyW1BMAeDGzJp480fikZVVj2npk=WO5jmRTa+_ixEkw@mail.gmail.com>
 <CAFLxGvzROo7Y0CNE3Qyi4jj-J526XYebgO_G8TLS9+oCJ+fBPQ@mail.gmail.com>
 <CAMBC=j7Yjk5RkT5xg1N=q3aVf45BbJgtYaZ8vsy3oBjZ+OOOaA@mail.gmail.com>
 <01b355e9-6095-a2af-5c77-3e15751ff8da@nod.at>
 <CAMBC=j7fn7tqouMD3ZQptZF_xRO5Xsx7HOXaGQahCQm2ug3RUw@mail.gmail.com>
 <0f04ed5e-e7fb-7bbf-678d-840fe0be4b16@nod.at>
 <CAMBC=j6t2h_yB3wQbNUexrJto+O3ruTXo992JWFLH293OyH0Bg@mail.gmail.com>
 <10f4c447-f1e5-89dc-17b6-b5d450a473fe@nod.at>
 <CAMBC=j5nyA=7vCb_AeM_oYAS+p_+mrcG=nwXVDO6WqD=Sg_nMg@mail.gmail.com>
 <CAMBC=j74mtCsatQnhOLfouA6d58VCd69YY9W8c=Soa8CiCtTFA@mail.gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <d11de80d-7136-4113-d43f-dcb024f8c4ee@nod.at>
Date: Thu, 26 Jan 2017 09:42:23 +0100
MIME-Version: 1.0
In-Reply-To: <CAMBC=j74mtCsatQnhOLfouA6d58VCd69YY9W8c=Soa8CiCtTFA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Chaitanya,

Am 23.01.2017 um 11:48 schrieb chaitanya vinnakota:
> Hi Richard,
> 
> We are seeing UBIFS errors even when the root-filesystem  is mounted
> read-only. But , the error is reported only once.
> Our test scenario is we are rebooting the device by calling "reboot"
> from a script ,  during data-write operations to the mtd partitions
> other than root-filesystem executed by another script.
> 
> What's more baffling is why root-filesystem UBIFS errors are seen when
> the data-write operations are  performed on the other partitions and
> most importantly when rootfs is mounted read-only,
> 
> [  155.121005] UBIFS error (pid 5040): ubifs_decompress: cannot
> decompress 2434 bytes, compressor zlib, error -22

The compressor fails to uncompress because the payload is corrupted.
This can be due to a driver bug, not strong enough ECC, etc..

> [  155.121017] UBIFS error (pid 5040): read_block: bad data node
> (block 60, inode 3484)
> [  155.121026] UBIFS error (pid 5040): do_readpage: cannot read page
> 60 of inode 3484, error -22
> 
> ECC errors are also observed sometimes when the rootfs is mounted read-only
> 
> [  154.824361] ECC: uncorrectable error 2 !!!
> [  154.824368] ECC correction failed for page 0x00014b58
> [  154.825474] ECC: uncorrectable error 2 !!!
> [  154.825479] ECC correction failed for page 0x00014b58
> [  154.825604] UBI warning: ubi_io_read: error -74 (ECC error) while

Here we have a classic ECC error. This should not happen on fresh
NANDs.

> reading 188 bytes from PEB 451:50368, read only 188 bytes, retry
> 
> The page 0x00014b58 falls in the rootfs partition. But , nanddump
> utility is not reporting any bad blocks from the rootfs partition .
> 
>  ~# nanddump /dev/mtd4
> nanddump: warning!: you did not specify a default bad-block handling
>   method. In future versions, the default will change to
>   --bb=skipbad. Use "nanddump --help" for more information.
> nanddump: warning!: in next release, nanddump will not dump OOB
>   by default. Use `nanddump --oob' explicitly to ensure
>   it is dumped.
> ECC failed: 0
> ECC corrected: 0
> Number of bad blocks: 0
> Number of bbt blocks: 0
> 
>  We ran mtd and ubi tests , mtd all tests passed but UBI one test i.e
> io_basic failed.
> 
> Can you please help us in this regard. Any inputs or suggestions ?

This is not easy. I suggest to double check all NAND/MTD settings from
group up. Timings, ECC strength, basic driver testing...

Thanks,
//richard
