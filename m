Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uan4j-0006CM-Ev
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 13:09:30 +0000
Message-ID: <1368191514.26780.164.camel@sauron.fi.intel.com>
Subject: Re: [patch] mtd: denali_dt: harmless case of testing the wrong
 variable
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 10 May 2013 16:11:54 +0300
In-Reply-To: <20130401062151.GA5197@longonot.mountain>
References: <20130401062151.GA5197@longonot.mountain>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org,
 Rob Herring <rob.herring@calxeda.com>,
 Grant Likely <grant.likely@secretlab.ca>, Bill Pemberton <wfp5p@virginia.edu>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Dinh Nguyen <dinguyen@altera.com>
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-04-01 at 09:21 +0300, Dan Carpenter wrote:
> There is a warning message that can't be printed because we test the
> wrong variable.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, but there is already a similar fix for this in upstream:

commit 6c67050ab108bcce2576fa1d7a0557eb0376520a
Author: Sachin Kamat <sachin.kamat@linaro.org>

-- 
Best Regards,
Artem Bityutskiy
