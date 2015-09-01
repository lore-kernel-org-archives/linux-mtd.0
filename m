Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZWt83-00033K-1t
 for linux-mtd@lists.infradead.org; Tue, 01 Sep 2015 21:30:07 +0000
Received: by pacfv12 with SMTP id fv12so8048433pac.2
 for <linux-mtd@lists.infradead.org>; Tue, 01 Sep 2015 14:29:46 -0700 (PDT)
Date: Tue, 1 Sep 2015 14:29:43 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Cc: boris.brezillon@free-electrons.com, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 3/3] mtd: nand: add Toshiba TC58NVG0S3E to nand_ids
 table
Message-ID: <20150901212943.GK81844@google.com>
References: <20141230200946.277c56c0@bbrezillon>
 <1420030733-10374-1-git-send-email-linux@rempel-privat.de>
 <1420030733-10374-3-git-send-email-linux@rempel-privat.de>
 <20150825192509.GI81844@google.com>
 <55DD39E6.7030406@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55DD39E6.7030406@rempel-privat.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Oleksij,

On Wed, Aug 26, 2015 at 06:00:38AM +0200, Oleksij Rempel wrote:
> Am 25.08.2015 um 21:25 schrieb Brian Norris:
> > An old one here...
> > 
> > On Wed, Dec 31, 2014 at 01:58:53PM +0100, Oleksij Rempel wrote:
> >> Add the full description of the Toshiba TC58NVG0S3E NAND chip in the
> >> nand_ids table so that we can later use the NAND ECC infos and ONFI timings
> >> mode in controller drivers.
> >>
> >> Tested with asm9260_nand driver.
> > 
> > Looks like this driver work stalled?
> 
> Yea, i'm working on other project. The company with asm9260_nand chip
> asked not to be named any more. I assume, they have some legal issues. I
> can continue to work on this in my free time, but i need some suggestion
> how to handle this issue. Any ideas?

Well, I'm not a lawyer, and I can't give legal advice. But AIUI, as long
as you can fulfill the Developer's Certificate of Origin (see
Documentation/SubmittingPatches), then you can still contribute code.
It's on you to clear up whether you have "the right to submit it under
the open source license indicated in the file."

(IANAL double: but given that the original submissions are already out
on the mailing lists under GPLv2 (the Signed-off-by), nothing would stop
random developer X from picking up your work and upstreaming it, without
any additional permission.)

Brian
