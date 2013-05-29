Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UhffZ-00055i-2w
 for linux-mtd@lists.infradead.org; Wed, 29 May 2013 12:39:57 +0000
Message-ID: <1369831369.24286.26.camel@sauron.fi.intel.com>
Subject: Re: [PATCH RESEND] mtd: denali: fix error handling for
 devm_ioremap_nocache()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Xi Wang <xi.wang@gmail.com>
Date: Wed, 29 May 2013 15:42:49 +0300
In-Reply-To: <1367555839-12920-1-git-send-email-xi.wang@gmail.com>
References: <1367555839-12920-1-git-send-email-xi.wang@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2013-05-03 at 00:37 -0400, Xi Wang wrote:
> It is incorrect to use `!res' for error handling since `res' must be
> non-null.  Use the return value `ptr' instead.
> 
> Signed-off-by: Xi Wang <xi.wang@gmail.com>
> ---

This is already fixed upstream:

commit 6c67050ab108bcce2576fa1d7a0557eb0376520a
Author: Sachin Kamat <sachin.kamat@linaro.org>
Date:   Mon Mar 18 15:11:11 2013 +0530

    mtd: denali_dt: Fix incorrect error check
    
    The return value of devm_ioremap_nocache should be checked here
instead
    of res.
    
    Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
    Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
    Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>

-- 
Best Regards,
Artem Bityutskiy
