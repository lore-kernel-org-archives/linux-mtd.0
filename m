Received: from mga03.intel.com ([143.182.124.21])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ucrvq-0000ax-7s
 for linux-mtd@lists.infradead.org; Thu, 16 May 2013 06:44:55 +0000
Message-ID: <1368686834.15764.167.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: optimize vid-header IO read checks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Thu, 16 May 2013 09:47:14 +0300
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E9C4E67@DBDE04.ent.ti.com>
References: <1367157069-18994-1-git-send-email-pekon@ti.com>
 <20980858CB6D3A4BAE95CA194937D5E73E9C4E67@DBDE04.ent.ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-05-16 at 06:38 +0000, Gupta, Pekon wrote:
> Hi, 
> 
> Requesting feedbacks/comments on this one too ?
> This should be independent of previous one..

How did you test this change? Did you test that we do not die in
scanning in case of bit-flips? How about ECC errors? Do we scrub
eraseblocks then?

-- 
Best Regards,
Artem Bityutskiy
