Received: from wr-out-0506.google.com ([64.233.184.238])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IMAWo-0001ks-0N
	for linux-mtd@lists.infradead.org; Fri, 17 Aug 2007 18:42:51 -0400
Received: by wr-out-0506.google.com with SMTP id c48so519812wra
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Aug 2007 15:42:48 -0700 (PDT)
Message-ID: <c384c5ea0708171542v6d2c659dy4cabd128e7405cb8@mail.gmail.com>
Date: Sat, 18 Aug 2007 00:42:48 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "James Olin Oden" <james.oden@gmail.com>
Subject: Re: What is the correct way to make an mtdchar device available?
In-Reply-To: <ac921f990708101059g1fdc248bxde61df769d9ac81e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ac921f990708081050p3d71ea85kf30418f6aad88ce2@mail.gmail.com>
	<20070808192832.GA21249@marvin.netwinder.org>
	<ac921f990708091203s4199fc67w751bc0922f65be5c@mail.gmail.com>
	<20070810134527.GA31564@marvin.netwinder.org>
	<ac921f990708100720g77641a19t20d161f72f5ceb56@mail.gmail.com>
	<20070810155353.GA4326@marvin.netwinder.org>
	<ac921f990708101059g1fdc248bxde61df769d9ac81e@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello all,

On 8/10/07, James Olin Oden <james.oden@gmail.com> wrote:
> On 8/10/07, Ralph Siemsen <ralphs@netwinder.org> wrote:
> > On Fri, Aug 10, 2007 at 10:20:49AM -0400, James Olin Oden wrote:
> > >
> > >   How do I update my BIOS with MTD?
> > ...
> Bummer.  It sounds like they are going out of their way to make it
> hard to automate BIOS updates.   That explanation may explain why our
> current proprietary driver did not work on a system that had the same
> south bridge and firmware hub, but was not built by us.
>
> > I am guessing the LinuxBIOS folks have dealt with these sorts of issues,
> > perhaps worth a look to see what they've come up with.
> I will check that out.
>

I once tried the same on a Supermicro server. I had to do this before
I could access the memory. I think I used some flashtool from
Linuxbios as well.

http://www.esrac.ele.tue.nl/~leon/linux/patches/2.4.27-bios-unreserved.patch

I don't remember the details though, this has been over 16 months ago
and we have never used it in production.

I'ld love to hear your results.

*** Assume that you screw up your BIOS image / chip --- so make sure
you have a working copy or a second machine you can use to boot from,
and/or BIOS flash tool. etc etc ***

Regards,
-- 
Leon
