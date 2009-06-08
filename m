Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MDZgk-0004RS-OH
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 07:54:57 +0000
Received: by fxm8 with SMTP id 8so3096906fxm.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Jun 2009 00:54:29 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH] nand/s3c2410: s3c2410_nand_setrate(): use correct macros
	for 2412/2440
References: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
	<1244438907.5847.323.camel@localhost.localdomain>
	<87ocszuvxj.fsf@macbook.be.48ers.dk>
	<1244440027.5847.324.camel@localhost.localdomain>
	<87k53nutfb.fsf@macbook.be.48ers.dk>
	<1244443300.5847.340.camel@localhost.localdomain>
	<1244447460.30939.33.camel@macbook.infradead.org>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 08 Jun 2009 09:54:14 +0200
In-Reply-To: <1244447460.30939.33.camel@macbook.infradead.org> (David
	Woodhouse's message of "Mon\, 08 Jun 2009 08\:51\:00 +0100")
Message-ID: <87y6s3tb2x.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

>>>>> "David" == David Woodhouse <dwmw2@infradead.org> writes:

Hi,

 David> In the years since I implemented that basic netiquette check,
 David> it's become acceptable to do exactly that for patch
 David> sequences. I thought I'd fixed it to accept 'PATCH' as well as
 David> 'Re:' and 'Aw:', but on looking closer I see I screwed it up
 David> -- it was trying to do a case-insensitive compare by turning
 David> the subject header into lower case before the
 David> comparison.... and then comparing against 'PATCH' in upper
 David> case... :)

Thanks!

-- 
Bye, Peter Korsgaard
