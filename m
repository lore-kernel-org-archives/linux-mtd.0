Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WhDMc-0006v0-Bi
 for linux-mtd@lists.infradead.org; Mon, 05 May 2014 07:31:03 +0000
Message-ID: <1399275032.15290.13.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/3] nandtest: Remove redundant check
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 05 May 2014 10:30:32 +0300
In-Reply-To: <1398690859-11494-2-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1398690859-11494-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1398690859-11494-2-git-send-email-ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
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

On Mon, 2014-04-28 at 10:14 -0300, Ezequiel Garcia wrote:
> This commit removes a redundant 'len' check, which is already performed
> just after the pread call.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

This looks straight-forward, let me apply it right away, thanks!

-- 
Best Regards,
Artem Bityutskiy
