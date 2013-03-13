Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjNL-0003xZ-J0
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 10:57:40 +0000
Message-ID: <1363172309.11441.13.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2 1/3] mtd: bcm47xxsflash: keep a reference to the BCMA
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Wed, 13 Mar 2013 12:58:29 +0200
In-Reply-To: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
References: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-06 at 12:01 +0100, Rafał Miłecki wrote:
> To implement erase and write support we need to "talk" with ChipCommon
> BCMA core which serial flash it attached to.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed the 3 to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
