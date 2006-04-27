Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FZ1vr-00086a-8x
	for linux-mtd@lists.infradead.org; Thu, 27 Apr 2006 04:33:10 -0400
Message-ID: <445081B4.8070801@intel.com>
Date: Thu, 27 Apr 2006 12:32:52 +0400
From: Alexander Belyakov <alexander.belyakov@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <F048F58F304F0040BC3E937DE4E231E701F5D409@NNSMSX401>
	<Pine.LNX.4.64.0604261157030.18520@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0604261157030.18520@localhost.localdomain>
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

Nicolas Pitre wrote:
>
> That won't work with Sibley.
>

It does work for Sibley. I've checked it for both NAND and Sibley before 
posting.

> Sibley flash must write everything all at once with
> a single writev call.
>

Not sure what did you  mean by that. But I should say that 
concat_writev() function does writes by page-sized chunks even if one 
vector entry has size less than one page. Function just "glues" it with 
the next vector entry (or its part) if any. So there are no writes with 
size less than pagesize, except first and last pages if we have 
unaligned data in downcoming vector.


As for too "complex" patch implementation. I'll take a look what can be 
done with usage of writev() and writev_ecc() of underlying devices. 
Thank you for advice. But as I said this change is just design matter 
and will not benefit much, because underlying device writev() function 
have to do the pagesize chunks splitting anyway.

Alexander

-------
The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue
