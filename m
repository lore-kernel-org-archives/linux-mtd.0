Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RScLw-0007M5-Sj
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2011 22:28:41 +0000
Received: by eye3 with SMTP id 3so7131168eye.36
 for <linux-mtd@lists.infradead.org>; Mon, 21 Nov 2011 14:28:38 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1321566689.2272.15.camel@koala>
References: <CAN8TOE9FPF-drb2d8cTAvxsK3M_ZdLTaaq7hn-CgEraiWVXAcA@mail.gmail.com>
 <1321566689.2272.15.camel@koala>
Date: Mon, 21 Nov 2011 14:28:38 -0800
Message-ID: <CAN8TOE-9A8D7iLCWJr6mUQ2UPFLn9ocQQtZEOngv7ht5orvDnA@mail.gmail.com>
Subject: Re: bad block markers + ONFI
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Florian Fainelli <ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 17, 2011 at 1:51 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Thu, 2011-11-10 at 16:52 -0800, Brian Norris wrote:
>> So I came up with a few options:
>> (a) Implement (A) for all ONFI-capable NAND
>> (b) Implement a flag for (A) without enforcing it for all ONFI NAND
>> (allow driver to specify, perhaps?)
>> (c) Make no change
>
> Well, if we know that some NANDs will break with a), then probably it is
> not an option, so we have only b) and c), right?

I suppose.

I can't see how a driver would really want to use (b), though.
Essentially, the driver would have to have foreknowledge that the NAND
actually follows the ONFI BBM spec.

And (c) is a disappointing alternative. Still, it may not have much
practical effect, since, for instance, scanning just 1st page instead
of 1st and last does not usually cause any difference in bad block
detection.

Brian
