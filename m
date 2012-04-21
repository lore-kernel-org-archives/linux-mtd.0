Received: from perceval.ideasonboard.com ([95.142.166.194])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SLgb4-0007c8-5c
 for linux-mtd@lists.infradead.org; Sat, 21 Apr 2012 20:07:54 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH 8/9] mtd: sh_flctl: Use user oob data in hardware ECC mode
Date: Sat, 21 Apr 2012 17:00:36 +0200
Message-ID: <7855571.0NdFmdbNxx@avalon>
In-Reply-To: <1334913230-23615-9-git-send-email-hechtb@gmail.com>
References: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
 <1334913230-23615-9-git-send-email-hechtb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Bastian,

Thanks for the patch.

On Friday 20 April 2012 11:13:49 Bastian Hecht wrote:
> In hardware ecc mode, the flctl now writes and reads the oob data
> provided by the user. Additionally the ECC is now returned in normal
> page reads, not only when using the explicit NAND_CMD_READOOB command.

For my information again, what's the purpose of returning OOB data if the 
caller hasn't requested it ? What are those data then used for ?

> Signed-off-by: Bastian Hecht <hechtb@gmail.com>

-- 
Regards,

Laurent Pinchart
