Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRrpN-0008Vw-Cq
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2011 20:47:58 +0000
Received: by bkat2 with SMTP id t2so6395281bka.36
 for <linux-mtd@lists.infradead.org>; Sat, 19 Nov 2011 12:47:54 -0800 (PST)
Subject: Re: [PATCH 0/2] small mtd-utils fixes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 19 Nov 2011 22:47:46 +0200
In-Reply-To: <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321735668.2167.2.camel@koala>
Mime-Version: 1.0
Cc: Kevin Cernekee <cernekee@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-11-18 at 15:37 -0800, Brian Norris wrote:
> On Fri, Nov 18, 2011 at 2:44 PM, Peter Korsgaard <jacmet@sunsite.dk> wrote:
> > Thanks, I've updated the package in buildroot. One minor nit, you forgot
> > to update the version in the Makefile.
> 
> I was just about to comment on the Makefile version as well; I forgot
> about that...any chance we can fix this on the official release? It's
> kind of important that I can tell which version my users are using,
> now that we've fixed a lot of annoying bugs/"features". If not, I may
> just modify it in my own releases.

My apologies. I've released 1.4.8 and changed the Makefile this time.
Uploaded the tarball as well.

Artem.
