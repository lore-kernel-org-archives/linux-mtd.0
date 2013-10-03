Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRm11-0001X9-F7
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 16:44:39 +0000
Message-ID: <1380818654.18862.1.camel@sauron.fi.intel.com>
Subject: Re: UBI fastmap updates
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Richard Weinberger <richard@nod.at>
Date: Thu, 03 Oct 2013 19:44:14 +0300
In-Reply-To: <1380376516-30144-1-git-send-email-richard@nod.at>
References: <1380376516-30144-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: richard.genoud@gmail.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2013-09-28 at 15:55 +0200, Richard Weinberger wrote:
> this series is a collection of all pending UBI fastmap updates.
> 
> Richard Genoud found issues in combination with U-Boot.
> These issues also uncovered other minor issues in some error paths.
> Only one fix is not really fastmap specific and touches generic 
> UBI code, "UBI: simplify image sequence test".
> 

Pushed to linux-ubi, thanks!

-- 
Best Regards,
Artem Bityutskiy
