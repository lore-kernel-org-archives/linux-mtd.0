Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQwZI-0001yw-4Z
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:53:08 +0000
Message-ID: <1410173564.10764.146.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] UBI: block: Fix block device size setting
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 08 Sep 2014 13:52:44 +0300
In-Reply-To: <1409348550-27768-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1409348550-27768-2-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Guido =?ISO-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-08-29 at 18:42 -0300, Ezequiel Garcia wrote:
> We are currently taking the block device size from the ubi_volume_info.size
> field. However, this is not the amount of data in the volume, but the
> number of reserved physical eraseblocks, and hence leads to an incorrect
> representation of the volume.
> 
> In particular, this produces I/O errors on static volumes as the block
> interface may attempt to read unmapped PEBs:
> 
> $ cat /dev/ubiblock0_0 > /dev/null
> UBI error: ubiblock_read_to_buf: ubiblock0_0 ubi_read error -22
> end_request: I/O error, dev ubiblock0_0, sector 9536
> Buffer I/O error on device ubiblock0_0, logical block 2384
> [snip]
> 
> Fix this by using the ubi_volume_info.used_bytes field which is set to the
> actual number of data bytes for both static and dynamic volumes.
> 
> While here, improve the error message to be less stupid and more useful:
> UBI error: ubiblock_read_to_buf: ubiblock0_1 ubi_read error -9 on LEB=0, off=15872, len=512
> 
> It's worth noticing that the 512-byte sector representation of the volume
> is only correct if the volume size is multiple of 512-bytes. This is true for
> virtually any NAND device, given eraseblocks and pages are 512-byte multiple
> and hence so is the LEB size.
> 
> Fixes: 9d54c8a33eec ("UBI: R/O block driver on top of UBI volumes")
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Looks good, do we want this one in stable?

-- 
Best Regards,
Artem Bityutskiy
