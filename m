Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1ESH6d-0006ff-SS
	for linux-mtd@lists.infradead.org; Wed, 19 Oct 2005 12:48:03 -0400
Message-ID: <435678BA.6080809@ru.mvista.com>
Date: Wed, 19 Oct 2005 20:47:54 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <F92C2EFE7C3BA745855BF7036E1F3F9A014CE48D@NNSMSX401>
	<Pine.LNX.4.64.0510191058000.5288@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0510191058000.5288@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: XIP & GCC optimization & halting
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

>  
>
>>Now I'm not clear about solution for the problem.
>>    
>>
>
>Select only one CFI buswidth and only one chip interleave when 
>configuring your kernel.  That will allow gcc to precompute everything a 
>t compile time and avoid the runtime divide.
>  
>
Does it make sense to lock runtime divide functions in i-cache during 
flash not being in linear mode?

Vitaly
