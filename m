Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7jaN-0005CT-BP
	for linux-mtd@lists.infradead.org; Wed, 15 Sep 2004 19:53:16 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1095194840.9144.273.camel@imladris.demon.co.uk>
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
	<1095190893.5442.35.camel@tubarao>
	<1095194840.9144.273.camel@imladris.demon.co.uk>
Content-Type: text/plain
Date: Wed, 15 Sep 2004 17:34:19 -0600
Message-Id: <1095291259.19900.44.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: steven.scholz@imc-berlin.de, Jochen Karrer <j.karrer@lightmaze.com>,
	linux-mtd@lists.infradead.org
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-14 at 21:47 +0100, David Woodhouse wrote:
> On Tue, 2004-09-14 at 13:41 -0600, Thayne Harbaugh wrote:
> > Anyone else that cares should comment now or I'll commit it so that it
> > doesn't get forgotten.
> 
> Looks good -- best to commit it. Are there other places where we need
> the same fix?

I looked and didn't see any other places (other than right before in the
same function - I changed that for consistency).

Anyone that cares, please test what's in CVS!

BTW, Eric Biederman is going to push this and other patches to the
kernel.  Better check everything before it's too late!
