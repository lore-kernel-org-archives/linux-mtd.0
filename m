Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OntO6-0000la-7o
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 13:18:02 +0000
Received: by bwz13 with SMTP id 13so6396140bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 06:18:01 -0700 (PDT)
Subject: Re: JFFS2 what file is a given node in?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shane Volpe <shanevolpe@gmail.com>
In-Reply-To: <AANLkTikWFqbH-s2Uo8TjW-fX2jkYdGH=9oKp17yVqZ7F@mail.gmail.com>
References: <AANLkTikWFqbH-s2Uo8TjW-fX2jkYdGH=9oKp17yVqZ7F@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 24 Aug 2010 16:10:49 +0300
Message-ID: <1282655449.24044.173.camel@localhost>
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

On Tue, 2010-08-24 at 08:52 -0400, Shane Volpe wrote:
> I get the following message:
> <4>Data CRC 0550f35b != calculated CRC 81fbb81c for node at 02aedb74
> I want to find out what file this node is in so I can further
> investigate the corruption, how do I do that?

Add a printk to the corresponding piece of code?

Also, notice that these messages are usually harmless and appear because
or unclean reboots.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
