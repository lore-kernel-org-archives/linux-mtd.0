Received: from desire.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19ajap-0002MW-3t
	for <linux-mtd@lists.infradead.org>; Thu, 10 Jul 2003 23:08:47 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>, jasmine@regolith.co.uk
Date: Fri, 11 Jul 2003 10:12:07 +1200
References: <E19ZLo5-0000XC-Kw@pentafluge.infradead.org>
	<Pine.LNX.4.53.0307101358200.32710@hex.linuxgrrls.org>
	<1057846853.21073.378.camel@passion.cambridge.redhat.com>
In-Reply-To: <1057846853.21073.378.camel@passion.cambridge.redhat.com>
MIME-Version: 1.0
Message-Id: <20030710220855.468E515B9B@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: nand flash driver -> ALE etc
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 11 July 2003 02:20, David Woodhouse wrote:
> On Thu, 2003-07-10 at 14:05, jasmine@regolith.co.uk wrote:
> > On Wed, 9 Jul 2003, Charles Manning wrote:
> > > I think most people connect CLE and ALE to GPIO pins, but some
> > > application notes describe driving these via the address bus. you
> > > should then be able to drive the lines the way you want by accessing
> > > the corresponding addresses.
>
> Hmmm. When sending multiple bytes of address, isn't ALE supposed to
> remain high for the entire duration, without going low again between
> cycles? How do you achieve this if it's on the address bus?

I always thought so too, but someone brought to my attention a discussion 
about using address lines in a Toshiba doc.

The timing diagrams in the Toshiba datasheet I have open right now 
(TC58128AFT) state  that ALE and friends are don't care except during the 
actual read/write cycles.

I looked at a Samsung datasheet and saw the same thing.


-- Charles
