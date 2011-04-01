Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Zjg-0002u6-Rb
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 08:29:41 +0000
Received: by wyb28 with SMTP id 28so3340579wyb.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 01 Apr 2011 01:29:39 -0700 (PDT)
Subject: Re: How to write to nand with an image containing oob data,
	including ECC?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1103291723240.25520@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1103291723240.25520@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 11:27:16 +0300
Message-ID: <1301646436.2789.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-03-29 at 17:30 +0200, Ricard Wanderlof wrote:
> Hi,
> 
> In order to test an ECC algorithm (BCH in this case, as I recently posted 
> about), i want to write an image to a nand flash which contains bit 
> errors.

I just tried to look at this, and realized that nandwrite and whole this
oob modes stuff is such a mess that I won't have time to deal with this
anyway, sorry. If you could figure out what is going on and fix this -
that would be great.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
