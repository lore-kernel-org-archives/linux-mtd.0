Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RZ7m3-0002OZ-3T
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 21:14:31 +0000
Received: by wgbdt11 with SMTP id dt11so4508685wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2011 13:14:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4EE1EB20.4070001@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <CAN8TOE-+7OVNiexKkP1yXYm6z5wx7dyOh0FhCkLzov8M=suVDQ@mail.gmail.com>
 <4EE1EB20.4070001@st.com>
Date: Fri, 9 Dec 2011 13:14:29 -0800
Message-ID: <CAN8TOE-Mxy1G0LjuqRfO-w1tdESuaDrJ5w=3o68r9C=YfgZ=gg@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 05/13] nand-data: remove incorrect/duplicate
 Numonyx NAND01G devices
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 9, 2011 at 3:04 AM, Angus CLARK <angus.clark@st.com> wrote:
> On 12/07/2011 07:28 PM, Brian Norris wrote:
>> On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
>>> The table includes two entries for each of the following Numonyx device=
s:
>>> NAND01GR3B2B, NAND01GW3B2B, NAND01GR4B2B, NAND01GW4B2B. =A0This patch r=
emoves the
>>> second set since it disagrees with the datasheets I have with regards t=
o ONFI
>>> V1.0 support and the READID data.
>>
>> This one's strange. I have 2 different data sheets for this part (both
>> Numonyx) and I have a sample NAND that's labeled "ST Micro
>> NAND01GW3B2C." The sample has ID 0x20F1001D, matching the row for
>> NAND01GW3B2B which you are deleting. The chip *is* ONFI-capable, and
>> yields a manufacturer/part string of "ST Micro NAND01GW3B2CN6."
>>
>
> Yes, the "Rev C" version, NAND01GW3B2C, does support ONFI, and returns a =
READID
> of 0x20F1001D. (Although interestingly, on my sample, it returns the "ONF=
I"
> signature but not the parameter page - I will investigate further!).

My chip (branded ST) is rev. C and it returns the signature and
parameter page properly.

> I do not have an equivalent "Rev B" sample (ie NAND01GW3B2B), but all the
> information I have suggests the "Rev B" family of devices does not suppor=
t ONFI,
> and the READID matches the "first" set of entries in the datasheet.
>
> Perhaps this is a "Rev C" vs "Rev B" issue, in which case, I would sugges=
t
> applying the patch and maybe adding the "Rev C" versions to the table. =
=A0What do
> you think?

I don't think that's quite right. I'll explain:

(1) I have two datasheets for this part, with *different* revision
histories (they don't even have the same origin date)
(2) The first sheet includes Rev. B and Rev. C information, supposedly
(3) The second sheet includes Rev. C only
(4) The entries you deleted were from the second sheet and probably
should have been labeled Rev. C, not Rev. B - the datasheet was
inconsistent.
(5) My sample part (ST NAND01GW3B2C) returns proper ONFI signature and
parameter page
(6) My sample part (ST NAND01GW3B2C) reads an actual ID that matches
the string from the NAND01GW3B2B that you are deleting (this is a
mixup/typo; see comment (4))

I'm not sure how to reconcile the histories from (1). Perhaps my 1st
sheet represents *only* Rev. B and the second sheet represents *only*
Rev. C?

If my statements aren't clear enough, I'll send a sample patch that
would 'reconcile' things a bit.

BTW, what's the ID string from your sample?

Any thoughts on the ST vs. Numonyx naming? Are they entirely
interchangeable names for these chips, where you may find similar/same
parts with different manufacturers slapped on? (seeing as I have an ST
part that matches a Numonyx data sheet)

Brian
