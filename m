Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XuFZ8-0007wi-74
 for linux-mtd@lists.infradead.org; Fri, 28 Nov 2014 07:02:07 +0000
Message-ID: <54781DD5.5030801@denx.de>
Date: Fri, 28 Nov 2014 08:01:41 +0100
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Huang Shijie <shijie8@gmail.com>
Subject: Re: [PATCH] mtd: gpmi: Remove "We support only one NAND chip" from
 bindings doc
References: <1417097929-17832-1-git-send-email-sr@denx.de>
 <20141128014832.GA3113@localhost.localdomain>
In-Reply-To: <20141128014832.GA3113@localhost.localdomain>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 28.11.2014 02:48, Huang Shijie wrote:
> On Thu, Nov 27, 2014 at 03:18:49PM +0100, Stefan Roese wrote:
>> This sentence "We support only one NAND chip now" is not true any more.
>> Multiple chips are supported. So lets remove this sentence to not
>
> The gpmi can only supports one chip. Of course, there are maybe two dies
> in this single chip.

Now I'm a bit confused. The i.MX6 supports 4 chips select signals. And 
isn't "two dies in this single chip" not practically the same as 
connecting 2 (or more) chips (same device) to multiple chip selects of 
the SoC? Where is the difference here?

Thanks,
Stefan
