Subject: Re: What is ANAND header?
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1169743487.9477.4.camel@sauron>
References: <20070124054731.GA31267@pooky.senux.com>
	<BFECAF9E178F144FAEF2BF4CE739C66803EAB0BB@exmail1.se.axis.com>
	<20070125064937.GA5712@pooky.senux.com>
	<1169716358.3609.12.camel@sauron>
	<1169739059.3593.84.camel@shinybook.infradead.org>
	<1169740653.3721.10.camel@sauron>
	<1169741859.3593.102.camel@shinybook.infradead.org>
	<1169743487.9477.4.camel@sauron>
Content-Type: text/plain
Date: Fri, 26 Jan 2007 00:55:38 +0800
Message-Id: <1169744138.3593.114.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Seongsu Lee <senux@senux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-01-25 at 18:44 +0200, Artem Bityutskiy wrote:
> 
> Agree, an FS is a much more interesting problem. Although a good FTL is
> is something which would be nice to have.

Not really. If we had a well-maintained FTL then people would only use
it. :)

NFTL/INFTL/SAFTL are actually quite good designs as FTLs go; it's just
that we have the potential patent issues with them and nobody really
cares enough about them to make sure _our_ implementation is as good as
it should be, or even that we tie in block-deletion events from the file
system.

-- 
dwmw2
