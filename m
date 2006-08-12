Received: from mail-in-07.arcor-online.net ([151.189.21.47])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GByX2-0002ax-Nc
	for linux-mtd@lists.infradead.org; Sat, 12 Aug 2006 14:48:31 -0400
In-Reply-To: <44DE1357.5010703@ru.mvista.com>
References: <311553550076b8b45674.846930886.miltonm@bga.com>
	<44DE1357.5010703@ru.mvista.com>
Mime-Version: 1.0 (Apple Message framework v750)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <9FC79123-7439-4800-B5B5-752AB81A6E4F@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [RFC] Adding MTD to device tree
Date: Sat, 12 Aug 2006 20:48:20 +0200
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org, arnd@arndb.de,
	Milton Miller <miltonm@bga.com>, linuxppc-embedded@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>> I would prefer to call them something different in the device tree.
>>> The name 'mtd' is very specific to Linux, but the device tree
>>> is a more generic concept.
>
>     "Memory type devices" are specific to Linux? Doubt it. :-)

The name "mtd" is.

>     In fact, device type "flash" sounds too restrictive.

But we can't call it "memory", that one is taken already.

>> 'm with your suggestion for device_type and model, but not
>> compatable.   "physmap"?  What kind of device is that?  A
>
>     Directly mapped NOR flash or ROM I think.

So use "flash" and "rom" as device_type (and as name, heh).

>> appropriate.   Physmap is the name of another linux driver.
>
>     And the role of the "compatible" prop is exactly to help OS in  
> selecting
> the driver.

But it *cannot* do that by just naming the driver.  Not every OS
calls this driver "physmap", you know.


Segher
