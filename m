Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OxxAS-0002XQ-Hn
	for linux-mtd@lists.infradead.org; Tue, 21 Sep 2010 07:21:33 +0000
Received: by bwz19 with SMTP id 19so7077656bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Sep 2010 00:21:31 -0700 (PDT)
Subject: RE: [PATCH] usibfs: fix kconfig dependency warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093ED5F718@Cloud.RL.local>
References: <70E876B0EA86DD4BAF101844BC814DFE093ED5F718@Cloud.RL.local>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 21 Sep 2010 10:19:41 +0300
Message-ID: <1285053581.7512.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Randy Dunlap <randy.dunlap@oracle.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-21 at 05:23 +0100, Jon Povey wrote:
> linux-mtd-bounces@lists.infradead.org wrote:
> > Pushed to the ubifs-2.6.git tree.
> 
> If the typo "usibfs" in the subject was in the patch you might want to
> fix it if there's still time.

I fixed it up. I never apply patches without looking at the subject
line, and I always use git am -i, which means edit the commit message
before applying.

So it is ok, thanks for heads up though!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
