Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtX4D-0008Kp-LD
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 05:54:26 +0000
Message-ID: <1372658296.22014.9.camel@sauron.fi.intel.com>
Subject: Re: [PATCH [mtd-utils]] use xstrdup in a few more places
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 01 Jul 2013 08:58:16 +0300
In-Reply-To: <1368054115-32172-1-git-send-email-vapier@gentoo.org>
References: <1368054115-32172-1-git-send-email-vapier@gentoo.org>
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

On Wed, 2013-05-08 at 19:01 -0400, Mike Frysinger wrote:
> These call sites either assume there is no failure (they deref the
> pointer right away), or the exit themselves.  Use xstrdup() instead.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Pushed to mtd-utils.

-- 
Best Regards,
Artem Bityutskiy
