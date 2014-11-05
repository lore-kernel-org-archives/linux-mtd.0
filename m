Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm2cx-0006XN-UW
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 15:36:08 +0000
Message-ID: <1415201733.958.121.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Wed, 05 Nov 2014 17:35:33 +0200
In-Reply-To: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
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

On Mon, 2014-11-03 at 15:58 +0200, Tanya Brokhman wrote:
> If there is more then one UBI device mounted, there is no way to
> distinguish between messages from different UBI devices.
> Add device number to all ubi layer message types.
> 
> The R/O block driver messages were replaced by pr_* since
> ubi_device structure is not used by it.
> 
> Amended a bit by Artem.
> 
> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Oh, the entire patch-set again... this means we need to review it again!
Please, have a mercy! :-) It is huge! Please, send a small patch against
the one which I pushed already. Thanks!

Artem.
