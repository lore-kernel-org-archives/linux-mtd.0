Received: from perceval.ideasonboard.com ([95.142.166.194])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S37nK-0002lb-0g
 for linux-mtd@lists.infradead.org; Thu, 01 Mar 2012 15:19:50 +0000
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bastian Hecht <hechtb@googlemail.com>
Subject: Re: [PATCH v3 1/7] mtd: sh_flctl: Expand FLCMNCR register bit field
Date: Thu, 01 Mar 2012 16:19:56 +0100
Message-ID: <1453489.YgpPZckSA6@avalon>
In-Reply-To: <1330595321-2728-1-git-send-email-hechtb@gmail.com>
References: <1330595321-2728-1-git-send-email-hechtb@gmail.com>
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

Thanks for the patches.

On Thursday 01 March 2012 10:48:35 Bastian Hecht wrote:
> Add support for a new hardware generation. The meaning of some bits
> of the FLCMNCR register changed, so some new defines are added
> parallel to the existing ones to keep backward compatibility.
> 
> The defines allow to choose an appropriate clocking scheme.
> 
> Signed-off-by: Bastian Hecht <hechtb@gmail.com>

For the whole set,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
