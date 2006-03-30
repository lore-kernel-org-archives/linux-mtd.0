Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOxBj-0002Uh-6u
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 08:27:56 -0500
Message-ID: <442BDCCA.6000408@intel.com>
Date: Thu, 30 Mar 2006 17:27:38 +0400
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <Pine.LNX.4.64.0603101044290.3274@localhost.localdomain>
	<44200D27.2060404@intel.com>
	<Pine.LNX.4.64.0603211002250.3631@localhost.localdomain>
	<442943A3.6060807@intel.com>
	<Pine.LNX.4.64.0603291125480.14923@localhost.localdomain>
	<Pine.LNX.4.64.0603291745000.14923@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603291745000.14923@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] cfi: Fixup of write errors on XIP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas

Thank you very much for assistance.

>>I think both solutions, although they fix this particular problem, are 
>>not addressing the fundamental issue which is that the current code 
>>structure to cope with XIP and non-XIP is becoming a total mess.  In 
>>fact the whole timeout/error handling should be factored out of every 
>>functions into a sincle subfunction, actually one for XIP and one for 
>>non-XIP.  This way the XIP case would not have to care about chip 
>>state changing since that cannot happen, and the timeout treshold 
>>would be more accurately computed as well.
>>    
>>
It's correct. I had to spent some time to find out the solution which 
doesn't break anything and doesn't change the architecure.
IMO your fix is much better than I expected.

>Please find attached a patch for what I mean.
>
>Could you test it and confirm the problem is actually gone?
>  
>
This code definetely will not cause the write error issue on XIP.
For just a case I made tests. No write errors were faced after 3 hours 
of testing.

I have one comment to the patch:

>+
>+	if (!z) {
>+		if (!--(*chip_op_time))
>+			*chip_op_time = 1;
>+	} else if (z > 1)
>+		*chip_op_time += z/2;
>
This change may negativelly affect on write performance in case of SND 
kernel configuration.
The process of write timeout increasing if faster than process of write 
timeout decreasing.
If we consider write time as a random value with mean = 
chip->buffer_write_time and unknown variance.
It means that average buffer write timeout will be greater than 
necessary timeout.
For example: consider the process : 1 write: average time + 10us; 2 
write: average time - 10us; 3 write average time time + 10us etc.

To check it I made additional performance test on station with P30 chip.
MTD RAW write performance degradation was 3% in comaprision to kernel 
witout the patch.
I think it would be better to left    *chip_op_time ++  as it was before.

Thanks,
Alexey
