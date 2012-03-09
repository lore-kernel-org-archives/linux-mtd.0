Received: from mga03.intel.com ([143.182.124.21])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5zDP-0002Q6-NF
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 12:46:37 +0000
Message-ID: <1331297331.29445.19.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v3 1/7] mtd: sh_flctl: Expand FLCMNCR register bit field
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Bastian Hecht <hechtb@googlemail.com>
Date: Fri, 09 Mar 2012 14:48:51 +0200
In-Reply-To: <1330595321-2728-1-git-send-email-hechtb@gmail.com>
References: <1330595321-2728-1-git-send-email-hechtb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>, linux-sh@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-03-01 at 10:48 +0100, Bastian Hecht wrote:
> Add support for a new hardware generation. The meaning of some bits
> of the FLCMNCR register changed, so some new defines are added
> parallel to the existing ones to keep backward compatibility.
> 
> The defines allow to choose an appropriate clocking scheme.
> 
> Signed-off-by: Bastian Hecht <hechtb@gmail.com>

Pushed the patch-set to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
