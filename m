Received: from mail-ig0-x233.google.com ([2607:f8b0:4001:c05::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8ILk-0002yj-TO
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2014 23:45:49 +0000
Received: by mail-ig0-f179.google.com with SMTP id c10so3095510igq.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2014 15:45:26 -0800 (PST)
Date: Tue, 28 Jan 2014 15:45:23 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@nsn.com>
Subject: Re: [PATCH v2] mtd: phram: Repair multiple instances support
Message-ID: <20140128234523.GA8919@ld-irv-0074>
References: <525C2147.9060605@nsn.com>
 <20131107073139.GC3805@norris.computersforpeace.net>
 <52B002D1.7060001@nsn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <52B002D1.7060001@nsn.com>
Cc: Joern Engel <joern@lazybastard.org>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 =?iso-8859-1?Q?Herv=E9?= Fache <h-fache@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 17, 2013 at 08:52:49AM +0100, Alexander Sverdlin wrote:
> On 07/11/13 08:31, ext Brian Norris wrote:
> > On Mon, Oct 14, 2013 at 06:52:23PM +0200, Alexander Sverdlin wrote:
> >> mtd: phram: Repair multiple instances support
> >>
> >> Commit b2a2a84d35e0f42ad26e326ec4258f6a8b8eecbe (mtd: phram: dot not crash when
> >> built-in and passing boot param) claims to be "based on Ville Herva's similar
> >> patch to block2mtd" (c4e7fb313771ac03dfdca26d30e8b721731c562b), but it has
> >> missed the crucial point of the original path: all these "if(n)def MODULE".
> >> It has broken the possibility to create several phram instances when phram is
> >> compiled as module. The possibility to add instances via /sys writes to
> >> /sys/module/phram/parameters/phram was also broken with mentioned patch.
> >> Proposed patch takes the idea of original block2mtd patch to its full extent.
> >> Assumtion "This function is always called before 'init_phram()'" was also
> >> incorrect, so removed the comment. This patch effectively reverts also
> >> b11ec57fc6e6d4882ef01a0c09a1dde58f50492e (mtd: phram: fix section mismatch for
> >> phram_setup).
> >>
> >> v2 changes: Fixed error handling in init_phram(). 
> >>
> >> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nsn.com>
> > 
> > Can we get any testers? Perhaps Hervé can confirm this?
> 
> Have addressed Ville Herva, Ryosuke Saito, Hervé Fache on 07.11.2013, no answer
> until now. Seems nobody interested in it any more. Any chances we still get this in?

Yeah, looks ok. Pushed to l2-mtd.git/next, for 3.15.

Brian
