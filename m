Received: from [85.21.88.6] (helo=buildserver.ru.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FAV02-0004DS-8P
	for linux-mtd@lists.infradead.org; Sat, 18 Feb 2006 11:32:02 -0500
Message-ID: <43F74BF1.1080307@ru.mvista.com>
Date: Sat, 18 Feb 2006 19:31:45 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <43EB96DC.3030900@eptar.com>	<35fb2e590602100558s2d868fa3o1752fbf3217439e4@mail.gmail.com>	<d97046180602151153g23064424x9e1ddf83a1d7ae4f@mail.gmail.com>	<200602161432.17447.manningc2@actrix.gen.nz>
	<1140253826.2480.651.camel@localhost.localdomain>
In-Reply-To: <1140253826.2480.651.camel@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: William Watson <wjw1961@gmail.com>,
	Charles Manning <manningc2@actrix.gen.nz>,
	linux-mtd@lists.infradead.org, yaffs@stoneboat.aleph1.co.uk
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi folks,

just two small notes from my side.
First, FWIW, YAFFS2 never writes OOB w/o data and that looks more proper 
than JFFS2 style which means cleanmarkers for an empty page.
YAFFS2 just needs means to be agnostic about how OOB bytes are placed 
within a page.

Next, I took a look at rtc_from4.c and I'm not sure how to follow this 
method if the NAND controller just doesn't have means to give the 
caclulated ECC back to user. Thomas, could you please elaborate on that?

Best regards,
  Vitaly

Thomas Gleixner wrote:

>Charles,
>
>On Thu, 2006-02-16 at 14:32 +1300, Charles Manning wrote:
>  
>
>>1) ECC on tags....  Tags are so small that a single-bit correction is probably 
>>enough. Multibit is probably a good thing to investigate.
>>2) More OOB being used for multi-bit schemes will probably mean less space 
>>available for tags.
>>    
>>
>
>We really should start to think seriously about oob usage for arbitrary
>data storage at all. I know that YAFFS(2) depends on that, but looking
>at the required mess in the code to keep this up for all the 9999
>variants of ECC/RS whatever mechanisms, bad block marking schemes ...
>
>Some words about Reed Solomon.
>
>Reed Solomon needs hardware support for performance reasons. Efficient
>usage of Reed Solomon requires a different Data / RS-code layout:
>
>512 Byte Data
>8 Byte RS Code
>512 Byte Data
>8 Byte RS Code
>512 Byte Data
>8 Byte RS Code
>512 Byte Data
>8 Byte RS Code
>32 Byte OOB
>
>This layout is supported already (see rtc_from4.c). It requires usage of
>flash based bad block tables.
>
>	tglx
>
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
>  
>
