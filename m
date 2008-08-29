Date: Fri, 29 Aug 2008 12:23:26 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [PATCH 2/2][MTD] Add support for > 2GiB MTD devices
Message-ID: <20080829102326.GA27647@logfs.org>
References: <1219817017.18027.149.camel@sauron>
	<000201c9080d$0bce0d20$6b01a8c0@mvista.com>
	<20080827093920.1bdb44c2@lxorguk.ukuu.org.uk>
	<1219827692.7107.170.camel@pmac.infradead.org>
	<20080827143416.GA1371@logfs.org>
	<1219848463.18027.166.camel@sauron>
	<20080827152534.GB1371@logfs.org> <1219988887.4036.7.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1219988887.4036.7.camel@sauron>
Cc: linux-mtd-bounces@lists.infradead.org,
	'Bruce Leonard' <brucle@earthlink.net>, Bruce_Leonard@selinc.com,
	linux-kernel@vger.kernel.org, Tim Anderson <tanderson@mvista.com>,
	linux-mtd@lists.infradead.org, 'Andrew Morton' <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>, Alan Cox <alan@lxorguk.ukuu.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 August 2008 08:48:07 +0300, Artem Bityutskiy wrote:
> On Wed, 2008-08-27 at 17:25 +0200, Jörn Engel wrote:
> > 
> > Could be useful, I don't mind you sending a patch.  However, does this
> > means that MEMGETINFO64 or some other ioctl should not be done?  Should
> > flash_erase open, read and close 8 seperate files instead of doing a
> > single ioctl?  And should our support for large devices wait for the
> > sysfs support that has been talked about and not done for about two
> > years already?
> 
> Up to dwmw2, but I do not mind if the answer to all the above questions
> is "yes" :-)

Well, I personally think a "yes" to the last question would be utter
madness.  Whoever answers that should better come up with an alternative
patch for sysfs support pronto.

Large flashes are not a one-off cases where a single manufacturer had a
rather bizarre design.  Their numbers will continually increase.  And
not supporting an ever-increasing class of hardware is simply not an
option.

Jörn

-- 
 on a false concept. This concept is that
people actually want to look at source code.
-- Rob Enderle
