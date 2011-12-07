Received: from mail-fx0-f49.google.com ([209.85.161.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYNA8-0003u7-Hh
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 19:28:18 +0000
Received: by fabs1 with SMTP id s1so368566fab.36
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 11:28:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323173269-19931-5-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <1323173269-19931-3-git-send-email-angus.clark@st.com>
 <1323173269-19931-4-git-send-email-angus.clark@st.com>
 <1323173269-19931-5-git-send-email-angus.clark@st.com>
Date: Wed, 7 Dec 2011 11:28:14 -0800
Message-ID: <CAN8TOE-+7OVNiexKkP1yXYm6z5wx7dyOh0FhCkLzov8M=suVDQ@mail.gmail.com>
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

On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
> The table includes two entries for each of the following Numonyx devices:
> NAND01GR3B2B, NAND01GW3B2B, NAND01GR4B2B, NAND01GW4B2B. =A0This patch rem=
oves the
> second set since it disagrees with the datasheets I have with regards to =
ONFI
> V1.0 support and the READID data.

This one's strange. I have 2 different data sheets for this part (both
Numonyx) and I have a sample NAND that's labeled "ST Micro
NAND01GW3B2C." The sample has ID 0x20F1001D, matching the row for
NAND01GW3B2B which you are deleting. The chip *is* ONFI-capable, and
yields a manufacturer/part string of "ST Micro NAND01GW3B2CN6."

So I'm not sure what to say. These data sheets are old enough I can't
find a public, updated version of the data sheet - only
company-internal copies of varying age - and everything is complicated
because ST Micro was bought by Numonyx, who rebranded some chips.

Unless you have a better suggestion, I might add a note instead of
deleting. Something like:

"ST/Numonyx chips may come with varying ID, ONFI capability"

Brian
