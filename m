Subject: Re: What is ANAND header?
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1169716358.3609.12.camel@sauron>
References: <20070124054731.GA31267@pooky.senux.com>
	<BFECAF9E178F144FAEF2BF4CE739C66803EAB0BB@exmail1.se.axis.com>
	<20070125064937.GA5712@pooky.senux.com>
	<1169716358.3609.12.camel@sauron>
Content-Type: text/plain
Date: Thu, 25 Jan 2007 23:30:58 +0800
Message-Id: <1169739059.3593.84.camel@shinybook.infradead.org>
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

On Thu, 2007-01-25 at 20:12 +1100, Artem Bityutskiy wrote:
> On Thu, 2007-01-25 at 15:49 +0900, Seongsu Lee wrote:
> > Then, is there any technical reason that translation layer
> > for bare NAND flash memory is *not* exist?
> 
> Just because it is a damn difficult task. 

No it isn't. It's just not an _interesting_ task. A 'normal' file system
on top of a translation layer is always going to be suboptimal when
compared to a file system designed to run directly on flash.

-- 
dwmw2
