Date: Wed, 17 Sep 2014 22:49:40 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCHv5] mtd: nand: atmel_nand: retrieve NFC clock
Message-ID: <20140918054940.GC7362@norris-Latitude-E6410>
References: <1410564239-8411-1-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1410564239-8411-1-git-send-email-alexandre.belloni@free-electrons.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Nicolas Ferre <nicolas.ferre@atmel.com>, linux-kernel@vger.kernel.org,
 Josh Wu <josh.wu@atmel.com>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Sep 13, 2014 at 01:23:59AM +0200, Alexandre Belloni wrote:
> From: Boris BREZILLON <boris.brezillon@free-electrons.com>
> 
> Retrieve the NFC clock to make sure it is enabled. Make that optional to ensure
> compatibility with previous device trees but document it as mandatory so newer
> device trees will include it.
> 
> Signed-off-by: Boris BREZILLON <boris.brezillon@free-electrons.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> Acked-by: Josh Wu <josh.wu@atmel.com>
> ---
> Changes in v5:
>  - Added a proper commit log

Pushed to l2-mtd.git. Thanks!

Brian
