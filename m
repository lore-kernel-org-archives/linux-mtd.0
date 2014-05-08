Received: from mo6-p05-ob.smtp.rzone.de ([2a01:238:20a:202:5305::4])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WiMGP-0001Nx-OJ
 for linux-mtd@lists.infradead.org; Thu, 08 May 2014 11:13:22 +0000
Message-ID: <536B66D7.3000007@denx.de>
Date: Thu, 08 May 2014 13:13:27 +0200
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Pekon Gupta <pekon@ti.com>, Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] mtd: nand: Fix problem with NAND_CMD_RNDOUT (05h-E0h)
References: <1399372120-24089-1-git-send-email-pekon@ti.com>
In-Reply-To: <1399372120-24089-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Steven Kipisz <s-kipisz2@ti.com>, Marek Belisko <marek.belisko@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Bacem Daassi <Bacem.Daassi@spansion.com>,
 Samuel Egli <samuel.egli@siemens.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06.05.2014 12:28, Pekon Gupta wrote:
> From: Bacem Daassi <Bacem.Daassi@spansion.com>
>
> Though the NAND_CMD_READ "Page Read" command expects the full address footprint
> (2bytes for column address + 3bytes for row address).
> But once the page is loaded into the read buffer, NAND_CMD_RNDOUT (05h-E0h) also
> called "Random Data Output" command expects to see only the column address that
> should be addressed within the already loaded page present in read buffers.
> Only 2 address cycles with ALE active should be provided between the 05h and E0h
> So expected sequence for NAND_CMD_RNDOUT is
> 	<05h> <column-addr-byte1> <column-address-byte2> <E0h>
>
> Though most NAND Devices mentioned above tend to work even if extra cycles of
> page-address is issued between <05h> .... <E0h> command. But some Spansion and
> Hynix devices break on this non-compliance.
> The same issue has been reported by Bacem Daassi
>    http://e2e.ti.com/support/arm/sitara_arm/f/791/t/259699.aspx
>
> This patch fixes nand_command for all vendors devices as datasheet of all
> devices expect same sequence.
>
> +--------+------------------------+---------------------------------------------
> |Vendor  | Datasheet/Part#        |  Reference
> +--------+------------------------+---------------------------------------------
> |Spansion| S34ML{01|02|04}G2      | Figure 6.12 Random Data Output In a Page
> |Micron  | MT29F{16|32|64|128}G08A| Figure 47: CHANGE READ COLUMN (05h-E0h) Operation
> |Macronix| MX30LF1G08AA           | Figure 10. AC Waveforms for Random Data Output
> |Toshiba | TC58NVG1S3ETAI0        | Figure Column Address Change in Read Cycle Timing Diagram (2/2)
> +--------+------------------------+---------------------------------------------
>
> Reported-by: Bacem Daassi <Bacem.Daassi@spansion.com>
> Reported-by: Marek Belisko <marek.belisko@gmail.com>
> Reported-by: Steven Kipisz <s-kipisz2@ti.com>
> Signed-off-by: Pekon Gupta <pekon@ti.com>

Looks good, so:

Reviewed-by: Stefan Roese <sr@denx.de>

Thanks,
Stefan
