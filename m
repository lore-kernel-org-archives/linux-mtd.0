Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTvGd-0000Yd-MU
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 16:06:12 +0000
Message-ID: <1410883494.28850.70.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/3] UBI: block: Add support for the UBI_VOLUME_UPDATED
 notification
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 16 Sep 2014 19:04:54 +0300
In-Reply-To: <CAAEAJfDL_+dahDrYB=3JAVASQDfzPLbVuA+AVRbqnHig3-KtPA@mail.gmail.com>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <1410173657.10764.148.camel@sauron.fi.intel.com>
 <20140908111832.GA1676@arch.hh.imgtec.org>
 <1410180460.10764.163.camel@sauron.fi.intel.com>
 <20140908182750.GA9222@arch.hh.imgtec.org>
 <1410880524.28850.49.camel@sauron.fi.intel.com>
 <CAAEAJfDnXe2Yb5OeVb07vsofrdDCV-h0umpYF-mukG+FyNP4LQ@mail.gmail.com>
 <1410882828.28850.69.camel@sauron.fi.intel.com>
 <CAAEAJfDL_+dahDrYB=3JAVASQDfzPLbVuA+AVRbqnHig3-KtPA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Guido =?ISO-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-09-16 at 16:56 +0100, Ezequiel Garcia wrote:
> Cc: stable@vger.kernel.org # v3.15+
> 
> I'll backport them when -stable guys ask to.

OK, just did it, and pushed out, thanks!

-- 
Best Regards,
Artem Bityutskiy
