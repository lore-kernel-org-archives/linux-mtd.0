Received: from mail-gy0-f177.google.com ([209.85.160.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QXyWh-00077P-3e
	for linux-mtd@lists.infradead.org; Sat, 18 Jun 2011 16:37:40 +0000
Received: by gyh20 with SMTP id 20so1565614gyh.36
	for <linux-mtd@lists.infradead.org>;
	Sat, 18 Jun 2011 09:37:36 -0700 (PDT)
Message-ID: <4DFCD44A.4090909@gmail.com>
Date: Sat, 18 Jun 2011 12:37:30 -0400
From: Peter Barada <peter.barada@gmail.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: Problem with clean markers/partial writes on Micron 4-bit ECC NAND
References: <4DFB9458.1030304@gmail.com> <20110617210014.GA28332@parrot.com>
In-Reply-To: <20110617210014.GA28332@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Eric Nelson <eric.nelson@logicpd.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Peter Barada <peter.barada@logicpd.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/17/2011 05:00 PM, Ivan Djelic wrote:
> On Fri, Jun 17, 2011 at 06:52:24PM +0100, Peter Barada wrote:
> (...)
>> The problem I'm running into with JFFS2 is that empty flash is first
>> marked with a clean marker into the OOB, and then a 2nd write to the
>> main data area is done (w/o an intervening erase) to that page with data
>> which corrupts the ECCs that were first modified by writing the cleanmarker.
>>
> (...)
>> I believe I've figured out a workaround:
>>
>> 1) Modify the ecclayout to add the other 8 bytes of the OOB that are NOT
>> ECCd *after* the 16 bytes that are ECCd (so the ecc layout looks like):
>>
> (...)
>> 2) Then set ops.ooboffs to 16 in jffs2_write_nand_cleanmarker and
>> jffs2_check_nand_cleanmarker.
>>
>> This "offsets" the read/writes by 16 bytes to move the cleanmarker into
>> OOB bytes that do not perturb the ECCs, and so far it looks to work.
>>
> OK, so now the cleanmarker is in an unprotected area; did you also patch
> jffs2_check_nand_cleanmarker() so that it does its pattern comparison in a
> bitflip-robust way (instead of just doing a memcmp) ?
> I think you may also need to modify jffs2_check_oob_empty() to take into
> account the new offset of your cleanmarker.
No, I haven't yet created a bitflip-robust jffs2_check_nand_cleanmarker 
- will code up a version that calculates the number of flips between the 
expected and read markers and if less than some threshold accept it.  
I'm surprised such code isn't already in JFFS2, unless JFFS2 assumes 
that area of the OOB is already protected (and that protection is OOB-only).

>> However I feel this is a hack as our product will use two different NAND
>> chips, the other being a more traditional SLC that can use 1-bit hamming
>> for ECC (which does not ECC any bytes in the OOB).
>>
>> How can I best code this into the MTD layer such that JFFS2 (and other
>> NAND FSs that does partial writes including OOB bytes) can understand
>> that some OOB bytes perturb the data area ECC?
>>
>> I think adding a "non_ecc_oob_offset" variable to the ecclayout could
>> capture this nuance of the OOB/ECC interaction for this chip and JFFS2
>> could set ops.ooboffs to non_ecc_oob_offset in
>> jffs2_write_nand_cleanmarker and jffs2_check_nand_cleanmarker.
> I believe JFFS2 only uses oob for its cleanmarker; then, maybe you could just
> omit the ecc-protected bytes from the .oobfree list, like this:
>
>    ecclayout = {
>           eccbytes = 32,
>           eccpos = { 8, 9, 10, 11, 12, 13, 14, 15,
>                   24, 25, 26, 27, 28, 19, 30, 31,
>                   40, 41, 42, 43, 44, 45, 46, 47,
>                   56, 57, 58, 59, 60, 61, 62, 63},
>           .oobfree = {
>                   { .offset = 2,
>                     .length = 2},
>                   { .offset = 18,
>                     .length = 2},
>                   { .offset = 24,
>                     .length = 2},
>                   { .offset = 42,
>                     .length = 2},
>           },
> };
>
> and only modify jffs2_check_nand_cleanmarker() and jffs2_check_oob_empty()
> so that they are robust to bitflips in unprotected oob bytes ?
> Or are you also using on the same mtd device another filesystem requiring
> protected oob bytes, like YAFFS2 ?
Yes we are using YAFFS2 in our system so I need not only protected OOB 
bytes, but at least 16 of them for YAFFS to hold its meta data - hence 
our OOB layout.  What's nice is that the 16 currently available are ECCd 
so there's not need to ECC the YAFFS meta data (which saves time).

The issue I have is how can I best tell MTD (and FS layers on top of it) 
that some of the OOB bytes can not be used in partial writes due to 
those bytes perturbing the ECC, or how to change JFFS2 to erase the 
block after writing the cleanmarker when it wants to write data into the 
block.

Why does JFFS2 write a clean marker into the empty block?  Is it to 
cover some state transition where power could be interrupted?

> Regards,
>
> Ivan
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/


-- 
Peter Barada
peter.barada@gmail.com
