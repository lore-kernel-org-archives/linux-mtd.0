Subject: Re: Release of UBIL: ubi with log
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <h2h6b5362aa1005100203l7530e56eh1029efd4d1428b91@mail.gmail.com>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1273474175.2209.61.camel@localhost>
	<h2h6b5362aa1005100203l7530e56eh1029efd4d1428b91@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 May 2010 14:02:56 +0300
Message-ID: <1273489376.2209.127.camel@localhost>
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

On Mon, 2010-05-10 at 14:33 +0530, Brijesh Singh wrote:
> Hi,
> 
> On Mon, May 10, 2010 at 12:19 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Fri, 2010-02-26 at 18:28 +0530, Brijesh Singh wrote:
> >> Hi,
> >>  It gives me great pleasure in sharing UBIL: ubi with log.  We have
> >> added logging functionality to ubi for reducing mount time.
> >> UBIL uses the "same source base of UBI". The logging functionality can
> >> be added or removed at compile time using "make menuconfig option".
> >>
> >> We have seen mount time reduction of 50% in 1GB NAND. We are expecting
> >> even better results for larger flash memories.
> >
> > Was that SLC or MLC NAND?
> 
> It was SLC NAND.
> 
> >> The source code of UBIL can be found in the following git tree:
> >> http://git.infradead.org/users/brijesh/ubi-2.6.git
> >>
> >> We have tested ubil for samsung nand and onenand. The test results can
> >> be found in the following git tree:
> >> http://git.infradead.org/users/brijesh/ubil_results
> >
> > Did you run any stress tests for UBIL? Which?
> 
> We ran
> 1) fsstress on UBIFS without power failure
> 2) fsstress on UBIFS with power failure

Please, run also the integck test which you can find in the mtd-utils,
it is a very good test, and I think it is better than fsstress even.

If integck will work, this will mean UBIL is quite stable. Then let's
make sure it does not regress when we introduce changes.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
