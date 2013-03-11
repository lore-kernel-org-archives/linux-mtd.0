Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UExnw-0004UQ-2E
 for linux-mtd@lists.infradead.org; Mon, 11 Mar 2013 08:09:56 +0000
Message-ID: <1362989448.5101.42.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] mtd: nand_base: Removed unnecessary command masking
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Alexander Shiyan <shc_work@mail.ru>
Date: Mon, 11 Mar 2013 10:10:48 +0200
In-Reply-To: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
References: <1362038541-22406-1-git-send-email-shc_work@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-02-28 at 12:02 +0400, Alexander Shiyan wrote:
> NAND command, passed to cmd_ctrl(), is masked with 0xff. This patch
> removes this since masking is not necessary and masking is not performed
> in other places for same call.
> 
> Signed-off-by: Alexander Shiyan <shc_work@mail.ru>

Pushed patches 1 and 2 to l2-mtd.git. Did not take patch 3. Thanks!

-- 
Best Regards,
Artem Bityutskiy
