Subject: Re: [PATCH] block2mtd lockdep_init_map warning
From: Peter Zijlstra <peterz@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>
In-Reply-To: <20080107102025.GA5338@lazybastard.org>
References: <200801061911.m06JBldW020012@agora.fsl.cs.sunysb.edu>
	<1199700326.7143.10.camel@twins>
	<20080107102025.GA5338@lazybastard.org>
Content-Type: text/plain; charset=utf-8
Date: Mon, 07 Jan 2008 11:34:25 +0100
Message-Id: <1199702065.7143.13.camel@twins>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kernel@vger.kernel.org,
	mingo@redhat.com, linux-mtd@lists.infradead.org,
	Erez Zadok <ezk@cs.sunysb.edu>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2008-01-07 at 11:20 +0100, Jörn Engel wrote:
> On Mon, 7 January 2008 11:05:26 +0100, Peter Zijlstra wrote:
> > 
> > Would something like this work for people?
> 
> Looks a lot better than what I thought of.  However, does the #ifdef
> within is_module_address() make sense when afaict lockdep is the only
> caller of that function?  Looks as if the whole function should be made
> conditional or none of it.

Ah, I hadn't bothered to check if there were more users. /me does a (not
so quick) git grep and finds lockdep is indeed the only caller. Sure, we
can move the whole function into the ifdef.
