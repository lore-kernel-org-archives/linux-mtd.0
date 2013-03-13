Received: from mail-ob0-x22d.google.com ([2607:f8b0:4003:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjTr-0004W3-1e
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 11:04:23 +0000
Received: by mail-ob0-f173.google.com with SMTP id dn14so882118obc.32
 for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2013 04:04:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1363172309.11441.13.camel@sauron.fi.intel.com>
References: <1362567695-17523-1-git-send-email-zajec5@gmail.com>
 <1363172309.11441.13.camel@sauron.fi.intel.com>
Date: Wed, 13 Mar 2013 12:04:21 +0100
Message-ID: <CACna6rwS3ifhLVTZS+ZeiY7J0sZn2NgHcTzQ0q0vVrn8eXS-NQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/3] mtd: bcm47xxsflash: keep a reference to the BCMA
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

2013/3/13 Artem Bityutskiy <dedekind1@gmail.com>:
> On Wed, 2013-03-06 at 12:01 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> To implement erase and write support we need to "talk" with ChipCommon
>> BCMA core which serial flash it attached to.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> Pushed the 3 to l2-mtd.git, thanks!

Thank you for your help on getting this cleaned :)

--=20
Rafa=C5=82
