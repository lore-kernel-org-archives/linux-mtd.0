Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Kcr-0001Jp-Lk
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 08:31:45 +0000
Message-ID: <1405499481.1906.3.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: init_volumes: Ignore volumes with no LEBs
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 16 Jul 2014 11:31:21 +0300
In-Reply-To: <1404828284-32643-1-git-send-email-richard@nod.at>
References: <1404828284-32643-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-07-08 at 16:04 +0200, Richard Weinberger wrote:
> UBI assumes that ubi_attach_info will only contain ubi_ainf_volume
> structures for volumes with at least one LEB.
> In scanning mode this is true because UBI can nicely create a ubi_ainf_volume
> on demand while creating the EBA table.

Applied to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
