Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYDKK-0002Mm-09
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 12:11:44 +0000
Message-ID: <1411906276.11836.21.camel@karhu>
Subject: Re: [RFC/PATCH 1/5] mtd: ubi: Read disturb infrastructure
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Sun, 28 Sep 2014 15:11:16 +0300
In-Reply-To: <1411886220-8208-1-git-send-email-tlinder@codeaurora.org>
References: <1411886220-8208-1-git-send-email-tlinder@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 dedeking1@gmail.com, linux-mtd@lists.infradead.org,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-09-28 at 09:37 +0300, Tanya Brokhman wrote:
> The need for performing read disturb is determined according to new
> statistics collected per eraseblock:
> - read counter: incremented at each read operation
>                 reset at each erase
> - last erase time stamp: updated at each erase
> 
> This patch adds the infrastructure for the above statistics

Would you please provide some kind of high level description for this
stuff. What is the problem at hand, how is it solved. Right off-the top
of my head I have the following comment.

Adding more fields to 'struct ubi_wl_entry' should be well-justified.
These objects are per-PEB, so there may be really a lot of them, and
they may consume a lot of memory. Increasing the size of the object may
be affect the memory consumption a lot.

So I wonder if these read counters solve a big enough problem, so that
they are worth having in this data structure.

So I am really missing the bigger picture here.

-- 
Best Regards,
Artem Bityutskiy
