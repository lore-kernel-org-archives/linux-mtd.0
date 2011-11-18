Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRXAO-0003mx-SR
 for linux-mtd@lists.infradead.org; Fri, 18 Nov 2011 22:44:17 +0000
Received: by eye3 with SMTP id 3so4720602eye.36
 for <linux-mtd@lists.infradead.org>; Fri, 18 Nov 2011 14:44:14 -0800 (PST)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/2] small mtd-utils fixes
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala>
Date: Fri, 18 Nov 2011 23:44:12 +0100
In-Reply-To: <1321653636.2141.0.camel@koala> (Artem Bityutskiy's message of
 "Sat, 19 Nov 2011 00:00:34 +0200")
Message-ID: <87k46xrqyr.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Frysinger <vapier.adi@gmail.com>, Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

 Artem> On Thu, 2011-11-17 at 15:56 -0800, Brian Norris wrote:
 >> On Thu, Nov 17, 2011 at 2:19 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
 >> > We can release it as soon as someone ask. Should I do this now?
 >> 
 >> I suppose I'm asking, so yes :)

 Artem> Done: mtd-utils-1.4.7
 Artem> The tarball is at the usual place as well.

Thanks, I've updated the package in buildroot. One minor nit, you forgot
to update the version in the Makefile.

-- 
Bye, Peter Korsgaard
