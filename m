Subject: Re: physmap and "request_module: runaway loop modprobe net-pf-1"
From: David Woodhouse <dwmw2@infradead.org>
To: David Miller <davem@davemloft.net>
In-Reply-To: <20080423.231055.193687131.davem@davemloft.net>
References: <1208867831.9212.582.camel@pmac.infradead.org>
	<97a0a9ac0804232101i71bfff22o723e2aaa80b09c2f@mail.gmail.com>
	<1209016143.9212.910.camel@pmac.infradead.org>
	<20080423.231055.193687131.davem@davemloft.net>
Content-Type: text/plain
Date: Thu, 24 Apr 2008 08:16:39 +0100
Message-Id: <1209021399.9212.927.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: netdev@vger.kernel.org, akpm@linux-foundation.org,
	gordonfarquharson@gmail.com, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 23:10 -0700, David Miller wrote:
> From: David Woodhouse <dwmw2@infradead.org>
> Date: Thu, 24 Apr 2008 06:49:03 +0100
> 
> > On Wed, 2008-04-23 at 22:01 -0600, Gordon Farquharson wrote:
> > > I guess the question is which patch (if either) is more appealing.
> > 
> > I definitely think we should initialise AF_UNIX sockets earlier. At
> > least request_module() _can_ work then, if you want it to and you set up
> > userspace accordingly.
> 
> I'm not so sure, for example, what if AF_UNIX is built modular?

I believe that as long as you include it in your initrd, it'll get
loaded on demand and all will be well. The first request_module() call
will trigger a request_module(af_unix), which will succeed.

-- 
dwmw2
