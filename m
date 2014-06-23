Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wz2UY-0002oE-IT
 for linux-mtd@lists.infradead.org; Mon, 23 Jun 2014 11:32:55 +0000
Message-ID: <1403523115.7903.64.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] Add security.selinux XATTR support for the UBIFS. Also
 fix couple of bugs in UBIFS extended attribute length calculation.
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Subodh Nijsure <subodh.nijsure@gmail.com>
Date: Mon, 23 Jun 2014 14:31:55 +0300
In-Reply-To: <1333892851-10758-1-git-send-email-snijsure@grid-net.com>
References: <1333892851-10758-1-git-send-email-snijsure@grid-net.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Subodh Nijsure <snijsure@grid-net.com>, linux-mtd@lists.infradead.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2012-04-08 at 06:47 -0700, Subodh Nijsure wrote:
> TESTING: Tested on  MX28 based platforms using Micron MT29F2G08ABAEAH4 NAND
>          With these change we are able to label UBIFS filesystem with security.selinux
>          and run system with selinux enabled.
>          Also ran integck test on UBI filesystem.
> 
> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>

Hi,

it looks like more people are interested in SELinux support. What
happened to this stuff?  You did not seem to take it all the way to
upstream for some reasons.

-- 
Best Regards,
Artem Bityutskiy
