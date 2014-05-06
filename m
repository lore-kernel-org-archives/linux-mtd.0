Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Whc9e-0000L2-Fl
 for linux-mtd@lists.infradead.org; Tue, 06 May 2014 09:59:18 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>, David Woodhouse
 <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, "Paul
 Gortmaker" <paul.gortmaker@windriver.com>,
 Jingoo Han <jg1.han@samsung.com>, Grant Likely <grant.likely@linaro.org>,
 Rob Herring <rob.herring@calxeda.com>,
 Prabhakar Kushwaha <prabhakar@freescale.com>
Subject: RE: [PATCH] mtd: fsl_elbc_nand: set NAND_NO_SUBPAGE_WRITE flag if
 using hardware ECC
Date: Tue, 6 May 2014 09:57:48 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EACAD6B@DBDE04.ent.ti.com>
References: <1399367678-31878-1-git-send-email-nyushchenko@dev.rtsoft.ru>
In-Reply-To: <1399367678-31878-1-git-send-email-nyushchenko@dev.rtsoft.ru>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "lugovskoy@dev.rtsoft.ru" <lugovskoy@dev.rtsoft.ru>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Nikita,

>From: Nikita Yushchenko
>
>Per MPC8572E manual, sec 14.4.3.1.3: "Transfers shorter than a full page,
>however, require software to prepare the appropriate ECC in the spare
>region"
>
>Need to set NAND_NO_SUBPAGE_WRITE flag. If this is not done, then
>generic nand_write_subpage_hwecc() is called instead of driver's
>write routine, which results into OOPS dereferencing NULL chip->ecc.hwctl
>pointer.
>
>Signed-off-by: Nikita Yushchenko <nyushchenko@dev.rtsoft.ru>
>---

This one is already solved.

Please refer below discussion and its previous thread on
why NAND_NO_SUBPAGE_WRITE should _not_ be set,
because it breaks compatibility with older UBIFS images.

http://lists.infradead.org/pipermail/linux-mtd/2014-April/053262.html

Also below is the appropriate fix without breaking backward compatibility.
http://lists.infradead.org/pipermail/linux-mtd/2014-May/053745.html


with regards, pekon
