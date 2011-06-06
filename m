Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTWi2-0000nw-0F
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 10:06:58 +0000
Received: by fxm14 with SMTP id 14so3394889fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 03:06:54 -0700 (PDT)
Subject: RE: [PATCH] mtd: OneNAND: Fix wrong subpage_sft at 4KiB pagesize
From: Artem Bityutskiy <dedekind1@gmail.com>
To: roman.tereshonkov@nokia.com
In-Reply-To: <E942AFD653C85241BF3CCD5F471BEDA203FC6E79@008-AM1MPN1-041.mgdnok.nokia.com>
References: <20110602064832.GA7319@july> <1307115701.3069.20.camel@localhost>
	<E942AFD653C85241BF3CCD5F471BEDA203FC6E79@008-AM1MPN1-041.mgdnok.nokia.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 13:02:37 +0300
Message-ID: <1307354557.3112.21.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kmpark@infradead.org, dwmw2@infradead.org,
	m.szyprowski@samsung.com
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-06 at 09:42 +0000, roman.tereshonkov@nokia.com wrote:
> What do mean by "no case to use the subpage"?
> 
> According to the spec KFM4G16Q4M-xEBx the Number of Partial Program Cycles in the page (NOP)
> is equal to 4 -> subpage_sft=2.

I thought this means "not supported by HW". But if this is supported,
then I'm very surprised why would we remove it. I'm dropping this patch
from my tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
