Received: from [213.97.115.166] (helo=drkitkat.Hispafuentes.com ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rhNb-0004U2-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Oct 2001 16:04:11 +0100
To: linux-mtd@lists.infradead.org
Subject: Driver for Flash NAND KM29U128T
From: blite@eresmas.com
Date: 11 Oct 2001 17:14:20 +0200
Message-ID: <m3sncq9pkj.fsf@drkitkat.Hispafuentes.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

  Hi all

    I'm newbie in embedded linux system, and I have a couple of
    doubts. 
    
    I'm working with a NAND flash memory from Samsung (KM29U128T) and i
    have seen this project perfect for what i need.  I have seen in
    file 'nand_ids.h' that there is a reference to my memory. ({"Samsung
    KM29U128T", NAND_MFR_SAMSUNG, 0x73, 24, 0, 2, 0x4000},) and i have
    tryed to compile it. Well, after some problems during compilation,
    i get a kernel with support for nand memories, but it fails when i
    boot from it. 
    I have read sources in drivers/nand directory and i think
    that i need to fill/modify something there to work with my flash. 
    Is this correct? It looks like spia.c is an example or something
    like that. Can i start from here? 
    I have the data sheet for my flash memory, and i think that it's from
    here where i have to take data to fill my driver, isn't?  

    Well, really i am not sure if i am on the right track. Can anyone
    tell me? And finally, have anybody this driver made? Can i get it
    from somewhere?

  

    Well, excuse me if the questions are trivial, but i'm only a
    begginer in this world. Thank you anyway 
    Blite
