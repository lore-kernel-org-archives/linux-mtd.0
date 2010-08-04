Subject: Re: question about drivers/mtd/ubi/cdev.c
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <julia@diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008040747330.3431@ask.diku.dk>
References: <Pine.LNX.4.64.1008032206060.20393@ask.diku.dk>
	<1280891212.4363.5.camel@localhost.localdomain>
	<Pine.LNX.4.64.1008040747330.3431@ask.diku.dk>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 04 Aug 2010 09:37:13 +0300
Message-ID: <1280903833.15689.65.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Wed, 2010-08-04 at 07:48 +0200, Julia Lawall wrote:
> > Hmm, the code is bogus, I do not know how it works, but it does, because
> > I tested it :-)
> >
> > We should not use 're' as a temporary variable inside the loop. I guess
> > we can use 're1' instead. I'll change this later, when have time, unless
> > you submit a fix earlier :-)
> 
> Would the proper approach be to use list_for_each_entry_safe?

Yes, plus not using the iterator as a temporary variable is also a good
idea.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
