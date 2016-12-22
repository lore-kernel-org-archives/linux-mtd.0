Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cJzgX-0004XX-Rp
 for linux-mtd@lists.infradead.org; Thu, 22 Dec 2016 09:29:14 +0000
Subject: Re: [PATCH] mtd-utils: Add configure switches to disable jffsX or
 ubifs tools
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
References: <20161221155412.29706-1-david.oberhollenzer@sigma-star.at>
 <20161222101909.3a386438@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, richard@sigma-star.at
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <73715338-b8d1-9503-6b20-83a55812f906@sigma-star.at>
Date: Thu, 22 Dec 2016 10:27:36 +0100
MIME-Version: 1.0
In-Reply-To: <20161222101909.3a386438@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/22/2016 10:19 AM, Thomas Petazzoni wrote:
> If the only two correct values are "yes" or "no", then you should use
> AC_ARG_ENABLE() and not AC_ARG_WITH().
That is indeed an interesting consideration. The guides seem to be a bit
blury on the destinction on enable/disable vs with/without.

I was under the impression that one should use enable/disable for features
of a program and with/without for external dependencies or entire programs,
i.e. "features of a project".

> Indeed, using AM_CONDITIONAL() is useful to assign automake variable.
> Here, BUILD_JFFS and BUILD_UBIFS are apparently only used within the
> configure.ac, so using AM_CONDITIONAL() is useless.
Not quite. They are used in the automake file to skip building mkfs.ubifs
and the jffsx utils.


Thanks,

David
