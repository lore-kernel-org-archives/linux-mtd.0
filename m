From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20040113154724.GA23333@wohnheim.fh-wedel.de>
References: <opr1py4bes8jdzbh@10.100.100.100>
	 <20040113154724.GA23333@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Message-Id: <1074009621.17620.70.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 13 Jan 2004 16:00:21 +0000
Content-Transfer-Encoding: 8bit
cc: Markus Borchers <MBorchers@adwin.de>
cc: linux-mtd@lists.infradead.org
Subject: Re: overwrite complete flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-13 at 16:47 +0100, Jörn Engel wrote:
> > I miss a device-file (like /dev/hda) to have access independent of any 
> > partitions.
> 
> Should be just like /dev/hda - look for the device with minor number 0
> or create it, if you don't have it.

That's not normally the case. It's _possible_ for the map driver to
register the whole device first, and then the partitions -- but most
don't.

-- 
dwmw2
