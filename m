Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtX8i-0008No-Cg
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 05:59:04 +0000
Message-ID: <1372658274.22014.8.camel@sauron.fi.intel.com>
Subject: Re: [PATCH [mtd-utils] 1/3] move _GNU_SOURCE to the main makefile
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 01 Jul 2013 08:57:54 +0300
In-Reply-To: <1368030446-343-1-git-send-email-vapier@gentoo.org>
References: <1368030446-343-1-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-05-08 at 12:27 -0400, Mike Frysinger wrote:
> A bunch of utils are relying on _GNU_SOURCE already.  The new prompt code
> uses getline() which is now part of POSIX, but in older versions of glibc,
> it was behind _GNU_SOURCE as it was a GNU extension.
> 
> This change doesn't actually tie us to glibc.  Only code that uses GNU
> extensions does that.  It just kills warning when using older versions of
> glibc.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed all 3 to mtd-utils.

-- 
Best Regards,
Artem Bityutskiy
