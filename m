Received: from zmc.proxad.net ([212.27.53.206])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RkjyR-0008K7-EB
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 22:15:20 +0000
Message-ID: <4F0CB86C.10006@freebox.fr>
Date: Tue, 10 Jan 2012 23:15:08 +0100
From: Florian Fainelli <ffainelli@freebox.fr>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] cfi: AMD/Fujitsu compatibles: add panic write support
References: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
 <4F0C124F.7040807@freebox.fr> <1326233055.2335.13.camel@koala>
In-Reply-To: <1326233055.2335.13.camel@koala>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 "Ira W. Snyder" <iws@ovro.caltech.edu>, linux-mtd@lists.infradead.org,
 Florian Fainelli <ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

Le 10/01/2012 23:04, Artem Bityutskiy a écrit :
> On Tue, 2012-01-10 at 11:26 +0100, Florian Fainelli wrote:
>> Hello,
>>
>> On 01/06/12 20:29, Ira W. Snyder wrote:
>>> This allows the mtdoops driver to work on flash chips using the
>>> AMD/Fujitsu compatible command set.
>>>
>>> As the code comments note, the locks used throughout the normal code
>>> paths in the driver are ignored, so that the chance of writing out the
>>> kernel's last messages are maximized.
>>
>> This patch made me looking at the panic code, but should not this be
>> made conditionnal to the enabling/disabling of the MTD oops driver?
>
> What do you mean? Conceptually, the driver is a low-level entity and it
> provides I/O mechanisms, and it should have no idea who will use them -
> be that is mtdoops or anything else.

I see you point. This adds a substantial amount of code, which is only 
used when the mtdoops driver is actually used. This is why I replied 
with a patch enabling/disabling the panic_write() code.

Now we can introduce a non visible Kconfig option which is selected by 
MTDOOPS and later other drivers.

My concern is about not adding more code which is barely used. I don't 
question the mtdoops driver, it definitively is useful.
--
Florian
