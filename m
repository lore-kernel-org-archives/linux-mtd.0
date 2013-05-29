Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uhfcu-0004zM-Uk
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 12:37:13 +0000
Message-ID: <1369831224.24286.25.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] drivers: mtd: devices: elm: use devm_ioremap_resource()
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Laurent Navet <laurent.navet@gmail.com>
Date: Wed, 29 May 2013 15:40:24 +0300
In-Reply-To: <1367507346-29382-1-git-send-email-laurent.navet@gmail.com>
References: <1367507346-29382-1-git-send-email-laurent.navet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-05-02 at 17:09 +0200, Laurent Navet wrote:
> Replace a call to deprecated devm_request_and_ioremap by devm_ioremap_resource.
> 
> Found with coccicheck and this semantic patch:
>  scripts/coccinelle/api/devm_request_and_ioremap.cocci.
> 
> Signed-off-by: Laurent Navet <laurent.navet@gmail.com>

We already have this changed in the l2-mtd.git tree:

commit f7393098da2aadf535787c74abd147aabaca491a
Author: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
Date:   Thu Apr 11 00:01:51 2013 +0300

    mtd: devices: convert to devm_ioremap_resource()
    
    Convert all uses of devm_request_and_ioremap() to the newly introduced
    devm_ioremap_resource() which provides more consistent error handling.
    
    Signed-off-by: Silviu-Mihai Popescu <silviupopescu1990@gmail.com>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>


-- 
Best Regards,
Artem Bityutskiy
