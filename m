Received: from mail-ve0-x236.google.com ([2607:f8b0:400c:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoP2A-0007xP-6Q
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 02:51:22 +0000
Received: by mail-ve0-f182.google.com with SMTP id jy13so12897283veb.41
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 18:51:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131205022025.GA24434@shlinux2.ap.freescale.net>
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
 <528C8C1B.7090902@st.com> <528DC1DB.2090007@freescale.com>
 <528DCFBD.9000905@st.com> <528DD70B.8010602@freescale.com>
 <528DE9A8.6060207@st.com> <528EBDAE.7070408@freescale.com>
 <20131204235831.GF27149@ld-irv-0074.broadcom.com>
 <20131205022025.GA24434@shlinux2.ap.freescale.net>
Date: Wed, 4 Dec 2013 18:51:01 -0800
Message-ID: <CAN8TOE8oQ05zYXj+hbCykzteM2rJC=P3wNwGS8Ey8Lj0a2XWgQ@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, Angus Clark <angus.clark@st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 4, 2013 at 6:20 PM, Huang Shijie <b32955@freescale.com> wrote:
> On Wed, Dec 04, 2013 at 03:58:31PM -0800, Brian Norris wrote:
>>
>> BTW, if we update m25p80 to use 6th-byte READID, we need to double-check
>> the entries that currently use the 5-byte ID string, so they don't break
>> if we extend them implicitly.
> yes, i think we should read out more bytes of the ID.
>
> Is there any NOR that can only read out 5bytes, and can not be read out 6 bytes?

I doubt it. But I wasn't talking about "can we read 6 bytes?", but
rather "what happens when we compare 6 bytes of ID with the 5 byte IDs
in the table?". We'll have a mixture of 3-byte, 5-byte and 6-byte IDs
in our table, and we need to be careful to match properly.

Brian
