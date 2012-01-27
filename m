Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqpPq-0006qw-Vn
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 17:16:47 +0000
Message-ID: <1327684589.12089.22.camel@joe2Laptop>
Subject: Re: [PATCH] mtd/nand: use string library
From: Joe Perches <joe@perches.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
Date: Fri, 27 Jan 2012 09:16:29 -0800
In-Reply-To: <1327674295-3700-2-git-send-email-akinobu.mita@gmail.com>
References: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
 <1327674295-3700-2-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Jiandong Zheng <jdzheng@broadcom.com>,
 akpm@linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-01-27 at 23:24 +0900, Akinobu Mita wrote:
> - Use memchr_inv to check if the data contains all 0xFF bytes.
>   It is faster than looping for each byte.

Stupid question:

Are there any mtd devices modified that are slower
at 64 bit accesses than repeated 8 bit accesses?
