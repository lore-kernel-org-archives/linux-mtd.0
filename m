Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RR9rr-00011U-1I
 for linux-mtd@lists.infradead.org; Thu, 17 Nov 2011 21:51:35 +0000
Received: by faar25 with SMTP id r25so4507305faa.36
 for <linux-mtd@lists.infradead.org>; Thu, 17 Nov 2011 13:51:33 -0800 (PST)
Subject: Re: bad block markers + ONFI
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 17 Nov 2011 23:51:27 +0200
In-Reply-To: <CAN8TOE9FPF-drb2d8cTAvxsK3M_ZdLTaaq7hn-CgEraiWVXAcA@mail.gmail.com>
References: <CAN8TOE9FPF-drb2d8cTAvxsK3M_ZdLTaaq7hn-CgEraiWVXAcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321566689.2272.15.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-11-10 at 16:52 -0800, Brian Norris wrote:
> So I came up with a few options:
> (a) Implement (A) for all ONFI-capable NAND
> (b) Implement a flag for (A) without enforcing it for all ONFI NAND
> (allow driver to specify, perhaps?)
> (c) Make no change

Well, if we know that some NANDs will break with a), then probably it is
not an option, so we have only b) and c), right?

Artem.
