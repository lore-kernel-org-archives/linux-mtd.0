Received: from e36.co.us.ibm.com ([32.97.110.154])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1FvK9C-0006qz-0R
	for linux-mtd@lists.infradead.org; Tue, 27 Jun 2006 16:27:06 -0400
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e36.co.us.ibm.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5RKQmsi016567
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2006 16:26:48 -0400
Received: from d03av02.boulder.ibm.com (d03av02.boulder.ibm.com [9.17.195.168])
	by d03relay04.boulder.ibm.com (8.13.6/NCO/VER7.0) with ESMTP id
	k5RKR3k6171266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2006 14:27:03 -0600
Received: from d03av02.boulder.ibm.com (loopback [127.0.0.1])
	by d03av02.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	k5RKQkOh032605
	for <linux-mtd@lists.infradead.org>; Tue, 27 Jun 2006 14:26:47 -0600
Subject: Re: [PATCH]Fixes of performance and stability issues in CFI driver.
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1151438714.6394.232.camel@pmac.infradead.org>
References: <Pine.LNX.4.56.0606271335001.21751@pentafluge.infradead.org>
	<Pine.LNX.4.64.0606271222570.28771@localhost.localdomain>
	<1151433983.6394.230.camel@pmac.infradead.org>
	<Pine.LNX.4.64.0606271454150.28771@localhost.localdomain>
	<1151438714.6394.232.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Tue, 27 Jun 2006 15:26:43 -0500
Message-Id: <1151440003.22623.10.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Nicolas Pitre <nico@cam.org>,
	Alexey Korolev <akorolev@pentafluge.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-06-27 at 21:05 +0100, David Woodhouse wrote:
> On Tue, 2006-06-27 at 15:16 -0400, Nicolas Pitre wrote:
> > > I'm not sure I follow that argument. cfi_udelay() is used in basically
> > > the same circumstances by other chip drivers, so why not do it there
> > > instead of open-coding it?
> > 
> > The code simply ends up being simpler. 
> 
> OK, fine. If someone could send me a tested version with an appropriate
> commit comment and Signed-off-by:, or better still stick it in a git
> tree for me to pull from, I'll add it to my tree.

That should read "...or better still send the patch _and_ stick it in a
git tree..."

;)

josh
