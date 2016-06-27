Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bHU84-0006IU-Qz
 for linux-mtd@lists.infradead.org; Mon, 27 Jun 2016 10:51:01 +0000
Message-ID: <1467024636.6689.2.camel@gmail.com>
Subject: Re: [PATCH] ubifs: switch_gc_head: remove redondant sync of wbuf
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Sylvain Etienne <seti@dadboo.eu>, linux-mtd@lists.infradead.org
Cc: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 27 Jun 2016 13:50:36 +0300
In-Reply-To: <20160623055344.GA5896@dadboo.eu>
References: <20160623055344.GA5896@dadboo.eu>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-06-23 at 07:53 +0200, Sylvain Etienne wrote:
> The wbuf is already sync-ed before ubifs_leb_unmap()
> 
> Signed-off-by: Sylvain Etienne <seti@dadboo.eu>

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
