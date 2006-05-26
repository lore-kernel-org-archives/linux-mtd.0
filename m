Received: from smtp002.mail.ukl.yahoo.com ([217.12.11.33])
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FjflM-0003Id-SV
	for linux-mtd@lists.infradead.org; Fri, 26 May 2006 13:06:20 -0400
Message-ID: <44773572.7000809@themis.com>
Date: Fri, 26 May 2006 19:05:54 +0200
From: jean-francois simon <jfs@themis.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: mpc8270 and 64bit flash geometry
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,
We have designed a board using the mpc8270 and have problm 
accessing the fLASH using linux-2.6.15.1

We have placed the FLASH on the 60x bus. Here is the geometry:

-FLASH Part number: M29DW640D70ZA1
-There are 2 Flash Memory Banks of 32MB each. So each bank has 4 
chips that are banked to form a 64b wide bus.
-Write to FLASH: as we have a single WE signal per bank, the 
write operation is done 64bits at a time. That is the CPU has to 
generate a 64bit write. It can't write in 8,16,32bit mode.

With that in mind I have selected an interleave of 4 and 
bankwidth of 8.

We now know this single WE poses problem. From reading the 
archive it seems there is a work around by defining a write 
routine in the map driver that uses the 64b load/store floating 
point instrcutions.
So I have done that, but I still can't do an "eraseall" (it will 
panic the system).

Besides the specific write routine, anything else I need to do? 
Or the MTD code will simply not work with this kind of geometry?


Looking at the code, I have one question: SHould 
./mtd/chips/cfi_probe.c:cfi_probe_chip() be called for _every_ 
flash chip? It seems to be called only once per bank.

Thanks

Best regards,
_______________________________________
jean-francois simon - themis computer
5, rue irene joliot curie
38330 eybens - france
+33 (0)870 448 638
+33 (0)4 76 14 77 85 - jfs@themis.com




	

	
		
___________________________________________________________________________ 
Yahoo! Mail réinvente le mail ! Découvrez le nouveau Yahoo! Mail et son interface révolutionnaire.
http://fr.mail.yahoo.com
