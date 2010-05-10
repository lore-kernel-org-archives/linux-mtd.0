Subject: Re: Release of UBIL: ubi with log
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <AANLkTil153m-e1GuxAyV5fAldq-Mr4NEgGjr0KrPH8jv@mail.gmail.com>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1273474175.2209.61.camel@localhost>
	<h2h6b5362aa1005100203l7530e56eh1029efd4d1428b91@mail.gmail.com>
	<1273482467.2209.101.camel@localhost>
	<AANLkTil153m-e1GuxAyV5fAldq-Mr4NEgGjr0KrPH8jv@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 May 2010 14:09:36 +0300
Message-ID: <1273489776.2209.129.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, rohitvdongre@gmail.com,
	David Woodhouse <dwmw2@infradead.org>,
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

On Mon, 2010-05-10 at 15:51 +0530, Brijesh Singh wrote:
> On Mon, May 10, 2010 at 2:37 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Mon, 2010-05-10 at 14:33 +0530, Brijesh Singh wrote:
> >> >> insmod ubi mtd=1,ubinize.
> >> >>  (Second parameter "ubinize" is introduced to avoid accidental loss of data.)
> >> >> insmod ubifs
> >> >> mount ubifs
> >> >
> >> > Why this ubinize parameter exists? Why you cannot detect empty media
> >> > just like UBI?
> >>
> >> The idea was not to accidentally ubinize mtd partition.
> >> For example: the file system generally don't format empty partition on
> >> it's own. It is forced.
> >
> > File system just never formats the media, so of course they never
> > corrupt anything. Utilities mkfs.ext3 and the like do this instead.
> >
> > In fact, you can thing of UBI the same way - it does not format, there
> > is ubiformat tool for that. Then, there is one single exception - empty
> > flash. It is just very handy to be able to attach it without ubiformat.
> > You can consider this as an additional usefuls feature.
> >
> > And UBI does manage somehow to not corrupt anything. So the question was
> > - why UBIL cannot?
> 
> Personally, I wasn't sure if it is nice idea to find empty flash and
> then format it on it's own.
> 
> UBIL certainly can do this. I will add this, if you find it useful.

Well, many people found it very useful. I found it very useful for
development as well. And since it already exists and is used, it is nice
to make UBIL consistent with it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
