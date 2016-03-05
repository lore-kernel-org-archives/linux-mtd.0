Received: from mail-pf0-x22c.google.com ([2607:f8b0:400e:c00::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac2wT-00044z-An
 for linux-mtd@lists.infradead.org; Sat, 05 Mar 2016 03:31:46 +0000
Received: by mail-pf0-x22c.google.com with SMTP id 63so45533781pfe.3
 for <linux-mtd@lists.infradead.org>; Fri, 04 Mar 2016 19:31:24 -0800 (PST)
Date: Fri, 4 Mar 2016 19:31:21 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-mtd@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>, zajec5@gmail.com
Subject: Re: [PATCH v2] mtd: spi-nor: add subsector flag to n25q128a
Message-ID: <20160305033121.GS55664@google.com>
References: <1456686558-1839-1-git-send-email-ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1456686558-1839-1-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Feb 28, 2016 at 04:09:18PM -0300, Ezequiel Garcia wrote:
> Micron n25q128axx support subsector (4K) erase so let's update the flags.
> Tested on n25q128a13.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

Applied to l2-mtd.git
