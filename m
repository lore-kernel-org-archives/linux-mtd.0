Subject: Re: [PATCH] nand/s3c2410: s3c2410_nand_setrate(): use correct
	macros for 2412/2440
From: David Woodhouse <dwmw2@infradead.org>
To: "dedekind@infradead.org" <dedekind@infradead.org>
In-Reply-To: <1244443300.5847.340.camel@localhost.localdomain>
References: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
	<1244438907.5847.323.camel@localhost.localdomain>
	<87ocszuvxj.fsf@macbook.be.48ers.dk>
	<1244440027.5847.324.camel@localhost.localdomain>
	<87k53nutfb.fsf@macbook.be.48ers.dk>
	<1244443300.5847.340.camel@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 08 Jun 2009 08:51:00 +0100
Message-Id: <1244447460.30939.33.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "wookey@wookware.org" <wookey@wookware.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-arm-kernel@lists.arm.linux.org.uk"
	<linux-arm-kernel@lists.arm.linux.org.uk>,
	"ben-linux@fluff.org" <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-06-07 at 23:41 -0700, Artem Bityutskiy wrote:
> 
> "Re in subject but no in-reply-to". dwmw2 was going to fix this
> few years ago :-)

Other way round, surely. It's the thread-hijack check, which checks for
messages with In-Reply-To: or References: headers indicating that
they're a reply to an existing thread, but without 'Re:' or 'Aw:' in the
Subject: header.

In the years since I implemented that basic netiquette check, it's
become acceptable to do exactly that for patch sequences. I thought I'd
fixed it to accept 'PATCH' as well as 'Re:' and 'Aw:', but on looking
closer I see I screwed it up -- it was trying to do a case-insensitive
compare by turning the subject header into lower case before the 
comparison.... and then comparing against 'PATCH' in upper case... :)

Fixed now:
http://git.infradead.org/users/dwmw2/eximconf.git?a=commitdiff;h=47505756

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
