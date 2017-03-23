Received: from mail.sigma-star.at ([95.130.255.111])
 by merlin.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cqz7q-0006IT-FD
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 09:33:47 +0000
Subject: Re: mtd-utils: various fixes, apply OpenEmbedded patches
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
References: <20170322102257.7605-1-david.oberhollenzer@sigma-star.at>
 <20170322161323.22b7489c@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, Yuanjie.Huang@windriver.com,
 raj.khem@gmail.com, Richard Weinberger <richard@nod.at>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <1b4bbd29-c93e-3e75-b01d-7b7b2ac93385@sigma-star.at>
Date: Thu, 23 Mar 2017 10:33:21 +0100
MIME-Version: 1.0
In-Reply-To: <20170322161323.22b7489c@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Thanks for the pointers. I took a look at the buildroot patches.

The first one (ubinize return status) has been applied shortly after
the mtd-utils 1.5.2 release.

The second patch (about execinfo.h) sparked a discussion with Richard
prefering a libmissing implementation instead. A libmissing has been
added in August last year that provides a dummy implementation of the
backtrace family of functions for libraries like musl that don't
provided them.

The third patch, that removes the bits/stdio_lim.h inclusion was also
applied already between the 1.5.2 and 2.0.0-rc1 releases.


Thanks,

David
