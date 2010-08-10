From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'David Brownell'" <david-b@pacbell.net>,
	"'Mike Frysinger'" <vapier.adi@gmail.com>
References: <016d01cb386e$22e28660$68a79320$@raj@ti.com>
	<893387.4342.qm@web180301.mail.gq1.yahoo.com>
In-Reply-To: <893387.4342.qm@web180301.mail.gq1.yahoo.com>
Subject: RE: [PATCH] m25p80: add support for a callback to platform code on
	successful device probe
Date: Tue, 10 Aug 2010 18:37:24 +0530
Message-ID: <019301cb388c$f9a777f0$ecf667d0$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 10, 2010 at 18:37:47, David Brownell wrote:
> 
> > On Tue, Aug 10, 2010 at 12:47:05, Mike Frysinger wrote:
> 
> > it is necessary
> > > that you do these things from kernel space instead of
> > standard
> > > userspace.
> 
> Hard to get userspace to do this stuff if
> you're doing a network boot, and thus need
> to have the MAC address working early.. it's
> easy if the kernel can get the MAC address,
> else not possible to boot.  Right?
> 

You are absolutely right.

- Sudhakar
