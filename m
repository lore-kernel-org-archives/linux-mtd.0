Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6Jd5-000835-RI
 for linux-mtd@lists.infradead.org; Thu, 23 Jan 2014 12:43:32 +0000
Date: Thu, 23 Jan 2014 09:43:24 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 1/1 RESEND] mtd: block2mtd: char mtd major and erasesize
 parameter check + mutex_destroy
Message-ID: <20140123124323.GA20713@localhost>
References: <20140122162843.15c3fb1e1318346339fcbff4@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140122162843.15c3fb1e1318346339fcbff4@skynet.be>
Cc: joern@lazybastard.org, akpm@linux-foundation.org, rdunlap@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabian,

On Wed, Jan 22, 2014 at 04:28:43PM +0800, Fabian Frederick wrote:
> -Deny use of a char mtd device to map as block device.
> -mutex_init when mtd structure is available.
> -fixme applied : check device size is a multiple of erasesize.
> -mutex_destroy on each device in block2mtd_exit and add_device failure.
> 

Hm... that sound like a lot of work for a single patch :-)

Care to chop it and submit a one-thing-per-patch series?

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
