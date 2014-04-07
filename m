Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX78Z-0002wJ-Is
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 10:50:48 +0000
Message-ID: <1396867521.17040.14.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] ubiformat: correct "non-ubifs" warning message
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 07 Apr 2014 13:45:21 +0300
In-Reply-To: <1396285384-1757-1-git-send-email-computersforpeace@gmail.com>
References: <1396285384-1757-1-git-send-email-computersforpeace@gmail.com>
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

On Mon, 2014-03-31 at 10:03 -0700, Brian Norris wrote:
> UBI's raw flash scan actually scans for UBI data, not UBIFS data (there
> *are* UBI users that are not UBIFS!), so correct the warning message.
> This also matches the comment in libscan.h.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to mtd-utils, thanks!

-- 
Best Regards,
Artem Bityutskiy
