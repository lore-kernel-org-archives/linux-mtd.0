Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aqGI4-0000vC-Gm
 for linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 08:36:49 +0000
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May 5 2014))
 with ESMTP id <0O5K00IDRD8O7L00@mailout1.w1.samsung.com> for
 linux-mtd@lists.infradead.org; Wed, 13 Apr 2016 09:36:24 +0100 (BST)
Message-id: <570E0506.4040705@samsung.com>
Date: Wed, 13 Apr 2016 10:36:22 +0200
From: Jacek Anaszewski <j.anaszewski@samsung.com>
MIME-version: 1.0
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org, linux-leds@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 0/4] LED trigger on MTD activity
References: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
In-reply-to: <1460494002-8578-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

Thanks for the update. From the previous discussion I've inferred
that it has been agreed on the whole patch to go through the LED tree.

Applied whole patch set to the for-next branch of linux-leds.git,
with acks from Boris, then.

Thanks,
Jacek Anaszewski

On 04/12/2016 10:46 PM, Ezequiel Garcia wrote:
> After our recent discussion [1], here's a proper patchset.
>
> The first patch is a minor cleanup which moves mtd_write_oob
> out of mtd.h header.
>
> The second patch introduces the LED MTD trigger.
>
> The third patch removes the "nand-disk" LED trigger
> from the NAND core.
>
> The fourth patch completes the series by calling ledtrig_mtd_activity
> on all MTD I/O activity paths.
>
> Changes from v1:
>
>    * Split the patches, suggested by Boris.
>
> Feedback is welcome!
>
> [1] http://www.spinics.net/lists/linux-leds/msg05906.html
>
> Ezequiel Garcia (4):
>    mtd: Uninline mtd_write_oob and move it to mtdcore.c
>    leds: trigger: Introduce a MTD (NAND/NOR) trigger
>    mtd: nand: Remove the "nand-disk" LED trigger
>    mtd: Hook I/O activity to the MTD LED trigger
>
>   drivers/leds/trigger/Kconfig       |  8 +++++++
>   drivers/leds/trigger/Makefile      |  1 +
>   drivers/leds/trigger/ledtrig-mtd.c | 45 ++++++++++++++++++++++++++++++++++++++
>   drivers/mtd/mtdcore.c              | 19 ++++++++++++++++
>   drivers/mtd/nand/nand_base.c       | 29 +-----------------------
>   include/linux/leds.h               |  6 +++++
>   include/linux/mtd/mtd.h            | 12 +---------
>   7 files changed, 81 insertions(+), 39 deletions(-)
>   create mode 100644 drivers/leds/trigger/ledtrig-mtd.c
>
