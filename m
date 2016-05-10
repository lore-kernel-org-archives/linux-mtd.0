Received: from mail-qg0-x232.google.com ([2607:f8b0:400d:c04::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b08v4-00049K-F2
 for linux-mtd@lists.infradead.org; Tue, 10 May 2016 14:45:57 +0000
Received: by mail-qg0-x232.google.com with SMTP id 90so7525639qgz.1
 for <linux-mtd@lists.infradead.org>; Tue, 10 May 2016 07:45:34 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] mtd: mediatek: driver for MTK Smart Device Gen1
 NAND
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1461946642-1842-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1461946642-1842-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <20160510141335.442d3d7b@bbrezillon>
Cc: computersforpeace@gmail.com, dwmw2@infradead.org, matthias.bgg@gmail.com,
 robh@kernel.org, linux-mtd@lists.infradead.org, xiaolei.li@mediatek.com,
 linux-mediatek@lists.infradead.org, erin.lo@mediatek.com,
 daniel.thompson@linaro.org, blogic@openwrt.org
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5731F40B.801@linaro.org>
Date: Tue, 10 May 2016 10:45:31 -0400
MIME-Version: 1.0
In-Reply-To: <20160510141335.442d3d7b@bbrezillon>
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

On 05/10/2016 08:13 AM, Boris Brezillon wrote:
>> +struct mtk_ecc {
>> >+	struct device *dev;
>> >+	void __iomem *regs;
>> >+	struct clk *clk;
>> >+
>> >+	struct completion done;
>> >+	struct semaphore sem;
> You tried to explain me why you decided to go for a semaphore instead of
> a mutex, but I don't remember. Could you explain it again?
> If that's all about being interruptible, then you can use

Just for flexibility, no other reason really.
Neither the mutex nor the semaphore are actually needed in this driver.
Not knowing how things are going to evolve in the upper layers of MTD I 
didn't feel comfortable taking a lock in a function and unlocking the 
mutex in a different function (which is the way this driver operates). 
with that in mind I opted for a semaphore since it can always be 
unlocked -if needed be- by a different thread.
