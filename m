Received: from tx2ehsobe004.messaging.microsoft.com ([65.55.88.14]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOw9x-0004By-ME
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 19:21:23 +0000
Message-ID: <4F9EE627.5080003@freescale.com>
Date: Mon, 30 Apr 2012 14:21:11 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 01/10] mtd: nand: add 'oob_required' argument to NAND
 {read,write}_page interfaces
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-2-git-send-email-computersforpeace@gmail.com>
 <20120429143631.532ce0a6@pixies.home.jungo.com>
 <1335705942.1942.10.camel@koala>
 <CAN8TOE-ZbZCmH0nAcM0Jx65nOPaJxyue2nd0MTFY9XwJhLqrsA@mail.gmail.com>
In-Reply-To: <CAN8TOE-ZbZCmH0nAcM0Jx65nOPaJxyue2nd0MTFY9XwJhLqrsA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Mike Dunn <mikedunn@newsguy.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Kevin Cernekee <cernekee@gmail.com>, Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>, linux-mtd@lists.infradead.org,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Jamie Iles <jamie@jamieiles.com>,
 Thomas Gleixner <tglx@linutronix.de>, Li Yang <leoli@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>, Axel Lin <axel.lin@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/30/2012 02:16 PM, Brian Norris wrote:
> On Sun, Apr 29, 2012 at 6:25 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Sun, 2012-04-29 at 14:36 +0300, Shmulik Ladkani wrote:
>>>> Note: I couldn't compile-test all of these easily, as some had ARCH
>>>> dependencies.
>>>>
>>>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>>>
>>> Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
>>
>> Brian, probably you take care of this, but just in case I would like to
>> ask to put tags like this to your patches when re-sending. I am trying
>> to be careful about this for several reasons: it shows that the patch
>> was reviewed, it saves the reviewers name in the git history which and
>> makes persons' contribution visible, so it is kind of a credit.
> 
> Sure, I'll do this as appropriate. Should I apply these tags when the
> review is made w/o an explicit "Reviewed-by" (e.g., Scott Wood's
> comments on patch 7)? There's also the issue of placing "reviewed-by"
> before the reviewer actually sees my change.

You can put mine on if you want in this case, provided the write-side
change is removed as discussed -- but in general, I'd say that making a
comment on one part of a patch doesn't indicate that the whole thing has
been reviewed.

-Scott
