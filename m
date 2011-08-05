Received: from antispam02.maxim-ic.com ([205.153.101.183])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QpEmd-00010o-22
	for linux-mtd@lists.infradead.org; Fri, 05 Aug 2011 07:25:31 +0000
From: Brian Foster <brian.foster@maxim-ic.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [BUG] mtdinfo -a: Tries to open NULL pointer for NOR with
	Eraseblock Regions
Date: Fri, 5 Aug 2011 09:24:15 +0200
References: <201107251148.51262.brian.foster@maxim-ic.com>
	<201107260921.44512.brian.foster@maxim-ic.com>
	<CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
In-Reply-To: <CAN8TOE847yECw3zeh42tf=6mC73O33Lr7Lzwpi0FrT-rB9ZYmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <201108050924.15740.brian.foster@maxim-ic.com>
Cc: Mike Frysinger <vapier@gentoo.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 04 August 2011 19:46:10 Brian Norris wrote:
> On Tue, Jul 26, 2011 at 12:21 AM, Brian Foster <brian.foster@maxim-ic.com> wrote:
> >  The list was easy to find; what I could not find was
> >  any indication of how/where bugs should be reported.
> 
> Hmm, it seems like maybe the closest info is hidden away at:
> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_how_send_bugreport
> But much of this refers to UBIFS-specific stuff.  Perhaps the
> site should be updated.

 Indeed.  I don't recall finding that (but as you say,
 this is not a UBIFS issue per se).  May I suggest an
 entry in the FAQ?

>[ ... ] 
> Anyway, since I don't have these types of flash [with region_info]
> readily available, I don't even use these options :)  And apparently,
> one of the biggest contributors for mtd-utils, Mike Frysinger,
> doesn't use region_info either...

 I've no idea why all(? I think!) of our embedded systems
 reference designs _do_ use such Flashes.  The designer's
 on vacation now (this is August, and it is France, hence
 just about everybody's on vacation .... !) or I'd ask if
 there's any reason.

cheers!
	-blf-
-- 
Brian FOSTER
Principal MTS, Software
Maxim Integrated Products (Microcontroller BU), formerly Innova Card
Web    : http://www.maxim-ic.com/
