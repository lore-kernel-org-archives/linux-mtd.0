Date: Thu, 30 Apr 2015 16:31:07 +0200
From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH v4 04/10] mtd: pxa3xx_nand: rework flash detection and
 timing setup
Message-ID: <20150430143106.GE4433@kwain>
References: <1429118648-19416-1-git-send-email-antoine.tenart@free-electrons.com>
 <1429118648-19416-5-git-send-email-antoine.tenart@free-electrons.com>
 <552EB7F0.2090106@gmail.com> <552FB4DF.1030403@free-electrons.com>
 <552FBC0E.20004@gmail.com> <552FEA74.5020909@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <552FEA74.5020909@free-electrons.com>
Cc: zmxu@marvell.com, boris.brezillon@free-electrons.com,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Antoine Tenart <antoine.tenart@free-electrons.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 jszhang@marvell.com, computersforpeace@gmail.com, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 16, 2015 at 01:59:32PM -0300, Ezequiel Garcia wrote:
> On 04/16/2015 10:41 AM, Sebastian Hesselbarth wrote:
> 
> > All we need is a function to convert sdr_timings to sane driver
> > timings. And we really need to split this patch into tiny pieces
> > otherwise it is not reviewable - or at least I need a full overview
> > about the driver first.
> > 
> 
> I think that's a bit of a different issue. This patch seems to be doing
> two things: it removes the in-driver flash detection *and* reworks
> timing setup.
> 
> How about we split this in two or even three patches? Along these lines:
> 1) introduce timing helpers, 2) rework timing setup, 3) remove in-driver
> flash detection. Not sure how feasible it is.

That's quite difficult, as you cannot have 1) without having the changes
made in 2). Flash detection and timing reworks are linked and I'm not
sure we can have this split into 2 or 3 patches without having a state
where the driver does not work.

Antoine

-- 
Antoine Ténart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
