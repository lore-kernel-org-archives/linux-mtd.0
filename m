Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUzuo-0001bx-0u
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 15:16:06 +0000
Message-ID: <1411139721.28850.143.camel@sauron.fi.intel.com>
Subject: Re: [patch] UBI: return on error in rename_volumes()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 19 Sep 2014 18:15:21 +0300
In-Reply-To: <20140919104848.GC26391@mwanda>
References: <20140919104848.GC26391@mwanda>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
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

On Fri, 2014-09-19 at 13:56 +0300, Dan Carpenter wrote:
> I noticed this during a code review.  We are checking that the strlen()
> of ->name is not less than the ->name_len which the user gave us.  I
> believe this bug is harmless but clearly we meant to return here instead
> of setting an error code and then not using it.

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
