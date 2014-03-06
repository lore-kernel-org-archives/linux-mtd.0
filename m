Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLVG1-0001uf-4G
 for linux-mtd@lists.infradead.org; Thu, 06 Mar 2014 10:10:29 +0000
Message-ID: <1394100605.6302.63.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Make UBI_IOCVOLCRBLK take a parameter for future
 usage
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Thu, 06 Mar 2014 12:10:05 +0200
In-Reply-To: <1394028974-27570-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1394028974-27570-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-03-05 at 11:16 -0300, Ezequiel Garcia wrote:
> In order to allow a future ioctl parameter, such as a creation flag,
> we change the UBI_IOCVOLCRBLK so it accepts a struct ubi_blkcreate_req.
> For the time being the structure is not in use, but fully reserved.
> 
> This ABI change is still possible and harmless, because the ioctl has just
> been introduced and there's no userspace program which uses it.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed to linux-ubifs.git, thank you!

-- 
Best Regards,
Artem Bityutskiy
