Received: from wtarreau.pck.nerim.net ([62.212.114.60] helo=1wt.eu)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ajhIS-0004fD-8a
 for linux-mtd@lists.infradead.org; Sat, 26 Mar 2016 06:02:05 +0000
Date: Sat, 26 Mar 2016 07:01:37 +0100
From: Willy Tarreau <w@1wt.eu>
To: Richard Weinberger <richard@nod.at>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Benson Young <benson6877@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Gstir <david@sigma-star.at>
Subject: Re: ubiblock RW
Message-ID: <20160326060137.GA9296@1wt.eu>
References: <CABJ+KKu2RJuHXE3LpmzSYtE0i57sHDUHWOxPxufCP94RTa=eBA@mail.gmail.com>
 <CAAEAJfB42GY9kGDBvacpKNgtAt3Kp1bE6rfprm_A_WiwR_cXGg@mail.gmail.com>
 <56F4502D.3030902@nod.at>
 <CAAEAJfDXB34SWoCMXBiqEFSRMWAxZpGmMR9tPdsN=mokO8fkhw@mail.gmail.com>
 <1458906697.615.20.camel@gmail.com>
 <20160325205011.GA1106@laptop.cereza> <56F5ACBD.8070201@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56F5ACBD.8070201@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 25, 2016 at 10:25:17PM +0100, Richard Weinberger wrote:
> Am 25.03.2016 um 21:50 schrieb Ezequiel Garcia:
> > I guess we could have some UBI parameter to enable this support,
> > and print a very noisy message to warn users about potential
> > device wear out -- naively assuming users read messages...
> 
> As I wrote in my previous mail, I think a new parameter for the ubiblock
> tool would do the job.
> I'd default ubiblock to RO and via the ubiblock tool you can enable RW mode.
> ...which would also trigger a warning.
> 
> What I'd like to avoid is a kernel command line or a Kconfig option to make
> RW default. If someone *really* wants RW she has to run ubiblock --enable-rw....
> in userspace. This should even work for block filesystems on top of UBI
> as root fs as you can remount them later RW.
> 
> Sounds like a plan?

I would see something a little bit better (from a user perspective), though
I don't know if it's possible. It would be nice to mark the UBI image RO/RW
when it is created via ubiformat. That would be a bit stored on the ubiblock
itself. That way the decision is taken at creation time and is not changed
later (or only using a specific tool). Note that it is very possible I'm
missing something important, but you get the idea.

Thanks,
Willy
