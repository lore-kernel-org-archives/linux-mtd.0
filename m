Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmjOF-0006Cs-Gq
 for linux-mtd@lists.infradead.org; Fri, 07 Nov 2014 13:15:48 +0000
Message-ID: <1415366123.958.331.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix invalid vfree()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Fri, 07 Nov 2014 15:15:23 +0200
In-Reply-To: <1414367171-4657-1-git-send-email-richard@nod.at>
References: <1414367171-4657-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-10-27 at 00:46 +0100, Richard Weinberger wrote:
> The logic of vfree()'ing vol->upd_buf is tied to vol->updating.
> In ubi_start_update() vol->updating is set long before vmalloc()'ing
> vol->upd_buf. If we encounter a write failure in ubi_start_update()
> before vmalloc() the UBI device release function will try to vfree()
> vol->upd_buf because vol->updating is set.
> Fix this by allocating vol->upd_buf directly after setting vol->updating.

Pushed, thanks!
