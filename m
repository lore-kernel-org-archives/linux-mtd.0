Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpF9f-0001KL-Ab
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 11:02:52 +0000
Message-ID: <1401188546.1304.128.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2 for v3.15 0/3] UBI: block: Support very large volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 27 May 2014 14:02:26 +0300
In-Reply-To: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1399284714-6283-1-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-05-05 at 07:11 -0300, Ezequiel Garcia wrote:
> This bug was reported on #mtd IRC. I don't have to reporter name to give proper
> credit. It should be applied as a fix for v3.15.

I've taken them, thanks.

However, I do not think they are important enough to send to 3.15. The
first patch, may be, but I doubt there is really a user suffering from
that. The second is just an optimization. The third is a fix, but I am
not sure if anyone uses this driver with such a huge MTD device. So I
think 3.16 should be all-right, how does this sound to you?

Thanks!

-- 
Best Regards,
Artem Bityutskiy
