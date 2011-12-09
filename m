Received: from eu1sys200aog116.obsmtp.com ([207.126.144.141])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYyFF-0008JM-BG
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 11:04:02 +0000
Message-ID: <4EE1EB20.4070001@st.com>
Date: Fri, 09 Dec 2011 11:04:00 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH (mtd-www) 05/13] nand-data: remove incorrect/duplicate
 Numonyx NAND01G devices
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>	<1323173269-19931-2-git-send-email-angus.clark@st.com>	<1323173269-19931-3-git-send-email-angus.clark@st.com>	<1323173269-19931-4-git-send-email-angus.clark@st.com>	<1323173269-19931-5-git-send-email-angus.clark@st.com>
 <CAN8TOE-+7OVNiexKkP1yXYm6z5wx7dyOh0FhCkLzov8M=suVDQ@mail.gmail.com>
In-Reply-To: <CAN8TOE-+7OVNiexKkP1yXYm6z5wx7dyOh0FhCkLzov8M=suVDQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 12/07/2011 07:28 PM, Brian Norris wrote:
> On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
>> The table includes two entries for each of the following Numonyx devices:
>> NAND01GR3B2B, NAND01GW3B2B, NAND01GR4B2B, NAND01GW4B2B.  This patch removes the
>> second set since it disagrees with the datasheets I have with regards to ONFI
>> V1.0 support and the READID data.
> 
> This one's strange. I have 2 different data sheets for this part (both
> Numonyx) and I have a sample NAND that's labeled "ST Micro
> NAND01GW3B2C." The sample has ID 0x20F1001D, matching the row for
> NAND01GW3B2B which you are deleting. The chip *is* ONFI-capable, and
> yields a manufacturer/part string of "ST Micro NAND01GW3B2CN6."
> 

Yes, the "Rev C" version, NAND01GW3B2C, does support ONFI, and returns a READID
of 0x20F1001D. (Although interestingly, on my sample, it returns the "ONFI"
signature but not the parameter page - I will investigate further!).

I do not have an equivalent "Rev B" sample (ie NAND01GW3B2B), but all the
information I have suggests the "Rev B" family of devices does not support ONFI,
and the READID matches the "first" set of entries in the datasheet.

Perhaps this is a "Rev C" vs "Rev B" issue, in which case, I would suggest
applying the patch and maybe adding the "Rev C" versions to the table.  What do
you think?

Cheers,

Angus

> So I'm not sure what to say. These data sheets are old enough I can't
> find a public, updated version of the data sheet - only
> company-internal copies of varying age - and everything is complicated
> because ST Micro was bought by Numonyx, who rebranded some chips.
> 
> Unless you have a better suggestion, I might add a note instead of
> deleting. Something like:
> 
> "ST/Numonyx chips may come with varying ID, ONFI capability"
> 
> Brian
> 

-- 
-------------------------------------
Angus Clark
ST Microelectronics (R&D) Ltd.
1000 Aztec West, Bristol, BS32 4SQ
email: angus.clark@st.com
tel: +44 (0) 1454 462389
st-tina: 065 2389
-------------------------------------
