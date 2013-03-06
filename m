Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDA0G-0000Hl-4c
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 08:47:12 +0000
Message-ID: <1362559670.21850.18.camel@sauron>
Subject: Re: [PATCH 2/2] mtd: nand: provision full ID support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Date: Wed, 06 Mar 2013 10:47:50 +0200
In-Reply-To: <CAMiH66HABdRAkbQvvCP-fVsUqoBsiD3Wp3KDsN_F9gqyHxoJxA@mail.gmail.com>
References: <1362494376-1588-1-git-send-email-dedekind1@gmail.com>
 <1362494376-1588-2-git-send-email-dedekind1@gmail.com>
 <1362494946.2943.55.camel@sauron>
 <CAMiH66HABdRAkbQvvCP-fVsUqoBsiD3Wp3KDsN_F9gqyHxoJxA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
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

On Wed, 2013-03-06 at 16:00 +0800, Huang Shijie wrote:
> On Tue, Mar 5, 2013 at 10:49 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Tue, 2013-03-05 at 16:39 +0200, Artem Bityutskiy wrote:
> >> + * @dev_id: device ID part of the full chip ID array (refers the same memory
> >> + *          address as @id[0])
> >
> > Here it should be @id[1] instead.
> >
> >
> this patch causes a compiler error.

Should be fine now, thanks!

-- 
Best Regards,
Artem Bityutskiy
