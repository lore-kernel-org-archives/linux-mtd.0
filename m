Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CgNRW-0006w1-Gy
	for linux-mtd@lists.infradead.org; Mon, 20 Dec 2004 08:19:19 -0500
Message-ID: <41C6D531.1020800@ieee.org>
Date: Mon, 20 Dec 2004 08:35:45 -0500
From: Dan Brown <dan_brown@ieee.org>
MIME-Version: 1.0
To: "Carlos, John J USAATC" <john.carlos@atc.army.mil>
References: <EFF9A3506F74924AB5CC77BDC66E7935181399@atcml01.atc.army.mil>
In-Reply-To: <EFF9A3506F74924AB5CC77BDC66E7935181399@atcml01.atc.army.mil>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Doc_loadbios fails?  Docboot?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Carlos, John J USAATC wrote:
> Should I just try to use docboot?  When using docboot I guess
> everything must be built into the kernel since initrd image is not supported
> (as the readme says it isn't).

Adding initrd support would be fairly easy... I'll try to put together a 
patch over the next few days, if you have a need for it.

	-Dan Brown
