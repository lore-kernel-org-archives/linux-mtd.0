Received: from mail-ig0-x22f.google.com ([2607:f8b0:4001:c05::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atXYv-0003HM-Hc
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 09:39:46 +0000
Received: by mail-ig0-x22f.google.com with SMTP id m9so9461279ige.1
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2016 02:39:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160422111129.4d7bae1e@bbrezillon>
References: <1460913104-27388-1-git-send-email-zajec5@gmail.com>
 <1460926387-9563-1-git-send-email-zajec5@gmail.com>
 <20160422111129.4d7bae1e@bbrezillon>
Date: Fri, 22 Apr 2016 11:39:24 +0200
Message-ID: <CACna6ryZK3SynrFpMg0q+9EhcpW6wUScMpPME_LMiWMm5mDKVw@mail.gmail.com>
Subject: Re: [PATCH V3 00/11] mtd: nand: get rid of NAND_ECC_SOFT_BCH
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
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

On 22 April 2016 at 11:11, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Sun, 17 Apr 2016 22:52:56 +0200
> Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:
>
>> This patchset completes usage of the new "algo" field and drops unwanted
>> NAND_ECC_SOFT_BCH.
>
> Rebased on top of nand/next and applied all except "mtd: nand: hisi504:
> set ECC algorithm based on DT info" which is not needed anymore.

Thanks a lot and sorry for the problem with
mtd: nand: davinci: set ECC algorithm explicitly
I can see you fixed it for me, thanks!
