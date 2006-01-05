Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EuVBM-00023t-5K
	for linux-mtd@lists.infradead.org; Thu, 05 Jan 2006 08:29:41 -0500
Message-ID: <43BD1F4D.6090000@ru.mvista.com>
Date: Thu, 05 Jan 2006 16:29:49 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Juha_Yrj=F6l=E4?= <juha.yrjola@nokia.com>
References: <1136235272.8963.21.camel@two.research.nokia.com>	
	<43BD118B.2050606@ru.mvista.com>
	<1136467206.22022.28.camel@two.research.nokia.com>
In-Reply-To: <1136467206.22022.28.camel@two.research.nokia.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [JFFS2] Make NAND OOB usage more flexible
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Juha,

no, the latest patch is 
http://lists.infradead.org/pipermail/linux-mtd/2005-December/014648.html.
It doesn't touch OneNAND but the required changes are so similar to 
common NAND that I don't think it's gonna be a problem to extend it for 
OneNAND. I just didn't bother to; but the approach itself is quite generic.

Vitaly

Juha Yrjölä wrote:

>Hi Vitaly,
>
>Sorry, I wasn't aware of any patch; I just joined the list.  Is this the
>patch?
>
>http://lists.infradead.org/pipermail/linux-mtd/2005-December/014521.html
>
>If it is, it seems to be ignorant of at least OneNAND.
>
>However, I do agree that the OOB stuff is not handled well at all in the
>current code (even after my patch).  When you come up with a better
>version, please update the OneNAND code, too.
>
>As a side note, on OneNAND it'd actually probably be faster to do a one
>big write of 64 OOB bytes instead of a lot of 2- or 3-byte writes.
>Looks like your patch is paving way for this by moving the OOB handling
>lower, which is good.
>
>So I do agree that for the long term the OOB handling needs rework, but
>my patch is a stopgap measure that allows all the devices (NAND and
>OneNAND) to work right now.
>
>BTW, this patch is bad:
>
>http://lists.infradead.org/pipermail/linux-mtd/2005-December/014522.html
>
>APIs visible to user-space should _never_ be broken if it's possible to
>avoid it.  You should implement a backwards-compatibility layer instead
>of just removing the old ioctls.
>
>Cheers,
>Juha
>
>On Thu, 2006-01-05 at 15:31 +0300, ext Vitaly Wool wrote:
>  
>
>>Oh my goodness... Maybe just apply my patch for OOB handling and all 
>>that stuff will go away?
>>
>>Vitaly
>>
>>Juha Yrjölä wrote:
>>
>>    
>>
>>>Many (if not all) OneNAND devices have the free OOB bytes scattered
>>>around the whole OOB area in blocks of 2 or 3 bytes.  To work around
>>>this, the JFFS2 wbuf code needs to consider _all_ the free OOB bytes
>>>specified by the oobfree array.
>>>      
>>>
>
>
>
>  
>
