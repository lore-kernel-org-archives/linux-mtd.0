Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W8Ict-0003ct-JQ
 for linux-mtd@lists.infradead.org; Wed, 29 Jan 2014 00:03:32 +0000
Received: by mail-ie0-f181.google.com with SMTP id to1so1374875ieb.12
 for <linux-mtd@lists.infradead.org>; Tue, 28 Jan 2014 16:03:10 -0800 (PST)
Date: Tue, 28 Jan 2014 16:03:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH v2] mtd: block2mtd: Add mutex_destroy
Message-ID: <20140129000307.GC8919@ld-irv-0074>
References: <20140125104508.c562066b2276aad0cb3934ee@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140125104508.c562066b2276aad0cb3934ee@skynet.be>
Cc: rdunlap@infradead.org, joern@lazybastard.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ezequiel.garcia@free-electrons.com,
 akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jan 25, 2014 at 10:45:08AM +0800, Fabian Frederick wrote:
> mutex_destroy added on each device in block2mtd_exit and add_device failure
> 
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Pushed to l2-mtd.git/next. Thanks!

Brian
