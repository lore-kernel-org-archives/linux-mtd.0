Received: from aserp1040.oracle.com ([141.146.126.69])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1975-0006Qk-P8
 for linux-mtd@lists.infradead.org; Mon, 22 Jul 2013 05:56:52 +0000
Date: Mon, 22 Jul 2013 08:56:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [patch] mtd: use correct error codes in debugfs_create()
Message-ID: <20130722055607.GF5636@mwanda>
References: <20130719054938.GC9729@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130719054938.GC9729@elgon.mountain>
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 kernel-janitors@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org, Akinobu Mita <akinobu.mita@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 19, 2013 at 08:49:38AM +0300, Dan Carpenter wrote:
> The test here is reversed.  It should be that if "dent" is a valid error
> code then we use it, otherwise if it is NULL then use -ENODEV.
> 

People have explained the debugfs_create API to me better and now
I'm not sure what to do here...  debugfs_create_dir() returns a
NULL on error and if debugfs is not enabled then it returns -ENODEV.
We test for if (!IS_ENABLED(CONFIG_DEBUG_FS)) earlier in the
function so it can only return NULL.

Probably I should just change the test to only test for NULL?

Otherwise I think my patch is correct.  The original code will
return success on error (NULL return) and that was not intended.

regards,
dan carpenter
