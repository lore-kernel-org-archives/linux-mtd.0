From: David Woodhouse <dwmw2@infradead.org>
To: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
In-Reply-To: <1074007527.9219.11.camel@spawn.uab.ericsson.se>
References: <20040113125031.GA5146@angel.research.nokia.com>
	 <1074001140.17620.3.camel@hades.cambridge.redhat.com>
	 <1074007527.9219.11.camel@spawn.uab.ericsson.se>
Content-Type: text/plain
Message-Id: <1074007799.17620.60.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 13 Jan 2004 15:30:00 +0000
Content-Transfer-Encoding: 7bit
cc: MTD List <linux-mtd@lists.infradead.org>
cc: "Jarkko Lavinen \(NMP/Helsinki\)" <jarkko.lavinen@nokia.com>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-13 at 16:25 +0100, Kenneth Johansson wrote:
> I have done some work on the JFFS2 code in u-boot and found that the
> fastest way was to load the entire FLASH into a continuous disk image in
> DRAM and then have code that directly dereference pointers into this
> image without any access functions or read on demand.

What we do in the current JFFS2 code is similar. We directly dereference
pointers into the _flash_ without access functions, rather than copying
it into DRAM first.

> When I tried to be smart and skip the copy and only read in what needed
> to be read that was significantly slower.

Bear in mind that the question was about NAND flash though -- it's not
directly deferenceable, and you're not going to get the same results.

-- 
dwmw2
