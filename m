Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQwap-0002Ml-77
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 10:54:43 +0000
Message-ID: <1410173657.10764.148.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] UBI: block: Add support for the UBI_VOLUME_UPDATED
 notification
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 08 Sep 2014 13:54:17 +0300
In-Reply-To: <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
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
> Static volumes can change its 'used_bytes' when they get updated,
> and so the block interface must listen to the UBI_VOLUME_UPDATED
> notification to resize the block device accordingly.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Looks like a good fix. If you want this in stable, you please, let me
know and also make sure you actually tested it and verified that block
device size actually gets changed.

-- 
Best Regards,
Artem Bityutskiy
