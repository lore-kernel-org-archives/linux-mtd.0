Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vyk1g-0005E1-Fs
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2014 15:17:36 +0000
Message-ID: <1388675815.25123.91.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 4/25] UBI: fix error return code
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Thu, 02 Jan 2014 17:16:55 +0200
In-Reply-To: <1388357260-4843-5-git-send-email-Julia.Lawall@lip6.fr>
References: <1388357260-4843-1-git-send-email-Julia.Lawall@lip6.fr>
 <1388357260-4843-5-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-12-29 at 23:47 +0100, Julia Lawall wrote:
> From: Julia Lawall <Julia.Lawall@lip6.fr>
> 
> Set the return variable to an error code as done elsewhere in the function.
> 
> A simplified version of the semantic match that finds this problem is as
> follows: (http://coccinelle.lip6.fr/)

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
