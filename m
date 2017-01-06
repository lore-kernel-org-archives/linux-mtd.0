Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cPRtI-0008FC-Qt
 for linux-mtd@lists.infradead.org; Fri, 06 Jan 2017 10:36:59 +0000
Subject: Re: error: ubi_io_read: error -74 (ECC error)
To: "Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, David Gstir <david@sigma-star.at>
References: <b23632bb474f4ba793086a9a139b3083@SGPMBX1023.APAC.bosch.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <04e73e49-fb0f-d58c-e300-5e1b80e0a6a6@nod.at>
Date: Fri, 6 Jan 2017 11:36:28 +0100
MIME-Version: 1.0
In-Reply-To: <b23632bb474f4ba793086a9a139b3083@SGPMBX1023.APAC.bosch.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Raghavan Anurag,

Am 06.01.2017 um 06:15 schrieb Anurag Raghavan (RBEI/ETW11):
> Hi Richard,
> 
> I am using the kernel version-30.3.5
> 
> Is there any patches available to fix this issue...???

Depends. Your kernel is very old, please consider an upgrade.
gpmi-nand saw some fixes lately. See commit bd2e778c9ee361c23ccb2b10591712e129d97893.

Just in case, removing the check from UBIFS is not the right fix.
I saw such "fixes" more than once on customer kernels.

Thanks,
//richard
