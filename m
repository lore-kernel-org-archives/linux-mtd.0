Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YRZK1-0006MU-Gt
 for linux-mtd@lists.infradead.org; Sat, 28 Feb 2015 04:48:14 +0000
Message-ID: <54F14851.5040209@hisilicon.com>
Date: Sat, 28 Feb 2015 12:47:13 +0800
From: Zhou Wang <wangzhou1@hisilicon.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [patch] mtd: hisilicon: && vs & typo
References: <20150211102509.GB18515@mwanda>
 <20150215090711.GA8351@norris-Latitude-E6410>
In-Reply-To: <20150215090711.GA8351@norris-Latitude-E6410>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2015/2/15 17:07, Brian Norris wrote:
> On Wed, Feb 11, 2015 at 01:25:09PM +0300, Dan Carpenter wrote:
>> The intent was to mask away some bits here, not to test true or false.
>>
>> Fix: 54f531f6e332 ('mtd: hisilicon: add a new NAND controller driver for hisilicon hip04 Soc')
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Pushed to l2-mtd.git. Thanks.

Hi Brian,

Thanks for the pushing.

Zhou Wang

> 
> Brian
> 
> 
