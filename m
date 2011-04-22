Received: from mail-px0-f171.google.com ([209.85.212.171])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QD8KI-0006pL-O4
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 04:50:43 +0000
Received: by pxi7 with SMTP id 7so265479pxi.16
	for <linux-mtd@lists.infradead.org>;
	Thu, 21 Apr 2011 21:50:40 -0700 (PDT)
Message-ID: <4DB1091C.6070502@gmail.com>
Date: Thu, 21 Apr 2011 21:50:36 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: dangerous NAND_BBT_SCANBYTE1AND6
References: <4DB052DB.7040308@parrot.com> <20110421171046.GA790@parrot.com>
In-Reply-To: <20110421171046.GA790@parrot.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan,

(FYI, please use my @gmail.com, not my @broadcom address.)

I can't say I know everything about the intentions and history of all 
statements in various NAND flash data sheets, but I have read many of 
them and will try to explain my view. Of course, I may be wrong.

On 4/21/2011 10:10 AM, Ivan Djelic wrote:
> Old small page nand devices used to have their bad block marker in 6th byte of
> the spare area of the first page.

Correct

> ST datasheet says that factory bad blocks will have _both_ bytes cleared
> (1st and 6th); I guess this was done to allow choosing which marker to check
> (but I may be wrong). Maybe to be compatible with large page marker location
> scheme (again, just guessing).

The actual statement is one of these two (pulled from various ST and 
Numonyx sheets):

"Any block, where the 1st and 6th bytes or the 1st word in the spare 
area of the 1st page, does not contain FFh, is a bad block."

"Any block, where the 1st and 6th bytes, in the spare area of the first
page, does not contain FFh is a bad block."

Strictly speaking, neither of these "sentences" uses correct grammar, as 
the commas are placed arbitrarily. Most importantly, though, I don't 
think they make clear the following:

1) Does the manufacturer guarantee that BOTH bytes are non-FFh?
2) Does the manufacturer guarantee that the combined bytes ("1st and 
6th") contain a non-FFh byte?

I understood it as the latter, and so decided the scan needed both bytes 
(perhaps one byte was written successfully but not the other). However, 
your argument for choice (1) ("this was done to allow choosing which 
marker to check") makes just as much sense (or more) to me.

In trying to decide why I came to conclude choice (2) and not (1), I 
recall that some Hynix and Samsung parts explicitly declare that the 
first OR second page may be used, in case the first page is bad. I may 
have subconsciously applied this 1st/2nd page concept to the 1st/6th 
bytes logic.

> My understanding of bad block markers is (please correct me if I am wrong):
> small page =>  check 6th byte of spare area of first page
> large page, non-ONFI =>  check first word of spare area of first page
> ONFI =>  see ONFI spec

Unfortunately, small page, large page, and ONFI are 3 classifications 
that oversimplify bad block markers.

Some people (especially Samsung and Hynix, but even some Micron) got 
creative. Some of their chips use:
1st or 2nd page
the last page
the 1st or last page
the last or (last - 2)th page

And of course, there's the controversial 1st/6th byte usage - that I'm 
still not clear on. Some of these scanning patterns are rare, but they 
do exist.

Sorry for any confusion, but I guess it's better late than never for 
this sort of discussion...

Brian
