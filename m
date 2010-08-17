Received: from lvps87-230-0-242.dedicated.hosteurope.de ([87.230.0.242])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OlSQC-0007Mv-PF
	for linux-mtd@lists.infradead.org; Tue, 17 Aug 2010 20:06:09 +0000
From: Michael Guntsche <mike@it-loops.com>
To: Brian Norris <norris@broadcom.com>
Subject: Re: [BUG] Nand support broken with v2.6.36-rc1
Message-ID: <20100817200559.GA4542@gibson.comsick.at>
References: <20100817113644.GA31317@gibson.comsick.at>
	<4C6AC037.7070205@broadcom.com>
	<20100817174704.GA1322@gibson.comsick.at>
	<4C6AD9C2.1070705@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4C6AD9C2.1070705@broadcom.com>
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
Date: Tue, 17 Aug 2010 20:06:09 -0000

On 17 Aug 10 11:49, Brian Norris wrote:
> First, have you ever used any of the mtdutils? In particular,
> running the command "mtdinfo -a" and sending the output is helpful
> if you have the utility installed on your board.
hmm mtdinfo tries to open /sys/class/mtd/mtd0/dev which das not exist
the device is working ok as block device on the other hand so let's try
the next thing.

Output booting with a patched .36-rc1

[    0.279217] rbppc_nand_probe: MikroTik RouterBOARD 600 series NAND driver, version 0.0.2
[    0.287535] ID byte 0: 0xad
[    0.290373] ID byte 1: 0x76
[    0.293185] ID byte 2: 0xad
[    0.295985] ID byte 3: 0x76
[    0.298798] ID byte 4: 0xad
[    0.301610] ID byte 5: 0x76
[    0.304423] ID byte 6: 0xad
[    0.307223] ID byte 7: 0x76
[    0.310046] NAND device: Manufacturer ID: 0xad, Chip ID: 0x76 (Hynix NAND 64MiB 3,3V 8-bit)

Hope this helps...
