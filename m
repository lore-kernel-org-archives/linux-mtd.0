Received: from mail-qg0-x229.google.com ([2607:f8b0:400d:c04::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b09R1-000395-77
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 15:18:56 +0000
Received: by mail-qg0-x229.google.com with SMTP id w36so8124000qge.3
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 08:18:32 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon> <5731F40B.801@linaro.org>
 <20160510165943.0322b374@bbrezillon>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mediatek@lists.infradead.org, erin.lo@mediatek.com,
 daniel.thompson@linaro.org, blogic@openwrt.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5731FBC5.4090009@linaro.org>
Date: Tue, 10 May 2016 11:18:29 -0400
MIME-Version: 1.0
In-Reply-To: <20160510165943.0322b374@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/10/2016 10:59 AM, Boris Brezillon wrote:
> On Tue, 10 May 2016 10:45:31 -0400
> Jorge Ramirez<jorge.ramirez-ortiz@linaro.org>  wrote:
>
>> >On 05/10/2016 08:13 AM, Boris Brezillon wrote:
>>>> > >>+struct mtk_ecc {
>>>>> > >> >+	struct device *dev;
>>>>> > >> >+	void __iomem *regs;
>>>>> > >> >+	struct clk *clk;
>>>>> > >> >+
>>>>> > >> >+	struct completion done;
>>>>> > >> >+	struct semaphore sem;
>>> > >You tried to explain me why you decided to go for a semaphore instead of
>>> > >a mutex, but I don't remember. Could you explain it again?
>>> > >If that's all about being interruptible, then you can use
>> >
>> >Just for flexibility, no other reason really.
>> >Neither the mutex nor the semaphore are actually needed in this driver.
>> >Not knowing how things are going to evolve in the upper layers of MTD I
>> >didn't feel comfortable taking a lock in a function and unlocking the
>> >mutex in a different function (which is the way this driver operates).
>> >with that in mind I opted for a semaphore since it can always be
>> >unlocked -if needed be- by a different thread.
> But that has nothing to do with possible evolutions in the MTD layer.
> The ECC engine resource can only have a single user at a time, hence
> the mutex approach. Sorry, but I don't understand the "flexibility"
> argument, but maybe I'm misunderstanding the different between a
> semaphore and a mutex.

mutex can only be unlocked by the same thread that locks it. if for some 
reason (hypotetically speaking) the MTD wishes to unlock ecc engines and 
implement an abort operation before running operations complete this 
could guarantee that the ecc engine is left in an unlocked state. the 
risk of having a mutex in this driver is that the lock/unlock happen in 
_different_ function calls (which is always scary) with DMAs having to 
complete in between so if the running thread was canceled before the 
mutex protecting the resource was unlocked we would never be able to 
unlock it....with a semaphore we could (any thread could unlock the 
resource).
