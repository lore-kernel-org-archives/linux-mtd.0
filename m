Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QWCdU-0004Fr-Fh
	for linux-mtd@lists.infradead.org; Mon, 13 Jun 2011 19:17:21 +0000
Received: by wwb39 with SMTP id 39so4031619wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 13 Jun 2011 12:17:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1307608004.7374.56.camel@localhost>
References: <1307563284-32416-1-git-send-email-computersforpeace@gmail.com>
	<1307608004.7374.56.camel@localhost>
Date: Mon, 13 Jun 2011 12:17:18 -0700
Message-ID: <BANLkTimU-fzEj6ByC9X6DX=tUQ0ay_eYrQ@mail.gmail.com>
Subject: Re: nanddump badblock options
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One last idea, while I'm trying to bring nanddump and nandwrite a
little closer together:

It makes sense for nanddump and nandwrite to have the same defaults
regarding OOB. Right now, nandwrite doesn't write OOB by default, and
nanddump dumps OOB by default. Is it OK to unify this and make
nanddump default to *not* dumping OOB? Then the nanddump '-o' and
'--oob' options would stand for 'Dump OOB data'. Unfortunately, this
makes the '-o' option completely reverse its meaning...

I would include this with my other change-ups if that's alright
(they're ready to send).

Mike:
any comments on my '--omitbad' question?

Thanks,
Brian
