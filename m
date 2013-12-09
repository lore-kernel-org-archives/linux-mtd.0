Received: from eu1sys200aog125.obsmtp.com ([207.126.144.159])
 by merlin.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vpwah-0007XY-C1
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 08:53:24 +0000
Message-ID: <52A584D7.9030200@st.com>
Date: Mon, 9 Dec 2013 08:52:39 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
References: <528C8C1B.7090902@st.com> <528DC1DB.2090007@freescale.com>
 <528DCFBD.9000905@st.com> <528DD70B.8010602@freescale.com>
 <528DE9A8.6060207@st.com> <528EBDAE.7070408@freescale.com>
 <20131204235831.GF27149@ld-irv-0074.broadcom.com>
 <20131205022025.GA24434@shlinux2.ap.freescale.net>
 <CAN8TOE8oQ05zYXj+hbCykzteM2rJC=P3wNwGS8Ey8Lj0a2XWgQ@mail.gmail.com>
 <52A05BA6.9080800@st.com> <20131206100220.GA16069@shlinux2.ap.freescale.net>
In-Reply-To: <20131206100220.GA16069@shlinux2.ap.freescale.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Angus CLARK <angus.clark@st.com>,
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

Hi Huang,

On 12/06/2013 10:02 AM, Huang Shijie wrote:
> On Thu, Dec 05, 2013 at 10:55:34AM +0000, Angus Clark wrote:
>> static struct flash_info *__devinit fsm_jedec_probe(struct stm_spi_fsm *fsm)
>> {
>> 	uint8_t	readid[MAX_READID_LEN];
> 
> How long is the MAX_READID_LEN? 5 or 8?

At the moment, I have it set to 6 (for the Spansion 'S' generation devices).  It
just needs to be set to the maximum READID length given in the table.

> Brian doubt that some NOR can not be read out more then 5 bytes.

I believe it is always safe to over-read the READID data.  I have found that
devices either repeat the READID, or start returning 0x00 bytes.

>> 	sort(flash_types, ARRAY_SIZE(flash_types) - 1,
>> 	     sizeof(struct flash_info), cmp_flash_info_readid_len, NULL);
>>
> If we keep the flash_types table be inserted by a specific order.
> We can remove this sort code.
> 

We could do, but that relies on people adding entries in the correct order, and
the correct order in terms of the search leads to a table that is not so easy to
read -- my first version required an ordered table!  I'm easy either way though,
there are clearly benefits to having an ordered table.

Cheers,

Angus
