Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCnHd-00051T-8Y
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 08:31:38 +0000
Message-ID: <1362472331.2943.25.camel@sauron>
Subject: Re: [PATCH 01/12] mtd: nand_ids: minor clean-ups
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Tue, 05 Mar 2013 10:32:11 +0200
In-Reply-To: <CAN8TOE-bJxgJ3HJCWyqkRJuOGjtoq0sLMNsDeFmZLAoB+Qg0bg@mail.gmail.com>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-2-git-send-email-dedekind1@gmail.com>
 <CAN8TOE-bJxgJ3HJCWyqkRJuOGjtoq0sLMNsDeFmZLAoB+Qg0bg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 10:36 -0800, Brian Norris wrote:
> > +        * These are the new chips with large page size, page size and
> > +        * eraseblock size is determined from the extended id bytes.
> 
> This is also incorrect grammar. It uses a comma to divide sentences
> and also uses "is". I would write something like this:
> 
> "These are the new chips with large page size. Their page size and
> eraseblock size are determined from the extended ID bytes."

Thanks Brian, will fix.

-- 
Best Regards,
Artem Bityutskiy
