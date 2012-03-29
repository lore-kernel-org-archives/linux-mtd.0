Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SDICu-0000Wk-C9
 for linux-mtd@lists.infradead.org; Thu, 29 Mar 2012 16:28:17 +0000
Message-ID: <4F748D9E.5060307@parrot.com>
Date: Thu, 29 Mar 2012 18:28:14 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Matteo Mattei <matteo.mattei@gmail.com>
Subject: Re: UBI/UBIFS issue: corrupt empty space => switched to read-only mode
References: <CAHea38St440q-T+FawSic=brdv-dHb7H7yXh0Unq028Op75zuQ@mail.gmail.com>
 <1332239983.11468.14.camel@sauron.fi.intel.com>
 <loom.20120329T173823-262@post.gmane.org>
In-Reply-To: <loom.20120329T173823-262@post.gmane.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Matteo Mattei a écrit :
> Artem Bityutskiy <dedekind1 <at> gmail.com> writes:
> 
>> On Fri, 2012-03-16 at 17:14 +0100, Matteo Mattei wrote:
>>> Hi guys,
>>>
>>> I am working hard on UBIFS to make it works on 2.6.32 and OMAP3530.
>>>
>>> I already posted some requests to TI forum but I have no answers up to now:
>>> http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx#627875
>> Well, this error was reported several times. AFAIR, there are 2 possible
>> causes for this.
>>
>> 1. Your driver does not protect the empty space. Normally the driver
>> corrects bit-flips using ECC, but some systems do not do this for empty
>> space, i.e., for the flash regions which have been erased but have never
>> been written. UBIFS expects to see all 0xFFs there, and if it doesn't,
>> it reports about corrupt empty space.
>>
>> You can fix this by fixing the driver, at least this is what people seem
>> to do. If this is impossible to fix, you can teach UBIFS to tolerate
>> bit-flips in the empty space.
>>
>> 2. More difficult issue which no one still dares to start fixing is the
>> unstable bits issue. I do not have time to work on this, so I offer
>> everyone assistance, but no on so far started working on this, AFAIK.
>> Here is the description of the issue:
>>
>> http://www.linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits
>>
>> HTH.
>>
> 
> Hi Aartem,
> I have some updates (also a BCH fix) as reported here:
> http://e2e.ti.com/support/embedded/linux/f/354/t/171839.aspx
I recomend you to use the bch patch that ivan post some time ago on the ML for OMAP.

The TI one has some issues (and is slow).


Matthieu
