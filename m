Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RZ7Ns-0000FO-EU
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 20:49:33 +0000
Received: by wgbdt11 with SMTP id dt11so4479926wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2011 12:49:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4EE1F329.2000303@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
 <CAN8TOE8vJfTzxT2Mz4=r45w==rg2dOneGvYTNZNi_tEZD6CrPw@mail.gmail.com>
 <4EE1F329.2000303@st.com>
Date: Fri, 9 Dec 2011 12:49:30 -0800
Message-ID: <CAN8TOE9ygPxSzs0Xjd3WB70CLTd83Qbs5ZDjvWJ4T3qowJ6jsQ@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 06/13] nand-data: fix name for Samsung
 "K9XDG08U5D"
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

On Fri, Dec 9, 2011 at 3:38 AM, Angus CLARK <angus.clark@st.com> wrote:
> On 12/07/2011 07:38 PM, Brian Norris wrote:
>> On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
>>> Change Samsung "K9XDG08U5D" to "K9MDG08U5D".
>>
>> According to my data sheet, all the following are available:
>>
>> K9LBG08U0D
>> K9HCG08U1D
>> K9MDG08U5D
>> K9PDGZ8U5D
>> K9PDG08U5D
>>
>> While they use "K9XDG08U5D" to cover the last 3 chips with the same ID
>> under the "Read ID" section, with `X' as a wildcard character. So it
>> should match K9MDG08U5D, K9PDG08U5D, and K9PDGZ8U5D.
>>
>
> Ah, that makes sense, or at least for the K9MDG08U5D and K9PDG08U5D devic=
es. =A0I
> can't find much information relating to K9PDGZ8U5D - the part number deco=
der I
> have suggests this would be 'SSD' technology (rather than x8 or x16). =A0=
Can you
> shed any light on this?

Not really. I've never seen the K9PDGZ8U5D, and judging by the 'SSD',
it probably wouldn't fit into our classifications too well.

> I see the datasheet uses capital 'X' as the wildcard, but perhaps lower-c=
ase 'x'
> (or '-' as you have suggested in other replies) would be less confusing.

I'd go with lowercase 'x'

> Also, although the K9MDG08U5D and K9PDG08U5D devices are equivalent with =
respect
> to the current columns in the table, one of the later patches I submitted=
 added
> the "I/O interface" column: this is "Single" for the K9MDG08U5D device an=
d
> "Dual" for the K9PDG08U5D device.
>
> Would you object to us keeping this patch as is, and I will add K9PDG08U5=
D as a
> separate device, with "Dual" I/O?

No, I guess not. That means we leave out K9PDGZ8U5D, which is fine with me.

Brian
