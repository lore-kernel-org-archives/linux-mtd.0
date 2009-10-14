Subject: Re: [PATCH] MTD: Add nand_ecc test module
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
In-Reply-To: <20091013095836.GA3166@localhost.localdomain>
References: <1255082095-22158-1-git-send-email-akinobu.mita@gmail.com>
	<1255268381.16942.74.camel@localhost>
	<20091013095836.GA3166@localhost.localdomain>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 14 Oct 2009 18:41:52 +0300
Message-Id: <1255534912.32489.172.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-10-13 at 18:58 +0900, Akinobu Mita wrote:
> > This should not be needed. MTD tests are always compiled as modules,
> > so you should not have copilation errors. And if MTD NAND support is
> > not present, modprobe will just fail.
> 
> nand_calculate_ecc and nand_correct_data needs CONFIG_MTD_NAND=y|m,
> otherwise it will get link error:
> 
> ERROR: "__nand_correct_data" [drivers/mtd/tests/nand_ecc-test.ko] undefined!
> ERROR: "__nand_calculate_ecc" [drivers/mtd/tests/nand_ecc-test.ko] undefined!

How about splitting tests on 2 parts - one part which does not require
NAND, and one which does, and make the second part compile only if NAND
is enabled ("depends" operator in Kconfig) ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
