Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHeGh-0000Y3-Od
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 05:18:41 -0400
Message-ID: <432FD421.2090508@ru.mvista.com>
Date: Tue, 20 Sep 2005 13:19:29 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: tglx@linutronix.de
References: <432EBFC8.3090803@ru.mvista.com>
	<1127162439.24044.235.camel@tglx.tec.linutronix.de>
In-Reply-To: <1127162439.24044.235.camel@tglx.tec.linutronix.de>
Content-Type: text/plain; charset=KOI8-R; format=flowed
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
>http://www.linux-mtd.infradead.org/tech/mtdnand/x215.html
>
>eccpos
>
>The eccpos array holds the byte offsets in the spare area where the ecc
>codes are placed. 
>
>  * oobfree
>
>The oobfree array defines the areas in the spare area which can be used
>for automatic placement. The information is given in the format {offset,
>size}. offset defines the start of the usable area, size the length in
>bytes. More than one area can be defined. The list is terminated by an
>{0, 0} entry. 
>
>
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
Well, after having a fresh look at it I lost the feeling that I was 
doing something wrong.

Let's look at the patch again:

<snip>

 	/* Write out OOB data */
-	if (this->options & NAND_HWECC_SYNDROME)
-		this->write_buf(mtd, &oob_buf[oobsel->eccbytes], mtd->oobsize - oobsel->eccbytes);
-	else 
+	if (this->options & NAND_HWECC_SYNDROME) 
+		if (mtd->ecctype != MTD_ECC_RS_DiskOnChip ) 
+			for (i = 0; oobsel->oobfree[i][1]; i++ ) 
+		    		this->write_buf (mtd, 
+						 oob_buf+oobsel->oobfree[i][0],
+			    			 oobsel->oobfree[i][1] );
+		else /* DiskOnChip legacy ECC */
+			this->write_buf(mtd, &oob_buf[oobsel->eccbytes], mtd->oobsize - oobsel->eccbytes);
+	else  
 		this->write_buf(mtd, oob_buf, mtd->oobsize);
 

<snip>

So, the subject of change is exactly the areas in the spare area which 
can be used for automatic placement (fsoobdata), i. e. oobfree. In my 
case, oobfree is not at oob+buf + oobsel->eccbytes but spread across the 
block in a way

data - ecc - fsoobdata - data - ecc - fsoobdata - data - ecc - fsoobdata - data - ecc - fsoobdata


Therefore the assumption that fsoobdata is at the end of the block 
doesn't work, and that's what this part of the patch is about.
Please correct me if I'm wrong,

Thanks,
   Vitaly
