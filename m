Subject: Re: [PATCH 3/3 -v3] MTD: Add nand_ecc test module
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Akinobu Mita <akinobu.mita@gmail.com>
In-Reply-To: <1256114044-12163-3-git-send-email-akinobu.mita@gmail.com>
References: <>  <1256114044-12163-3-git-send-email-akinobu.mita@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 21 Oct 2009 11:51:35 +0300
Message-Id: <1256115095.29856.338.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	vimal singh <vimal.newwork@gmail.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-10-21 at 17:34 +0900, Akinobu Mita wrote:
> This module tests NAND ECC functions.
> 
> The test is simple.
> 
> 1. Create a 256 or 512 bytes block of data filled with random bytes (data)
> 2. Duplicate the data block and inject single bit error (error_data)
> 3. Try to correct error_data
> 4. Compare data and error_data
> 
> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> Cc: vimal singh <vimal.newwork@gmail.com>
> ---
>  drivers/mtd/tests/Makefile        |    1 +
>  drivers/mtd/tests/nand_ecc-test.c |   87 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 88 insertions(+), 0 deletions(-)
>  create mode 100644 drivers/mtd/tests/nand_ecc-test.c

How about a consistent name for the test? All current tests have 'mtd_'
prefix. How about make the file to be 'mtd_ecctest.c' ?

Also, since you anyway need to use these "#defines", I think there is
not need to use this splitting. I apologize for leading you that way at
the beginning.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
