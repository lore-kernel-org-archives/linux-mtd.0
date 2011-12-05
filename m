Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXS4B-0007lJ-2M
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 06:30:19 +0000
Received: by laai10 with SMTP id i10so1298277laa.36
 for <linux-mtd@lists.infradead.org>; Sun, 04 Dec 2011 22:30:17 -0800 (PST)
Subject: Re: [PATCH v2] nandtest: seed random generator with time
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Mon, 05 Dec 2011 08:30:13 +0200
In-Reply-To: <1322847972-26504-1-git-send-email-computersforpeace@gmail.com>
References: <1322730350.2332.28.camel@koala>
 <1322847972-26504-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1323066616.2316.17.camel@koala>
Mime-Version: 1.0
Cc: Jan Weitzel <j.weitzel@phytec.de>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-12-02 at 09:46 -0800, Brian Norris wrote:
> If a seed is not provided via --seed, we use the default rand() values,
> which produces the same sequence of values every run. Since this is
> undesirable, we should choose a random seed via the current time().
> 
> Note that this patch moves the srand() until after all the initial
> options processing.

Pushed, thanks!

Artem.
