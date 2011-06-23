Received: from mail-iw0-f177.google.com ([209.85.214.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZt6U-0007tw-MR
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 23:14:31 +0000
Received: by iwn35 with SMTP id 35so2391374iwn.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 16:14:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron> <1308841503.23597.12.camel@sauron>
	<BANLkTimTu1ORjEvtJ7XSCCqwzDbid957Aw@mail.gmail.com>
	<BANLkTi=cUqQcQzeinQaqh_VBFtfnfkVinw@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Thu, 23 Jun 2011 19:14:03 -0400
Message-ID: <BANLkTimJN8yOXCqsNscax6bmkTWTzvHphA@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jun 23, 2011 at 19:00, Brian Norris wrote:
> Unfortunately, few utils display any version number at all

i've been pondering unifying common options so all tools have the same
behavior.  for example, all utils should work the same with the basic
flags:
-h --help
-V --version
-v --verbose

it's bad enough when these deviate across projects, but even within a
project is even more obnoxious.

> and of the ones that do, we have a
> random "2.1.0" from flash_erase. We wouldn't want to have a decreased
> version number...so do we jump to mtd-utils v2.1 and make everything
> the same version? Or even v3.0, just for fun?

i dont think anyone has scripts parsing these things.  i say let's
just lock them all to the mtd release and forget about it.
-mike
