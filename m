From: David Woodhouse <dwmw2@infradead.org>
To: Jens Axboe <axboe@suse.de>
In-Reply-To: <20031110140927.GE32637@suse.de>
References: <37CC93E8710D@baydel.com>  <20031110140927.GE32637@suse.de>
Content-Type: text/plain
Message-Id: <1068473878.5743.6.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 10 Nov 2003 14:17:59 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
cc: Simon Haynes <simon@baydel.com>
cc: linux-kernel@vger.kernel.org
Subject: Re: SFFDC and blksize_size
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-11-10 at 15:09 +0100, Jens Axboe wrote:
> On Fri, Nov 07 2003, Simon Haynes wrote:
> > 
> > I have been writing a block driver for SSFDC compliant SMC cards. This stuff 
> > allocates 16k blocks.  When I get requests the transfers are split into the 
> > size I specifty in the blksize_size{MAJOR] array. It sems that most things 
> 
> Sounds like a bad way to do it. It's much better to prevent builds of
> bigger requests than you can handle in one go. You don't mention what
> kernel you are using, but both 2.4 and 2.6 can do this for you.

The problem is the other way round -- he wants request merging, and he's
achieving this by setting the block size higher.... and observing a
crash when he sets his block size higher than PAGE_SIZE.


-- 
dwmw2
