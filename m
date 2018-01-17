Received: from 4.mo178.mail-out.ovh.net ([46.105.49.171])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebixj-0008EE-Md
 for linux-mtd@lists.infradead.org; Wed, 17 Jan 2018 08:20:54 +0000
Received: from player715.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 801D070000
 for <linux-mtd@lists.infradead.org>; Wed, 17 Jan 2018 09:20:21 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 17 Jan 2018 09:20:11 +0100
From: =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Peter Rosin <peda@axentia.se>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION] linux-next panics when trying to mount root
In-Reply-To: <20180116163032.54a392c7@bbrezillon>
References: <574b1571-1664-f09f-62bf-48f7f94a51cd@axentia.se>
 <20180116143651.04bca70f@bbrezillon>
 <b5af18eb-e54d-eeab-d03b-4c0edbe74fd6@axentia.se>
 <20180116152138.18a114d6@bbrezillon>
 <6a51ff05-89ed-cd57-6d90-3af51c7ce619@axentia.se>
 <20180116163032.54a392c7@bbrezillon>
Message-ID: <0d3201d921386c32d2b65b3b7d3e10e7@milecki.pl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018-01-16 16:30, Boris Brezillon wrote:
> On Tue, 16 Jan 2018 16:02:35 +0100
> Peter Rosin <peda@axentia.se> wrote:
> 
>> On 2018-01-16 15:21, Boris Brezillon wrote:
>> > On Tue, 16 Jan 2018 14:56:52 +0100
>> > Peter Rosin <peda@axentia.se> wrote:
>> >
>> >> Hmmm, I guess the question is if the command line should override the
>> >> device tree or not?
>> >
>> > Yep, that's the problem. Now the core parses the compatible to decides
>> > which part parser should be used. The thing is, the "cmdline" parser is
>> > not yet exposing a compatible id, and even if it was, this would
>> > require patching all DTs to add this new compatible.
>> >
>> > 	partitions {
>> > 		compatible = "cmdline", "fixed-partitions";
>> > 		...
>> > 	};
>> >
>> > Not really an option, so I'll drop the 2 patches for now until we find a
>> > better solution.
>> >
>> >> I'm going to send a patch for the above dts change either way...
>> >
>> > If you want, but that does not solve the problem: we should not break
>> > existing users.
>> 
>> Well, don't let these devices stop you, they will not get a new kernel
>> w/o also getting a new dtb, and I can handle this just fine. But maybe
>> I'm just the first reporter and you'd rather not risk anything? 
>> Anyway,
>> just wanted to let you know where I stand...
> 
> Unfortunately, at91 is not the only platform to have "fixed-partitions"
> defined in its DTs, and I guess users of other platforms also like to
> override the default MTD layout by their own using mtdparts.I'd like to
> find a solution that keeps everyone happy.

I absolutely agree with Boris, we can't risk such regressions. That had 
to
be dropped and I'm looking for a better solution.
