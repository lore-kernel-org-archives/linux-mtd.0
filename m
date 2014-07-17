Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7eLC-0004EC-UC
 for linux-mtd@lists.infradead.org; Thu, 17 Jul 2014 05:34:51 +0000
Message-ID: <1405575253.5423.110.camel@sauron.fi.intel.com>
Subject: Re: [RFC] ubi: updatevol: Support volume to volume update
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 17 Jul 2014 08:34:13 +0300
In-Reply-To: <1405527597-11394-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1405527597-11394-1-git-send-email-ezequiel@vanguardiasur.com.ar>
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

On Wed, 2014-07-16 at 13:19 -0300, Ezequiel Garcia wrote:
> This commit adds the support for ubiupdatevol to recieve a UBI volume
> as the second parameter. This could be useful to update a UBI volume,
> from another UBI volume present in the system, for instance when
> a redundant scheme is used.

No objections to adding such functionality.
