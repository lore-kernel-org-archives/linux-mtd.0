Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLJWo-0001Rj-8L
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 21:39:03 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
 <87txc4w698.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>
 <D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>
 <877g8ojqsn.fsf@nbsps.com> <53079725.6080105@nod.at>
 <87ios8gsho.fsf@nbsps.com> <87k3coq8di.fsf@nbsps.com>
 <530860B1.9000808@nod.at> <877g8kr1h7.fsf@nbsps.com>
 <530B670B.3090002@nod.at> <87sir8ms41.fsf@nbsps.com>
 <87ob1wmrzi.fsf@nbsps.com> <53178FC6.6060605@nod.at>
Date: Wed, 05 Mar 2014 16:30:48 -0500
In-Reply-To: <53178FC6.6060605@nod.at> (Richard Weinberger's message of "Wed,
 05 Mar 2014 21:57:42 +0100")
Message-ID: <87txbcib93.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: "Wiedemer, Thorsten \(Lawo AG\)" <Thorsten.Wiedemer@lawo.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Ziegler,
 Emanuel \(Lawo AG\)" <Emanuel.Ziegler@lawo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On  5 Mar 2014, richard@nod.at wrote:

> Thorsten and Emanuel from Lawo AG kindly gave me access to one of
> their boards such that I was able to work directly on the issue.

> The solution is rather trivial.
> Two commits were missing in their tree:

> commit 8afd500cb52a5d00bab4525dd5a560d199f979b9
> Author: Adam Thomas <adamthomas1111@gmail.com>
> Date:   Sat Feb 2 22:35:08 2013 +0000

> UBIFS: fix double free of ubifs_orphan objects

> and

> commit 2928f0d0c5ebd6c9605c0d98207a44376387c298
> Author: Adam Thomas <adamthomas1111@gmail.com>
> Date:   Sat Feb 2 22:32:31 2013 +0000

> UBIFS: fix use of freed ubifs_orphan objects

> Bill, I'm very sure this fixes also the issue you face.

I haven't seen this issue recently.  It was only with older versions.  I
have both of those commits as well and wasn't able to reproduce it.  So
I have no issues.

Still, the logic of ubi_eba_copy_leb() seems really weird to me.  I
don't understand,

 	err = leb_write_trylock(ubi, vol_id, lnum);

followed by,

	leb_write_unlock(ubi, vol_id, lnum);

It looks like a double reference count decrement.  Maybe they operate on
different ltree nodes, but then the locks mis-match.

Fwiw,
Bill Pringlemeir.
