Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U5bmB-0000an-Km
 for linux-mtd@lists.infradead.org; Wed, 13 Feb 2013 12:49:28 +0000
Message-ID: <1360759748.12703.148.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: mtd_torturetest can cause stack overflows
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Al Cooper <alcooperx@gmail.com>
Date: Wed, 13 Feb 2013 14:49:08 +0200
In-Reply-To: <1360073290-4191-1-git-send-email-alcooperx@gmail.com>
References: <Y> <1360073290-4191-1-git-send-email-alcooperx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2013-02-05 at 09:08 -0500, Al Cooper wrote:
> mtd_torturetest uses the module parm "ebcnt" to control the size of a
> stack based array of int's. When "ebcnt" is large, Ex: 1000, it
> causes stack overflows on systems with small kernel stacks. The fix
> is to move the array from the stack to kmalloc memory.
> 
> Signed-off-by: Al Cooper <alcooperx@gmail.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
