Received: from mail-px0-f171.google.com ([209.85.212.171])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QCxl9-0003SE-8A
	for linux-mtd@lists.infradead.org; Thu, 21 Apr 2011 17:33:44 +0000
Received: by pxi7 with SMTP id 7so1342056pxi.16
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 10:33:40 -0700 (PDT)
Message-ID: <4DB06A6B.2080806@gmail.com>
Date: Thu, 21 Apr 2011 10:33:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
References: <4DB052DB.7040308@parrot.com>
In-Reply-To: <4DB052DB.7040308@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Brian Norris <norris@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

On 4/21/2011 8:52 AM, Matthieu CASTET wrote:
> I believe NAND_BBT_SCANBYTE1AND6 behavior is very dangerous.
> We have a ST flash where ecc where but on bit 5 and 6.
> With new kernel all block are bad.
>
> Is this option is really needed ?
> ST datasheet say [1]. We already check the first Word.
> Why do we need to check the 6th Byte ?
>
>
> Matthieu
>
> PS : the code check 1st, 2nd, 6th, 7th Bytes. So it check too much bytes.
>
>
> [1]
> The devices are supplied with all the locations inside valid blocks erased
> (FFh). The Bad
> Block Information is written prior to shipping. Any block, where the 1st and 6th
> Bytes, or 1st
> Word, in the spare area of the 1st page, does not contain FFh, is a Bad Block.

I've tried my best to verify that any modifications I have made to bad 
block scanning comply with the data sheets, but I very well could have 
made mistakes (especially since there are so many different types of 
scanning patterns, and very few manufacturers are actually being 
consistent with these things).

That being said, I believe that the data sheet you quoted has some answer:
"Any block, where the 1st and 6th Bytes, or 1st Word, in the spare area 
of the 1st page, does not contain FFh, is a Bad Block."
AFAICT, this description means that x8 buswidth devices must scan bytes 
1 and 6 while x16 devices only need to scan the first word. So I bet 
your device is actually an x8 device and so the 1st/6th byte pattern is 
correct. I think the fact that this conflicts with your ECC patterns is 
something you must deal with.

 > PS : the code check 1st, 2nd, 6th, 7th Bytes. So it check too much bytes.

I've seen this before. This may be incorrect. Are you sure it's not 1st, 
2nd, 5th, 6th though? I believe the "2-byte scans" were chosen before to 
keep from having to differentiate between x8/x16 buses. Perhaps this 
should be changed. (volunteers?)

While we're on the subject: do people use x16 buses on NAND anymore?

Brian
