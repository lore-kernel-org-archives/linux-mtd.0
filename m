Received: from lvps87-230-0-242.dedicated.hosteurope.de ([87.230.0.242])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OlQGM-0005F6-4A
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2010 17:47:51 +0000
Date: Tue, 17 Aug 2010 19:47:04 +0200
From: Michael Guntsche <mike@it-loops.com>
To: Brian Norris <norris@broadcom.com>
Subject: Re: [BUG] Nand support broken with v2.6.36-rc1
Message-ID: <20100817174704.GA1322@gibson.comsick.at>
References: <20100817113644.GA31317@gibson.comsick.at>
	<4C6AC037.7070205@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C6AC037.7070205@broadcom.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 Aug 10 10:00, Brian Norris wrote:
> One of the following two cases is likely the problem:
> (1) Your chip is supposed to use offset 0, not 5, for the BBM (i.e.,
> NAND_LARGE_BADBLOCK_POS, not NAND_SMALL_BADBLOCK_POS), and so your
> ecclayout should not be leaving byte 0 in the "oobfree" array (a
> design flaw since you first began using this chip)

First, I am just an end user so I have no access to the datasheets etc. I
just got the code from the board manufactrurer (2.6.27) and forward
port it to recent kernels.

The reason I am using a specific layout is because the bootloader on
this board expects it this way. It formats it this way in the beginning
and I cannot change that. 


> Could you send the full NAND ID string (8 bytes, not
If you can tell me where I can find that I'll be more than happy to send
it to you. But as I said I think the reason for this is this special
bootloader.

Please tell me, if you need more informations.


Kind regards,
Michael
