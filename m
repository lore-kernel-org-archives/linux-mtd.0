Received: from mga02.intel.com ([134.134.136.20] helo=orsmga101-1.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYlq8-0002iN-P9
	for linux-mtd@lists.infradead.org; Wed, 26 Apr 2006 11:22:10 -0400
Message-ID: <444F9002.9060000@intel.com>
Date: Wed, 26 Apr 2006 19:21:38 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Jorn Engel <joern@wohnheim.fh-wedel.de>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<20060426141609.GG29108@wohnheim.fh-wedel.de>
In-Reply-To: <20060426141609.GG29108@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] MTD: mtdconcat NAND/Sibley support
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jorn Engel wrote:
>
> concat_writev() is far too complicated.  I have a patch somewhere that
> adds a generic writev() function to every device.  Once that is in,
> your patch should get a respin and be much simpler.
>

Having generic writev() still requires concat_writev() to split the data 
into several parts (in general case by number of subdevices). So I do 
not see how concat_writev() could become simpler.

In my patch you split data from downcoming vector into several  _equal_  
page-sized chunks and write them by calling generic write().

In case you think about one have to create  _several_vectors_  of  
_unknown_  size and pass them to the generic writev() which in turn will 
anyway split these new vectors into equal page-sized chunks.

And I really doubt there is a way to simplify concat_block_isbad() and 
concat_block_markbad() functions from the patch.

> I didn't closely look at the rest of it but suspect similar things.
>

Why I'm not surprised here? :)

Patch have nothing complex and have completely nothing new. Just fixes 
some broken stuff.

Is it better to leave concatenation layer without any changes and only 
compatible with NOR devices, despite mtdconcat.c file comments claim 
that it does support NAND?

Alexander

-------
The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue
