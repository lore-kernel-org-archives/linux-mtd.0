Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by canuck.infradead.org with smtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C7dk2-0004Dz-4B
	for linux-mtd@lists.infradead.org; Wed, 15 Sep 2004 13:38:51 -0400
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1095194840.9144.273.camel@imladris.demon.co.uk>
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
	<1095190893.5442.35.camel@tubarao>
	<1095194840.9144.273.camel@imladris.demon.co.uk>
Content-Type: text/plain
Date: Wed, 15 Sep 2004 11:19:54 -0600
Message-Id: <1095268794.19900.10.camel@tubarao>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Jochen Karrer <j.karrer@lightmaze.com>,
	steven.scholz@imc-berlin.de
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

You asked that before and the response was, "no, unless we just want
things to be consistent."

Like I said, I'm just not very familiar with the buffer functions and
I'm a bit too lazy (and busy) to read the code.  Guess I'll have to look
- then I'll commit it.
