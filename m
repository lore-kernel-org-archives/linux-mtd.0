Received: from mail-qy0-f170.google.com ([209.85.216.170])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OyGre-0001JA-RO
	for linux-mtd@lists.infradead.org; Wed, 22 Sep 2010 04:23:28 +0000
Received: by qyk35 with SMTP id 35so5518525qyk.15
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Sep 2010 21:23:20 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1284441967.2084.18.camel@brekeke>
References: <1284263480-31573-1-git-send-email-vapier@gentoo.org>
	<1284308851.1783.23.camel@brekeke>
	<AANLkTinkp3O9uFhumuuBTq4T+Um9MSjFv3nb_byF0Q35@mail.gmail.com>
	<1284358990.27765.154.camel@localhost>
	<AANLkTin4u=jQOxxuTwzMHrEEg=vDc2TSTah_=_Li02xx@mail.gmail.com>
	<1284441967.2084.18.camel@brekeke>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 22 Sep 2010 00:23:00 -0400
Message-ID: <AANLkTin+2ocUT_NMToGHoAhX5=Trn2CdLFmiMBmvSVuC@mail.gmail.com>
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
To: dedekind1@gmail.com
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

On Tue, Sep 14, 2010 at 01:26, Artem Bityutskiy wrote:
> On Mon, 2010-09-13 at 21:21 -0400, Mike Frysinger wrote:
>> ... policy is for the end user to determine ... this is putting
>> artificial limits for no real reason that i can see.
>
> But the problem is not artificial limits. The problem is that I do not
> think your option is usable at all, because, as I explained, bad
> eraseblock is not necessarily writable, it's contents and the state is
> unpredictable. It may contain unstable bits, for example. You really
> need to erase it before writing.

it is completely artificial.  as you said yourself, it is "not
necessarily writable".  that means i should be able to tell the
hardware "do XXX" and let the hardware do it.  instead, i'm stuck with
userspace utils that say "no, you cant do that".  except the only
thing telling me i cant do that is the userspace utils.  as clearly
demonstrated, adding this option lets me do what i want -- write to
pages and change their contents.

the fact that i might not get the same data back as what i wrote is
completely irrelevant.  i can already do this to good pages without
erasing them first.  by your logic, nandwrite should also be
artificially aborting with "oh, you need to erase these blocks first".
 but it isnt

the fact that normally you want to skip badblocks is also irrelevant.
that's why it is an option the user specifically needs to enable
themselves.  i dont care if the default policy is "dont write to bad
blocks".  the default policy has no bearing here.
-mike
