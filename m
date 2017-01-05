Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cP7qi-0000FW-JZ
 for linux-mtd@lists.infradead.org; Thu, 05 Jan 2017 13:12:58 +0000
Subject: Re: [patch] ubifs: potential uninitialized variable in
 truncate_data_node()
To: "Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, David Gstir <david@sigma-star.at>
References: <20170105124635.GA8525@elgon.mountain>
 <787dbd07f1ed419ca37f3bb0c6f6c84a@SGPMBX1023.APAC.bosch.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5f927d38-c92c-55eb-f2a7-bba3b5f0ebd8@nod.at>
Date: Thu, 5 Jan 2017 14:12:24 +0100
MIME-Version: 1.0
In-Reply-To: <787dbd07f1ed419ca37f3bb0c6f6c84a@SGPMBX1023.APAC.bosch.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Raghavan Anurag,

Am 05.01.2017 um 13:54 schrieb Anurag Raghavan (RBEI/ETW11):
> Hi All,
> 
> My appdata partition could not be mounted or where the partition was not able to be used. Anyone can help me to find out the root cause of this. What are the possibilities of this ubifs corruption. Any patched are available to fix this issue.
> 
> Error logs:
> 
> [    1.797141] UBI error: ubi_io_read: error -74 (ECC error) while reading 253952 bytes from PEB 445:8192, read 253952 bytes
> [    1.808274] UBIFS error (pid 491): ubifs_scan: corrupt empty space at LEB 489:233760
> [    1.816037] UBIFS error (pid 491): ubifs_scanned_corruption: corruption at LEB 489:233760
> [    1.828660] UBIFS error (pid 491): ubifs_scan: LEB 489 scanning failed
> [    1.835215] UBIFS warning (pid 491): ubifs_ro_mode: switched to read-only mode, error -117
> [    1.843502] UBIFS error (pid 491): make_reservation: cannot reserve 58 bytes in jhead 2, error -117
> [    1.852569] UBIFS error (pid 491): do_writepage: cannot write page 0 of inode 76584, error -117
> dpkg: error: unable to sync new file '/var/lib/dpkg/arch-new': Structure needs cleaning

Why are you hijacking this mail thread?

In your case UBIFS fails because of an ECC error in 0xFF bytes.
UBIFS does not expect this and the MTD driver has to make sure that it does
not happen.
Is this a recent kernel?

Thanks,
//richard
