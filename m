Subject: Re: [PATCH] block2mtd lockdep_init_map warning
From: Peter Zijlstra <peterz@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080106131343.GA3120@lazybastard.org>
References: <200801060717.m067HW6c030422@agora.fsl.cs.sunysb.edu>
	<20080106131343.GA3120@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Sun, 06 Jan 2008 14:39:22 +0100
Message-Id: <1199626763.31975.50.camel@lappy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Erez Zadok <ezk@cs.sunysb.edu>,
	dwmw2@infradead.org, mingo@redhat.com, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 2008-01-06 at 14:13 +0100, Jörn Engel wrote:

> Ingo, Peter, does either of you actually care about this problem?  In
> the last round when I debugged this problem there was a notable lack of
> reaction from either of you.

Yeah I do, I just know very little about the module stuff and haven't
come around to looking into it.

I agree that Erez's patch is quite horrible.
