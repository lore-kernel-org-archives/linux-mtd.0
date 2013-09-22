Received: from sh16-54.1blu.de ([178.254.0.106])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VNgT5-000715-10
 for linux-mtd@lists.infradead.org; Sun, 22 Sep 2013 10:00:43 +0000
To: Richard Weinberger <richard@nod.at>
Subject: Re: Patching mkfs.ubifs.c for running under Windows
 =?UTF-8?Q?=3F?=
MIME-Version: 1.0
Date: Sun, 22 Sep 2013 12:00:21 +0200
From: gutemine <gutemine@oozoon.de>
In-Reply-To: <523EB7DA.1030003@nod.at>
References: <mailman.6.1379692801.23497.linux-mtd@lists.infradead.org>
 <7c74c0d714e8e87daebbfd0163642d71@localhost>
 <CAFLxGvwvoeyhDDD=WqEpw59f8WKKujQo7Pg8mcJOev-7oN-_CQ@mail.gmail.com>
 <5099962fe00dce3a388c4cf305a27d25@localhost> <523EB7DA.1030003@nod.at>
Message-ID: <7d89b4c47e6ea5fe05555dcbc7acb795@localhost>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

See my comments below.

> Hi *Would be nice to know your real name*!

The Dreambox community has areas of interrest which are
working on receiving PayTV with receivers not certifed by the
PayTV vendors, therefore people prefere to be known only by
their nicks. 

My focus areas are not any of these activities, but 
please respect my privacy. If needed I can drop you 
a mail from my personal account
but not via the full distrubution list.

> Where can I find the sources?

Originally it was planned to submit ubidump.c as a new member of mtd-utils
but as I received no real help from my community in testing and developing
addons to ubidump like a GUI for Windows and Linux, I decided to keep 
it closed source for the moment and ship it only as compiled binaries 
with a shareware license.

This is possible as I wrote ubidump from scratch after failing multiply
to create an ubidump tool out of existing code. 

It was simply a too complex task for me, so I had to do it my 
way - and I didn't even read much of the ubifs documentation either. 
To be honest this idiots approach reduced the complexity of the task
dramatically, 
but it still was a 200h project.

For adapting mkfs.ubifs to our needs I would off course respect the GPL
and publish the sources or a patch - which brings us back to my 
original question to the mailing list.
 
> Feel free to send a patch against
> http://git.infradead.org/mtd-www.git

I will try, but as I'm too old for using such modern stuff like git
this could take some time to find out how to diff the xml

Kind Regards,
gutemine
