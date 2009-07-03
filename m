Received: from mail-qy0-f200.google.com ([209.85.221.200])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MMcxP-0007C9-LV
	for linux-mtd@lists.infradead.org; Fri, 03 Jul 2009 07:13:22 +0000
Received: by qyk38 with SMTP id 38so2460711qyk.28
	for <linux-mtd@lists.infradead.org>;
	Fri, 03 Jul 2009 00:13:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <077E41CFFD002C4CAB7DFA4386A53264F5D813@DEMUEXC014.nsn-intra.net>
References: <077E41CFFD002C4CAB7DFA4386A53264F5D7E7@DEMUEXC014.nsn-intra.net>
	<1246373088.20721.11.camel@localhost.localdomain>
	<8bd0f97a0907011815r644dd021mc394406ba913767a@mail.gmail.com>
	<1246603942.20721.29.camel@localhost.localdomain>
	<077E41CFFD002C4CAB7DFA4386A53264F5D812@DEMUEXC014.nsn-intra.net>
	<8bd0f97a0907030002y521723a4s42e71dbb63e7e502@mail.gmail.com>
	<077E41CFFD002C4CAB7DFA4386A53264F5D813@DEMUEXC014.nsn-intra.net>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Fri, 3 Jul 2009 03:12:54 -0400
Message-ID: <8bd0f97a0907030012j53afcec1s81f71dfae233db9c@mail.gmail.com>
Subject: Re: Compile Error: structure has no member named lowest_vol_num
To: "Biefel, Reiner (NSN - DE/Munich)" <reiner.biefel@nsn.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jul 3, 2009 at 03:08, Biefel, Reiner wrote:
>>people rarely set CPPFLAGS
>
> And how do they include headers of ZLIB, LZO and E2FSPROGS when header
> files are not in standard path, for example during cross-build?

they either have then in the standard path like a sane toolchain, or
they use CFLAGS.  i'm not saying putting -I flags in CFLAGS vs
CPPFLAGS is correct, just that people rarely do it the right way.
-mike
