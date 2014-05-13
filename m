Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wk2SV-0007Im-Ca
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 02:28:47 +0000
Date: Mon, 12 May 2014 23:27:53 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/4] mtd: nand: Account the blocks used by the BBT in the
 ecc_stats
Message-ID: <20140513022753.GB1447@arch.cereza>
References: <1395403064-28113-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395403064-28113-3-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395403064-28113-3-git-send-email-ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21 Mar 08:57 AM, Ezequiel Garcia wrote:
> Strictly speaking we should be updating the ecc_stats in the master
> MTD object, with the blocks used by the bad block table.
> 
> This is already being done for bad and reserved blocks detected doing
> the BBT search, but not for the blocks used by the BBT itself. This commit
> adds the latter.
> 
> It should be noted that the ecc_stats structure is kept only for userspace
> information, accesible through an ioctl. However, since the master MTD object
> is not tied to any /dev/mtd{N} device node in the filesystem, there's currently
> no way to retrieve this information.
> 
> This ecc_stats is used for the MTD partitions typically allocated and
> registered by mtd_device_parse_register(). These have a device node, but scan
> for bad blocks and updates the ecc_stats in a different code path.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> --
> For the reasons exposed above, it's not clear we should remove the ecc_stats
> update in the master MTD altogether or simply take account of the BBT blocks
> for consistency. I've chosen the latter, for it seemed a safer changer.
> 
> I'm open to discussion, though.

Brian,

Can you comment a bit on this one? Should I keep this change in v2?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
