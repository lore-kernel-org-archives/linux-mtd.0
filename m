Received: from eu1sys200aog117.obsmtp.com ([207.126.144.143])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYymQ-0002YA-55
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 11:38:18 +0000
Message-ID: <4EE1F329.2000303@st.com>
Date: Fri, 09 Dec 2011 11:38:17 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH (mtd-www) 06/13] nand-data: fix name for Samsung
 "K9XDG08U5D"
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
 <1323173269-19931-6-git-send-email-angus.clark@st.com>
 <CAN8TOE8vJfTzxT2Mz4=r45w==rg2dOneGvYTNZNi_tEZD6CrPw@mail.gmail.com>
In-Reply-To: <CAN8TOE8vJfTzxT2Mz4=r45w==rg2dOneGvYTNZNi_tEZD6CrPw@mail.gmail.com>
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

On 12/07/2011 07:38 PM, Brian Norris wrote:
> On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
>> Change Samsung "K9XDG08U5D" to "K9MDG08U5D".
> 
> According to my data sheet, all the following are available:
> 
> K9LBG08U0D
> K9HCG08U1D
> K9MDG08U5D
> K9PDGZ8U5D
> K9PDG08U5D
> 
> While they use "K9XDG08U5D" to cover the last 3 chips with the same ID
> under the "Read ID" section, with `X' as a wildcard character. So it
> should match K9MDG08U5D, K9PDG08U5D, and K9PDGZ8U5D.
> 

Ah, that makes sense, or at least for the K9MDG08U5D and K9PDG08U5D devices.  I
can't find much information relating to K9PDGZ8U5D - the part number decoder I
have suggests this would be 'SSD' technology (rather than x8 or x16).  Can you
shed any light on this?

I see the datasheet uses capital 'X' as the wildcard, but perhaps lower-case 'x'
(or '-' as you have suggested in other replies) would be less confusing.

Also, although the K9MDG08U5D and K9PDG08U5D devices are equivalent with respect
to the current columns in the table, one of the later patches I submitted added
the "I/O interface" column: this is "Single" for the K9MDG08U5D device and
"Dual" for the K9PDG08U5D device.

Would you object to us keeping this patch as is, and I will add K9PDG08U5D as a
separate device, with "Dual" I/O?

Cheers,

Angus
