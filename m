Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xlvhv-0001ZM-EA
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 08:12:47 +0000
Received: by mail-pd0-f175.google.com with SMTP id y13so285646pdi.34
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 00:12:26 -0800 (PST)
Date: Wed, 5 Nov 2014 00:12:22 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Aaron Sierra <asierra@xes-inc.com>
Subject: Re: [PATCH 1/2] mtd: nand: Base BCH ECC bytes on required strength
Message-ID: <20141105081222.GC22361@norris-Latitude-E6410>
References: <930617930.480758.1409098152001.JavaMail.zimbra@xes-inc.com>
 <677105509.189583.1409161536993.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <677105509.189583.1409161536993.JavaMail.zimbra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Jordan Friendshuh <jfriendshuh@xes-inc.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 27, 2014 at 12:45:36PM -0500, Aaron Sierra wrote:
> From: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> 
> NAND devices with page sizes over 4 KiB require more than 4-bits of ECC
> coverage. This patch calculates the value of ecc_bytes based on a still
> assumed 512-byte step size (13-bits) and the ecc_strength.
> 
> Example:
> Micron M73A devices (8 KiB page) require 8-bit ECC per 512-byte
> 
> Signed-off-by: Jordan Friendshuh <jfriendshuh@xes-inc.com>
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>

Applied to l2-mtd.git.

Brian
