Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUmmW-00065N-Ct
 for linux-mtd@lists.infradead.org; Thu, 27 Aug 2015 02:19:13 +0000
Date: Thu, 27 Aug 2015 10:18:32 +0800
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <xhnjupt@gmail.com>
Cc: Han Xu <b45815@freescale.com>, Fabio Estevam <fabio.estevam@freescale.com>,
 boris.brezillon@free-electrons.com, vinod.koul@intel.com,
 linux-kernel@vger.kernel.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nicholas Mc Guire <hofrat@osadl.org>, dmaengine@vger.kernel.org,
 dan.j.williams@intel.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH v2 4/6] mtd: nand: gpmi: add GPMI NAND support for i.MX7D
Message-ID: <20150827021832.GA4193@free64-pc.asiapac.arm.com>
References: <1439868295-24890-1-git-send-email-b45815@freescale.com>
 <20150818065252.GB10641@free64-pc.asiapac.arm.com>
 <CA+EcR23-nhpoEz1tcGMPmb07RcEAk-dQCCnkCpNra50RjXwe_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+EcR23-nhpoEz1tcGMPmb07RcEAk-dQCCnkCpNra50RjXwe_A@mail.gmail.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 26, 2015 at 03:24:14PM -0500, Han Xu wrote:
> Hi Shijie,
>=20
> The features for MX6 and MX7 are not identical, I would love to use
> two macros in this patch and will push another patch to use quirks to
> distinguish them, is that Okay for you?
okay, no problem.

Actually, you should be the maintainer for the gpmi driver, not me :)

thanks
Huang Shijie
