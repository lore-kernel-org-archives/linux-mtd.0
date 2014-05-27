Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpGhM-0004xr-21
 for linux-mtd@lists.infradead.org; Tue, 27 May 2014 12:41:45 +0000
Message-ID: <1401194435.1304.143.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] nandtest: Introduce multiple reads & check iterations
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 27 May 2014 15:40:35 +0300
In-Reply-To: <1399388869-5815-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1399388869-5815-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1399388869-5815-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Pekon Gupta <pekon@ti.com>,
 Guido =?ISO-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-05-06 at 12:07 -0300, Ezequiel Garcia wrote:
> The current nandtest performs a simple test which consists of:
> 
>   1. erase block
>   2. write data
>   3. read and verify
> 
> In order to improve the nandtest strength, this commit adds a new parameter
> to increase the number of "read and verify" iterations. In other words,
> the test now consists of:
> 
>   1. erase block
>   2. write data
>   3. read and verify (N times)

I think this is reasonable, but there were some skeptic replies, so
probably another approver's voice would not hurt. Let me give you my

Acked-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

and drop Brian a hint that if he things the same way, he could just push
this driver, or approve and then I can push.

-- 
Best Regards,
Artem Bityutskiy
