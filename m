Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U9vwc-0003ux-Qi
 for linux-mtd@lists.infradead.org; Mon, 25 Feb 2013 11:10:08 +0000
Message-ID: <512B468B.6060902@parrot.com>
Date: Mon, 25 Feb 2013 12:10:03 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
 <20980858CB6D3A4BAE95CA194937D5E73E99A025@DBDE01.ent.ti.com>
 <512B2DC6.8090104@parrot.com>
 <20980858CB6D3A4BAE95CA194937D5E73E99A07D@DBDE01.ent.ti.com>
 <alpine.DEB.2.00.1302251109570.3736@lnxricardw.se.axis.com>
In-Reply-To: <alpine.DEB.2.00.1302251109570.3736@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ricard Wanderlof a écrit :
> On Mon, 25 Feb 2013, Gupta, Pekon wrote:
> 
>> But assuming there is no file-system OOB metadata | cleanmarker to be stored (like in UBIFS)
>> Do we still need to transfer OOB data from Host processor to NAND device ?
>> If yes, then ECC calculation & correction which at times is main bottle-neck in NAND accesses,
>> may be best done at Host-processor side..
>>
>> Also, In-case there is some file-system metadata to be stored in OOB|spare area along with ECC,
>> how do we ensure that layout of metadata does not overlap with ECC syndrome in BENAND ?
>> Is the BENAND capable of re-adjusting its ECC layout ?
> 
> BENAND uses a separate non-addressable area for its on-chip ECC. Thus, 
> the complete OOB area is available for the user (except bad block marker 
> bytes).
There are 2 generations of BENAND :
- old generation that use oob for its on-chip ECC
- new generation that use a separate non-addressable area

I believe the patch is for the old generation because it create a special layout :

+
+static struct nand_ecclayout benand_oob_128 = {
+       .oobfree = {
+               {.offset = 2, .length = 3},
+               {.offset = 18, .length = 3},
+               {.offset = 34, .length = 3},
+               {.offset = 50, .length = 3},
+               {.offset = 66, .length = 3},
+               {.offset = 82, .length = 3},
+               {.offset = 98, .length = 3},
+               {.offset = 114, .length = 3},
+       }
+};


> 
> IIUC, however, BENAND has a restriction on how data can written to the 
> flash. For instance, for a BENAND with 2k pages and 64 bytes OOB per page, 
> each 512 byte area is paired with 16 bytes of the OOB. When writing using 
> the on-chip ECC, one must write the 512 area of the main page followed by 
> the paired 16 bytes in the OOB area, without writing a new column address 
> to the flash. It is also possible just to write the main area, but then 
> the paired OOB bytes cannot be written at a later date, as that will cause 
> overwriting of the on-chip ECC, causing read errors during subsequent 
> read.
> 
> I don't know if it's possible to write the whole 2k page in one go, 
> followed immediately by the 64 byte OOB. I think not, but the 
> documentation is not clear on this point IMHO, and I have not tested it.
I think it is possible : on our test we didn't deactivate the soc nand
controller ecc : it wrote 2K of data + OOB with its ecc. And it was working.

I believe it is what they wanted when using a separate non-addressable area.
They wanted to provide new generation nand flash that require more ecc
correction, but that is transparent for the host (very little software
modification : check status bit in read).



> 
> The most efficient use of BENAND is probably to avoid using the OOB if 
> possible, and just use the main area. This does require that the driver be 
> configured accordingly which is a pity in a production environment where 
> one wants to have as wide a range of chips to choose from during the 
> production run.

Yes using OOB is asking for trouble with new nand.


Matthieu
