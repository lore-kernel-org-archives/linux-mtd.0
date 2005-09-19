Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHTNS-000722-Bd
	for linux-mtd@lists.infradead.org; Mon, 19 Sep 2005 17:40:49 -0400
Message-ID: <432F3057.4080600@ru.mvista.com>
Date: Tue, 20 Sep 2005 01:40:39 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <432EBFC8.3090803@ru.mvista.com>
	<1127162439.24044.235.camel@tglx.tec.linutronix.de>
In-Reply-To: <1127162439.24044.235.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND/ HW ECC problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Thomas Gleixner wrote:

>On Mon, 2005-09-19 at 17:40 +0400, Vitaly Wool wrote:
>  
>
>>First, it turned to be necessary to add one more ECC type 
>>(NAND_ECC_HW10_512): this controller stores 10 ECC data bytes after each 
>>512-byte block. Also the need to change size of eccpos array off of 
>>nand_oobinfo structure arose: for flashes with 2K-sector, this turned to 
>>be 40 bytes for each sector.
>>    
>>
>
>Hmm, we really should think about making the ECC size per chunksize run
>time configurable.
>  
>
What if have it in the same way as oobfree is stored, i. e. {offset, 
length} pairs instead?

>  
>
>>The serious problem we came across also was that nand_write_page doesn't 
>>follow the free bytes reference for OOB to write ECC data what was 
>>obviously wrong. As far as I understand, the DoC flashes have specific 
>>mechanism for handling that, so he legacy variant was left for the DoC, 
>>dunno whether it's right.
>>    
>>
>
>Err, the oobfree reference is the place where file systems can put their
>data in. The ECC is put into the byte positions given by eccpos.
>
>  
>
Oh yes, thanks for the clarifications.

>I never bothered to implement the support for HW_ECC with a scattered
>byte layout as I never seen a controller doing such nonsense. All I have
>seen do
>
>data - ecc - fsoobdata (512byte/page)
>data - ecc -data - ecc -data - ecc -data - ecc - fsoobdata (2k/page)
>
>as this is the most efficient way to handle it.
>
>If your chip does it different, please use the correct parts of the data
>structure to implement it. 
>
>  
>
Yes, it does and I'm not at all happy with that. However, I guess this 
controller is likely to be used in other boards' designs...
So, the right way to handle this bizarre stuff currently is to 
write/read ECC data byte-by-byte following the eccpos array, correct?

Best regards,
   Vitaly
