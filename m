Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eNG0q-0001BV-BG
 for linux-mtd@lists.infradead.org; Fri, 08 Dec 2017 10:36:43 +0000
Date: Fri, 8 Dec 2017 11:35:50 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 kernel@pengutronix.de, Han Xu <han.xu@nxp.com>
Subject: Re: [PATCH 02/10] mtd: nand: gpmi: Utilize hardware to detect
 bitflips in erased blocks
Message-ID: <20171208113550.3cfdf4e5@bbrezillon>
In-Reply-To: <20171208102157.vwmy3jmaoiiy6255@pengutronix.de>
References: <20171206091925.5810-1-s.hauer@pengutronix.de>
 <20171206091925.5810-3-s.hauer@pengutronix.de>
 <20171206102713.47d2fdbe@bbrezillon>
 <20171206152804.u62dopc6mwwdz457@pengutronix.de>
 <20171206163431.5fddd6c6@bbrezillon>
 <20171208102157.vwmy3jmaoiiy6255@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 8 Dec 2017 11:21:57 +0100
Sascha Hauer <s.hauer@pengutronix.de> wrote:

> On Wed, Dec 06, 2017 at 04:34:31PM +0100, Boris Brezillon wrote:
> > On Wed, 6 Dec 2017 16:28:04 +0100
> > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> >   
> > > On Wed, Dec 06, 2017 at 10:27:13AM +0100, Boris Brezillon wrote:  
> > > > Hi Sascha,
> > > > 
> > > > On Wed,  6 Dec 2017 10:19:17 +0100
> > > > Sascha Hauer <s.hauer@pengutronix.de> wrote:
> > > >     
> > > > > The GPMI nand has a hardware feature to ignore bitflips in erased pages.
> > > > > Use this feature rather than the longish code we have now.
> > > > > Unfortunately the bitflips in erased pages are not corrected, so we have
> > > > > to memset the read data before passing it to the upper layers.    
> > > > 
> > > > There's a good reason we didn't use the HW bitflip detection in the
> > > > first place: we currently have no way to report the number of corrected
> > > > bitflips in an erased page, and that's a big problem, because then UBI
> > > > does not know when it should re-erase the block.    
> > > 
> > > Ah, ok.
> > >   
> > > > 
> > > > Maybe we missed something when the initial proposal was done and
> > > > there's actually a way to retrieve this information, but if that's not
> > > > the case, I'd prefer to keep the existing implementation even if it's
> > > > slower and more verbose.    
> > > 
> > > I'm not so much concerned about the verbosity of the code but rather
> > > about the magic it has inside. I have stared at this code for some time
> > > now and still only vaguely know what it does.
> > > 
> > > We could do a bit better: We can still detect the number of bitflips
> > > using nand_check_erased_ecc_chunk() without reading the oob data.
> > > That would not be 100% accurate since we do not take the oob data into
> > > account which might have bitflips aswell, but still should be good
> > > enough, no?  
> > 
> > Nope, we really have to take OOB bytes into account when counting
> > bitflips. Say that you have almost all in-band data set to 0xff, but
> > all OOB bytes reserved for ECC are set to 0 because someone decided to
> > write this portion of the page in raw mode. In this case we can't
> > consider the page as empty, otherwise we'll fail to correctly write ECC
> > bytes next time we program the page.  
> 
> I would probably be with you if at least the current code worked correctly,
> but unfortunately it doesn't.
> 
> I did a test with the attached program. What it does is that it writes
> pages nearly full of 0xff in raw mode. In the first page the first byte
> is exchanged with a bitflip, in the second page the second byte is
> exchanged with a bitflip, and so on. What I would expect that the number
> of corrected bits is the same for all bitflip positions. What I get
> instead is this:
> 
> ./a.out /dev/mtd4 0x0f
> byteno: 0x00000000 corrected: 5 failed: 0
> byteno: 0x00000001 corrected: 4 failed: 0
> byteno: 0x00000002 corrected: 5 failed: 0
> byteno: 0x00000003 corrected: 6 failed: 0
> byteno: 0x00000004 corrected: 5 failed: 0
> byteno: 0x00000005 corrected: 5 failed: 0
> byteno: 0x00000006 corrected: 4 failed: 0
> byteno: 0x00000007 corrected: 5 failed: 0
> byteno: 0x00000008 corrected: 5 failed: 0
> byteno: 0x00000009 corrected: 4 failed: 0
> ...
> 
> (Read this as: byteno <x> in page has 0x0f instead of 0xff, so number
> of corrected bits should be 4, instead we have 5)
> 
> or:
> ./a.out /dev/mtd4 0xfe
> byteno: 0x00000000 corrected: 1 failed: 0
> byteno: 0x00000001 corrected: 1 failed: 0
> byteno: 0x00000002 corrected: 1 failed: 0
> byteno: 0x00000003 corrected: 1 failed: 0
> byteno: 0x00000004 corrected: 1 failed: 0
> byteno: 0x00000005 corrected: 1 failed: 0
> byteno: 0x00000006 corrected: 1 failed: 0
> byteno: 0x00000007 corrected: 1 failed: 0
> byteno: 0x00000008 corrected: 1 failed: 0
> byteno: 0x00000009 corrected: 1 failed: 0
> byteno: 0x0000000a corrected: 1 failed: 0
> byteno: 0x0000000b corrected: 1 failed: 0
> byteno: 0x0000000c corrected: 1 failed: 0
> byteno: 0x0000000d corrected: 1 failed: 0
> byteno: 0x0000000e corrected: 2 failed: 0
> byteno: 0x0000000f corrected: 1 failed: 0
> byteno: 0x00000010 corrected: 1 failed: 0
> byteno: 0x00000011 corrected: 1 failed: 0
> byteno: 0x00000012 corrected: 2 failed: 0
> byteno: 0x00000013 corrected: 1 failed: 0
> 
> When I add a print_hex_dump to the driver I really see a buffer
> with 5 bytes flipped instead of 4. When I do a raw read of the
> page (under barebox, the Linux driver doesn't print the OOB data
> properly), then I really see what I have written: A page with four
> bitflips. The results are perfectly reproducable, so I don't expect
> that to be any random read failures.

Wow, that's really weird.

> 
> I know next to nothing about BCH, but could it be that the BCH engine
> already starts correcting the page while it still doesn't know that
> it can't be corrected at all leaving spurious cleared bits in the
> read data?

Bitflips are not supposed to be fixed by the BCH engine if an
uncorrectable error is detected. BCH is operating on a block of data
(usually 512 or 1024 bytes), and before starting to fix actual errors,
it searches their positions, and their positions is only determined
after the correctable/uncorrectable check has been done, so really, I
doubt BCH can mess up you data.

Did you find out where the extra bitflip is? Is it next to the other
bitflips or in a totally different region?

> 
> Sascha
> 
> -------------------------------8<-------------------------------
> 
> #include <stdio.h>
> #include <sys/types.h>
> #include <sys/stat.h>
> #include <fcntl.h>
> #include <unistd.h>
> #include <stdlib.h>
> #include <mtd/mtd-abi.h>
> #include <sys/ioctl.h>
> #include <stdint.h>
> #include <string.h>
> 
> int fd;
> uint8_t *buf;
> uint8_t byte;
> 
> void erase_block(void)
> {
> 	struct erase_info_user req = {
> 		.start = 0,
> 		.length = 128 * 1024,
> 	};
> 	int ret;
> 
> 	ret = ioctl(fd, MEMERASE, &req);
> 	if (ret != 0) {
> 		perror("ioctl");
> 		exit (1);
> 	}
> }
> 
> void get_stats(unsigned int *__corrected, unsigned int *__failed)
> {
> 	struct mtd_ecc_stats stats;
> 	static unsigned int corrected, failed;
> 	int ret;
> 
> 	ret = ioctl(fd, ECCGETSTATS, &stats);
> 	if (ret != 0) {
> 		perror("ioctl");
> 		exit (1);
>  	}
> 
> 	*__corrected = stats.corrected - corrected;
> 	*__failed = stats.failed - failed;
> 
> 	corrected = stats.corrected;
> 	failed = stats.failed;
> }
> 
> void wr_pages(int startbyte)
> {
> 	struct mtd_write_req req = {
> 		.start = 0,
> 		.len = 2048,
> 		.ooblen = 64,
> 		.usr_data = (__u64)(unsigned long)buf,
> 		.usr_oob = (__u64)(unsigned long)(buf + 2048),
> 		.mode = MTD_OPS_RAW,
> 	};
> 	unsigned int corrected, failed;
> 	int i, ret;
> 
> 	erase_block();
> 
> 	for (i = 0; i < 64; i++) {
> 		memset(buf, 0xff, 2112);
> 
> 		buf[i + startbyte] = byte;
> 
> 		req.start = i * 2048;
> 
> 		ret = ioctl(fd, MEMWRITE, &req);
> 		if (ret != 0) {
> 			perror("ioctl");
> 			exit(1);
> 		}
> 	}
> 
> 	lseek(fd, 0, SEEK_SET);
> 
> 	for (i = 0; i < 64; i++) {
> 		int j;
> 
> 		ret = read(fd, buf, 2048);
> 		if (ret < 2048) {
> 			perror("read");
> 			exit(1);
> 		}
> 
> 		get_stats(&corrected, &failed);
> 		printf("byteno: 0x%08x corrected: %d failed: %d\n", i + startbyte, corrected, failed);
> 
> 		for (j = 0; j < 2048; j++) {
> 			if (buf[j] != 0xff) {
> 				printf("swapped: 0x%08x notff: 0x%08x instead: 0x%02x\n",
> 				       startbyte + i, j, buf[j]);
> 			}
> 		}
> 	}
> }
> 
> int main(int argc, char *argv[])
> {
> 	int i;
> 	unsigned int c, f;
> 
> 	if (argc < 3) {
> 		printf("usage: %s <mtd> <byte>\n", argv[0]);
> 		exit (1);
> 	}
> 
> 	byte = strtoul(argv[2], NULL, 0);
> 
> 	fd = open(argv[1], O_RDWR);
> 	if (fd < 0) {
> 		perror("open");
> 		exit(1);
> 	}
> 
> 	get_stats(&c, &f);
> 
> 	buf = malloc(2112);
> 
> 	for (i = 0; i < 0x840; i+= 64)
> 		wr_pages(i);
> 
> 	exit(0);
> }
