Received: from eu1sys200aog116.obsmtp.com ([207.126.144.141])
	by canuck.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R4TVy-00041h-IM
	for linux-mtd@lists.infradead.org; Fri, 16 Sep 2011 08:11:16 +0000
Message-ID: <4E730494.7030509@st.com>
Date: Fri, 16 Sep 2011 09:11:00 +0100
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH V3 3/6] MTD : add the database for the NANDs
References: <1301474413-28821-1-git-send-email-b32955@freescale.com>	<1301474413-28821-4-git-send-email-b32955@freescale.com>	<201103301046.04357.ffainelli@freebox.fr>	<4D92F277.7060607@freescale.com>	<1301566248.2828.40.camel@localhost>	<AANLkTi=59br1KueZupGevB4DgP7UqBKRgbGgRvsjgH-8@mail.gmail.com>
	<CAN8TOE9-iEPyWXLsxddeofazgrCWDWKgrx6eBkr7vdKErfgeCA@mail.gmail.com>
In-Reply-To: <CAN8TOE9-iEPyWXLsxddeofazgrCWDWKgrx6eBkr7vdKErfgeCA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <b32955@freescale.com>,
	Brian Norris <computersforpeace@gmail.com>,
	Huang Shijie <shijie8@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian, Huang,

Sorry for the long email, but this topic also interests me.

On 09/14/2011 04:44 PM, Brian Norris wrote:
> I see nothing has happened with this thread recently. It doesn't
> deserve to die though.

Having played around with the nand_ids.c and nand_get_flash_type(), I
also think the approach is in need of a bit of an overhaul.  The code is
getting increasingly difficult to follow, given the growing number of
non-standard decoding exceptions.

My first attempt was rather similar to Huang's -- using a static table
of READIDs and extended device properties.  However, this also gets
rather complicated, and again needs to handle special cases.  For
example, early revisions of a NAND device often include 'don't care'
bytes in the READID, or even just shorter READIDs.  We could add a
"matching-mask" to the table, and enforce some ordering to the binding
process (e.g. bind against the first match in the table, or perhaps the
most-specific match in the table?), but the semantics of the
table-ordering is difficult to enforce, especially when new devices are
added later.  Using a static table also has other disadvantages, such as
size and the need to continually update as new devices emerge (my list
is now over 300 devices!).

I ended up refactoring the nand_get_flash_type() code, according to 3
basic schemes:

	'ID 2' : extract properties from nand_flash_ids[].  For 2-byte IDs, or
where device ID gives a non-zero page-size (particularly SP devices).

	'Extended ID': decode properties from ID string where possible, falling
back to nand_flash_ids[].  For 3/4/5-byte IDs.

 	'ID 6'       : decode properties from ID string where possible,
falling back to nand_flash_ids[].  For 6-byte IDs.

The refactoring was primarily aimed at simplifying the way in which
decoding exceptions could be accommodated.

I have tested the code on the all the devices found in Brian's most
excellent table:
> http://linux-mtd.infradead.org/nand-data/nanddata.html

with the following exceptions:
	- ONFI-only devices: decode not possible using READID
	- Multi-CS devices: probe must be repeated on each CS
	- Toshiba devices: difficultly in acquiring the datasheets and the full
READID.

I have also added a few more devices and columns to the table (#CS,
#LUNs, #RBn) which I hope to submit shortly.

I was working on a non-standard NAND driver at the time, which made
little use of nand_base.c, and on an older 2.6.32 tree.  However, if
there is sufficient interest, I am happy at having a go at updating
nand_get_flash_type() on mtd-2.6.

Let me know if you think this might be useful.  Perhaps posting the
standalone test code I used on nanddata.html (actually a csv version of
the table!) would be a good start?

Cheers,

Angus
