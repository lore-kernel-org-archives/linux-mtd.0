Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xa5ba-0001KB-Fw
 for linux-mtd@lists.infradead.org; Fri, 03 Oct 2014 16:21:18 +0000
Message-ID: <1412353168.10105.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Fri, 03 Oct 2014 19:19:28 +0300
In-Reply-To: <CACna6ryws=d_7NXhzWyu34TaV+Yv8y0+D4Q0ewuzDEv=8xDxRg@mail.gmail.com>
References: <1412089998-18978-1-git-send-email-tlinder@codeaurora.org>
 <1412350035.3795.101.camel@sauron.fi.intel.com>
 <CACna6ryws=d_7NXhzWyu34TaV+Yv8y0+D4Q0ewuzDEv=8xDxRg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 linux-arm-msm@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-10-03 at 17:50 +0200, Rafał Miłecki wrote:
> On 3 October 2014 17:27, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > Yes, I guess a single patch is indeed OK. I have few nit-picks, though.
> >
> > On Tue, 2014-09-30 at 18:13 +0300, Tanya Brokhman wrote:
> >> -             ubi_err("'ubi_io_read_ec_hdr()' returned unknown code %d", err);
> >> +             ubi_err(ubi,
> >> +               "'ubi_io_read_ec_hdr()' returned unknown code %d", err);
> >>               return -EINVAL;
> >
> > I think it is fine if the line is long in these cases, let's keep the
> > message on the same line, this split does not contribute to better
> > readability, quite the opposite, in my opinion.
> >
> > One line:
> > ubi_err(ubi, "long line")
> >
> > Multiple lines:
> > ubi_err(ubi, "long line,
> >         parameters)
> 
> You should discuss that with checkpatch team, because ARAIR it will
> complain about "long line" with any other parameter in the same line.

I respect checkpatch.pl, and uniformity / consistency, but in this
particular case I put my maintainer hat on and say that for this kernel
subsystem it is fine, because the maintainer will be more efficient in
maintaining this code when the code is a bit mere readable for him.

Artem.
