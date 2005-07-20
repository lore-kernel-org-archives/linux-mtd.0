From: David Woodhouse <dwmw2@infradead.org>
To: Martin Egholm Nielsen <martin@egholm-nielsen.dk>
In-Reply-To: <dblne1$cgd$1@sea.gmane.org>
References: <dbl42b$hcn$1@sea.gmane.org>
	<1121867130.12903.15.camel@localhost.localdomain>
	<dblm4l$802$1@sea.gmane.org>
	<1121869156.12903.19.camel@localhost.localdomain>
	<dblne1$cgd$1@sea.gmane.org>
Content-Type: text/plain
Date: Wed, 20 Jul 2005 15:17:21 -0400
Message-Id: <1121887042.20077.1.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 garbage collector blocking for minutes after mount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-07-20 at 16:34 +0200, Martin Egholm Nielsen wrote:
> I'm not comfortable with profiling the kernel... It could be arranged, 
> but I rather see if the a recent CVS snapshot does it for me... ;-)

Profiling isn't hard or intrusive -- all you need to do is boot with
something like 'profile=1' on the kernel command line, then
read /proc/profile after the GC thread has finished doing its thing.

Then the readprofile tool will be able to tell you where the time was
spent.

-- 
dwmw2
