Received: from qw-out-1920.google.com ([74.125.92.147])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LvDII-0007Zj-MG
	for linux-mtd@lists.infradead.org; Sat, 18 Apr 2009 16:21:36 +0000
Received: by qw-out-1920.google.com with SMTP id 4so239618qwk.24
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Apr 2009 09:21:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1239953416.3390.243.camel@localhost.localdomain>
References: <a95a62fe0904082252h41afa872j2ef6fb9d1d76dc27@mail.gmail.com>
	<1239953416.3390.243.camel@localhost.localdomain>
Date: Sat, 18 Apr 2009 09:21:28 -0700
Message-ID: <a95a62fe0904180921w3ac0128et7a543742f5734d64@mail.gmail.com>
Subject: Re: [PATCH 2/4] [MTD] Add MEMERASE64 ioctl for >4GiB devices
From: Kevin Cernekee <kpc.mtd@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 17, 2009 at 12:30 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> Kevin, are you going to re-send patches 2-4, taking into account
> Arnd's and Andrew's suggestions?

For Arnd's suggestion, I posted a followup patch here:

http://lists.infradead.org/pipermail/linux-mtd/2009-April/025269.html

Andrew brought up two issues: [MTD] in the subject line, and
linewrapping.  I am assuming that he fixed these himself since he
pulled all five patches (originals + followup) into the -mm tree.

Should I fix and repost the set anyway?

Thanks.
