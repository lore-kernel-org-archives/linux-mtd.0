Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nh1fS-0007zk-UF
	for linux-mtd@lists.infradead.org; Mon, 15 Feb 2010 14:11:24 +0000
Subject: Re: Emulated write failures cause block marking as bad
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Marek Skuczynski <mareksk7@gmail.com>
In-Reply-To: <a328840c1002050123u15be6d75s1c6f27fca6452137@mail.gmail.com>
References: <a328840c1002040902ic5c17a8p5262e482b4fced01@mail.gmail.com>
	<1265304794.7343.135.camel@localhost> <4B6B221E.2060409@gmail.com>
	<a328840c1002050123u15be6d75s1c6f27fca6452137@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 15 Feb 2010 16:10:06 +0200
Message-ID: <1266243006.11659.98.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2010-02-05 at 10:23 +0100, Marek Skuczynski wrote:
> > Okay, maybe my case is isolated because of tested system configuration,
> > I will try manage this case myself.
> >
> I have prepared a patch, maybe someone will find it useful.

Something like this is useful, but I disapprove of adding another
configuration option. Instead, I think you should just improve the
current debugging code.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
