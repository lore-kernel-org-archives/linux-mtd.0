Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Clogt-0001SK-PV
	for linux-mtd@lists.infradead.org; Tue, 04 Jan 2005 08:25:41 -0500
Message-ID: <41DA9D43.70807@ieee.org>
Date: Tue, 04 Jan 2005 08:42:27 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: Balint Cristian <rezso@rdsor.ro>
References: <41D9949B.5070207@ieee.org> <200501041119.25138.rezso@rdsor.ro>
In-Reply-To: <200501041119.25138.rezso@rdsor.ro>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCBoot update
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Balint Cristian wrote:

>Just a undocumented Question:
>
> Can please tell me if run on ARM/xscale not on intel only ?
>If not, it is difficult to adapt ?, or you already have some plans for this.
>  
>
DOCBoot only runs on intel hardware.  In fact it only runs on intel 
hardware with a somewhat standard PC configuration, namely a standard 
BIOS which supplies certain functionality.  Also, the Linux bootloading 
process is very specific to i386.  I would guess that a variant of 
DOCBoot for ARM/xscale would probably be a complete rewrite.  Sorry :(

    -Dan
