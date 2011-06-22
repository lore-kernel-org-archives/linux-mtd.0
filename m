Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZFGJ-0000Gx-1V
	for linux-mtd@lists.infradead.org; Wed, 22 Jun 2011 04:41:59 +0000
Received: by pwi3 with SMTP id 3so435264pwi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Jun 2011 21:41:55 -0700 (PDT)
Subject: Re: nanddump badblock options
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 22 Jun 2011 07:42:38 +0300
In-Reply-To: <BANLkTimU-fzEj6ByC9X6DX=tUQ0ay_eYrQ@mail.gmail.com>
References: <1307563284-32416-1-git-send-email-computersforpeace@gmail.com>
	<1307608004.7374.56.camel@localhost>
	<BANLkTimU-fzEj6ByC9X6DX=tUQ0ay_eYrQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308717762.18119.21.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-06-13 at 12:17 -0700, Brian Norris wrote:
> One last idea, while I'm trying to bring nanddump and nandwrite a
> little closer together:
> 
> It makes sense for nanddump and nandwrite to have the same defaults
> regarding OOB. Right now, nandwrite doesn't write OOB by default, and
> nanddump dumps OOB by default. Is it OK to unify this and make
> nanddump default to *not* dumping OOB? Then the nanddump '-o' and
> '--oob' options would stand for 'Dump OOB data'. Unfortunately, this
> makes the '-o' option completely reverse its meaning...

Yes, I think so. Just invent a sensible "deprecation period" plan and go
ahead with unifying them.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
