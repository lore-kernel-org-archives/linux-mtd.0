Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FPEjO-0008Dc-M4
	for linux-mtd@lists.infradead.org; Fri, 31 Mar 2006 03:11:53 -0500
Message-ID: <442CE431.5050700@intel.com>
Date: Fri, 31 Mar 2006 12:11:29 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>	<20060330121156.GA31749@wohnheim.fh-wedel.de>
	<442CD1CB.7050509@intel.com> <442CE0E8.1080105@yandex.ru>
In-Reply-To: <442CE0E8.1080105@yandex.ru>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem B. Bityutskiy wrote:
> Just in general, the
>
> #ifdef EPRST
> #include <elki-palki.h>
> #endif
>
> is not very nice. It is nicer to add the #ifdef protection in the 
> header itself. This is not a major problem, but it is just nicer and 
> Linux people like this. Just incapsulate all the protection in the 
> header itself. Don't spread the protection over many .c files which 
> may potentially want to include your header.
>
I followed the already existing example for partitions.h in the same 
mphysmap.c file. Just thought it's OK. I'll try to fix that, thanks.

Alexander Belyakov
