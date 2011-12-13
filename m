Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RaTI1-0003Cu-DY
 for linux-mtd@lists.infradead.org; Tue, 13 Dec 2011 14:25:06 +0000
Message-ID: <4EE7602F.30508@st.com>
Date: Tue, 13 Dec 2011 14:24:47 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH (mtd-www) 05/13] nand-data: remove incorrect/duplicate
 Numonyx NAND01G devices
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <CAN8TOE-+7OVNiexKkP1yXYm6z5wx7dyOh0FhCkLzov8M=suVDQ@mail.gmail.com>
 <4EE1EB20.4070001@st.com>
 <CAN8TOE-Mxy1G0LjuqRfO-w1tdESuaDrJ5w=3o68r9C=YfgZ=gg@mail.gmail.com>
In-Reply-To: <CAN8TOE-Mxy1G0LjuqRfO-w1tdESuaDrJ5w=3o68r9C=YfgZ=gg@mail.gmail.com>
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

On 12/09/2011 09:14 PM, Brian Norris wrote:
> On Fri, Dec 9, 2011 at 3:04 AM, Angus CLARK <angus.clark@st.com> wrote:
>> On 12/07/2011 07:28 PM, Brian Norris wrote:
>>> On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
>>>> The table includes two entries for each of the following Numonyx devices:
>>>> NAND01GR3B2B, NAND01GW3B2B, NAND01GR4B2B, NAND01GW4B2B.  This patch removes the
>>>> second set since it disagrees with the datasheets I have with regards to ONFI
>>>> V1.0 support and the READID data.
>>>
>>> This one's strange. I have 2 different data sheets for this part (both
>>> Numonyx) and I have a sample NAND that's labeled "ST Micro
>>> NAND01GW3B2C." The sample has ID 0x20F1001D, matching the row for
>>> NAND01GW3B2B which you are deleting. The chip *is* ONFI-capable, and
>>> yields a manufacturer/part string of "ST Micro NAND01GW3B2CN6."
>>>
>>
>> Yes, the "Rev C" version, NAND01GW3B2C, does support ONFI, and returns a READID
>> of 0x20F1001D. (Although interestingly, on my sample, it returns the "ONFI"
>> signature but not the parameter page - I will investigate further!).
> 
> My chip (branded ST) is rev. C and it returns the signature and
> parameter page properly.
> 
>> I do not have an equivalent "Rev B" sample (ie NAND01GW3B2B), but all the
>> information I have suggests the "Rev B" family of devices does not support ONFI,
>> and the READID matches the "first" set of entries in the datasheet.
>>
>> Perhaps this is a "Rev C" vs "Rev B" issue, in which case, I would suggest
>> applying the patch and maybe adding the "Rev C" versions to the table.  What do
>> you think?
> 
> I don't think that's quite right. I'll explain:
> 
> (1) I have two datasheets for this part, with *different* revision
> histories (they don't even have the same origin date)
> (2) The first sheet includes Rev. B and Rev. C information, supposedly

Would you be able to email a copy of the datasheet that covers both NAND01GW3B2B
and NAND01GW3B2C devices?  I have several datasheets for each separately, but
none that covers both.

> (3) The second sheet includes Rev. C only
> (4) The entries you deleted were from the second sheet and probably
> should have been labeled Rev. C, not Rev. B - the datasheet was
> inconsistent.

Yes, that makes sense, and is what I was meant when I suggested it was a "Rev C"
vs "Rev B" issue.  I believe the data corresponds to NAND01GW3B2C rather than
NAND01GW3B2B.  My patch deleted this entry, since a correct NAND01GW3B2B already
existed, and I then suggested adding a correct entry for NAND01GW3B2C.  Perhaps
we just update the patch to rename the incorrect NAND01GW3B2B entry with
NAND01GW3B2C?

> (5) My sample part (ST NAND01GW3B2C) returns proper ONFI signature and
> parameter page
> (6) My sample part (ST NAND01GW3B2C) reads an actual ID that matches
> the string from the NAND01GW3B2B that you are deleting (this is a
> mixup/typo; see comment (4))
> 
> I'm not sure how to reconcile the histories from (1). Perhaps my 1st
> sheet represents *only* Rev. B and the second sheet represents *only*
> Rev. C?

That would be my guess, but anything is possible when it comes to NAND datasheets!

> 
> If my statements aren't clear enough, I'll send a sample patch that
> would 'reconcile' things a bit.
> 
> BTW, what's the ID string from your sample?
> 

My sample returns a READID of 0x20f1001d.  It returns the 'ONFI' signature from
READID to 0x20, but I still fail to get anything back from NAND_CMD_PARAM.  I
suspect it is a bug in my driver somewhere, but I haven't had a chance to look
into it further yet.

> Any thoughts on the ST vs. Numonyx naming? Are they entirely
> interchangeable names for these chips, where you may find similar/same
> parts with different manufacturers slapped on? (seeing as I have an ST
> part that matches a Numonyx data sheet)
> 

Yes, when Numonyx was spun-out from ST, the datasheets were re-branded but the
actual chip packages still used the ST logo, and the ST JEDEC ID (and ST fabs I
believe).  Numonyx has now been brought by Micron, and it seems Micron are only
offering "Numonyx" parts that do not clash with its own portfolio.

Cheers,

Angus
