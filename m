Subject: Re: [PATCH 0/4] MTD: OneNAND: Fix samsung SoCs various bugs
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: ext Kyungmin Park <kmpark@infradead.org>
In-Reply-To: <AANLkTi=d3YZEMBMKU9-RVjXQEfF3eWGxesVJ5japEwjX@mail.gmail.com>
References: <20100927072431.GA32076@july> <1285655139.2437.7.camel@localhost>
	<AANLkTi=d3YZEMBMKU9-RVjXQEfF3eWGxesVJ5japEwjX@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 28 Sep 2010 13:03:29 +0300
Message-ID: <1285668209.2437.70.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-09-28 at 12:02 +0200, ext Kyungmin Park wrote:
> On Tue, Sep 28, 2010 at 3:25 PM, Artem Bityutskiy
> <Artem.Bityutskiy@nokia.com> wrote:
> > On Mon, 2010-09-27 at 16:24 +0900, Kyungmin Park wrote:
> >> The following changes since commit 32163f4b2cef28a5aab8b226ffecfc6379a53786:
> >>   Al Viro (1):
> >>         alpha: fix usp value in multithreaded coredumps
> >>
> >> Kyungmin Park (4):
> >>       MTD: OneNAND: Remove unused cmd_map at s5pc110
> >>       MTD: OneNAND: S5PC100: Only S5PC110 use the command map method
> >>       MTD: OneNAND: S5PC110: Fix wrong DMA hanlding when HIGHMEM
> >>       MTD: OneNAND: S5PC110: Add timeout to prevent the endless loop
> >>
> >>  drivers/mtd/onenand/samsung.c |   45 +++++++++++++++++++++++++++-------------
> >>  1 files changed, 30 insertions(+), 15 deletions(-)
> >
> > Some patches are already in my l2-mtd-2.6.git tree, could you please
> > send the series against the l2 tree so that I could apply it?
> 
> I tried to clone you tree. but it's too slow since internal network issue.
> I will send it tomorrow.

Always use --reference linux-2.6 when cloning linux trees and it'll be
faster.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
