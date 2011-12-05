Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
 helo=DB3EHSOBE003.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RXeUj-0003zO-4o
 for linux-mtd@lists.infradead.org; Mon, 05 Dec 2011 19:46:33 +0000
Message-ID: <4EDD1F90.300@freescale.com>
Date: Mon, 5 Dec 2011 13:46:24 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
 <1322973098-2528-3-git-send-email-shuo.liu@freescale.com>
 <1323067628.2316.29.camel@koala>
In-Reply-To: <1323067628.2316.29.camel@koala>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, shuo.liu@freescale.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/05/2011 12:47 AM, Artem Bityutskiy wrote:
> On Sun, 2011-12-04 at 12:31 +0800, shuo.liu@freescale.com wrote:
>> +		/*
>> +		 * Freescale FCM controller has a 2K size limitation of buffer
>> +		 * RAM, so elbc_fcm_ctrl->buffer have to be used if writesize
>> +		 * of chip is greater than 2048.
>> +		 * We malloc a large enough buffer (maximum page size is 16K).
>> +		 */
>> +		elbc_fcm_ctrl->buffer = kmalloc(1024 * 16 + 1024, GFP_KERNEL);
>> +		if (!elbc_fcm_ctrl->buffer) {
>> +			dev_err(dev, "failed to allocate memory\n");
>> +			mutex_unlock(&fsl_elbc_nand_mutex);
>> +			ret = -ENOMEM;
>> +			goto err;
>> +		}
> 
> Sorry for returning to this again and agian - I do not have time to dig
> suggest you the right solutions on the one hand, you do not provide me a
> good answer on the other hand (or I forgot?).
> 
> 16KiB pages do not even exist I believe.

Googling turns up some hints of it, but nothing concrete such as a
datasheet.  We can assume 8K max for now and adjust it later, as the
need becomes clear.

> And you kmalloc 33KiB or RAM

17KiB, or 9KiB if we forget about 16K-page NAND.

> although in most cases you need only 5KiB. I think this is wrong -
> what is the very strong reason of wasting RAM you have?
> 
> Why you cannot allocate exactly the required amount of RAM after
> 'nand_scan_ident()' finishes and you know the page size?

Because this is a controller resource, shared by multiple NAND chips
that may be different page sizes (even if not, it's adding another point
of synchronization required between initialization of different chips).
 I don't think it's worth the gymnastics to save a few KiB.

-Scott
