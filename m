Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYDOo-0004TL-C2
 for linux-mtd@lists.infradead.org; Sun, 28 Sep 2014 12:16:22 +0000
Message-ID: <1411906556.11836.26.camel@karhu>
Subject: Re: [PATCH] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Tanya Brokhman <tlinder@codeaurora.org>
Date: Sun, 28 Sep 2014 15:15:56 +0300
In-Reply-To: <5427C5C4.40508@codeaurora.org>
References: <1411886185-7838-1-git-send-email-tlinder@codeaurora.org>
 <5427C046.5030608@nod.at> <5427C5C4.40508@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2014-09-28 at 11:24 +0300, Tanya Brokhman wrote:
> This is how I first implemented this patch. But then I cam across
> some 
> ubi_err prints during the init process (in build.c ubi_init()) when
> we 
> still don't have the ubi structure, so we need to pass some number to 
> the message. I overcame this by using UBI_MAX_DEVICES.

Well, may be having two sets of wrappers would make sense then?

Or if there are few of those, just using 'printk()' would be a solution?

-- 
Best Regards,
Artem Bityutskiy
