Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a0U8I-00058H-Ny
 for linux-mtd@lists.infradead.org; Sun, 22 Nov 2015 12:52:43 +0000
Received: by wmuu63 with SMTP id u63so24824737wmu.0
 for <linux-mtd@lists.infradead.org>; Sun, 22 Nov 2015 04:52:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <5650F952.2060409@gmail.com>
References: <564CEB61.2000601@gmail.com> <20151118215755.GL31303@sirena.org.uk>
 <564D0098.4030107@gmail.com> <20151119114057.GN31303@sirena.org.uk>
 <F224F5F3-FAD5-47FE-9419-39E53BCBB8C6@sperl.org>
 <20151119171538.GO31303@sirena.org.uk>
 <9CDADBED-FD18-4635-82A9-5AB14C9ABCAE@sperl.org>
 <20151120120502.GT31303@sirena.org.uk>
 <08871ECD-52DF-4CBF-AF3D-4C3A442C008A@sperl.org>
 <20151121134946.GI26072@sirena.org.uk> <56507B3B.4080608@gmail.com>
 <CAOMqctR=UDEPbgJDY3YvxpbVEEp4t6ajkyv=cVAZp2fLBNBanA@mail.gmail.com>
 <5650F952.2060409@gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Sun, 22 Nov 2015 13:51:40 +0100
Message-ID: <CAOMqctQ73BJxA3Xm+4ddYPsnnZ+nOs7mcADW2W0+fRHN10U_KQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: m25p80: handle HW message size restrictions
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Brian Norris <computersforpeace@gmail.com>,
 Martin Sperl <martin@sperl.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 22 November 2015 at 00:08, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Extend m25p80_read allowing to read in chunks in case the
> SPI HW has a max supported message size.

I would prefer if this was handled as part of the patchset which adds
error checking to spi-nor.

Thanks

Michal
