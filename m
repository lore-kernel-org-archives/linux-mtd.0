Return-Path: <SRS0=xwS+=ES=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF26C2D0A3
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:28:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877B420A8B
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2020 15:28:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fAeRbqok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877B420A8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baikalelectronics.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nhtXtTUOw1R6R//QC9+V4chjzlRiu7xdAlkxV+Z6Y9U=; b=fAeRbqok7TNUvfz8w7eUIgeHr
	pR9F61JusfVerYIpOdVqqTQi8S6UuWnIOqDbcGcPEP39RN3xW7xfzcL3/YY724N6XlisxtHxKOcBK
	X/jAlmjGFZgU+Fk6ScB4JX0/qGfcbn73e/tVv9S8Q2kU8mcQCn04TaR+fmmis6Moq+8iIWJOCll3k
	vAyisYS5ztHxUrkZHWQd8c5wdSkczM1j+UbO1WyN1XKIfXXrlfI+U8D+MuFnZ9xD2P2q3YUtaCD1G
	5N+Gwv9tR4vU6IJhxANcQXWrq5OW80WA3+Z1983ugCta/b34EtE+INyMT/ay09dG9RrrO+9dn7OXC
	VpVB4Xxcg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdEVm-00043z-2z; Thu, 12 Nov 2020 15:27:46 +0000
Received: from mail.baikalelectronics.com ([87.245.175.226]
 helo=mail.baikalelectronics.ru)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdEVi-00043T-UR
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2020 15:27:44 +0000
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 417D3803017D;
 Thu, 12 Nov 2020 15:27:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IeRGtuy7iSgB; Thu, 12 Nov 2020 18:27:40 +0300 (MSK)
Date: Thu, 12 Nov 2020 18:27:39 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: drivers/mtd/maps/physmap-bt1-rom.c:78:18: sparse: sparse: cast
 removes address space '__iomem' of expression
Message-ID: <20201112152739.r4673zyeixkcwukx@mobilestation>
References: <202011021254.XC70BaQT-lkp@intel.com>
 <20201110113827.hl5i27cpl6exo3md@mobilestation>
 <20201110163556.3e3423f6@xps13>
 <20201111192259.ovdyjcuue7fx2bqa@mobilestation>
 <20201112092715.7e466405@xps13>
 <8cdc6166-7183-c8a9-5c27-93a511e6471a@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8cdc6166-7183-c8a9-5c27-93a511e6471a@ti.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_102743_362311_316FD438 
X-CRM114-Status: GOOD (  15.18  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kbuild-all@lists.01.org, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello Vignesh

On Thu, Nov 12, 2020 at 08:30:42PM +0530, Vignesh Raghavendra wrote:
> =

> =

> On 11/12/20 1:57 PM, Miquel Raynal wrote:
> > Hi Sergey,
> > =

> > Serge Semin <Sergey.Semin@baikalelectronics.ru> wrote on Wed, 11 Nov
> > 2020 22:22:59 +0300:
> > =

> >> On Tue, Nov 10, 2020 at 04:35:56PM +0100, Miquel Raynal wrote:
> >>> Hi Serge,
> >>>
> >>> Serge Semin <Sergey.Semin@baikalelectronics.ru> wrote on Tue, 10 Nov
> >>> 2020 14:38:27 +0300:
> >>>   =

> >>>> Hello Miquel,
> >>>>
> >>>> A situation noted by the warning below won't cause any problem becau=
se
> >>>> the casting is done to a non-dereferenced variable. It is utilized
> >>>> as a pointer bias later in that function. Shall we just ignore the
> >>>> warning or still fix it somehow?  =

> >>>   =

> >>
> >>> Do you think the cast to a !__iomem value is mandatory here?  =

> >>
> >> It's not mandatory to have the casting with no __iomem, but wouldn't
> >> doing like this:
> >> + 	shift =3D (ssize_t __iomem)src & 0x3;
> >> be looking weird? Really, is there a good way to somehow extract the f=
irst
> >> two bits of a __iomem pointer without getting the sparse warning?
> > =

> > I asked around me, what about trying uintptr_t?
> > =

> =


> One more way is to use __force to tell sparse that this casting is
> intentional:
> =

>        shift =3D (__force ssize_t)src & 0x3;

Oh, great! That solution is actually much better than using some
currently unexplained sparse peculiarity! I was thinking about applying
some other attribute, but __force just didn't come to my mind. Thank
you very much for the suggestion. I'll post the fix with the solution
suggested by you.

-Sergey

> =

> =

> > Thanks,
> > Miqu=E8l
> > =

> > ______________________________________________________
> > Linux MTD discussion mailing list
> > http://lists.infradead.org/mailman/listinfo/linux-mtd/
> > =


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
