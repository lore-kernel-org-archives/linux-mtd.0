Received: from ns.virtualhost.dk ([195.184.98.160] helo=virtualhost.dk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AJCkm-0003QH-3a
	for <linux-mtd@lists.infradead.org>; Mon, 10 Nov 2003 14:10:52 +0000
Date: Mon, 10 Nov 2003 15:09:27 +0100
From: Jens Axboe <axboe@suse.de>
To: Simon Haynes <simon@baydel.com>
Message-ID: <20031110140927.GE32637@suse.de>
References: <37CC93E8710D@baydel.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <37CC93E8710D@baydel.com>
Content-Type: text/plain; charset=us-ascii
cc: linux-mtd@lists.infradead.org
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

On Fri, Nov 07 2003, Simon Haynes wrote:
> 
> I have been writing a block driver for SSFDC compliant SMC cards. This stuff 
> allocates 16k blocks.  When I get requests the transfers are split into the 
> size I specifty in the blksize_size{MAJOR] array. It sems that most things 

Sounds like a bad way to do it. It's much better to prevent builds of
bigger requests than you can handle in one go. You don't mention what
kernel you are using, but both 2.4 and 2.6 can do this for you.

-- 
Jens Axboe
