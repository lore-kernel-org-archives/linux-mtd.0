Received: from mail-ob0-f172.google.com ([209.85.214.172])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U2GRq-0004uu-PW
 for linux-mtd@lists.infradead.org; Mon, 04 Feb 2013 07:26:39 +0000
Received: by mail-ob0-f172.google.com with SMTP id tb18so6045291obb.17
 for <linux-mtd@lists.infradead.org>; Sun, 03 Feb 2013 23:26:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1358255575.2731.134.camel@sauron.fi.intel.com>
References: <1356366869-22943-1-git-send-email-zajec5@gmail.com>
 <1358255575.2731.134.camel@sauron.fi.intel.com>
Date: Mon, 4 Feb 2013 08:26:37 +0100
Message-ID: <CACna6rz8wbDdk+=Qdsyd446mjbUUXU=g-bTP81Z6-V7XcgW1hA@mail.gmail.com>
Subject: Re: [FIX][PATCH 3.8] mtd: bcm47xxnflash: increase NFLASH_READY_RETRIES
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/1/15 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2012-12-24 at 17:34 +0100, Rafa=C5=82 Mi=C5=82ecki wrote:
>> Recently imlemented writing support has shown that current num of
>> retries is too low. Writing requires longer waiting than simple reading.
>>
>> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
>
> Just FYI, this patch is sitting in David's tree and will probably be merg=
ed to 3.8.

Ping?

--=20
Rafa=C5=82
