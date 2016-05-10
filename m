Date: Tue, 10 May 2016 16:59:43 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 matthias.bgg@gmail.com, robh@kernel.org, linux-mtd@lists.infradead.org,
 xiaolei.li@mediatek.com, linux-mediatek@lists.infradead.org,
 erin.lo@mediatek.com, daniel.thompson@linaro.org, blogic@openwrt.org
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
Message-ID: <20160510165943.0322b374@bbrezillon>
In-Reply-To: <5731F40B.801@linaro.org>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon> <5731F40B.801@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 10 May 2016 10:45:31 -0400
Jorge Ramirez <jorge.ramirez-ortiz@linaro.org> wrote:

> On 05/10/2016 08:13 AM, Boris Brezillon wrote:
> >> +struct mtk_ecc {  
> >> >+	struct device *dev;
> >> >+	void __iomem *regs;
> >> >+	struct clk *clk;
> >> >+
> >> >+	struct completion done;
> >> >+	struct semaphore sem;  
> > You tried to explain me why you decided to go for a semaphore instead of
> > a mutex, but I don't remember. Could you explain it again?
> > If that's all about being interruptible, then you can use  
> 
> Just for flexibility, no other reason really.
> Neither the mutex nor the semaphore are actually needed in this driver.
> Not knowing how things are going to evolve in the upper layers of MTD I 
> didn't feel comfortable taking a lock in a function and unlocking the 
> mutex in a different function (which is the way this driver operates). 
> with that in mind I opted for a semaphore since it can always be 
> unlocked -if needed be- by a different thread.

But that has nothing to do with possible evolutions in the MTD layer.
The ECC engine resource can only have a single user at a time, hence
the mutex approach. Sorry, but I don't understand the "flexibility"
argument, but maybe I'm misunderstanding the different between a
semaphore and a mutex.


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
