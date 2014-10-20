Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDNR-0002gn-NJ
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 13:52:02 +0000
Message-ID: <1413813074.7906.294.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Joe Perches <joe@perches.com>
Date: Mon, 20 Oct 2014 16:51:14 +0300
In-Reply-To: <1413302724.3269.18.camel@joe-AO725>
References: <1413296037-22346-1-git-send-email-tlinder@codeaurora.org>
 <543D304C.5000607@codeaurora.org> <1413297205.3269.11.camel@joe-AO725>
 <1413299231.7906.101.camel@sauron.fi.intel.com>
 <1413302724.3269.18.camel@joe-AO725>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 ezequiel.garcia@free-electrons.com, Richard Weinberger <richard@nod.at>,
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

On Tue, 2014-10-14 at 09:05 -0700, Joe Perches wrote:
> It's pretty trivial when all the lines are already
> being touched.

OK, but then the same change should done in UBIFS, because it's
ubifs_msg() and so on macros are consistent with UBI macros. So I think
if this is done, then it is done separately for both UBI and UBIFS.

Artem.
