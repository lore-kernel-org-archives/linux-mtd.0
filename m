Date: Thu, 5 Feb 2015 17:59:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 00/13] mtd: st_spi_fsm: Align with ST's internal
 development
Message-ID: <20150206015917.GA18140@ld-irv-0074>
References: <1418644760-18773-1-git-send-email-lee.jones@linaro.org>
 <20150113051452.GR9759@ld-irv-0074> <20150121124930.GA22024@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150121124930.GA22024@x1>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 kernel@stlinux.com, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 21, 2015 at 12:49:30PM +0000, Lee Jones wrote:
> On Mon, 12 Jan 2015, Brian Norris wrote:
> > Typically "simpler" and "reducing the cost of having lots of extra DT
> > properties" aren't good enough reasons for immediately breaking an
> > existing DT binding. We usually expect to support both for some period
> > of time.
> 
> Only once a binding has became ABI.  As there are no users of this
> driver yet (this will change after this sync'ing patch-set has been
> applied), so we can safely consider this binding to be in-progress and
> as such, not yet ABI, thus we can do this ol' switch-aroo without the
> usual 6 month deprecation period.

OK, fine with me.

Brian
