Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QKWPi-0002UW-Up
	for linux-mtd@lists.infradead.org; Thu, 12 May 2011 13:58:51 +0000
Received: by ewy3 with SMTP id 3so510945ewy.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 12 May 2011 06:58:49 -0700 (PDT)
Subject: Re: UBI bad image sequence number error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1105120903590.15966@lnxricardw.se.axis.com>
References: <BANLkTi=0DP6QE9eLK6wS4L3gNv2Mb9ib+A@mail.gmail.com>
	<Pine.LNX.4.64.1105120903590.15966@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 12 May 2011 16:55:26 +0300
Message-ID: <1305208526.14423.13.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-12 at 09:05 +0200, Ricard Wanderlof wrote:
> On Wed, 11 May 2011, Alex Levin wrote:
> 
> > UBI error: ubi_init: UBI error: cannot initialize UBI, error -22
> 
> (Not actually a response to Alex, more of a general comment on the code:)
> 
> I see a lot of these 'error -SOMETHING' in UBI error reports, is there not 
> a way for the driver to convert the error numbers to text strings?

I do not know such a way.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
