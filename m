Subject: Re: [PATCH] CFI: remove major/minor version check for command set
	0x0002
From: David Woodhouse <dwmw2@infradead.org>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <alpine.LFD.2.00.0901081134110.6007@xanadu.home>
References: <496624A4.3050808@grandegger.com>
	<alpine.LFD.2.00.0901081134110.6007@xanadu.home>
Content-Type: text/plain
Date: Thu, 08 Jan 2009 16:48:37 +0000
Message-Id: <1231433317.28362.77.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Wolfgang Grandegger <wg@grandegger.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-01-08 at 11:47 -0500, Nicolas Pitre wrote:
> > The NOR Flash memory K8P2815UQB from Samsung uses the major version
> > number '0', which seems to be unusual but not illegal, IIUC. This
> > patch removes the major-minor version check to get this Flash memory
> > supported as well.
> 
> Instead of removing the test entirely, I'd suggest you augment it with 
> the manufacturer ID (cfi->mfr and cfi->id).  Or better yet, just use 
> that information to fix up the version number to something sensible.

Couldn't you use a quirk to do the latter?

-- 
dwmw2
