Received: from mail-oa0-f52.google.com ([209.85.219.52])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UHwHT-0001Sv-AS
 for linux-mtd@lists.infradead.org; Tue, 19 Mar 2013 13:08:43 +0000
Received: by mail-oa0-f52.google.com with SMTP id k14so402158oag.39
 for <linux-mtd@lists.infradead.org>; Tue, 19 Mar 2013 06:08:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363698221.14966.17.camel@sauron.fi.intel.com>
References: <1363343486-3084-1-git-send-email-zajec5@gmail.com>
 <51434BAC.4080003@hauke-m.de>
 <CACna6rxL5zV8xbJS3nwVi_w_4KXoR2uYKMCfNNEA8u6k1m22Dg@mail.gmail.com>
 <1363698221.14966.17.camel@sauron.fi.intel.com>
Date: Tue, 19 Mar 2013 14:08:40 +0100
Message-ID: <CACna6rzFFTU=hZDcFtdsB8dn=HY=G3ML4JUMO0iqbqD4KoYUDA@mail.gmail.com>
Subject: Re: [PATCH] mtd: bcm47xxsflash: implement chip polling
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/3/19 Artem Bityutskiy <dedekind1@gmail.com>:
> On Fri, 2013-03-15 at 17:43 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> To be honest, I had bus abstraction in my code. I removed it because
>> of Artem's comments in last patchset. He said he doesn't have a proof
>> I'll ever add SSB support and told me to remove code that prepared
>> bcm47xxsflash for abstracting bus type.
>
> I only asked to introduce it when you actually need it. I only objected
> to adding preparations without the code which uses the preparations. I
> do not really know the bcm47 HW, but of course if you have a HW resource
> which is shared between subsystems, you should not use it directly from
> MTD, you should have some kind of framework / accessors for the
> resource.

Thanks. I'll send you a V2 I prefer over this one today :)

--=20
Rafa=C5=82
