Received: from mail-ie0-f178.google.com ([209.85.223.178])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WKxFt-0006EM-VH
 for linux-mtd@lists.infradead.org; Tue, 04 Mar 2014 21:52:06 +0000
Received: by mail-ie0-f178.google.com with SMTP id lx4so167731iec.37
 for <linux-mtd@lists.infradead.org>; Tue, 04 Mar 2014 13:51:44 -0800 (PST)
Message-ID: <5316498A.8080200@mds.com>
Date: Tue, 04 Mar 2014 15:45:46 -0600
From: Chuck Peplinski <chuck@mds.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] Check flag status register for Micron n25q512a
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
 <201403021542.09196.marex@denx.de> <5314B336.7090306@mds.com>
 <201403040129.12504.marex@denx.de>
In-Reply-To: <201403040129.12504.marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: chuck@mds.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/3/2014 6:29 PM, Marek Vasut wrote:
>> FSR can apparently toggle without SR.
> Is that documented anywhere ? How can that be ?
I'm looking at the data sheet for the part, n25q_512mb_1ce3v_65nm.pdf, 
from the Micron web site at 
http://www.micron.com/products/nor-flash/serial-nor-flash#fullPart&236=10.
The comment that led us in this direction is on page 62:

"ERASE Operations
When the operation is in progress, the program or erase controller bit 
of the flag status
register is set to 0. The flag status register must be polled for the 
operation status. When
the operation completes, that bit is cleared to 1.
Note that the flag status register must be polled even if operation 
times out."

> Hmmmm , I have a feeling that if you actually added wait_till_ready() 
> call at the end of _erase() and _write(), you would get the same 
> effect. This would in turn mean you are instead missing 
> wait_till_ready() somewhere else. Can you try using wait_till_ready() 
> at the end of _erase() and _write() please ? 

That would be the standard code, right?  That's where we started and it 
did not work.

At some point I'll try some more tests.  I'm not blocked on this now, so 
it's not totally critical.
One thing I notice:  The web site notes that this part stacks two 256M 
dies.  Maybe that's why it is non-standard?
Sure would be nice to hear from someone at Micron...
