Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBnU7-0007z9-TK
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 16:09:12 +0000
Message-ID: <1406563726.23376.33.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: ubi_wl_flush(): Use list_for_each_entry_safe()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Mon, 28 Jul 2014 19:08:46 +0300
In-Reply-To: <1406446548-5790-1-git-send-email-richard@nod.at>
References: <1406446548-5790-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-07-27 at 09:35 +0200, Richard Weinberger wrote:
> Use the _safe variant because we're iterating over
> a list where items get deleted and freed.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
