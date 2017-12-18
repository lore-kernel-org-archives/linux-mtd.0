Date: Mon, 18 Dec 2017 07:37:15 +0100
From: Willy Tarreau <w@1wt.eu>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: pxa3xx_nand times out in 4.14 with JFFS2
Message-ID: <20171218063715.GA20461@1wt.eu>
References: <20171217155305.16c5bb4f@bbrezillon> <20171217150043.GA1403@1wt.eu>
 <CAAEAJfD47bGTSppEqcRszjAgBUjiCevmdYLKfsQTPYMcVu8VDA@mail.gmail.com>
 <20171217162342.GA1833@1wt.eu> <20171217190746.2a61232c@bbrezillon>
 <20171217190056.GA1107@1wt.eu>
 <CAAEAJfArtxcWgcjHAb__3BQxWEBgWU8uWtHGYETc-m9eUs91nA@mail.gmail.com>
 <20171217211650.GA6815@1wt.eu> <20171217222611.59f9031b@bbrezillon>
 <20171217224617.1f9b8b84@xps13>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171217224617.1f9b8b84@xps13>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi guys,

On Sun, Dec 17, 2017 at 10:46:17PM +0100, Miquel RAYNAL wrote:
> > Actually, if things go well it will only be applied to stable
> > releases (I really hope we'll be able to switch to Miquel's driver in
> > 4.16). BTW, if you have some time, maybe you can test Miquel's [1]
> > branch and let us know if it still works properly.
> 
> As Boris said, we would really welcome a test of this branch, because
> you almost have the same setup as Sean in the thread "pxa3xx: wait time
> out when scanning for bb" and I am running out of explanation for his
> problem unless it is related to U-Boot. So if you could try booting
> with and without the on-flash-bbt property and report whether it fails
> or not it would be of great help!

Yes, I noticed your work mentionned in some of the threads I've read
during my troubleshooting session and considered giving it a try. I'll
probably do this next week-end.

Thanks!
Willy
