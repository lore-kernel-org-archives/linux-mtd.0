Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5GtJ-0002AC-HT
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 12:22:22 +0000
Received: by wyb28 with SMTP id 28so2398412wyb.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 05:22:20 -0700 (PDT)
Subject: Re: UBI - EBA table (Erase block association table) - wear leveling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Navaneethan P <pnavanee@gmail.com>
In-Reply-To: <AANLkTi=hrqqOZEu8DF8jm9q0E44fRG5_y9j-sdnBorgP@mail.gmail.com>
References: <AANLkTi=hrqqOZEu8DF8jm9q0E44fRG5_y9j-sdnBorgP@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 15:19:50 +0300
Message-ID: <1301573990.2828.59.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Stefan.Bigler@keymile.com, navaneethan.p@aricent.com,
	linux-mtd@lists.infradead.org, Sundararajan.Somasundaram@aricent.com,
	"shenbaga.nathan" <shenbaga.nathan@aricent.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Fri, 2011-03-18 at 19:49 +0530, Navaneethan P wrote:
>  Hi Linux-Mtd users,
> 
> We are using UBI over NAND Flash. I have the following dubts.
> 
> 1) UBI stores the volume id table & EBA table in some PEB of the NAND Flash.

No, only the volume table is stored on-flash. The EBA table is built
when the flash is scanned.

> My assumption is that volume id table will always be stored in LEB
> 'X'. and UBI will go & read the information during initialization.
> Is my undersatnding correct?

Not sure, probably. On initialization UBI scans whole flash and finds
the volume table
> 
> 2) One of the assumption is that EBA table is always stored in an PEB.
> Is my assumption correct?

No, EBA table is built while scanning in RAM. This is why UBI is not
very scalable. UBI2 would need to solve it, but no one developed UBI2
yet.

> 3) I read from the wear leveling subsystem (wl.c), the maximum
> difference between the erase counters of erase blocks will be
> CONFIG_MTD_UBI_WL_THRESHOLD (defined as 4096).

OK.

> If the difference exceeds then it will move the data from high EC
> block to low EC block.

Yes.

> Let me take the case of PEB 'A' stores the EBA table.

There is no such PEB.

>  Because of the
> writting to the flash, EC of PEB 'A' reaches to 4096. As per the
> documentation, it has to be wear leveled to lower EC block. Let me
> assume that this PEB is 'B'. My doubt is "In the next initialization,
> how does the UBI understands that EBA is stored in PEB 'B' instead of
> PEB 'A'?"

UBI always scans. That is design decision. It has advantages
(robustness, simplicity) and drawbacks (linear scalability).

Here you can find various docs, BTW:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_ubidoc

HTH.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
