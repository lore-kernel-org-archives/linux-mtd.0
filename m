Received: from nbd.name ([46.4.11.11])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5vfQ-0006u5-3j
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 08:59:16 +0000
Message-ID: <4F59C630.3060501@openwrt.org>
Date: Fri, 09 Mar 2012 09:58:24 +0100
From: John Crispin <blogic@openwrt.org>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] MTD: MIPS: lantiq: reintroduce support for cmdline
 partitions
References: <1330016389-20973-1-git-send-email-blogic@openwrt.org>
 <1331282453.22872.29.camel@sauron.fi.intel.com>
In-Reply-To: <1331282453.22872.29.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org,
 Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/03/12 09:40, Artem Bityutskiy wrote:
> On Thu, 2012-02-23 at 17:59 +0100, John Crispin wrote:
>> From: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
>>
>> Since commit ca97dec2ab5c87e9fbdf7e882e1820004a3966fa the
>> command line parsing of MTD partitions does not work anymore.
>>
>> Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
>> Signed-off-by: John Crispin <blogic@openwrt.org>
>

Hi Artem,

i have tested this patch using arch/mips/configs/xway_defconfig and
gcc4.6+linaro

i will try a build with your config in a moment

which git-tree are you building on top of ?

thanks,
John
