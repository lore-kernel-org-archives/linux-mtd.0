Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UcYRk-0004VC-4t
 for linux-mtd@lists.infradead.org; Wed, 15 May 2013 09:56:34 +0000
Message-ID: <1368611929.15764.22.camel@sauron.fi.intel.com>
Subject: Re: corrupted empty space - again
From: Artem Bityutskiy <dedekind1@gmail.com>
To: =?UTF-8?Q?Micha=C5=82_Przep=C5=82ata?= <michal.przeplata@gmail.com>
Date: Wed, 15 May 2013 12:58:49 +0300
In-Reply-To: <CADX2ZXOk1SW8gWnmWu+E8CAU9bPuOYEdyp3vmKktB1m=_ZZrfA@mail.gmail.com>
References: <CADX2ZXOk1SW8gWnmWu+E8CAU9bPuOYEdyp3vmKktB1m=_ZZrfA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-15 at 11:42 +0200, Michał Przepłata wrote:
> My assumption is that when UBIFS will write 2kB page to the empty space
> with bitflips, it will (right after writting) verify ECC of that data to
> be sure it is correct, and if it isn't it will write to a different LEB
> and scrub this one. That way there will be no data loss. Isn't that the
> way things are done?

No, we do not do this - it would be too ineffecient if UBIFS read
everything it just wrote. Besides, MTD layer may do some caching, and
reading may return results from a cache...

The driver can implement this functionality, though. It could then
return an error, and then UBI would have to do recovery, which is not
very fast process, because it involves moving all the data from the
faulty erasebolock somewhere else, and then torture the faulty one.

I think it is more efficient to do something in the driver on the read
path. I really do not know what would be a robust and fast solution,
though. You could check if ECC's bytes in OOB are all 0xFFs, which would
mean that the page is empty, and you need to verify the bit-flips. But
the OOB area itself may have bit-flips in the ECC positions...

But there are people in this list who are more knoledgable in the area.
I am out of MTD business for several years already and forgot a lot of
things. You just need to somehow get their attention :-)
> >
> > I think this is a bad idea, because this way you also ignore real
> > corruptions, instead of noticing them right away.
> On UBI homepage there is mentioned that one should write a process
> that will periodically re-read all UBI blocks, in order to not let
> bitflips in data blocks to accumulate over long periods of time.
> So it is still not there? 

No, no one implemented this, although it is easy to do, I think.

> Must this be done in kernel-space or
> simpler in user-space (I guess reading all *files* from mounted volumes
> will not be enough, as some UBI blocks (journaling, other structures)
> will not be re-read this way, right?)

Probably a kernel-space thread would do better. And if doing this in
user-space, you should do this by reading UBI volumes directly
(/dev/ubiX_Y), not from the file-system.

> BTW. For some reason my previous mail (response to Pekon Gupta) is on
> hold by mailing list's owner. Am I considered a spammer for some reason? :)

Probably. The mailing list does not like HTML and "Re: in subject but no
In-Reply-To: in headers".

-- 
Best Regards,
Artem Bityutskiy
