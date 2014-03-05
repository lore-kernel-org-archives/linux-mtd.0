Received: from mail-pb0-x22c.google.com ([2607:f8b0:400e:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLGU8-0003Pq-4p
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 18:24:04 +0000
Received: by mail-pb0-f44.google.com with SMTP id rp16so1410017pbb.31
 for <linux-mtd@lists.infradead.org>; Wed, 05 Mar 2014 10:23:40 -0800 (PST)
Date: Wed, 5 Mar 2014 10:23:34 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Annoying ML complains about "suspicious header"
Message-ID: <20140305182334.GT13420@norris-Latitude-E6410>
References: <CACna6rzSrnx8ueOn1O5k62eTppPDRVFgTA56WgQQqWUW1asMJw@mail.gmail.com>
 <1393325817.3412.94.camel@sauron.fi.intel.com>
 <CAN8TOE8Cu0fkdV7J6ZxMAoN0oAdvBMFQETMZUa7sp0v3wocJ6w@mail.gmail.com>
 <1394009048.6302.12.camel@sauron.fi.intel.com>
 <1394017388.21141.56.camel@i7.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394017388.21141.56.camel@i7.infradead.org>
Cc: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 05, 2014 at 11:03:08AM +0000, David Woodhouse wrote:
> On Wed, 2014-03-05 at 10:44 +0200, Artem Bityutskiy wrote:
> > Right, and I am embarrassed because of the typos. Indeed I wanted to
> > say: "solving social problems with technical means never works well".
> 
> Oh, it does. HTML is a social problem, and the technical solution works.
> 
> The threading thing is also a social problem — even now there are plenty
> of people who are just lazy and inconsiderate, and will hit 'reply' on
> an existing thread and change the subject instead of properly creating a
> new one.
> 
> In both cases there is a *big* correlation between the people who can't
> be bothered with the technicalities of sending a proper email, and the
> people who can't actually manage to write coherently in the email itself
> (or who are asking stupid questions because they're equally lazy in
> finding things for themselves). We don't lose much, by banning HTML and
> (genuinely) stupid threading abuse.

For the threading issues: I'm not sure this is always a good idea. But
if you want to leave the filter, can it include a better rejection
message? Like one that mentions the intention (replying to the wrong
thread) as a possible cause? The "suspicious header" message is very
much opaque to us.

> The complexity with the threading check is that it has false positives
> with patch sets, because we *expect* those to be in a thread but without
> the normal 'Re:' in the subject. The check already does have an
> exemption if it finds [Pp][Aa][Tt][Cc][Hh] in the subject — Rafał,
> looking at the four messages in the moderation queue from you, if you'd
> just said [RFC PATCH] and [WIP PATCH] instead of just [RFC] and [WIP]
> alone, then they'd have sailed straight through.
> 
> However, it looks like I could further reduce the number of false
> positives on this check by just exempting *all* messages with X-Mailer:
> header containing 'git-send-email', and that would have fixed it for all
> your recent postings too. I've made that change.

Could you publicize the filter rules somehow? This kind of heuristic
will inevitably leave corner cases eventually (what if people aren't
using git-send-email, but otherwise send properly-formatted threads with
an [RFC] patch title?), and it would be nice to be able to identify the
error -- either in the filter or in the sender.

Brian
