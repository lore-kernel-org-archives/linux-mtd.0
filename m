Received: from mail-bw0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RRrwr-0000PX-Fy
 for linux-mtd@lists.infradead.org; Sat, 19 Nov 2011 20:55:42 +0000
Received: by bkat2 with SMTP id t2so6401258bka.36
 for <linux-mtd@lists.infradead.org>; Sat, 19 Nov 2011 12:55:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1321735668.2167.2.camel@koala>
References: <1321473837-27891-1-git-send-email-computersforpeace@gmail.com>
 <1321568352.2272.33.camel@koala>
 <CAN8TOE8uSW5rHbs8VeTFTNcqNwZGwUZpPJpfOgxtUsGL1PTJZg@mail.gmail.com>
 <1321653636.2141.0.camel@koala> <87k46xrqyr.fsf@macbook.be.48ers.dk>
 <CAN8TOE8Gd97SXK1ACCtatJ97Q8ESZQJNH5mVU0Ej2ruOL0dZRQ@mail.gmail.com>
 <1321735668.2167.2.camel@koala>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 19 Nov 2011 15:55:18 -0500
Message-ID: <CAMjpGUfB0OoP_TvQ+eVEwx6_nmJ0p4jrCyu4ceTQBHGeRvUm-Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] small mtd-utils fixes
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Kevin Cernekee <cernekee@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Nov 19, 2011 at 15:47, Artem Bityutskiy wrote:
> On Fri, 2011-11-18 at 15:37 -0800, Brian Norris wrote:
>> On Fri, Nov 18, 2011 at 2:44 PM, Peter Korsgaard wrote:
>> > Thanks, I've updated the package in buildroot. One minor nit, you forgot
>> > to update the version in the Makefile.
>>
>> I was just about to comment on the Makefile version as well; I forgot
>> about that...any chance we can fix this on the official release? It's
>> kind of important that I can tell which version my users are using,
>> now that we've fixed a lot of annoying bugs/"features". If not, I may
>> just modify it in my own releases.
>
> My apologies. I've released 1.4.8 and changed the Makefile this time.
> Uploaded the tarball as well.

how are you making the releases ?  seems like this keeps coming up, so
maybe we should have a `make dist` that takes care of this stuff
automatically to avoid future mistakes ...
-mike
