Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DH6OC-0006mk-Mj
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2005 15:35:41 -0500
Message-ID: <424C5F16.8010809@ieee.org>
Date: Thu, 31 Mar 2005 15:35:34 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Zeri Virgo <zerivirgo@infocell-its.com>
References: <4249C357.2040600@ieee.org> <424C1C58.3000905@infocell-its.com>
In-Reply-To: <424C1C58.3000905@infocell-its.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [UPDATE] DOCBoot support for NFTL-based DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zeri Virgo wrote:

> Unfortunately my 2.6.11.5 kernel patched with mtd/patchkernel.sh, is 
> crashing with the following stack trace (I've just jotted down the 
> symbols)...


Hmm.  Looks like I broke something when I changed the code to scan the 
entire device for media headers.  Some questions for you:

 - What size is your DOC?
 - How big is your firmware area?  (I'm assuming you resized it using 
the DOS-based tools)
 - Did the diskonchip driver work for you without crashing before my 
latest changes?  (Obviously this would be with a standard-sized firmware 
area)
 - Can you tell me what kind of crash it is?  NULL pointer dereference, etc?
 - What information (if any) is printed when the DOC is detected, before 
the crash?  I'm interested in information about the number and sizes of 
NAND chips, number of chips per floor, etc.

> The MTD section of my .config is below (I removed NFTL because I'm 
> only going to be using JFFS2, ok?). Is there anything obviously wrong 
> here?

I didn't see anything wrong in your config options.

    -Dan
