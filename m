Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYaj3-00019M-Vh
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 12:06:18 +0000
Date: Tue, 22 Oct 2013 14:05:42 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?ISO-8859-15?Q?Steffen_K=FChn?= <sk@ammonit.com>
Subject: Re: problem with ecc errors and ubifs
In-Reply-To: <52666705.8040000@ammonit.com>
Message-ID: <alpine.DEB.2.00.1310221356080.28562@lnxricardw.se.axis.com>
References: <52666705.8040000@ammonit.com>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 22 Oct 2013, Steffen Kühn wrote:

> We use MT29F4G08ABBDAHC flash devices from Micron. This type of flash
> supports on-die-ecc (8 bit) and needs at least 4-bit-ecc. When we have
> started to use this flash no support for on die ecc was available in the
> kernel (kernel 3.2). The on die ecc support is - because of that - self
> written.
> ...
>
> I have seen that such error reporting leads usually to a page "scrub". I
> do not really understand what there happens.

I don't know the details, but scrubbing means that the data in the page 
is to be rewritten at another place in the flash, since the presence of a 
bit error indicates that the data in the page will eventually become 
unreliable.

The code as it looks today triggers scrubbing whenever a single bit 
correction is detected during read. The reason for this is that the 
classic Hamming algorithm can only handle one incorrect bit, so if another 
bit flips the data becomes unreadable.

I know there have been discussions that when using ECC that can correct 
more than a single bit in a given area, to not trigger scrubbing as soon 
as a single bit goes bad, but use a threshold mechanism, so that scrubbing 
is triggered first when, say, half the maximum amount of bits need 
correcting (e.g. in your case when 4 bits need correcting), the reason 
being that flashes which require multibit ecc tend to have bits here and 
there that flip rather quickly after writing, so triggering on them leads 
to undue scrubbing and hence wear on the flash.

> But sometimes the result is catastrophic. Because of that I have removed 
> the error reporting (my hope is that 8 bit errors occur seldom enough in 
> a page) After that code removing our problems are completely vanished (I 
> have even tested with more than 8 bit errors in the same page => no 
> problems). I could not provoke any faults by creating numerous bit 
> errors in dozens of pages.

Removing the 'corrected bit' reporting mechanism avoids scrubbing, and 
hence that code path is never executed. It seems a serious bug if the 
scrubbing mechanism doesn't work as intended, for whatever reason.

> What is your opinion? Have I overlooked something? I know that this
> method has risks but I hope that under the line the file system stays
> longer alive.

The risk would be that eventually the number of errors would grow past the 
ECC capability and subsequently lead to unreadable data. If there indeed 
is a bug in the scrubbing mechanism, I agree it would be better to just 
correct the bits and hope not too many of them flip. But it would be 
better to try and fix the problem with scrubbing...

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
