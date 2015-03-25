Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YaguF-0001qX-Ag
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2015 08:43:19 +0000
Message-ID: <1427272975.30360.30.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2 linux-next] UBIFS: simplify returns
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Fabian Frederick <fabf@skynet.be>
Date: Wed, 25 Mar 2015 10:42:55 +0200
In-Reply-To: <1426192461-16011-1-git-send-email-fabf@skynet.be>
References: <1426192461-16011-1-git-send-email-fabf@skynet.be>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, geert@linux-m68k.org,
 linux-kernel@vger.kernel.org, Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2015-03-12 at 21:34 +0100, Fabian Frederick wrote:
> directly return recover_head() and ubifs_leb_unmap()
> instead of storing value in err and testing it.
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>
> ---

Pushed to linux-ubifs/master, thanks!
