Received: from co1ehsobe006.messaging.microsoft.com ([216.32.180.189]
 helo=co1outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VosfH-0001HR-CC
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 10:29:44 +0000
Date: Fri, 6 Dec 2013 18:02:22 +0800
From: Huang Shijie <b32955@freescale.com>
To: Angus Clark <angus.clark@st.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
Message-ID: <20131206100220.GA16069@shlinux2.ap.freescale.net>
References: <528C8C1B.7090902@st.com> <528DC1DB.2090007@freescale.com>
 <528DCFBD.9000905@st.com> <528DD70B.8010602@freescale.com>
 <528DE9A8.6060207@st.com> <528EBDAE.7070408@freescale.com>
 <20131204235831.GF27149@ld-irv-0074.broadcom.com>
 <20131205022025.GA24434@shlinux2.ap.freescale.net>
 <CAN8TOE8oQ05zYXj+hbCykzteM2rJC=P3wNwGS8Ey8Lj0a2XWgQ@mail.gmail.com>
 <52A05BA6.9080800@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <52A05BA6.9080800@st.com>
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 05, 2013 at 10:55:34AM +0000, Angus Clark wrote:
> static struct flash_info *__devinit fsm_jedec_probe(struct stm_spi_fsm *fsm)
> {
> 	uint8_t	readid[MAX_READID_LEN];

How long is the MAX_READID_LEN? 5 or 8?

Brian doubt that some NOR can not be read out more then 5 bytes.

> 	char readid_str[MAX_READID_LEN * 3 + 1];
> 	struct flash_info *info;
> 
> 	if (fsm_read_jedec(fsm, readid) != 0) {
> 		dev_info(fsm->dev, "error reading JEDEC ID\n");
> 		return NULL;
> 	}
> 
> 	hex_dump_to_buffer(readid, MAX_READID_LEN, 16, 1,
> 			   readid_str, sizeof(readid_str), 0);
> 
> 	dev_dbg(fsm->dev, "READID = %s\n", readid_str);
> 
> 	/* The 'readid' may match multiple entries in the table.  To ensure we
> 	 * retrieve the most specific match, the table is sorted in order of
> 	 * 'readid_len'.
> 	 */
> 	sort(flash_types, ARRAY_SIZE(flash_types) - 1,
> 	     sizeof(struct flash_info), cmp_flash_info_readid_len, NULL);
> 
If we keep the flash_types table be inserted by a specific order.
We can remove this sort code.

> 	for (info = flash_types; info->name; info++) {
> 		if (memcmp(info->readid, readid, info->readid_len) == 0)
> 			return info;
> 	}
> 

thanks
Huang Shijie
