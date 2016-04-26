Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1auvNn-0001fO-Oh
 for linux-mtd@lists.infradead.org; Tue, 26 Apr 2016 05:18:00 +0000
Message-ID: <1461647856.32142.1.camel@gmail.com>
Subject: Re: [RFC] Porting kernel MTD tests to user space
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: david.oberhollenzer@sigma-star.at
Date: Tue, 26 Apr 2016 08:17:36 +0300
In-Reply-To: <1461622409-14970-1-git-send-email-richard@nod.at>
References: <1461622409-14970-1-git-send-email-richard@nod.at>
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

On Tue, 2016-04-26 at 00:13 +0200, Richard Weinberger wrote:
> David was so kind and did an initial port of Linux's MTD tests to
> user space.
> He took most tests as-is and massaged them to work in user space
> using libmtd.
> In the long run the goal is giving up the kernel tests as much as
> possible
> and improve the tests present in mtd-utils.
> 
> Feedback is very welcome!

I would consider moving them, not just porting. Indeed, we probably do
not want to have the same code in 2 places, or is there a strong reason
why would we want that?

Artem.
