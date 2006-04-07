Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FRnnW-0001jE-Uk
	for linux-mtd@lists.infradead.org; Fri, 07 Apr 2006 06:02:42 -0400
Message-ID: <443638A3.1020807@inf.u-szeged.hu>
Date: Fri, 07 Apr 2006 12:02:11 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Alexander Belyakov <alexander.belyakov@intel.com>
References: <20060406135055.BE6FA43AA1@ws5-1.us4.outblaze.com>	<200604070828.33546.h.schurig@mn-solutions.de>	<20060407081220.GE10831@localhost.localdomain>
	<4436211B.7020004@intel.com>
In-Reply-To: <4436211B.7020004@intel.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
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

Alexander Belyakov wrote:

> I have disabled that code and got my rootfs successfully mounted with
> JFFS2_SUMMARY enabled..
>
> ...
>    if (!buf_size) {
>        buf_len = c->sector_size;
>
> #if 0
>        if (jffs2_sum_active()) {
>            /* must reread because of summary test */
>            err = jffs2_flash_read_safe(c, buf_ofs, buf_len, buf);
>            if (err)
>                return err;
>        }
> #endif
>
>    }
> ...
>
> Probably someone who is in charge of JFFS2_SUMMARY feature can
> elaborate on this.

You are right. It was a forgatten code. We removed it with a patch
commited now.

Thanks!

Ferenc
