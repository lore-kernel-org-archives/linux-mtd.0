Subject: RE: [ANNOUNCE] [PATCH] [MTD] Flex-OneNAND MTD Driver available.
From: David Woodhouse <dwmw2@infradead.org>
To: apgmoorthy <moorthy.apg@samsung.com>
In-Reply-To: <000b01c92215$ae62d4e0$3dd66c6b@sisodomain.com>
References: <19198934.52871221827459790.JavaMail.weblogic@epml16>
	<9c9fda240809220011w49c0875q804f836550ff3476@mail.gmail.com>
	<000001c91e42$1aa86c50$3dd66c6b@sisodomain.com>
	<9c9fda240809251731y48272a63j988e0001dc50d78@mail.gmail.com>
	<1222404711.5012.5.camel@sauron>
	<A09E9029F2344F78959A3E36179C468E@sisodomain.com>
	<1222417176.5012.17.camel@sauron>
	<000b01c92215$ae62d4e0$3dd66c6b@sisodomain.com>
Content-Type: text/plain
Date: Fri, 10 Oct 2008 07:34:53 +0100
Message-Id: <1223620493.28324.90.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'Kyungmin Park' <kmpark@infradead.org>,
	'lkml' <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-09-29 at 14:58 +0530, apgmoorthy wrote:
>    Please do comment on this patch. 
> 
>    "Not to expose whole OOB" suggestion by Kyungmin should be fine ,
> but looking for your suggestion.

I'm working on a revamp of the MTD core which would start exposing
attributes by sysfs, which would mean a lot of the ioctl problems go
away. I suspect it would be OK simply not to export the whole OOB, until
that's done.

I posted other code which can export things in sysfs already -- perhaps
we don't need to wait until the core rewrite is done?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
