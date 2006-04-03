Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQGKT-00058d-Fl
	for linux-mtd@lists.infradead.org; Mon, 03 Apr 2006 00:06:21 -0400
Message-ID: <44309F34.8010301@ru.mvista.com>
Date: Mon, 03 Apr 2006 08:06:12 +0400
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <F048F58F304F0040BC3E937DE4E231E701DC3ABB@NNSMSX401>
	<442B9FA5.9070901@ru.mvista.com> <442BF839.8060402@intel.com>
	<1143733184.3579.47.camel@sauron.oktetlabs.ru>
	<442CD50A.6070006@intel.com> <442CE217.8080103@yandex.ru>
	<Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0603311143460.14923@localhost.localdomain>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>,
	Alexander Belyakov <alexander.belyakov@intel.com>,
	linux-mtd@lists.infradead.org, "Kutergin,
	Timofey" <timofey.kutergin@intel.com>, "Korolev,
	Alexey" <alexey.korolev@intel.com>
Subject: Re: [PATCH/RFC] MTD: Striping layer core
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:
> IMHO striping NOR and NAND together simply makes no sense.  NOR and NAND 
> are fundamentally different things when it comes to writing to them, and 
> apart from evaluation boards where every possible peripheral can be 
> found you rarely will find both NOR and NAND in the same real life 
> design.
>   
Oh really? What about MP3 player-oriented design with NAND flash as a 
main storage and NOR flash for kernel/userspace XIP etc?

Vitaly
