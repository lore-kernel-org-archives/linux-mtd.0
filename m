Received: from eu1sys200aog114.obsmtp.com ([207.126.144.137])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYvvh-0006dF-Tt
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 08:35:42 +0000
Message-ID: <4EE1C855.5040001@st.com>
Date: Fri, 09 Dec 2011 08:35:33 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH (mtd-www) 02/13] nand-data: updates to S30ML-P devices
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <CAN8TOE9=Yh=pZkX3DePEwpnjZwqODwc-JLCSYkF_bKt5GzF4=A@mail.gmail.com>
In-Reply-To: <CAN8TOE9=Yh=pZkX3DePEwpnjZwqODwc-JLCSYkF_bKt5GzF4=A@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: gernot.hoyler@spansion.com, Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On 12/07/2011 06:49 PM, Brian Norris wrote:
> On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
>> Updates to Spansion S30ML-P devices:
>>        - expand names to differentiate between x8 and x16 devices
> 
> Expanding the names is probably good, but I don't really like the
> "-FI{00,50}" piece. There are a few places where I used a wildcard in
> the table to represent "don't care" characters. I think a lower-case
> `x' might make sense, for example:
> 
> S30ML512P30-FIx0
> S30ML512P50-FIx1
> S30ML256P30-FIx0
> ...
> 

Yes, agreed.  Will update the patch (and see comments below).

> 
>>        - fix ID 5th byte: 0x01 to 0x10 (checked with datasheet; seems regression
>>          introduced as part of commit 165cfaa9cdb1054bbafa98f24f179c6aa101fbe6
>>          "nand-data: remove asterisks")
> 
> Hmm, not exactly a regression, but I overlooked it when merging in
> changes to my local table. In fact, I have a data sheet that lists the
> ID with 0x01, but it may be out of date. It's hard to find a current
> one from Spansion's website, although a random copy I found off a
> third party site confirms your given string, I think. Then, there's a
> posting from Gernot Hoyler last year that gives this sample string.
> It's slightly different (at id_data[2]):
> 
>    id_data[0]=0x01
>    id_data[1]=0x56
>    id_data[2]=0x00
>    id_data[3]=0x01
>    id_data[4]=0x10
>    id_data[5]=0x00
>    id_data[6]=0x00
>    id_data[7]=0x00
> 
> I'm thinking:
> 
> id_data[2] = 0x00 or 0x01, depending on model as stated in data sheet.
> I just ignored the 0x00 option.
> id_data[4] = 0x10
> 

The datasheet I have is Rev 3.0 (April 8, 2008).  According to the revision
history, id_data[4] was updated in Rev 2.0.  Would this fit your datasheet?

id_data[2] is 0x01 for the "ECC-free/0% bad blocks" device, and 0x00 for the
"ECC required/2% bad blocks" model.  This "Notes" column already mentions this.

> Anyway, it may be apparent by now that I don't actually have a sample
> of this chip myself. I'll go with whoever has a current data sheet
> and/or actual chip.
> 

I haven't tested one myself either - I will see if we have any samples lying
around, but I suspect not...

Cheers,

Angus
