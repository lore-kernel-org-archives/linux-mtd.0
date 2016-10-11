Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bu4v6-0001lV-Cn
 for linux-mtd@lists.infradead.org; Tue, 11 Oct 2016 21:49:09 +0000
Received: by mail-oi0-x241.google.com with SMTP id p136so2136439oic.1
 for <linux-mtd@lists.infradead.org>; Tue, 11 Oct 2016 14:48:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160920083615.31099-1-zajec5@gmail.com>
References: <20160914102151.21722-1-zajec5@gmail.com>
 <20160920083615.31099-1-zajec5@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 11 Oct 2016 23:48:46 +0200
Message-ID: <CACna6rwMLWZ-MDVJ=j-hwb4CPE2197rORVU7Ozr-LxfsvYAWGQ@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] ubifs: drop softlimit and delta fields from struct
 ubifs_wbuf
To: Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
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

On 20 September 2016 at 10:36, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> w=
rote:
> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>
> Values of these fields are set during init and never modified. They are
> used (read) in a single function only. There isn't really any reason to
> keep them in a struct. It only makes struct just a bit bigger without
> any visible gain.
>
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Hi Richard, could you pick this small patchset, please?
