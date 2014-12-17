Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y12aR-0001oS-6S
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 00:35:31 +0000
Received: by mail-pd0-f174.google.com with SMTP id fp1so14968212pdb.33
 for <linux-mtd@lists.infradead.org>; Tue, 16 Dec 2014 16:35:09 -0800 (PST)
Date: Tue, 16 Dec 2014 16:35:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH v2] mtd: fsl_upm: Support NAND ECC DTS properties
Message-ID: <20141217003506.GK9759@ld-irv-0074>
References: <71973089.5152.1415472776826.JavaMail.zimbra@xes-inc.com>
 <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1854666513.5578.1415473916534.JavaMail.zimbra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, devicetree@vger.kernel.org,
 linux-mtd@lists.infradead.org, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jordan Friendshuh <jfriendshuh@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Aaron,

On Sat, Nov 08, 2014 at 01:11:56PM -0600, Aaron Sierra wrote:
> From: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> 
> Support the generic nand-ecc-mode and nand-ecc-strength device-tree
> properties with the Freescale UPM NAND driver.
> 
> This patch preserves the default software ECC mode while adding the
> ability to use BCH ECC for larger NAND devices.
> 
> Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> ---
> v2:
>     * Now using ECC mode and strength helpers from of_mtd.h
>     * ECC mode and strength checking is more robust

Should I be expecting an update? Ezequiel made a few comments, and I'm
not sure if you were planning any action based on them.

Brian
