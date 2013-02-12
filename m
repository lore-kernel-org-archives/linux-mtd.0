Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5IQe-0001me-S1
 for linux-mtd@lists.infradead.org; Tue, 12 Feb 2013 16:09:58 +0000
Message-ID: <1360685406.12703.119.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: physmap_of: Convert device allocation to
 managed devm_kzalloc()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Tue, 12 Feb 2013 18:10:06 +0200
In-Reply-To: <1359125428-23801-2-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1359125428-23801-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1359125428-23801-2-git-send-email-ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, thierry.reding@avionic-design.de,
 linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-01-25 at 11:50 -0300, Ezequiel Garcia wrote:
> Tested by compilation only.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Pushed this one to l2-mtd.git, thanks!
-- 
Best Regards,
Artem Bityutskiy
