Subject: Re: What is ANAND header?
From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1169740653.3721.10.camel@sauron>
References: <20070124054731.GA31267@pooky.senux.com>
	<BFECAF9E178F144FAEF2BF4CE739C66803EAB0BB@exmail1.se.axis.com>
	<20070125064937.GA5712@pooky.senux.com>
	<1169716358.3609.12.camel@sauron>
	<1169739059.3593.84.camel@shinybook.infradead.org>
	<1169740653.3721.10.camel@sauron>
Content-Type: text/plain
Date: Fri, 26 Jan 2007 00:17:39 +0800
Message-Id: <1169741859.3593.102.camel@shinybook.infradead.org>
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

On Thu, 2007-01-25 at 17:57 +0200, Artem Bityutskiy wrote:
> Well, FTL is somewhat similar to flash FS in terms of complexity. A
> reasonably good FTL is probably not a damn difficult task. But a
> scalable FTL where you do not need to scan your device when
> initializing it is really difficult.

No more difficult than a file system, which will give better results.

> Of course, FTL will always be slower then flash-oriented FS. But if
> you have a very quick HW (like Cafe?) you may end-up with an
> acceptable speed - this depends on requirements.
> 
> Also, if you teach the FS to inform FTL about blocks that are free -
> it'll be much faster. 

Well, yes. The more you teach the FS about the actual requirements of
flash hardware, the more efficient it'll be. Hence the observation that
FTL isn't an interesting problem; filesystems are.

-- 
dwmw2
