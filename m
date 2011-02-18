Date: Fri, 18 Feb 2011 09:34:47 -0800
From: Tony Lindgren <tony@atomide.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 4/4] mtd: OneNAND: OMAP2: increase multiblock erase
	verify timeout
Message-ID: <20110218173447.GT20795@atomide.com>
References: <1297068421-14430-1-git-send-email-adrian.hunter@nokia.com>
	<1297068421-14430-5-git-send-email-adrian.hunter@nokia.com>
	<20110217234603.GI20795@atomide.com>
	<1298003498.2735.4.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1298003498.2735.4.camel@localhost>
Cc: Kyungmin Park <kyungmin.park@samsung.com>,
	linux-omap Mailing List <linux-omap@vger.kernel.org>,
	linux-mtd Mailing List <linux-mtd@lists.infradead.org>,
	linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

* Artem Bityutskiy <dedekind1@gmail.com> [110217 20:31]:
> Hi,
> 
> On Thu, 2011-02-17 at 15:46 -0800, Tony Lindgren wrote:
> > * Adrian Hunter <adrian.hunter@nokia.com> [110207 00:45]:
> > > From: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> > > 
> > > The current multiblock erase verify read timeout 100us is the maximum
> > > for none-error case. If errors happen during multibock erase then
> > > the specification recommends to run multiblock erase verify command
> > > with maximum timeout 10ms (see specs. for KFM4G16Q2A and KFN8G16Q2A).
> > > 
> > > For the most common non-error case we wait 100us in udelay polling
> > > loop. In case of timeout the interrupt mode is used to wait for the
> > > command end.
> > > 
> > > Signed-off-by: Roman Tereshonkov <roman.tereshonkov@nokia.com>
> > 
> > I'll queue this series. Anybody from MTD list care to ack this patch?
> 
> Acked-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Thanks!

Tony
