Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UapHV-0000k2-AQ
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 15:30:49 +0000
Message-ID: <1368199993.8952.0.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 1/3] mtd: m25p80: utilize dedicated 4-byte addressing
 commands
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Fri, 10 May 2013 18:33:13 +0300
In-Reply-To: <1365669299-6830-1-git-send-email-computersforpeace@gmail.com>
References: <1365669299-6830-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-04-11 at 01:34 -0700, Brian Norris wrote:
> Traditionally, the command set used by SPI flash only supported a 3-byte
> address. However, large SPI flash (>= 32MB, or 256Mbit) require 4 bytes
> to address the entire flash. Most manufacturers have supplied a mode
> switch (via a "bank register writer", or a "enable 4-byte mode"
> command), which tells the flash to expect 4 address cycles from now on,
> instead of 3. This mode remains until power is cut, the reset line is
> triggered (on packages where present), or a command is sent to reset the
> flash or to reset the 3-byte addressing mode.

Pushed this patch-set to l2-mtd.git tree, thanks!

-- 
Best Regards,
Artem Bityutskiy
