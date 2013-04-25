Received: from mail-oa0-f45.google.com ([209.85.219.45])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UVF4L-0000lE-74
 for linux-mtd@lists.infradead.org; Thu, 25 Apr 2013 05:50:10 +0000
Received: by mail-oa0-f45.google.com with SMTP id o17so2489479oag.4
 for <linux-mtd@lists.infradead.org>; Wed, 24 Apr 2013 22:50:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1364158291-22591-1-git-send-email-zajec5@gmail.com>
References: <1364158291-22591-1-git-send-email-zajec5@gmail.com>
Date: Thu, 25 Apr 2013 07:50:07 +0200
Message-ID: <CACna6ryn+dKfj-hGmMemwQJ2P2dp0Jn7iOpc1kA9UHYwyddDHA@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: bcm47xxsflash: implement ChipCommon R/W ops
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 David Woodhouse <David.Woodhouse@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Hauke Mehrtens <hauke@hauke-m.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/3/24 Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>:
> They are needed for erasing/writing. Use a magic pointers and small
> functions to preapre code for adding other buses suppoer in the future
> (like SSB).

David: is there a chance for picking up that 2 patches for 3.10?

--=20
Rafa=C5=82
