Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VqxiP-00014v-9C
 for linux-mtd@lists.infradead.org; Thu, 12 Dec 2013 04:17:33 +0000
Received: by mail-pb0-f43.google.com with SMTP id rq2so11252396pbb.16
 for <linux-mtd@lists.infradead.org>; Wed, 11 Dec 2013 20:17:11 -0800 (PST)
Date: Thu, 12 Dec 2013 12:17:05 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
Message-ID: <20131212041704.GB1460@gmail.com>
References: <528DCFBD.9000905@st.com> <528DD70B.8010602@freescale.com>
 <528DE9A8.6060207@st.com> <528EBDAE.7070408@freescale.com>
 <20131204235831.GF27149@ld-irv-0074.broadcom.com>
 <20131205022025.GA24434@shlinux2.ap.freescale.net>
 <CAN8TOE8oQ05zYXj+hbCykzteM2rJC=P3wNwGS8Ey8Lj0a2XWgQ@mail.gmail.com>
 <52A05BA6.9080800@st.com>
 <20131206100220.GA16069@shlinux2.ap.freescale.net>
 <52A584D7.9030200@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52A584D7.9030200@st.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 09, 2013 at 08:52:39AM +0000, Angus Clark wrote:
> 
> > Brian doubt that some NOR can not be read out more then 5 bytes.
> 
> I believe it is always safe to over-read the READID data.  I have found that
> devices either repeat the READID, or start returning 0x00 bytes.

I will send a patch set after the spi-nor framework is merged.
This issue is a low priority now.


thanks
Huang Shijie
