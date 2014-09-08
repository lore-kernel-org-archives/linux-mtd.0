Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQviv-0001TF-QY
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 09:59:02 +0000
Message-ID: <1410170318.10764.119.camel@sauron.fi.intel.com>
Subject: Re: Ubi patch proposition for 3.10.y
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: jean-philippe francois <jp.francois@cynove.com>
Date: Mon, 08 Sep 2014 12:58:38 +0300
In-Reply-To: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
References: <CAGGh5h0KjexqaoEt8vvVXAEqCr625675XG4d71KdEuhrQVPr3w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: richard@nod.at,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 stable@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-08-29 at 14:26 +0200, jean-philippe francois wrote:
> Hi,
> 
> I think commit 4b3e0a25... [1] (UBI: Call scan_all() with correct
> offset in error case) should be added to 3.10.y stable branch.

This is the "fastmap" fix, and fastmap is called experimental. We do not
have enough confidence it is production ready. Specifically, I'd like to
hear someone doing extensive power-cut testing with this feature. The
power-cut tolerance is one of the "selling features" of UBI/UBIFS, after
all.

Therefore I never added fastmap fixes to the stable queue.

But if someone is willing to put all the fastmap fixes together, add the
"stable tags" with the right kernel version "markings", and test for few
older kernels, then I will recommend them to be included to the stable.
Although I am not sure the stable maintainers would like accept them.

But I do not recommend adding this single patch to the stable queue.

But better, if people started paying more attention to "fastmap", we may
agree that from now on we are careful about the sending the fixes to the
stable queue.

Thanks!

-- 
Best Regards,
Artem Bityutskiy
