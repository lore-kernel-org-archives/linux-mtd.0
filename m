Received: from mga14.intel.com ([143.182.124.37])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uhfcq-0004zM-Dx
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 12:37:08 +0000
Message-ID: <1369831198.24286.24.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V2] drivers: mtd: nand: davinci: use
 devm_ioremap_resource()
From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
To: Laurent Navet <laurent.navet@gmail.com>
Date: Wed, 29 May 2013 15:39:58 +0300
In-Reply-To: <1367502970-28642-1-git-send-email-laurent.navet@gmail.com>
References: <1367502970-28642-1-git-send-email-laurent.navet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: mturquette@linaro.org, sshtylyov@ru.mvista.com,
 linux-kernel@vger.kernel.org, m-karicheri2@ti.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org
Reply-To: artem.bityutskiy@linux.intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-05-02 at 15:56 +0200, Laurent Navet wrote:
> Replace a call to deprecated devm_request_and_ioremap by devm_ioremap_resource.
> 
> Found with coccicheck and this semantic patch:
>  scripts/coccinelle/api/devm_request_and_ioremap.cocci.
> 
> Signed-off-by: Laurent Navet <laurent.navet@gmail.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
