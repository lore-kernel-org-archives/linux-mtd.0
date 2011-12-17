Received: from ocean.emcraft.com ([213.221.7.182])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rc2ht-0001Yc-PH
 for linux-mtd@lists.infradead.org; Sat, 17 Dec 2011 22:26:18 +0000
Message-ID: <4EED171F.2080904@emcraft.com>
Date: Sun, 18 Dec 2011 02:26:39 +0400
From: Ilya Yanok <yanok@emcraft.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] plat_ram: call mtd_device_register only if partition
 data exists
References: <1323733076-6301-1-git-send-email-yanok@emcraft.com>
 <1324135902.4240.46.camel@sauron.fi.intel.com>
In-Reply-To: <1324135902.4240.46.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On 17.12.2011 19:31, Artem Bityutskiy wrote:
>> mtd_device_parse_register() registers the device as a whole if no
>> partition data is passed so there is no reason to call
>> mtd_device_register() after that.
>>
>> Signed-off-by: Ilya Yanok <yanok@emcraft.com>
> 
> This seems to be a bug-fix, right? What happens without this patch?

Right.

> We end up with 2 MTD equivalent MTD devices?

Yes (only second one shown in /proc/mtd) and a warning for kobject:

kobject (cf2c10e0): tried to init an initialized object, something is
seriously wrong.

Regards, Ilya.
