Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QajZF-0004hH-Jk
	for linux-mtd@lists.infradead.org; Sun, 26 Jun 2011 07:15:42 +0000
Received: by wwf22 with SMTP id 22so2789437wwf.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 26 Jun 2011 00:15:39 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
	<BANLkTimJN8yOXCqsNscax6bmkTWTzvHphA@mail.gmail.com>
	<1308946822.13493.36.camel@koala>
Date: Sun, 26 Jun 2011 09:15:35 +0200
In-Reply-To: <1308946822.13493.36.camel@koala> (Artem Bityutskiy's message of
	"Fri, 24 Jun 2011 23:20:17 +0300")
Message-ID: <87r56h6p2g.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

Hi,

 >> i dont think anyone has scripts parsing these things.  i say let's
 >> just lock them all to the mtd release and forget about it.

 Artem> Let's ask CC Peter who is packaging mtd-utils just in
 Artem> case. Peter, will you suffer if mtd-utils' version all suddenly
 Artem> become 1.4.6? Also, will you suffer if we switch to 2.0 or 3.0 -
 Artem> 2 numbers instead of 3?

No, the version number doesn't matter as long as it increases and
release tarballs are made.

Thanks.

-- 
Bye, Peter Korsgaard
