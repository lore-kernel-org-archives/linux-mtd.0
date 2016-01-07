Date: Thu, 7 Jan 2016 10:27:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 55/58] mtd: nand: add helpers to access ->priv
Message-ID: <20160107182709.GA79906@google.com>
References: <1449734442-18672-1-git-send-email-boris.brezillon@free-electrons.com>
 <1449734442-18672-56-git-send-email-boris.brezillon@free-electrons.com>
 <20151218221758.GQ10460@google.com>
 <20151219040124.7ffe4274@bbrezillon>
 <20160106231323.GM109450@google.com>
 <20160107155237.7271aa7e@bbrezillon>
 <20160107171700.GE109450@google.com>
 <20160107182140.02111dc1@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160107182140.02111dc1@bbrezillon>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Re-constructing CC list)

On Thu, Jan 07, 2016 at 06:21:40PM +0100, Boris Brezillon wrote:
> On Thu, 7 Jan 2016 09:17:00 -0800
> Brian Norris <computersforpeace@gmail.com> wrote:
> > So are these last few patches still applicable as-is, or should I await
> > a new submission?
> 
> It still applies correctly (I rebased it on l2-mtd/master).
> You may want to adapt the jz4780 driver to make use of these helpers.

OK. Fixed some small conflicts and pushed patches 55-58 to l2-mtd.git.
Thanks!

Brian
