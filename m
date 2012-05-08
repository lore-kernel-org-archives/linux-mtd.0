Message-ID: <1336483374.16236.38.camel@twins>
Subject: Re: [PATCH] UBI: Replace yield() with cond_resched()
From: Peter Zijlstra <peterz@infradead.org>
To: dedekind1@gmail.com
Date: Tue, 08 May 2012 15:22:54 +0200
In-Reply-To: <1336483427.23308.37.camel@sauron.fi.intel.com>
References: <1336465602-12627-1-git-send-email-richard@nod.at>
 <1336467723.23308.23.camel@sauron.fi.intel.com> <4FA8FC83.7000503@nod.at>
 <1336483427.23308.37.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-05-08 at 16:23 +0300, Artem Bityutskiy wrote:
> On Tue, 2012-05-08 at 12:59 +0200, Richard Weinberger wrote:
> > > The purpose was different. If we have I/O error, we hope it is a
> > > transient failure. E.g., the HW is temporary unavailable because of a=
n
> > > internal issue. And with yield() we hoped to schedule away for longer
> > > time than usual and let other processes which may affect that HW go
> > > forward and do something.
> >=20
> > Okay, yield() is clearly the wrong choice here.
> > cond_resched() is better.
>=20
> I do not think it is better. Yes, for I/O I'd suggest
> msleep_interruptible(200) instead.

At least document the intent of that random sleep. Otherwise we'll be
having this same discussion again in a few years or so ;-)
