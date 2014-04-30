Date: Wed, 30 Apr 2014 15:33:39 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH v2] mtd: davinci-nand: disable subpage write for
 keystone-nand
Message-ID: <20140430223339.GF2497@norris-Latitude-E6410>
References: <1395346112-13350-1-git-send-email-ivan.khoronzhuk@ti.com>
 <532B4C36.8060405@ti.com> <5343F0D6.2010804@ti.com>
 <20140416070833.GA5512@norris-Latitude-E6410>
 <534E51BF.9050508@ti.com> <535E5AF5.2020203@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <535E5AF5.2020203@ti.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, grygorii.strashko@ti.com,
 linux@arm.linux.org.uk, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, m-karicheri2@ti.com, rob@landley.net,
 galak@codeaurora.org, Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>,
 dwmw2@infradead.org, Warner Losh <imp@bsdimp.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 28, 2014 at 09:43:17AM -0400, Santosh Shilimkar wrote:
> On Wednesday 16 April 2014 05:47 AM, Ivan Khoronzhuk wrote:
> > On 04/16/2014 10:08 AM, Brian Norris wrote:
> >> On Tue, Apr 08, 2014 at 03:51:34PM +0300, Ivan Khoronzhuk wrote:
> >>> Could you pick up subj patch?
> >> Pushed to l2-mtd.git. Is it critical this goes in for 3.15? It's
> >> currently queued for -next (3.16).
> >>
> 
> [..]
> 
> > 
> > This is a critical fix and it should be for 3.15.
> Ping. 3.15-rc3 is already out and I still see this fix merged
> yet.

OK, cherry-picked to linux-mtd.git with the intention of sending to
Linus soon.

Regards,
Brian
