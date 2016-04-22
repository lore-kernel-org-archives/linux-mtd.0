Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atXcO-0005eP-So
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 09:43:21 +0000
Date: Fri, 22 Apr 2016 11:42:48 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH V3 00/11] mtd: nand: get rid of NAND_ECC_SOFT_BCH
Message-ID: <20160422114248.37137b99@bbrezillon>
In-Reply-To: <CACna6ryZK3SynrFpMg0q+9EhcpW6wUScMpPME_LMiWMm5mDKVw@mail.gmail.com>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>
 <20160422111129.4d7bae1e@bbrezillon>
 <CACna6ryZK3SynrFpMg0q+9EhcpW6wUScMpPME_LMiWMm5mDKVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 22 Apr 2016 11:39:24 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> On 22 April 2016 at 11:11, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
> > On Sun, 17 Apr 2016 22:52:56 +0200
> > Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
> >
> >> This patchset completes usage of the new "algo" field and drops unwant=
ed
> >> NAND_ECC_SOFT_BCH.
> >
> > Rebased on top of nand/next and applied all except "mtd: nand: hisi504:
> > set ECC algorithm based on DT info" which is not needed anymore.
>=20
> Thanks a lot and sorry for the problem with
> mtd: nand: davinci: set ECC algorithm explicitly
> I can see you fixed it for me, thanks!

No problem. Actually that was not your fault, I just applied other
patches in the meantime, and one of them was dropping the local
ecc_mode variable.

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
