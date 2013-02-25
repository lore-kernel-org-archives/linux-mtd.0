Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U9v8N-0007Z8-Lt
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2013 10:18:12 +0000
Date: Mon, 25 Feb 2013 11:18:06 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Gupta, Pekon" <pekon@ti.com>
Subject: RE: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73E99A07D@DBDE01.ent.ti.com>
Message-ID: <alpine.DEB.2.00.1302251109570.3736@lnxricardw.se.axis.com>
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
 <20980858CB6D3A4BAE95CA194937D5E73E99A025@DBDE01.ent.ti.com>
 <512B2DC6.8090104@parrot.com>
 <20980858CB6D3A4BAE95CA194937D5E73E99A07D@DBDE01.ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 25 Feb 2013, Gupta, Pekon wrote:

> But assuming there is no file-system OOB metadata | cleanmarker to be stored (like in UBIFS)
> Do we still need to transfer OOB data from Host processor to NAND device ?
> If yes, then ECC calculation & correction which at times is main bottle-neck in NAND accesses,
> may be best done at Host-processor side..
>
> Also, In-case there is some file-system metadata to be stored in OOB|spare area along with ECC,
> how do we ensure that layout of metadata does not overlap with ECC syndrome in BENAND ?
> Is the BENAND capable of re-adjusting its ECC layout ?

BENAND uses a separate non-addressable area for its on-chip ECC. Thus, 
the complete OOB area is available for the user (except bad block marker 
bytes).

IIUC, however, BENAND has a restriction on how data can written to the 
flash. For instance, for a BENAND with 2k pages and 64 bytes OOB per page, 
each 512 byte area is paired with 16 bytes of the OOB. When writing using 
the on-chip ECC, one must write the 512 area of the main page followed by 
the paired 16 bytes in the OOB area, without writing a new column address 
to the flash. It is also possible just to write the main area, but then 
the paired OOB bytes cannot be written at a later date, as that will cause 
overwriting of the on-chip ECC, causing read errors during subsequent 
read.

I don't know if it's possible to write the whole 2k page in one go, 
followed immediately by the 64 byte OOB. I think not, but the 
documentation is not clear on this point IMHO, and I have not tested it.

The most efficient use of BENAND is probably to avoid using the OOB if 
possible, and just use the main area. This does require that the driver be 
configured accordingly which is a pity in a production environment where 
one wants to have as wide a range of chips to choose from during the 
production run.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
