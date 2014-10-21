Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgWVY-0000LX-05
 for linux-mtd@lists.infradead.org; Tue, 21 Oct 2014 10:17:40 +0000
Message-ID: <544632B6.60701@atmel.com>
Date: Tue, 21 Oct 2014 12:17:26 +0200
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH 2/2] jffs2: fix buffer dump debug output
References: <cover.1413878259.git.cyrille.pitchen@atmel.com>		
 <21ad981db8c65d3f00be3d9a254cae78cf40b96d.1413878259.git.cyrille.pitchen@atmel.com>	
 <1413879465.12828.1.camel@perches.com> <54462BB6.5020405@atmel.com>
 <1413885267.7906.426.camel@sauron.fi.intel.com>
In-Reply-To: <1413885267.7906.426.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Joe Perches <joe@perches.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 nicolas.ferre@atmel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 21/10/2014 11:54, Artem Bityutskiy a écrit :
> On Tue, 2014-10-21 at 11:47 +0200, Cyrille Pitchen wrote:
>> thanks for your comment. Indeed using print_hex_dump() would be a good idea
>> since it would avoid each driver to implement its own version of buffer dumps.
>> Reading the source code of print_hex_dump(), the output format would change a
>> little bit:
>> the output would no longer be aligned to JFFS2_BUFDUMP_BYTES_PER_LINE boundary
>> using leading spaces.
>> If it's ok to change the output format it's good for me as well.
> 
> Changing format is OK, this is just a debugging cruft. But it is OK only
> if you test the changes. If you are unable to test the changes, it is
> better to avoid doing non-trivial changes.
> 
The version provided in this patch was tested. However I don't know how to cope
with the offs parameter of __jffs2_dbg_dump_buffer() if I replace the current
source code by a call to print_hex_dump().
If I use DUMP_PREFIX_ADDRESS as prefix_type value, the printed offsets are
relative to the address of buf in RAM, not to the hardware offset in my
dataflash provided by the offs parameter.
Also, if I use DUMP_PREFIX_OFFSET, the printed offsets start from 0 instead of
offs value.

I think keeping the right offsets in the output dump is helpfull.
