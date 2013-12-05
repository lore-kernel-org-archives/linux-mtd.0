Received: from eu1sys200aog115.obsmtp.com ([207.126.144.139])
 by merlin.infradead.org with smtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoWbW-0005pO-9T
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 10:56:23 +0000
Message-ID: <52A05BA6.9080800@st.com>
Date: Thu, 5 Dec 2013 10:55:34 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: m25p80: add support for Spansion s25fl128s chip
References: <1384937569-23893-1-git-send-email-b32955@freescale.com>	<528C8C1B.7090902@st.com>	<528DC1DB.2090007@freescale.com>	<528DCFBD.9000905@st.com>	<528DD70B.8010602@freescale.com>	<528DE9A8.6060207@st.com>	<528EBDAE.7070408@freescale.com>	<20131204235831.GF27149@ld-irv-0074.broadcom.com>	<20131205022025.GA24434@shlinux2.ap.freescale.net>
 <CAN8TOE8oQ05zYXj+hbCykzteM2rJC=P3wNwGS8Ey8Lj0a2XWgQ@mail.gmail.com>
In-Reply-To: <CAN8TOE8oQ05zYXj+hbCykzteM2rJC=P3wNwGS8Ey8Lj0a2XWgQ@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
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

On 12/05/2013 02:51 AM, Brian Norris wrote:
> On Wed, Dec 4, 2013 at 6:20 PM, Huang Shijie <b32955@freescale.com> wrote:
>> Is there any NOR that can only read out 5bytes, and can not be read out 6 bytes?
> 
> I doubt it. But I wasn't talking about "can we read 6 bytes?", but
> rather "what happens when we compare 6 bytes of ID with the 5 byte IDs
> in the table?". We'll have a mixture of 3-byte, 5-byte and 6-byte IDs
> in our table, and we need to be careful to match properly.
> 

Just in case it is of interest, I have implemented something similar in my own
out-of-tree driver (relevant code segments below).  My 'flash_info' table
structure is a little different to m25p80, but the approach could be similar,
and it has been tested on numerous devices.

/*
 * SPI Flash Device Table
 */
struct flash_info {
	char		*name;

	/* READID data, as returned by 'FLASH_CMD_RDID' (0x9f). */
	u8		readid[MAX_READID_LEN];
	int		readid_len;

	/* The size listed here is what works with FLASH_CMD_SE, which isn't
	 * necessarily called a "sector" by the vendor.
	 */
	unsigned	sector_size;
	u16		n_sectors;

	/* FLASH device capabilities.  Note, in contrast to the other
	 * capabilities, 'FLASH_CAPS_32BITADDR' is set at probe time, based on
	 * the size of the device found.
	 */
	u32		capabilities;

	/* Maximum operating frequency.  Note, where FAST_READ is supported,
	 * freq_max specifies the FAST_READ frequency, not the READ frequency.
	 */
	u32		max_freq;

	int		(*config)(struct stm_spi_fsm *, struct flash_info *);
};

/* Device with standard 3-byte JEDEC ID */
#define JEDEC_INFO(_name, _jedec_id, _sector_size, _n_sectors,		\
		   _capabilities, _max_freq, _config)			\
	{								\
		.name = (_name),					\
		.readid[0] = ((_jedec_id) >> 16 & 0xff),		\
		.readid[1] = ((_jedec_id) >>  8 & 0xff),		\
		.readid[2] = ((_jedec_id) >>  0 & 0xff),		\
		.readid_len = 3,					\
		.sector_size = (_sector_size),				\
		.n_sectors = (_n_sectors),				\
		.capabilities = (_capabilities),			\
		.max_freq = (_max_freq),				\
		.config = (_config)					\
	}

/* Device with arbitrary-length READID */
#define RDID(...) __VA_ARGS__	/* Dummy macro to protect array argument. */
#define RDID_INFO(_name, _readid, _readid_len, _sector_size,		\
		  _n_sectors, _capabilities, _max_freq, _config)	\
	{								\
		.name = (_name),					\
		.readid = _readid,					\
		.readid_len = _readid_len,				\
		.capabilities = (_capabilities),			\
		.sector_size = (_sector_size),				\
		.n_sectors = (_n_sectors),				\
		.capabilities = (_capabilities),			\
		.max_freq = (_max_freq),				\
		.config = (_config)					\
	}


static struct flash_info __devinitdata flash_types[] = {

#define M25P_CAPS (FLASH_CAPS_READ_WRITE | FLASH_CAPS_READ_FAST)
	JEDEC_INFO("m25p40",  0x202013,  64 * 1024,   8, M25P_CAPS, 25, NULL),
	JEDEC_INFO("m25p80",  0x202014,  64 * 1024,  16, M25P_CAPS, 25, NULL),
	JEDEC_INFO("m25p16",  0x202015,  64 * 1024,  32, M25P_CAPS, 25, NULL),
	JEDEC_INFO("m25p32",  0x202016,  64 * 1024,  64, M25P_CAPS, 50, NULL),
	JEDEC_INFO("m25p64",  0x202017,  64 * 1024, 128, M25P_CAPS, 50, NULL),
	JEDEC_INFO("m25p128", 0x202018, 256 * 1024,  64, M25P_CAPS, 50, NULL),

#define M25PX_CAPS (FLASH_CAPS_READ_WRITE	| \
		    FLASH_CAPS_READ_FAST	| \
		    FLASH_CAPS_READ_1_1_2	| \
		    FLASH_CAPS_WRITE_1_1_2)
	JEDEC_INFO("m25px32", 0x207116,  64 * 1024,  64, M25PX_CAPS, 75, NULL),
	JEDEC_INFO("m25px64", 0x207117,  64 * 1024, 128, M25PX_CAPS, 75, NULL),

	/* Spansion S25FLxxxP
	 *     - 256KiB and 64KiB sector variants (identified by ext. JEDEC)
	 *     - S25FL128Px devices do not support DUAL or QUAD I/O
	 */
#define S25FLXXXP_CAPS (FLASH_CAPS_READ_WRITE	| \
			FLASH_CAPS_READ_1_1_2	| \
			FLASH_CAPS_READ_1_2_2	| \
			FLASH_CAPS_READ_1_1_4	| \
			FLASH_CAPS_READ_1_4_4	| \
			FLASH_CAPS_WRITE_1_1_4	| \
			FLASH_CAPS_READ_FAST)
	RDID_INFO("s25fl032p", RDID({0x01, 0x02, 0x15, 0x4d, 0x00}), 5,
		  64 * 1024,  64, S25FLXXXP_CAPS, 80, s25fl_config),
	RDID_INFO("s25fl128p1", RDID({0x01, 0x20, 0x18, 0x03, 0x00}), 5,
		  256 * 1024, 64,
		 (FLASH_CAPS_READ_WRITE | FLASH_CAPS_READ_FAST), 104, NULL),
	RDID_INFO("s25fl128p0", RDID({0x01, 0x20, 0x18, 0x03, 0x01}), 5,
		  64 * 1024, 256,
		  (FLASH_CAPS_READ_WRITE | FLASH_CAPS_READ_FAST), 104, NULL),
	RDID_INFO("s25fl129p0", RDID({0x01, 0x20, 0x18, 0x4d, 0x00}), 5,
		  256 * 1024,  64, S25FLXXXP_CAPS, 80, sstatic int
cmp_flash_info_readid_len(const void *a, const void *b)
{
	return ((struct flash_info *)b)->readid_len -
		((struct flash_info *)a)->readid_len;
}
25fl_config),
	RDID_INFO("s25fl129p1", RDID({0x01, 0x20, 0x18, 0x4d, 0x01}), 5,
		  64 * 1024, 256, S25FLXXXP_CAPS, 80, s25fl_config),

	/* Spansion S25FLxxxS
	 *     - 256KiB and 64KiB sector variants (identified by ext. JEDEC)
	 *     - RESET# signal supported by die but not bristled out on all
	 *       package types.  The package type is a function of board design,
	 *       so this information is captured in the board's capabilities.
	 *     - Supports 'DYB' sector protection. Depending on variant, sectors
	 *       may default to locked state on power-on.
	 *     - S25FL127Sx handled as S25FL128Sx
	 */
#define S25FLXXXS_CAPS (S25FLXXXP_CAPS		| \
			FLASH_CAPS_RESET	| \
			FLASH_CAPS_DYB_LOCKING)
	RDID_INFO("s25fl128s0", RDID({0x01, 0x20, 0x18, 0x4d, 0x00, 0x80}), 6,
		  256 * 1024, 64, S25FLXXXS_CAPS, 80, s25fl_config),
	RDID_INFO("s25fl128s1", RDID({0x01, 0x20, 0x18, 0x4d, 0x01, 0x80}), 6,
		  64 * 1024, 256, S25FLXXXS_CAPS, 80, s25fl_config),
	RDID_INFO("s25fl256s0", RDID({0x01, 0x02, 0x19, 0x4d, 0x00, 0x80}), 6,
		  256 * 1024, 128, S25FLXXXS_CAPS, 80, s25fl_config),
	RDID_INFO("s25fl256s1", RDID({0x01, 0x02, 0x19, 0x4d, 0x01, 0x80}), 6,
		  64 * 1024, 512, S25FLXXXS_CAPS, 80, s25fl_config),

	{ },
};

static int cmp_flash_info_readid_len(const void *a, const void *b)
{
	return ((struct flash_info *)b)->readid_len -
		((struct flash_info *)a)->readid_len;
}

static struct flash_info *__devinit fsm_jedec_probe(struct stm_spi_fsm *fsm)
{
	uint8_t	readid[MAX_READID_LEN];
	char readid_str[MAX_READID_LEN * 3 + 1];
	struct flash_info *info;

	if (fsm_read_jedec(fsm, readid) != 0) {
		dev_info(fsm->dev, "error reading JEDEC ID\n");
		return NULL;
	}

	hex_dump_to_buffer(readid, MAX_READID_LEN, 16, 1,
			   readid_str, sizeof(readid_str), 0);

	dev_dbg(fsm->dev, "READID = %s\n", readid_str);

	/* The 'readid' may match multiple entries in the table.  To ensure we
	 * retrieve the most specific match, the table is sorted in order of
	 * 'readid_len'.
	 */
	sort(flash_types, ARRAY_SIZE(flash_types) - 1,
	     sizeof(struct flash_info), cmp_flash_info_readid_len, NULL);

	for (info = flash_types; info->name; info++) {
		if (memcmp(info->readid, readid, info->readid_len) == 0)
			return info;
	}

	dev_err(fsm->dev, "Unrecognized READID [%s]\n", readid_str);

	return NULL;
}

Cheers,

Angus
