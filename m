Received: from deck1210.hostdeck.com ([212.39.12.10])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GxQvZ-0005o4-In
	for linux-mtd@lists.infradead.org; Thu, 21 Dec 2006 11:37:54 -0500
Message-ID: <458AB6B3.40500@fatti.com>
Date: Thu, 21 Dec 2006 17:30:43 +0100
From: Enrico Migliore <enrico.migliore@fatti.com>
MIME-Version: 1.0
To: Indrek Kruusa <indrek.kruusa@artecdesign.ee>
Subject: Re: Transfer rates with NAND
References: <458A73AF.2040307@artecdesign.ee>
In-Reply-To: <458A73AF.2040307@artecdesign.ee>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Indrek Kruusa wrote:
> Hi,
>
> I am wondering which NAND transfer rates are seen in embedded Linux 
> projects. What to expect from the whole hardware/software subsystem?
> I have one Geode LX design with CS5536 companion chip which by using 
> built-in 8-bit Flash controller on PCI bus gives me slightly over 2MB/s. 
> It's almost the same with Linux MTD driver and with a self-made basic 
> driver. Is the speed here the matter of flash controller only? Which is 
> the fastest flash controller out there? :)
>
> thanks in advance,
> Indrek
>
>   
Hi Indrek,
 
 the data transfer from the NAND to the CPU and viceversa depends on:

 1. NAND bus maximum speed
 2. CPU's bus controller speed (*) and its configuration
 3. Read or Write operarations

The overhead added by the MTD layer or any other well written driver is 
irrelevant.

(*) I mean the bus that access the NAND which might not be the same bus 
that access the RAM

Enrico
