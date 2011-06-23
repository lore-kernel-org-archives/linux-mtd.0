Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZmCo-0006tb-8H
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 15:52:36 +0000
Received: by iwn35 with SMTP id 35so2011328iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 08:52:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1308841503.23597.12.camel@sauron>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 23 Jun 2011 11:52:07 -0400
Message-ID: <BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>,
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 23, 2011 at 11:04, Artem Bityutskiy wrote:
> And speaking about released, should we do a new one? If you see that
> some utils should have a version increased - feel free to do so. But
> even better we could make the version numbers to be the same as release
> number, then this process would be more automated and version would make
> some sense...

the version isnt encoded anywhere.  so if you started using something
like the kernel where the VERSION was in the Makefile, we could use
that to create a header file which all the utils would include.
-mike
