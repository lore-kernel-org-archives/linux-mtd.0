From: David Woodhouse <dwmw2@infradead.org>
To: Ilguiz Latypov <ilatypov@infradead.org>
In-Reply-To: <20031111063345.GA1336@ei.homeip.net>
References: <3FB05364.2000608@sympatico.ca>
	 <20031111063345.GA1336@ei.homeip.net>
Content-Type: text/plain
Message-Id: <1068539851.5855.2.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 11 Nov 2003 08:37:31 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: GRUB MTD DISKONCHIP patch failure withGRUB CVS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-11-11 at 01:33 -0500, Ilguiz Latypov wrote:
> Mike,
> 
> On Mon, Nov 10, 2003 at 10:11:32PM -0500, Mike Gore wrote:
> > I downloaded the latest CVS for grub on 10 Nov 2003 at 9:30pmEST and 
> > attempted to apply the MTD patch grub-2003-01-08-doc.patch
> > Besides the expected Changelog and Authors errors I got one rejected 
> > section on stage2/disk_io.c (see below for copy of the failed section)
> 
> I updated the patch to match the change in disk_io.c you've found.  The
> new patch is grub-2003-11-10-doc.patch.  I tested it only with a floppy
> boot.

Thanks for doing that. We _really_ ought to sort out the copyright
assignments so the patch can be merged.

-- 
dwmw2
