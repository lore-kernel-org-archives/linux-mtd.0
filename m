Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
 helo=DB3EHSOBE006.bigfish.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rci6V-0002Rz-D1
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2011 18:38:28 +0000
Message-ID: <4EEF849B.7030804@freescale.com>
Date: Mon, 19 Dec 2011 12:38:19 -0600
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 3/3] mtd/nand : workaround for Freescale FCM to support
 large-page Nand chip
References: <1322973098-2528-1-git-send-email-shuo.liu@freescale.com>
 <1322973098-2528-3-git-send-email-shuo.liu@freescale.com>
 <4EDEAEB9.6020703@freescale.com> <1323724195.2297.11.camel@koala>
 <4EE66EFE.1050608@freescale.com> <1323724784.2297.20.camel@koala>
 <4EE6725C.3050706@freescale.com>
 <1324132520.4240.26.camel@sauron.fi.intel.com>
In-Reply-To: <1324132520.4240.26.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Artem.Bityutskiy@nokia.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, shuo.liu@freescale.com,
 linux-mtd@lists.infradead.org, akpm@linux-foundation.org, leoli@freescale.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/17/2011 08:35 AM, Artem Bityutskiy wrote:
> On Mon, 2011-12-12 at 15:30 -0600, Scott Wood wrote:
>> On 12/12/2011 03:19 PM, Artem Bityutskiy wrote:
>>> On Mon, 2011-12-12 at 15:15 -0600, Scott Wood wrote:
>>>> NAND chips come from the factory with bad blocks marked at a certain
>>>> offset into each page.  This offset is normally in the OOB area, but
>>>> since we change the layout from "4k data, 128 byte oob" to "2k data, 64
>>>> byte oob, 2k data, 64 byte oob" the marker is no longer in the oob.  On
>>>> first use we need to migrate the markers so that they are still in the oob.
>>>
>>> Ah, I see, thanks. Are you planning to implement in-kernel migration or
>>> use a user-space tool?
>>
>> That's the kind of answer I was hoping to get from Shuo. :-)
>>
>> Most likely is a firmware-based tool, but I'd like there to be some way
>> for the tool to mark that this has happened, so that the Linux driver
>> can refuse to do non-raw accesses to a chip that isn't marked as having
>> been migrated (or at least yell loudly in the log).
>>
>> Speaking of raw accesses, these are currently broken in the eLBC
>> driver... we need some way for the generic layer to tell us what kind of
>> access it is before the transaction starts, not once it wants to read
>> out the buffer (unless we add more hacks to delay the start of a read
>> transaction until first buffer access...).  We'd be better off with a
>> high-level "read page/write page" function that does the whole thing
>> (not just buffer access, but command issuance as well).
> 
> It looks like currently you can re-define chip->read_page, so I guess
> you should rework MTD and make chip->write_page re-definable?

Unless something has changed very recently, there is no chip->read_page
or chip->write_page.  There is chip->ecc.read_page and
chip->ecc.write_page, but they are too low-level.  What we'd need to
replace is a portion of nand_do_read_ops()/nand_do_write_ops().

-Scott
