Subject: Re: [PATCH 1/2] clps711x/ceiva: port to use physmap flash
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <BANLkTimG86aN5hUBy=GgpMAxhiQSPbetPg@mail.gmail.com>
References: <1307015648-17505-1-git-send-email-dbaryshkov@gmail.com>
	<1307075905.4405.130.camel@localhost>
	<BANLkTi=TQfMec9Kuq4-P9Rokp44g67Tx6A@mail.gmail.com>
	<1307077842.4405.133.camel@localhost>
	<BANLkTimG86aN5hUBy=GgpMAxhiQSPbetPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 03 Jun 2011 08:21:28 +0300
Message-ID: <1307078488.4405.139.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-06-03 at 09:17 +0400, Dmitry Eremin-Solenikov wrote:
> On 6/3/11, Artem Bityutskiy <Artem.Bityutskiy@nokia.com> wrote:
> > On Fri, 2011-06-03 at 09:02 +0400, Dmitry Eremin-Solenikov wrote:
> >> On 6/3/11, Artem Bityutskiy <Artem.Bityutskiy@nokia.com> wrote:
> >> > On Thu, 2011-06-02 at 15:54 +0400, Dmitry Eremin-Solenikov wrote:
> >> >> Port ceiva machine to use physmap flash instead of custom mapping
> >> >> driver
> >> >> (which even can't compile cleanly with current kernels). All info
> >> >> is gathered from drivers/mtd/maps/ceiva.c. Compile tested only.
> >> >>
> >> >> Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> >> >> ---
> >> >>  arch/arm/mach-clps711x/ceiva.c |   60
> >> >> ++++++++++++++++++++++++++++++++++++++++
> >> >>  1 files changed, 60 insertions(+), 0 deletions(-)
> >> >
> >> > Is ceiva used and not dead? May be we could kill it completely?
> >>
> >> No functional changes to board file since start of git history. Also
> >> I don't know how useful can be contemporary Linux on 4 MiB of RAM
> >
> > I also noticed that no one is interested in this board for long time. So
> > I suggest to remove ceiva support altogether via some arm tree.
> 
> Anyway the patch removing mtd support can be pushed via mtd tree
> (there is really no point on mtd/maps/ceiva.c), and removing ceiva
> depends on Russell's decision.

There is as well little point in changing ceiva code if we can just kill
it instead. So let's first try to ask Russell if he is fine with killing
ceiva or not. Could you please do this in a separate thread with an
appropriate subject.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
