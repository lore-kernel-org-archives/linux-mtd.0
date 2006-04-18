Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FVlEw-0005HF-Q3
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 04:07:22 -0400
Message-ID: <44449DFE.6040905@intel.com>
Date: Tue, 18 Apr 2006 12:06:22 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <20060406135055.BE6FA43AA1@ws5-1.us4.outblaze.com>	<200604070828.33546.h.schurig@mn-solutions.de>	<20060407081220.GE10831@localhost.localdomain>
	<4436211B.7020004@intel.com> <443638A3.1020807@inf.u-szeged.hu>
In-Reply-To: <443638A3.1020807@inf.u-szeged.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Holger Schurig <h.schurig@mn-solutions.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org
Subject: Re: Problem of "JFFS2 summary"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc Havasi wrote:
>
> You are right. It was a forgatten code. We removed it with a patch
> commited now.
>
> Thanks!
>
> Ferenc
>

Ferenc, I have just looked at Centralized summary patch. It seems it is 
good idea to add check c->mtd->block_isbad against NULL before call in 
jffs2_cs_build_filesystem_jeb() function. I understand that your patch 
at the moment is for NAND only but someone, for example, may have rootfs 
on NOR where block_isbad() method is not provided. Adding that check you 
will just get message "...cs_block is not valid..." for JFFS2 at NOR, 
otherwise Kernel panic.

.......
int jffs2_cs_build_filesystem_jeb(struct jffs2_sb_info *c)
{
int i, ret;
uint32_t offset;

for (i=0; i < CENT_SUM_RETRY_EMPTY; i++) {
offset = c->blocks[i]->offset;
if(c->mtd->block_isbad) {
if (c->mtd->block_isbad(c->mtd, offset) == 2) {
dbg_cs2("Erase block #%d (offset 0x08%x) is bad! Skip", i, offset);
continue;
}
}
.......

Thanks,
Alexander Belyakov

-------
The content of this message is my personal opinion only and although I 
am an employee of Intel, the statements I make here in no way represent 
Intel’s position on the issue
**
