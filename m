Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTUyJ-00066x-JI
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 08:15:42 +0000
Received: by fxm14 with SMTP id 14so3326184fxm.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 01:15:36 -0700 (PDT)
Subject: Re: [PATCH 050/104] physmap_of: separate parse_obsolete_partitions
	to separate parser
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <4DEC8B45.1020900@gmail.com>
References: <1307026293-8535-1-git-send-email-dbaryshkov@gmail.com>
	<1307026293-8535-16-git-send-email-dbaryshkov@gmail.com>
	<1307347330.3135.29.camel@localhost>  <4DEC8B45.1020900@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 06 Jun 2011 11:11:20 +0300
Message-ID: <1307347880.3135.35.camel@localhost>
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

On Mon, 2011-06-06 at 12:09 +0400, Dmitry Eremin-Solenikov wrote:
> I'd really like to strip it out of physmap_of to simplify things.
> 
> It parses the mtd partitions, it's a separate functional part. I can 
> argue if it should be a module or just in-kernel part, if it should
> be 
> visible to users (or just autoselected by physmap_of), but I'd 
> definitely prefer to have this as a separate source file hooking into
> generic mtd_parse subsystem. 

I understand your desire to keep physmap_of nice and shiny and have all
the crap separate, but that is really too small amount of code to even a
separate file. And after all, that's physmap_of's crap, you can keep it
in separate functions and register as a separate parser, but put it say,
to the end of phusmap_of file with a big fat comment telling that no one
should use it, you can add a deprication date, a warning, etc as well.

P.S. I'm not very aware of OF so if adding a warning is a stupid
suggestion, please just ignore it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
