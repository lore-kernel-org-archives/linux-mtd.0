Received: from lists.s-osg.org ([54.187.51.154])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZyNYh-0005wL-69
 for linux-mtd@lists.infradead.org; Mon, 16 Nov 2015 17:27:15 +0000
Subject: Re: spi: OF module autoloading is still broken
To: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>
References: <56104E88.3040807@gmail.com> <20151112185926.GC8456@google.com>
 <20151113194031.GI8456@google.com> <20151113221228.GT12392@sirena.org.uk>
 <20151113225113.GJ8456@google.com> <20151113231410.GV12392@sirena.org.uk>
 <20151113234857.GK8456@google.com> <20151116135342.GD31303@sirena.org.uk>
From: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, linux-mtd@lists.infradead.org,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Message-ID: <564A11D9.80109@osg.samsung.com>
Date: Mon, 16 Nov 2015 14:26:49 -0300
MIME-Version: 1.0
In-Reply-To: <20151116135342.GD31303@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Mark,

On 11/16/2015 10:53 AM, Mark Brown wrote:
> On Fri, Nov 13, 2015 at 03:48:57PM -0800, Brian Norris wrote:
> 
>> I suspect we'll have to fully support both spi_device_id tables (fully
>> supported already; if nothing else, to keep wildcard matching) and
>> of_match_tables (not fully supported for module loading), and in some
>> cases, the two will have to stay partially in sync.
> 
> What I don't really understand here is why we've decided to push all
> this stuff into the subsystems, it seems like if we're managing to do
> the matching based on the compatible we really ought to be able to have
> the core figure out the uevents for us too.  I need to go have a look at
> that...
> 

There is already a set of generic OF uevents that are reported by the core
but IIUC those are not used by udev. Please take a look to of_device_uevent()
in drivers/of/device.c and dev_uevent() that calls it in drivers/base/core.c.

Now, if the different struct bus_type .uevent handlers could be factored out
to have a common helper or be deleted completely and handled by the core
instead, that is a very good question.

To be honest I haven't looked at this possibility and I'm not that familiar
with the device model. But in any case I believe that modifying spi_uevent()
to behave as other subsystems and properly report an OF based modalias is
a step in the right direction. We can later identify the common logic and
move all the bus_type modalias reporting to the core as a follow up IMHO.

But of course if up to you to decide :)

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
