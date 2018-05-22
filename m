Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fL2fm-0003Ye-1V
 for linux-mtd@lists.infradead.org; Tue, 22 May 2018 08:29:44 +0000
Received: by mail-wm0-x242.google.com with SMTP id f6-v6so29548737wmc.4
 for <linux-mtd@lists.infradead.org>; Tue, 22 May 2018 01:29:23 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1526973160.8186.60.camel@infradead.org>
References: <00a60e88ed75601a69f6cf4b194ef9ee6b22056f.camel@kernel.crashing.org>
 <1526973160.8186.60.camel@infradead.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Tue, 22 May 2018 10:29:21 +0200
Message-ID: <CACna6rwaaC-4xLOG91aBRVmFeexkU+TgN5z4POrC4rj2C9XMzw@mail.gmail.com>
Subject: Re: Lockdep complaint in jffs2
To: David Woodhouse <dwmw2@infradead.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-mtd@lists.infradead.org, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 22 May 2018 at 09:12, David Woodhouse <dwmw2@infradead.org> wrote:
> On Tue, 2018-05-22 at 13:17 +1000, Benjamin Herrenschmidt wrote:
>> Hi David !
>>
>> I noticed this on my BMC when building OpenBMC with Lockdep...
>> something worth investigating/digging ?
>
> Hm, I have a feeling a saw a patch to fix this fairly recently and was
> bikeshedding it. Will check...

This one maybe?
https://patchwork.ozlabs.org/patch/906633/

You may consider looking at all patches delegated to you:
https://patchwork.ozlabs.org/project/linux-mtd/list/?delegate=3D20

--=20
Rafa=C5=82
