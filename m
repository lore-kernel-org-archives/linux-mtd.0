Received: from eu1sys200aog120.obsmtp.com ([207.126.144.149])
 by merlin.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VjS7w-0006sf-38
 for linux-mtd@lists.infradead.org; Thu, 21 Nov 2013 11:08:52 +0000
Message-ID: <528DE9A8.6060207@st.com>
Date: Thu, 21 Nov 2013 11:08:24 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>
 <528C8C1B.7090902@st.com> <528DC1DB.2090007@freescale.com>
 <528DCFBD.9000905@st.com> <528DD70B.8010602@freescale.com>
In-Reply-To: <528DD70B.8010602@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Cc: Angus CLARK <angus.clark@st.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/21/2013 09:48 AM, Huang Shijie wrote:
> 于 2013年11月21日 17:17, Angus Clark 写道:
>> No, the s25fl129p1 only supports SDR "Quad Output Read" and "Quad I/O
>> Read".  I
>> thought the M25P80_QUAD_READ flag was for the SDR operations though,
>> hence why I
>> said the m25p80 driver was not sensitive to the differences between
>> s25fl129p1
>> and s25fl128s1.  Is that not the case?
> the target of adding this item is to support the DDR quad read.
> So we should add a new item for this nor.

Assuming you a referring to the same M25P80_QUAD_READ flag as introduced by
"[PATCH] drivers: mtd: m25p80: Add quad read support.", then the flag invokes
OPCODE_QUAD_READ = 0x6b, which corresponds to the Spansion *SDR* "QOR" command.
 The DDR QUAD Read command is 0xed, "DDRQIOR" (there is no DDR equivalent of
"QOR").  So, again, I believe the m25p80 driver is not sensitive to the
differences between s25fl129p1 and s25fl128s1; the M25P80_QUAD_READ flag, as is
stands, applies equally to both.

Cheers,

Angus

-- 
-------------------------------------
Angus Clark
ST Microelectronics (R&D) Ltd.
1000 Aztec West, Bristol, BS32 4SQ
email: angus.clark@st.com
tel: +44 (0) 1454 462389
st-tina: 065 2389
-------------------------------------
