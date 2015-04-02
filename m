Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YdgN2-00075M-DG
 for linux-mtd@lists.infradead.org; Thu, 02 Apr 2015 14:45:25 +0000
Received: by lbdc10 with SMTP id c10so60877024lbd.2
 for <linux-mtd@lists.infradead.org>; Thu, 02 Apr 2015 07:45:00 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <551D5352.8060305@nod.at>
References: <1427984026-31100-1-git-send-email-richard@nod.at>
 <CAOMZO5AeuCJB5anOt9Rq_H-HsLhXR9VZz0PDkN=R6aRPZN=+0g@mail.gmail.com>
 <551D5352.8060305@nod.at>
Date: Thu, 2 Apr 2015 11:45:00 -0300
Message-ID: <CAOMZO5BpX0LHOmkPpsOHn+7x-VBzAnjuG0ed_n4OTe6_g0O2mQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: Add simple read disturb test
From: Fabio Estevam <festevam@gmail.com>
To: Richard Weinberger <richard@nod.at>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 2, 2015 at 11:33 AM, Richard Weinberger <richard@nod.at> wrote:

> Why? Free()ing a NULL pointer is perfectly fine.
> What did I miss? :)

If the first 'iobuf = kmalloc(mtd->erasesize, GFP_KERNEL);' fails then
you jump to the out label where you call 5 kfree() and then return the
error.

It would be much better just to return the error immediately in this
case and add one label for each allocation error, so that it only
kfree the previous successful allocations.
