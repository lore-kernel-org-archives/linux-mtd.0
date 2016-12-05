Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cDyjX-00051X-Ip
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2016 19:15:28 +0000
Subject: Re: Add --skip-all-ffs option to mtd-utils nandwrite
To: Kees Trommel <ctrommel@aimvalley.nl>, linux-mtd@lists.infradead.org
References: <82cbfdbc-c79b-01b0-bc64-a4259d7a150e@aimvalley.nl>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <16abefc9-61e8-3b0d-c44c-6d02764ec8e9@sigma-star.at>
Date: Mon, 5 Dec 2016 20:13:49 +0100
MIME-Version: 1.0
In-Reply-To: <82cbfdbc-c79b-01b0-bc64-a4259d7a150e@aimvalley.nl>
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

Hi,


On 12/05/2016 05:14 PM, Kees Trommel wrote:
> Would it be possible to add an option --skip-all-ffs option to mtd-utils nandwrite?
> 
> With this option pages that contain only 0xFF bytes will be skipped and not written to flash.
> 
> This option is useful when you want to write using nandwrite an UBI image to NAND devices with a HW ECC. Without this option the OOB of a page that is written with all 0xFFs is no longer erased because the HW adds an non 0xFFs ECC to the OOB. If the data of the page contains only 0xFFs then UBI/UBIFS assumes that the page is erased and writes to it without erasing the page first. This causes that a read of this page fails with unrecoverable ECC errors and a subsequent corruption of the UBIFS.

Yes, that sounds reasonable.
 
> Attached is a patch file that adds the --skip-all-ffs option. A nandwrite of UBI image with this option will be successful while it fails without this option.

Your patch looks good to me, however even after fixing the paths to nandwrite.c (the
source tree got restructured over a year ago, see commit 7d81790ced) it doesn't apply
to the current mtd-utils master branch. Could you please rebase your patch onto the
current mtd-utils master branch (git://git.infradead.org/mtd-utils.git) and resubmit it?


Thanks,

David
