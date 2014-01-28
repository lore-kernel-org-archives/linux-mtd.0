Received: from mail-pb0-x234.google.com ([2607:f8b0:400e:c01::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W81PN-0002M4-Rx
 for linux-mtd@lists.infradead.org; Tue, 28 Jan 2014 05:40:26 +0000
Received: by mail-pb0-f52.google.com with SMTP id jt11so6830298pbb.25
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2014 21:40:03 -0800 (PST)
Date: Mon, 27 Jan 2014 21:32:46 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch v2] mtd: sm_ftl: heap corruption in
 sm_create_sysfs_attributes()
Message-ID: <20140128053246.GF3162@norris-Latitude-E6410>
References: <52A06B00.7070309@bfs.de> <20131205145349.GA13302@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131205145349.GA13302@elgon.mountain>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>,
 linux-mtd@lists.infradead.org, walter harms <wharms@bfs.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 05, 2013 at 05:53:50PM +0300, Dan Carpenter wrote:
> We always put a NUL terminator one space past the end of the "vendor"
> buffer.  Walter Harms also pointed out that this should just use
> kstrndup().
> 
> Fixes: 7d17c02a01a1 ('mtd: Add new SmartMedia/xD FTL')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch looks good.

> ---
> v2:  Use kstrndup().
>      Don't subtract 1 from the strnlen() limiter for the NUL.  I think
>      it's ok to go over?

I don't think you're "going over" anything. You're just (correctly)
allocating the buffer as (at most) one byte larger than (SM_SMALL_PAGE -
SM_CIS_VENDOR_OFFSET), which is perfect if you're copying up to
(SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET) bytes of character data.

Pushed to l2-mtd.git/next, queued for 3.15. Thanks.

Brian
