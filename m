From: David Woodhouse <dwmw2@infradead.org>
To: Miernik <miernik@ctnet.pl>
In-Reply-To: <slrnbqhkno.2rl.miernik@tarnica.ctnet.pl>
References: <slrnbqgacq.1t2.miernik@tarnica.ctnet.pl>
	 <slrnbqhkno.2rl.miernik@tarnica.ctnet.pl>
Content-Type: text/plain
Message-Id: <1068028888.6065.20.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 05 Nov 2003 10:41:28 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: in CVS: drivers/mtd/mtdchar.c:65: called object is not a
	function
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2003-11-05 at 11:37 +0100, Miernik wrote:
> On 2003-11-04, Miernik <miernik@ctnet.pl> wrote:
> > I tried patching 2.6.0-test9 kernel with CVS code fetched today at ~ 
> > 22:30 CET, and I ended with this:
> 
> And another problem: 

I haven't been tracking changes in Linus' 2.6 tree recently. Some stuff
changed in Linus' tree since I last looked. Take a diff between what's
actually in 2.6, and the corresponding $Id$ tag from CVS... those are
the changes which need to be merged into the CVS tree.

-- 
dwmw2
