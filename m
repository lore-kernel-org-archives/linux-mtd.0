Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5Gd5-0004ze-EX
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 14:46:56 +0000
Message-ID: <1375455107.14869.326.camel@sauron.fi.intel.com>
Subject: Re: [PATCH resend] MTD: atmel_nand: using a stronger ECC is not
 dangerous
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 02 Aug 2013 17:51:47 +0300
In-Reply-To: <1375197449-32370-1-git-send-email-richard.genoud@gmail.com>
References: <1375197449-32370-1-git-send-email-richard.genoud@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Josh Wu <josh.wu@atmel.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-07-30 at 17:17 +0200, Richard Genoud wrote:
> We don't have to issue a warning when a stronger error correting
> capability is chosen.
> 
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> Acked-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
