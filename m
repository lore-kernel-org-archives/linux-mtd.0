Subject: Re: Release of UBIL: ubi with log
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <t2q71cd59b01003310557v3c2b0775o6e90af812067e726@mail.gmail.com>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1267559131.1883.1.camel@localhost.localdomain>
	<t2q71cd59b01003310557v3c2b0775o6e90af812067e726@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 31 Mar 2010 15:59:08 +0300
Message-ID: <1270040348.15073.8.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Brijesh Singh <brij.singh@samsung.com>,
	"brijesh.s.singh@gmail.com" <brijesh.s.singh@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"rohitvdongre@gmail.com" <rohitvdongre@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-03-31 at 14:57 +0200, ext Corentin Chary wrote:
> On Tue, Mar 2, 2010 at 8:45 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Fri, 2010-02-26 at 18:28 +0530, Brijesh Singh wrote:
> >> Hi,
> >>  It gives me great pleasure in sharing UBIL: ubi with log.  We have
> >> added logging functionality to ubi for reducing mount time.
> >> UBIL uses the "same source base of UBI". The logging functionality can
> >> be added or removed at compile time using "make menuconfig option".
> >>
> >> We have seen mount time reduction of 50% in 1GB NAND. We are expecting
> >> even better results for larger flash memories.
> >>
> >> The source code of UBIL can be found in the following git tree:
> >> http://git.infradead.org/users/brijesh/ubi-2.6.git
> >>
> >
> > Sounds interesting! However, I'm out of office till end of March, and
> > won't be able to look closely at this. But hopefully others will try it.
> >
> 
> Hi,
> Didn't took the time  to read the code, I'll try to do so soon.
> Could you tell us more about what you did and how it works ?
> Is it similar to yaffs checkpoints ? When are the log written ?
> What will happen if you try to mount something that used UBIL with a
> kernel without UBIL support ?
> Thanks,

Right. 

And Brijesh, just go ahead, split your stuff on patches, and submit them
to the MTD ML. Send your docs/URL to docs there as well.

Please, do not wait, just go ahead and start pushing it out.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
