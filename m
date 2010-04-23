Subject: Re: Release of UBIL: ubi with log
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <k2q6b5362aa1004011206n1a0fb72due64fa6e3da749796@mail.gmail.com>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1267559131.1883.1.camel@localhost.localdomain>
	<t2q71cd59b01003310557v3c2b0775o6e90af812067e726@mail.gmail.com>
	<k2h6b5362aa1004010414j1ce57f33w27ee1debe9cb7a68@mail.gmail.com>
	<z2l71cd59b01004010459k91abccd8x9479276db49d3fd1@mail.gmail.com>
	<k2q6b5362aa1004011206n1a0fb72due64fa6e3da749796@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 23 Apr 2010 15:11:50 +0300
Message-ID: <1272024710.6917.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, rohitvdongre@gmail.com,
	linux-mtd@lists.infradead.org, Corentin Chary <corentin.chary@gmail.com>,
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

On Fri, 2010-04-02 at 00:36 +0530, Brijesh Singh wrote:
> On Thu, Apr 1, 2010 at 5:29 PM, Corentin Chary <corentin.chary@gmail.com> wrote:
> > On Thu, Apr 1, 2010 at 1:14 PM, Brijesh Singh <brijesh.s.singh@gmail.com> wrote:
> >> Hi,
> >>
> >> On Wed, Mar 31, 2010 at 6:27 PM, Corentin Chary
> >> <corentin.chary@gmail.com> wrote:
> >>> On Tue, Mar 2, 2010 at 8:45 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >>>> On Fri, 2010-02-26 at 18:28 +0530, Brijesh Singh wrote:
> >>>>> Hi,
> >>>>>  It gives me great pleasure in sharing UBIL: ubi with log.  We have
> >>>>> added logging functionality to ubi for reducing mount time.
> >>>>> UBIL uses the "same source base of UBI". The logging functionality can
> >>>>> be added or removed at compile time using "make menuconfig option".
> >>>>>
> >>>>> We have seen mount time reduction of 50% in 1GB NAND. We are expecting
> >>>>> even better results for larger flash memories.
> >>>>>
> >>>>> The source code of UBIL can be found in the following git tree:
> >>>>> http://git.infradead.org/users/brijesh/ubi-2.6.git
> >>>>>
> >>>>
> >>>> Sounds interesting! However, I'm out of office till end of March, and
> >>>> won't be able to look closely at this. But hopefully others will try it.
> >>>>
> >>>
> >>> Hi,
> >>> Didn't took the time  to read the code, I'll try to do so soon.
> >>> Could you tell us more about what you did and how it works ?
> >>> Is it similar to yaffs checkpoints ? When are the log written ?
> >> Not sure with yaffs checkpoints.
> >
> > Yaffs works by writting it's internal memory representation on the
> > nand while unmounting, so it seems to be different.
> 
> Right now, all the valid log is kept in buffer. This is written at
> umount/ when log is full.

So do you mean that in case of a power-cut, the log is lost and UBI will
have to do scanning?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
