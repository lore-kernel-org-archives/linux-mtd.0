Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqhxT-0000sM-Pn
 for linux-mtd@lists.infradead.org; Wed, 22 Mar 2017 15:13:57 +0000
Date: Wed, 22 Mar 2017 16:13:23 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, Yuanjie.Huang@windriver.com,
 raj.khem@gmail.com
Subject: Re: mtd-utils: various fixes, apply OpenEmbedded patches
Message-ID: <20170322161323.22b7489c@free-electrons.com>
In-Reply-To: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Wed, 22 Mar 2017 11:22:52 +0100, David Oberhollenzer wrote:

> The series mainly includes some of the patches applied localy by
> the OpenEmbedded project that haven't been submitted upstream so
> far.

In Buildroot, we're still using the old 1.5.2 mtd-utils version, but we
have three patches on it, you might be interested in having a look to
see if any of those patches are still relevant or not:

  https://git.buildroot.org/buildroot/tree/package/mtd/

We'll try to move to the 2.x version soon.

Thanks for all this work on mtd-utils, very nice to see the project
more active!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
