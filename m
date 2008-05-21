Received: from nabagan.bluegap.ch ([88.198.58.248])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JykRE-00008m-CL
	for linux-mtd@lists.infradead.org; Wed, 21 May 2008 09:16:48 +0000
Message-ID: <4833E87D.10209@bluegap.ch>
Date: Wed, 21 May 2008 11:16:45 +0200
From: Markus Schiltknecht <markus@bluegap.ch>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: curious questions
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm new to the list - and having lots of questions. Feel free to simply 
point me to earlier discussions or other resources. Even simple Yes or 
No answers might also do it ;-)

Having read through most of the infradead.org website (and others), I 
today realized, that erase blocks span *multiple* pages, which explains 
the huge difference in 'block size' sometimes cited (around 2K vs around 
128K).

Now, if I understand correctly, a flash chip supports reading and 
(limited) writing to pages, and erasing erase-blocks. But the MTD FAQ 
states:

 > (The mtd device) maintains 3 main operations: read from eraseblock,
 > write to eraseblock, and erase eraseblock

Am I understanding correctly, that I can't write to the a single page 
with MTD (after having erased the according erase-block)? Even if I'm 
writing the single pages in the block sequentially?


Can I repeatedly write to a NAND flash page, to set its bits to 1 
(without resetting any bit to 0) (or vice-versa for XOR)?


I've followed the 'hardware devices' cited on the website, but it seems 
a little out-dated. What's an inexpensive way to get a device with 
accessible NAND chips on it to play with? It looks to me like you only 
get to purchase stuff with embedded FTL, which isn't suitable as an mtd.


Looking forward to your answers, hints and pointers.

Markus
