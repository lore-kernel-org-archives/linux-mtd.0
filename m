Received: from www2.levante.de ([212.101.151.130] helo=www.levante.de)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dd8lQ-0006cL-UL
	for linux-mtd@lists.infradead.org; Tue, 31 May 2005 11:34:46 -0400
Message-ID: <429C8427.4020802@fsforth.de>
Date: Tue, 31 May 2005 17:35:03 +0200
From: Jonas <jdietsche@fsforth.de>
MIME-Version: 1.0
To: blair@circumnavnetworks.com
References: <B1091462CF5479489B1D8FE818330D2C80F27E@exchange2003.ad.skymv.com>		<429AEC25.4000309@fsforth.de>	<1117478995.24559.12.camel@blairs-desktop>
	<429C8192.30004@fsforth.de>
In-Reply-To: <429C8192.30004@fsforth.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: nand write problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Uuups, wrong shortcut ;-)

>> What version of nandwrite (nandwrite -V) do you have? Version 1.30
>> supports -f.
I used version 1.30. Peter Grayson just sent a patch.

>>> then I mount it with
>>> # mount -t jffs2 /dev/mtdblock/2 /mnt/
>>> and get a lot of
>>> CLEANMARKER node found at 0x00000000 has totlen 0xc != normal 0x0
>>>
>>> Copy the image with nandwrite is the correct and only way? Or is 
>>> there another possibility?
>>
>>
>> I've seen the CLEANMARKER errors before. How did you create the JFFS2
>> partition?
I used flash_eraseall -j /dev/mtd/2 and then I copied it with the 
command above.

>> Check out this thread for a little more detail:
>> http://lists.infradead.org/pipermail/linux-mtd/2005-March/012045.html
Thanks.

Regards,
Jonas
