Received: from out2.smtp.messagingengine.com ([66.111.4.26])
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BsZNh-0001TK-Rd
	for linux-mtd@lists.infradead.org; Wed, 04 Aug 2004 23:57:30 -0400
Received: from fastmail.fm (203-219-10-94-vic.tpgi.com.au [203.219.10.94])
	by mail.messagingengine.com (Postfix) with ESMTP id C9071C13D48
	for <linux-mtd@lists.infradead.org>;
	Wed,  4 Aug 2004 23:57:24 -0400 (EDT)
Message-ID: <4111AEA6.2080605@fastmail.fm>
Date: Thu, 05 Aug 2004 13:51:02 +1000
From: Brendan J Simon <BrendanSimon@fastmail.fm>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: 128MB DOC2000 with 2.4.X kernel
Reply-To: BrendanSimon@fastmail.fm
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've just been reading the archives about 128MB DOCs looking like a 
Millenium device and the soltion being to do 4 reads, etc.
The 2.4.26 kernel doesn't support this device but I see that the 2.6.X 
kernels do.

If I modify docprobe.c to detect the 128MB DOC2000 correctly, will the 
rest of the MTD code work correctly with it ???
I hope so as this would be a quick fix, however I do recall seeing 
something about 3 and 4 byte addresses.  Is this relevant to getting 
128MB DOC working with 2.4.X kernels ?

To summarise, I have an embedded board with a 64MB DOC2000 and a 2.4.18 
kernel.  I need to have a 128MB DOC2000 working on it pretty quickly and 
am considering the options of making a few source code changes to the 
2.4.18 kernel or porting a newer 2.6.x kernel to the embedded board.  
I'm looking for the quickest solution.  Any ideas, comments or 
suggestions would be greatly appreciated.

Is INTFL needed for the 128MB DOC2000 or can I use the NFTL code that I 
am currently using on the 64MB doc?

Many thanks,
Brendan Simon.
