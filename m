From: David Woodhouse <dwmw2@infradead.org>
To: Roy Lauer <rlaor@yahoo.com>
In-Reply-To: <20040204101218.92472.qmail@web20416.mail.yahoo.com>
References: <20040204101218.92472.qmail@web20416.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1075890631.5699.3.camel@lapdancer.baythorne.internal>
Mime-Version: 1.0
Date: Wed, 04 Feb 2004 10:30:32 +0000
Content-Transfer-Encoding: 7bit
cc: gerg@snapgear.com
cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with DOC Millennium Plus
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

If your mailer is broken and loses References: headers, get a real one.
Don't just remove 'Re:' from your subject line to get around the
filters. 

On Wed, 2004-02-04 at 02:12 -0800, Roy Lauer wrote:
> > The DiskOnChip Millennium Plus uses INFTL not NFTL.
> You should be very
> > careful using the current INFTL code -- it does not
> observe the Bad Block Table.
> 
> What does it mean?
> Does it mean that practically the current INFTL code
> is unusable with the DiskOnChip Millennium Plus?
> 
> The DOC is recognized correctly but I keep getting
> "corrupt block" errors (please see the log below).

It does indeed look like it's trying to erase blocks which are actually
bad -- which it should have _known_ are bad if it had been able to read
the BBT.

We really do need to implement support for reading the BBT.

-- 
dwmw2
