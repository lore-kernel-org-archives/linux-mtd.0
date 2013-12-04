Received: from mail-ie0-x233.google.com ([2607:f8b0:4001:c03::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoMLK-0005Ep-6S
 for linux-mtd@lists.infradead.org; Wed, 04 Dec 2013 23:58:58 +0000
Received: by mail-ie0-f179.google.com with SMTP id x13so27182588ief.24
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 15:58:35 -0800 (PST)
Date: Wed, 4 Dec 2013 15:58:31 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
Message-ID: <20131204235831.GF27149@ld-irv-0074.broadcom.com>
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
 <528C8C1B.7090902@st.com> <528DC1DB.2090007@freescale.com>
 <528DCFBD.9000905@st.com> <528DD70B.8010602@freescale.com>
 <528DE9A8.6060207@st.com> <528EBDAE.7070408@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <528EBDAE.7070408@freescale.com>
Cc: Marek Vasut <marex@denx.de>, Angus Clark <angus.clark@st.com>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Leaving Huang's email intact, since it was in HTML format and didn't
make it through the list's filter; Huang, you really need to fix this.)

On Fri, Nov 22, 2013 at 10:13:02AM +0800, Huang Shijie wrote:
> 于 2013年11月21日 19:08, Angus Clark 写道:
> 
>     Assuming you a referring to the same M25P80_QUAD_READ flag as introduced by
>     "[PATCH] drivers: mtd: m25p80: Add quad read support.", then the flag invokes
>     OPCODE_QUAD_READ = 0x6b, which corresponds to the Spansion *SDR* "QOR" command.
>      The DDR QUAD Read command is 0xed, "DDRQIOR" (there is no DDR equivalent of
>     "QOR").  So, again, I believe the m25p80 driver is not sensitive to the
>     differences between s25fl129p1 and s25fl128s1; the M25P80_QUAD_READ flag, as is
>     stands, applies equally to both.
> 
> The current m25p80 is not sensitive, but i am changing the this driver now.
> In the future, it should support the DDR QUAD READ. this patch is just making
> preparation for
> the DDR QUAD read.
> 
> And I will submit a patch to read out the 6th READID to distinguish the two
> different NOR.

So to be clear, this patch can't go in as-is.

BTW, if we update m25p80 to use 6th-byte READID, we need to double-check
the entries that currently use the 5-byte ID string, so they don't break
if we extend them implicitly.

Brian
