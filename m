From: David Woodhouse <dwmw2@infradead.org>
To: tharbaugh@lnxi.com
In-Reply-To: <1095268794.19900.10.camel@tubarao>
References: <MKELJOLMMOHJCMIPKLJKCEMOCAAA.j.karrer@lightmaze.com>
	<1095190893.5442.35.camel@tubarao>
	<1095194840.9144.273.camel@imladris.demon.co.uk>
	<1095268794.19900.10.camel@tubarao>
Content-Type: text/plain
Message-Id: <1095270103.24547.638.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 15 Sep 2004 18:41:44 +0100
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Jochen Karrer <j.karrer@lightmaze.com>,
	steven.scholz@imc-berlin.de
Subject: Re: Bug in cfi_cmdset_0002.c in linux-2.6.8.1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-09-15 at 11:19 -0600, Thayne Harbaugh wrote:
> On Tue, 2004-09-14 at 21:47 +0100, David Woodhouse wrote:
> > On Tue, 2004-09-14 at 13:41 -0600, Thayne Harbaugh wrote:
> > > Anyone else that cares should comment now or I'll commit it so that it
> > > doesn't get forgotten.
> > 
> > Looks good -- best to commit it. Are there other places where we need
> > the same fix?
> 
> You asked that before and the response was, "no, unless we just want
> things to be consistent."

If I was going to be reliable enough to remember such things I'd be
reliable enough to have committed the patch in the first place. Don't
taunt me :)

> Like I said, I'm just not very familiar with the buffer functions and
> I'm a bit too lazy (and busy) to read the code.  Guess I'll have to look
> - then I'll commit it.

Thanks. I completely accept your excuse. :)

-- 
dwmw2
