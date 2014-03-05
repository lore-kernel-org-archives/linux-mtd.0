Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WL7bp-00007X-Rd
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 08:55:26 +0000
Message-ID: <1394009699.6302.19.camel@sauron.fi.intel.com>
Subject: Re: Annoying ML complains about "suspicious header"
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 05 Mar 2014 10:54:59 +0200
In-Reply-To: <CAN8TOE_6AjRBJGX2vCcS1VEJAy0xt00VXPvDwKoNq4_uXJWr7A@mail.gmail.com>
References: <CACna6rzSrnx8ueOn1O5k62eTppPDRVFgTA56WgQQqWUW1asMJw@mail.gmail.com>
 <1393325817.3412.94.camel@sauron.fi.intel.com>
 <CAN8TOE8Cu0fkdV7J6ZxMAoN0oAdvBMFQETMZUa7sp0v3wocJ6w@mail.gmail.com>
 <CAN8TOE_6AjRBJGX2vCcS1VEJAy0xt00VXPvDwKoNq4_uXJWr7A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-03-05 at 00:40 -0800, Brian Norris wrote:
> On Wed, Mar 5, 2014 at 12:35 AM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> > On Tue, Feb 25, 2014 at 2:56 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> On Tue, 2014-02-25 at 07:09 +0100, Rafał Miłecki wrote:
> >>> I think it's 5th time ML complains about some unspecified "suspicious
> >>> header" in my patches. I sent patches using "git send-email", so I
> >>> really don't know what may be wrong with them.
> >>
> >> There are several rules on the server which try to trap mails which
> >> break threading, and HTML mails.
> ...
> >> Anyway, I'd vote to remove these rules altogether.
> >
> > OK, but who can actually *do* this? Is dwmw the only ML moderator?
> 
> BTW, I wouldn't vote to remove *all* the aforementioned rules. I think
> the HTML filter is probably still valid (it's standard practice for
> all other Linux mailing lists, I think; and HTML mail is unnecessary
> and even problematic), but some of the threading ones have really
> stumped me before and probably should be improved or dropped.

I would vote to remove all the trapping. Especially if you take into
account that no one moderates that the list nowadays. I did this in the
past occasionally, but not anymore.

For html - if the community wants to be that strict, it is better to
reject them with a notification. Trapping makes little sense, no?

Then there are the multipart/alternative e-mails with both paint-text
and HTML versions of the text, one could let them go through, I guess.

-- 
Best Regards,
Artem Bityutskiy
