Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRY0H-0005IL-6N
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2011 23:37:53 +0000
Received: by eye3 with SMTP id 3so4766575eye.36
 for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2011 15:37:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87k46xrqyr.fsf@macbook.be.48ers.dk>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala>
 <87k46xrqyr.fsf@macbook.be.48ers.dk>
Date: Fri, 18 Nov 2011 15:37:51 -0800
Message-ID: <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Brian Norris <computersforpeace@gmail.com>
To: Peter Korsgaard <jacmet@sunsite.dk>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 18, 2011 at 2:44 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> Thanks, I've updated the package in buildroot. One minor nit, you forgot
> to update the version in the Makefile.

I was just about to comment on the Makefile version as well; I forgot
about that...any chance we can fix this on the official release? It's
kind of important that I can tell which version my users are using,
now that we've fixed a lot of annoying bugs/"features". If not, I may
just modify it in my own releases.

Brian
