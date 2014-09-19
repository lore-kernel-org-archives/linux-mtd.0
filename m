Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUzue-0001Z5-37
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 15:15:56 +0000
Message-ID: <1411139731.28850.145.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] UBIFS: Remove bogus assert
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 19 Sep 2014 18:15:31 +0300
In-Reply-To: <1411120127-18787-1-git-send-email-richard@nod.at>
References: <1411120127-18787-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-09-19 at 11:48 +0200, Richard Weinberger wrote:
> This assertion was only correct before UBIFS had xattr support.
> Now with xattr support also a directory node can carry data
> and can act as host node.
> 
> Suggested-by: Artem Bityutskiy <dedekind1@gmail.com>
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed both, thank you!

-- 
Best Regards,
Artem Bityutskiy
