Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1akR6z-00074y-GB
 for linux-mtd@lists.infradead.org; Mon, 28 Mar 2016 06:57:18 +0000
Message-ID: <1459148213.19765.14.camel@gmail.com>
Subject: Re: ubiblock RW
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Willy Tarreau <w@1wt.eu>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Benson Young
 <benson6877@gmail.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, David Gstir <david@sigma-star.at>
Date: Mon, 28 Mar 2016 09:56:53 +0300
In-Reply-To: <56F85851.5020508@nod.at>
References: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
 <CAAEAJfB42GY9kGDBvacpKNgtAt3Kp1bE6rfprm_A_WiwR_cXGg@mail.gmail.com>
 <56F4502D.3030902@nod.at>
 <CAAEAJfDXB34SWoCMXBiqEFSRMWAxZpGmMR9tPdsN=mokO8fkhw@mail.gmail.com>
 <1458906697.615.20.camel@gmail.com> <20160325205011.GA1106@laptop.cereza>
 <56F5ACBD.8070201@nod.at> <20160326060137.GA9296@1wt.eu>
 <56F85851.5020508@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-03-28 at 00:01 +0200, Richard Weinberger wrote:
> Am 26.03.2016 um 07:01 schrieb Willy Tarreau:
> > 
> > On Fri, Mar 25, 2016 at 10:25:17PM +0100, Richard Weinberger wrote:
> > > 
> > > Am 25.03.2016 um 21:50 schrieb Ezequiel Garcia:
> > > > 
> > > > I guess we could have some UBI parameter to enable this
> > > > support,
> > > > and print a very noisy message to warn users about potential
> > > > device wear out -- naively assuming users read messages...
> > > As I wrote in my previous mail, I think a new parameter for the
> > > ubiblock
> > > tool would do the job.
> > > I'd default ubiblock to RO and via the ubiblock tool you can
> > > enable RW mode.
> > > ...which would also trigger a warning.
> > > 
> > > What I'd like to avoid is a kernel command line or a Kconfig
> > > option to make
> > > RW default. If someone *really* wants RW she has to run ubiblock
> > > --enable-rw....
> > > in userspace. This should even work for block filesystems on top
> > > of UBI
> > > as root fs as you can remount them later RW.
> > > 
> > > Sounds like a plan?
> > I would see something a little bit better (from a user
> > perspective), though
> > I don't know if it's possible. It would be nice to mark the UBI
> > image RO/RW
> > when it is created via ubiformat. That would be a bit stored on the
> > ubiblock
> > itself. That way the decision is taken at creation time and is not
> > changed
> > later (or only using a specific tool). Note that it is very
> > possible I'm
> > missing something important, but you get the idea.
> ubiblock is just a layer above an UBI volumes.
> We could add a new UBI volume flag for RW ubiblock.

You can add a per-volume R/O flag if needed, yes. Expose it to user-
space. This may be a useful thing irrespectively. I am not sure how it
helps with ubiblock though.

Ideally, the ubiblock R/W enabled flag should be stored in ubiblock,
not in UBI, not in MTD, because you want ubiblock to have full control
over it. You do not want a user go and change the flag via the UBI
interface whenever the user feels like, right?

To have this kind of flag in ubiblock, it needs an on-flash superblock
or something. If you are not going to introduce it, which I believe is
the case, then the only option left in my opinion is a ubiblock module
parameter.

If I am a ubiblock user who needs the write support, and this naive
write support is good enough for me, I want it enabled by default on my
product. A module parameter with a sound name like 'dangerous-write-
support' or something would work fine for me.

Artem.
