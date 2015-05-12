From: "Cantavenera, Giuseppe (EXT-Other - DE/Ulm)"
 <giuseppe.cantavenera.ext@nokia.com>
To: ext Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH] mtd: fix: avoid race condition when accessing
 mtd->usecount
Date: Tue, 12 May 2015 06:38:34 +0000
Message-ID: <362FEC998FA6CC42BC5BA5B7BA75E0970D5A1D1E@DEMUMBX009.nsn-intra.net>
References: <1429611622-2652-1-git-send-email-giuseppe.cantavenera.ext@nokia.com>
 <20150508001012.GV32500@ld-irv-0074> <20150508001745.GW32500@ld-irv-0074>
 <20150508002649.GX32500@ld-irv-0074>
 <362FEC998FA6CC42BC5BA5B7BA75E0970D5A08FA@DEMUMBX009.nsn-intra.net>
 <20150511222505.GI32500@ld-irv-0074>
In-Reply-To: <20150511222505.GI32500@ld-irv-0074>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "Restelli, Lorenzo \(EXT-Other - DE/Ulm\)" <lorenzo.restelli.ext@nokia.com>,
 zhangxingcai <zhangxingcai@huawei.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 "fengfuqiu@huawei.com" <fengfuqiu@huawei.com>, "Sverdlin,
 Alexander \(Nokia - DE/Ulm\)" <alexander.sverdlin@nokia.com>,
 "tanhaijun@huawei.com" <tanhaijun@huawei.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> -----Original Message-----
> From: ext Brian Norris [mailto:computersforpeace@gmail.com]
> Sent: Tuesday, May 12, 2015 12:25 AM
> To: Cantavenera, Giuseppe (EXT-Other - DE/Ulm)
> Cc: linux-mtd@lists.infradead.org; Restelli, Lorenzo (EXT-Other -
> DE/Ulm); dwmw2@infradead.org; stable@vger.kernel.org; Sverdlin,
> Alexander (Nokia - DE/Ulm); zhangxingcai; fengfuqiu@huawei.com;
> tanhaijun@huawei.com; linux-kernel@vger.kernel.org
> Subject: Re: [PATCH] mtd: fix: avoid race condition when accessing mtd-
> >usecount
>=20
> On Mon, May 11, 2015 at 07:44:26AM +0000, Cantavenera, Giuseppe (EXT-
> Other - DE/Ulm) wrote:
> > > -----Original Message-----
> > > From: ext Brian Norris [mailto:computersforpeace@gmail.com]
> > > Sent: Friday, May 08, 2015 2:27 AM
> > > To: Cantavenera, Giuseppe (EXT-Other - DE/Ulm)
> > > Cc: linux-mtd@lists.infradead.org; Restelli, Lorenzo (EXT-Other -
> > > DE/Ulm); dwmw2@infradead.org; stable@vger.kernel.org; Sverdlin,
> > > Alexander (Nokia - DE/Ulm); zhangxingcai; fengfuqiu@huawei.com;
> > > tanhaijun@huawei.com; linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH] mtd: fix: avoid race condition when accessing
> mtd-
> > > >usecount
> > >
> > > On Thu, May 07, 2015 at 05:17:45PM -0700, Brian Norris wrote:
> > > > On Thu, May 07, 2015 at 05:10:12PM -0700, Brian Norris wrote:
> > > > > On Tue, Apr 21, 2015 at 12:20:22PM +0200, Giuseppe Cantavenera
> > > wrote:

> Can I get a 'Tested-by', or at least an 'Acked-by' for the patch? I
> tested it, but I don't think I can reproduce your original problem very
> easily.
>=20
> Brian

Hello Brian,

We were able to do some long runs last night and as expected
this patch seems to address the issue pretty well.

Thanks,
Giuseppe

Tested-by: Giuseppe Cantavenera <giuseppe.cantavenera.ext@nokia.com>
