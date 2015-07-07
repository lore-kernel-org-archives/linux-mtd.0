Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZCQgX-0006Fj-UH
 for linux-mtd@lists.infradead.org; Tue, 07 Jul 2015 11:05:11 +0000
Message-ID: <559BB24C.5080205@nod.at>
Date: Tue, 07 Jul 2015 13:04:44 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Egli, Samuel" <samuel.egli@siemens.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: autoresize causes insufficient reservation of PEBs for bad PEB
 handling
References: <27E9275BC1C8554E840881B19B62BE421A8FD9@DENBGAT9EI1MSX.ww902.siemens.net>
 <CAFLxGvwLZ0YKX9f=QzAt-+AfgPgUiJMT2WfUBx3UMbX0z+mnGA@mail.gmail.com>
 <27E9275BC1C8554E840881B19B62BE421A92F3@DENBGAT9EI1MSX.ww902.siemens.net>
In-Reply-To: <27E9275BC1C8554E840881B19B62BE421A92F3@DENBGAT9EI1MSX.ww902.siemens.net>
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

Am 07.07.2015 um 12:59 schrieb Egli, Samuel:
> Hello Richard,
>> Something I did not notice yesternight, 140+140+341 is 621.
>> According to your logs the MTD partition is only 508MiB large.
> 
> oops. Sorry, this is my mistake. We have to products with same 
> number of volumes and names but with different volume sizes.
> 
> The samples I linked on gist have vol_size for rootfs_a and 
> rootfs_b set to 70MiB. So when setting the 3rd vol_size to
> 341MiB I get like linked before from "ubinfo -a" the following:
> 
> ubi0
> Volumes count:                           3
> Logical eraseblock size:                 126976 bytes, 124.0 KiB
> Total amount of logical eraseblocks:     4065 (516157440 bytes, 492.2 MiB)
> Amount of available logical eraseblocks: 7 (888832 bytes, 868.0 KiB)
> Maximum count of volumes                 128
> Count of bad physical eraseblocks:       0
> Count of reserved physical eraseblocks:  80
> Current maximum erase counter value:     2
> Minimum input/output unit size:          2048 bytes
> Character device major/minor:            251:0
> Present volumes:                         0, 1, 2
>  
Richard Weinberger <richard.weinberger@gmail.com>> Volume ID:   0 (on ubi0)
> Type:        dynamic
> Alignment:   1
> Size:        579 LEBs (73519104 bytes, 70.1 MiB)
> State:       OK
> Name:        rootfs_a
> Character device major/minor: 251:1
> -----------------------------------
> Volume ID:   1 (on ubi0)
> Type:        dynamic
> Alignment:   1
> Size:        579 LEBs (73519104 bytes, 70.1 MiB)
> State:       OK
> Name:        rootfs_b
> Character device major/minor: 251:2
> -----------------------------------
> Volume ID:   2 (on ubi0)
> Type:        dynamic
> Alignment:   1
> Size:        2816 LEBs (357564416 bytes, 341.0 MiB)
> State:       OK
> Name:        configuration
> Character device major/minor: 251:3
> 
> So this is actually ok. I get my 80 blocks reserved.
> 
> Sorry for the confusion.

Okay. So there is no issue at all? :-)

Thanks,
//richard
