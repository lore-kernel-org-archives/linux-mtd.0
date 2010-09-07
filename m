Date: Mon, 6 Sep 2010 21:34:31 -0700
From: Arjan van de Ven <arjan@infradead.org>
To: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>
Subject: Re: [RFC][PATCH 1/1]nand/denali: Add runtime pm support for denali
	controller driver
Message-ID: <20100906213431.3758f14f@infradead.org>
In-Reply-To: <5D8008F58939784290FAB48F54975198278A3799CB@shsmsx502.ccr.corp.intel.com>
References: <20100906080838.GA6528@intel.com>
	<20100906125327.036fbcaf@infradead.org>
	<5D8008F58939784290FAB48F54975198278A3798F3@shsmsx502.ccr.corp.intel.com>
	<20100906203453.453b1da2@infradead.org>
	<5D8008F58939784290FAB48F54975198278A3799CB@shsmsx502.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>, "Gao,
	Yunpeng" <yunpeng.gao@intel.com>, "Yuan, Hang" <hang.yuan@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 7 Sep 2010 12:03:40 +0800
"Dong, Chuanxiao" <chuanxiao.dong@intel.com> wrote:

> 
> > if you take the refcount every time you get a command, and drop a
> > count each time a command completes.... this is all not too
> > important.. it'll just work
> If I take the refcount every time I got a command and drop a count
> each time a command completes, the controller device will be resumed
> every time when it gets a command and suspended after it finishes a
> command. For a 4k page NAND, processing just 1M data will cause
> device resume/suspend 256 times....This will influence the
> performance...

so this is where you can tell the runtime PM system to use a timer, and
only turn on power saving after some idle time.

you don't need to do that yourself... the runtime PM system has this
capability built in!


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
